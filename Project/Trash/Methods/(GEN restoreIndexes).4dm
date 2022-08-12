//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      GEN restoreIndexes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_IndexSettingsFields; 0)
	ARRAY LONGINT:C221($_al_IndexSettingsTables; 0)
	ARRAY LONGINT:C221($_al_RebuiltFields; 0)
	ARRAY LONGINT:C221($_al_RebuiltTables; 0)
	//ARRAY LONGINT(GEN_al_IndexSettingsFields;0)
	//ARRAY LONGINT(GEN_al_IndexSettingsTables;0)
	ARRAY REAL:C219($_ar_TablesSet; 0)
	C_BLOB:C604(GEN_IndexBLOB)
	C_BOOLEAN:C305($_bo_Changes; $_bo_FieldFound; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_LoadSettingsFromFile)
	C_LONGINT:C283($_l_Element; $_l_FieldLength; $_l_FieldsIndex; $_l_FieldType; $_l_Index; $_l_Index2; $_l_IndexingProcess; $_l_ItemID; $_l_offset; $_l_TableNumber; $_l_TableReferences)
	C_LONGINT:C283($_l_TableRow)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN restoreIndexes")
//this method will get the currently set indexes
//and compare them to the stored settings.
//if there are any fields which are stored as indexed but not set as indexed
//then they will be indexed
//this will not UNindex any.
//the updated settings will then be stored.
If (False:C215)
	ARRAY LONGINT:C221($_al_IndexSettingsTables; 255)
	ARRAY LONGINT:C221($_al_IndexSettingsFields; 255)
	$_l_Element:=0
	For ($_l_Index; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_Index))
			For ($_l_Index2; 1; Get last field number:C255($_l_Index))
				If (Is field number valid:C1000($_l_Index2; $_l_Index))
					$_ptr_FieldPointer:=Field:C253($_l_Index; $_l_Index2)
					GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
					If ($_bo_FieldIndexed)
						$_l_Element:=$_l_Element+1
						If ($_l_Element>Size of array:C274($_al_IndexSettingsTables))
							INSERT IN ARRAY:C227($_al_IndexSettingsTables; Size of array:C274($_al_IndexSettingsTables)+1; 255)
							INSERT IN ARRAY:C227($_al_IndexSettingsFields; Size of array:C274($_al_IndexSettingsFields)+1; 255)
						End if 
						$_al_IndexSettingsTables{$_l_Element}:=$_l_Index
						$_al_IndexSettingsFields{$_l_Element}:=$_l_Index2
					End if 
				End if 
				
			End for 
		End if 
	End for 
	ARRAY LONGINT:C221($_al_IndexSettingsTables; $_l_Element)
	ARRAY LONGINT:C221($_al_IndexSettingsFields; $_l_Element)
	
	// I want this group of arrays and fields sorted by Table and field number-it should be sorted anyway
	
	SORT ARRAY:C229($_al_IndexSettingsTables; $_al_IndexSettingsFields)
	
	While (Semaphore:C143("IndexSettings"))
		DelayTicks(20)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Index Settings")
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	$_bo_LoadSettingsFromFile:=False:C215
	If (Gen_Option)
		//load from file option
		$_bo_LoadSettingsFromFile:=True:C214
	End if 
	$_bo_Changes:=False:C215
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	ARRAY LONGINT:C221(GEN_al_IndexSettingsTables; 0)
	ARRAY LONGINT:C221(GEN_al_IndexSettingsFields; 0)
	$_l_offset:=0
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; GEN_al_IndexSettingsTables; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; GEN_al_IndexSettingsFields; $_l_offset)
	Else 
		//nothing saved
		$_bo_Changes:=True:C214
		COPY ARRAY:C226($_al_IndexSettingsFields; GEN_al_IndexSettingsFields)
		COPY ARRAY:C226($_al_IndexSettingsTables; GEN_al_IndexSettingsTables)
	End if 
	If ($_bo_LoadSettingsFromFile)
		//ignore the saved values and load from a file
		$_ti_DocumentRef:=DB_OpenDocument(""; "TEXT")
		If (OK=1)
			Close_DocUMENT($_ti_DocumentRef)
			SET BLOB SIZE:C606(GEN_IndexBLOB; 0)
			DOCUMENT TO BLOB:C525(document; GEN_IndexBLOB)
			$_l_offset:=0
			BLOB TO VARIABLE:C533(GEN_IndexBLOB; GEN_al_IndexSettingsTables; $_l_offset)
			BLOB TO VARIABLE:C533(GEN_IndexBLOB; GEN_al_IndexSettingsFields; $_l_offset)
		End if 
	End if 
	SORT ARRAY:C229(GEN_al_IndexSettingsTables; GEN_al_IndexSettingsFields)
	
	$_l_TableNumber:=0
	$_l_Element:=1
	ARRAY LONGINT:C221($_al_RebuiltTables; 0)
	ARRAY LONGINT:C221($_al_RebuiltFields; 0)
	ARRAY REAL:C219($_ar_TablesSet; 0)
	For ($_l_Index; 1; Size of array:C274($_al_IndexSettingsFields))
		$_bo_FieldFound:=False:C215
		For ($_l_FieldsIndex; 1; Size of array:C274(GEN_al_IndexSettingsFields))
			If (GEN_al_IndexSettingsTables{$_l_FieldsIndex}=$_al_IndexSettingsTables{$_l_Index}) & (GEN_al_IndexSettingsFields{$_l_FieldsIndex}=$_al_IndexSettingsFields{$_l_Index})
				$_bo_FieldFound:=True:C214
				$_l_FieldsIndex:=Size of array:C274(GEN_al_IndexSettingsFields)
			End if 
		End for 
		If (Not:C34($_bo_FieldFound))  //There are changes
			$_bo_Changes:=True:C214
		End if 
		//Regardless of any changes setup a NEW array. this is because the array seems to not be correct at least on DB data.
		//we will test the array at the end
		$_l_TableReferences:=Num:C11("1"+String:C10($_al_IndexSettingsTables{$_l_Index}; "0000")+(String:C10($_al_IndexSettingsFields{$_l_Index}; "0000000")))
		$_l_TableRow:=Find in array:C230($_ar_TablesSet; $_l_TableReferences)
		If ($_l_TableRow<0)
			APPEND TO ARRAY:C911($_ar_TablesSet; $_l_TableReferences)
			$_l_TableRow:=Size of array:C274($_ar_TablesSet)
		End if 
		If (Size of array:C274($_al_RebuiltFields)<$_l_TableRow)
			APPEND TO ARRAY:C911($_al_RebuiltTables; $_al_IndexSettingsTables{$_l_Index})
			APPEND TO ARRAY:C911($_al_RebuiltFields; $_al_IndexSettingsFields{$_l_Index})
			
		Else 
			$_al_RebuiltTables{$_l_TableRow}:=$_al_IndexSettingsTables{$_l_Index}
			$_al_RebuiltFields{$_l_TableRow}:=$_al_IndexSettingsFields{$_l_Index}
		End if 
		
		
	End for 
	For ($_l_FieldsIndex; 1; Size of array:C274(GEN_al_IndexSettingsFields))
		$_bo_FieldFound:=False:C215
		For ($_l_Index; 1; Size of array:C274($_al_IndexSettingsFields))
			If (GEN_al_IndexSettingsTables{$_l_FieldsIndex}=$_al_IndexSettingsTables{$_l_Index}) & (GEN_al_IndexSettingsFields{$_l_FieldsIndex}=$_al_IndexSettingsFields{$_l_Index})
				$_bo_FieldFound:=True:C214
				$_l_Index:=Size of array:C274($_al_IndexSettingsFields)
			End if 
		End for 
		If (Not:C34($_bo_FieldFound))  //There are changes
			$_bo_Changes:=True:C214
		End if 
		//Regardless of any changes setup a NEW array. this is because the array seems to not be correct at least on DB data.
		//we will test the array at the end
		$_l_TableReferences:=Num:C11("1"+String:C10(GEN_al_IndexSettingsTables{$_l_FieldsIndex}; "0000")+(String:C10(GEN_al_IndexSettingsFields{$_l_FieldsIndex}; "0000000")))
		$_l_TableRow:=Find in array:C230($_ar_TablesSet; $_l_TableReferences)
		If ($_l_TableRow<0)
			APPEND TO ARRAY:C911($_ar_TablesSet; $_l_TableReferences)
			$_l_TableRow:=Size of array:C274($_ar_TablesSet)
		End if 
		If (Size of array:C274($_al_RebuiltFields)<$_l_TableRow)
			APPEND TO ARRAY:C911($_al_RebuiltTables; GEN_al_IndexSettingsTables{$_l_FieldsIndex})
			APPEND TO ARRAY:C911($_al_RebuiltFields; GEN_al_IndexSettingsFields{$_l_FieldsIndex})
			
		Else 
			$_al_RebuiltTables{$_l_TableRow}:=GEN_al_IndexSettingsTables{$_l_FieldsIndex}
			$_al_RebuiltFields{$_l_TableRow}:=GEN_al_IndexSettingsFields{$_l_FieldsIndex}
		End if 
		
		
	End for 
	
	SORT ARRAY:C229($_al_RebuiltTables; $_al_RebuiltFields)
	If (Size of array:C274($_al_RebuiltTables)#Size of array:C274(GEN_al_IndexSettingsTables))
		$_bo_Changes:=True:C214
	End if 
	
	
	
	If ($_bo_Changes)
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		LOAD RECORD:C52([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		$_l_offset:=0
		//ARRAY LONGINT($_al_RebuiltTables;0)
		//ARRAY LONGINT($_al_RebuiltFields;0)
		VARIABLE TO BLOB:C532($_al_RebuiltTables; [PREFERENCES:116]DataBlob:2; $_l_offset)
		VARIABLE TO BLOB:C532($_al_RebuiltFields; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; GEN_al_IndexSettingsTables; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; GEN_al_IndexSettingsFields; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
		
		For ($_l_Index; 1; Size of array:C274(GEN_al_IndexSettingsTables))
			If (GEN_al_IndexSettingsTables{$_l_Index}<=Get last table number:C254)
				If (Is table number valid:C999(GEN_al_IndexSettingsTables{$_l_Index}))
					If (GEN_al_IndexSettingsFields{$_l_Index}<=Get last field number:C255(Table:C252(GEN_al_IndexSettingsTables{$_l_Index})))  //NG august 2004
						If (Is field number valid:C1000(GEN_al_IndexSettingsTables{$_l_Index}; GEN_al_IndexSettingsFields{$_l_Index}))
							$_ptr_FieldPointer:=Field:C253(GEN_al_IndexSettingsTables{$_l_Index}; GEN_al_IndexSettingsFields{$_l_Index})
							
							GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
							If (Not:C34($_bo_FieldIndexed))
								If (Application type:C494=4D Remote mode:K5:5)
									$_l_IndexingProcess:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; GEN_al_IndexSettingsTables{$_l_Index}; GEN_al_IndexSettingsFields{$_l_Index})
								Else 
									$_l_IndexingProcess:=New process:C317("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; GEN_al_IndexSettingsTables{$_l_Index}; GEN_al_IndexSettingsFields{$_l_Index})
									
								End if 
							End if 
						End if 
					Else 
						
					End if 
				End if 
			End if 
		End for 
	End if 
	If (Gen_Option)
		//save to file option
		$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
		If (OK=1)
			Close_DocUMENT($_ti_DocumentRef)
			SET BLOB SIZE:C606(GEN_IndexBLOB; 0)
			VARIABLE TO BLOB:C532(GEN_al_IndexSettingsTables; GEN_IndexBLOB; *)
			VARIABLE TO BLOB:C532(GEN_al_IndexSettingsFields; GEN_IndexBLOB; *)
			BLOB TO DOCUMENT:C526(document; GEN_IndexBLOB)
		End if 
		
	End if 
	CLEAR SEMAPHORE:C144("IndexSettings")
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("GEN restoreIndexes"; $_t_oldMethodName)