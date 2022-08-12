//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_EditDataModel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BK_al_ADBFIELDNUM;0)
	//ARRAY LONGINT(BK_al_aDBTableNum;0)
	//ARRAY LONGINT(BK_al_MapRecID;0)
	//ARRAY LONGINT(BK_al_PsuedoNumber;0)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKDataDefaults;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(BK_at_BKFieldName;0)
	//ARRAY TEXT(BK_at_DBFieldName;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK; DSS_bo_Enabled)
	C_LONGINT:C283($_l_ArraySize; $_l_CurrentWinRefOLD; $_l_Delay; $_l_Index; $_l_ItemID; $_l_ModelIDposition; $_l_Offset; $_l_Repeats; $_l_Tries; $_l_WindowReference; BK_l_CustDataModelID)
	C_LONGINT:C283(BK_l_DataModelID; BK_l_DayBookContext; BK_l_itemDataModelID; BK_l_Save; DB_l_DataModelID; DM_l_BKDataDefaults; DS_l_ModelSeq; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($0; $1; $2; $3; $5)
	C_TEXT:C284($_t_oldMethodName; $4; BK_t_BKCONTEXT; BK_t_DataModelName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_EditDataModel")
BK_l_CustDataModelID:=0
BK_l_itemDataModelID:=0
BK_t_DataModelName:=""
DM_l_BKDataDefaults:=0
$0:=DB_l_DataModelID
If (Count parameters:C259>=1)
	BK_l_DataModelID:=$1
	If (Count parameters:C259>=2)
		BK_l_itemDataModelID:=$3
		BK_l_CustDataModelID:=$2
	End if 
	If (Count parameters:C259>=4)
		BK_t_DataModelName:=$4
	End if 
	If (Count parameters:C259>=5)
		DM_l_BKDataDefaults:=$5
	End if 
	HIDE WINDOW:C436
	
	If (Count parameters:C259>=3)
		$_l_WindowReference:=Open window:C153($2; $3; $2; $3; 4)
	Else 
		$_l_WindowReference:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
	End if 
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=$_l_WindowReference
BK_l_Save:=0
DIALOG:C40([USER:15]; "BK_DataModel")
CLOSE WINDOW:C154
SHOW WINDOW:C435
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (BK_l_Save=1)
	If (BK_l_DataModelID>0)
		//existing record
		CREATE EMPTY SET:C140([EW_BK_FieldMap:121]; "Keep")
		CREATE EMPTY SET:C140([EW_BK_FieldMap:121]; "Delete")
		QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=BK_l_DataModelID)
		CREATE SET:C116([EW_BK_FieldMap:121]; "CurrentSelection")
		
		For ($_l_Index; 1; Size of array:C274(BK_at_BKFieldName))
			Case of 
				: (BK_al_PsuedoNumber{$_l_Index}<0)  //new record
					//New Record"
					READ WRITE:C146([EW_BK_FieldMap:121])
					CREATE RECORD:C68([EW_BK_FieldMap:121])
					[EW_BK_FieldMap:121]DayBookTableNumber:1:=BK_al_aDBTableNum{$_l_Index}
					[EW_BK_FieldMap:121]DayBookFieldNumber:2:=BK_al_ADBFIELDNUM{$_l_Index}
					[EW_BK_FieldMap:121]BKFieldName:3:=BK_at_BKFieldName{$_l_Index}
					If ([EW_BK_FieldMap:121]DayBookTableNumber:1>0) & ([EW_BK_FieldMap:121]DayBookFieldNumber:2>0)
						[EW_BK_FieldMap:121]DaybookFieldType:4:=Type:C295(Field:C253([EW_BK_FieldMap:121]DayBookTableNumber:1; [EW_BK_FieldMap:121]DayBookFieldNumber:2)->)
					End if 
					[EW_BK_FieldMap:121]x_DestinationContext:8:=BK_l_DayBookContext
					[EW_BK_FieldMap:121]DaybookFieldName:5:=BK_at_DBFieldName{$_l_Index}
					[EW_BK_FieldMap:121]BKTableName:6:=BK_t_BKCONTEXT
					[EW_BK_FieldMap:121]x_MapSetID:7:=BK_l_DataModelID
					DB_SaveRecord(->[EW_BK_FieldMap:121])
					AA_CheckFileUnlocked(->[EW_BK_FieldMap:121]x_MapSetID:7)
					ADD TO SET:C119([EW_BK_FieldMap:121]; "CurrentSelection")
					ADD TO SET:C119([EW_BK_FieldMap:121]; "Keep")
					UNLOAD RECORD:C212([EW_BK_FieldMap:121])
				: (BK_al_PsuedoNumber{$_l_Index}>1000)  //modified
					READ WRITE:C146([EW_BK_FieldMap:121])
					QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_RecID:9=BK_al_MapRecID{$_l_Index})
					[EW_BK_FieldMap:121]DayBookTableNumber:1:=BK_al_aDBTableNum{$_l_Index}
					[EW_BK_FieldMap:121]DayBookFieldNumber:2:=BK_al_ADBFIELDNUM{$_l_Index}
					[EW_BK_FieldMap:121]BKFieldName:3:=BK_at_BKFieldName{$_l_Index}
					If ([EW_BK_FieldMap:121]DayBookTableNumber:1>0) & ([EW_BK_FieldMap:121]DayBookFieldNumber:2>0)
						[EW_BK_FieldMap:121]DaybookFieldType:4:=Type:C295(Field:C253([EW_BK_FieldMap:121]DayBookTableNumber:1; [EW_BK_FieldMap:121]DayBookFieldNumber:2)->)
					End if 
					[EW_BK_FieldMap:121]DaybookFieldName:5:=BK_at_DBFieldName{$_l_Index}
					[EW_BK_FieldMap:121]BKTableName:6:=BK_t_BKCONTEXT
					[EW_BK_FieldMap:121]x_DestinationContext:8:=BK_l_DayBookContext
					[EW_BK_FieldMap:121]x_MapSetID:7:=BK_l_DataModelID
					DB_SaveRecord(->[EW_BK_FieldMap:121])
					AA_CheckFileUnlocked(->[EW_BK_FieldMap:121]x_MapSetID:7)
					ADD TO SET:C119([EW_BK_FieldMap:121]; "CurrentSelection")
					ADD TO SET:C119([EW_BK_FieldMap:121]; "Keep")
					UNLOAD RECORD:C212([EW_BK_FieldMap:121])
					READ ONLY:C145([EW_BK_FieldMap:121])
				Else 
					QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_RecID:9=BK_al_MapRecID{$_l_Index})
					ADD TO SET:C119([EW_BK_FieldMap:121]; "Keep")
			End case 
		End for 
		//all the records are now resaved
		DIFFERENCE:C122("CurrentSelection"; "Keep"; "Delete")
		//and in the delete have been removed from the array so delete them
		USE SET:C118("Delete")
		If (Records in selection:C76([EW_BK_FieldMap:121])>0)
			DELETE SELECTION:C66([EW_BK_FieldMap:121])
		End if 
		$_l_Tries:=0
		While (Semaphore:C143("LoadingDataModelPrefs"))
			$_l_Tries:=$_l_Tries+1
			DelayTicks(2*(1+$_l_Tries))
		End while 
		READ ONLY:C145([PREFERENCES:116])
		$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
		If ($_l_ItemID>0)
			DSS_bo_Enabled:=False:C215
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			//here use a Check_Locked
			If (Records in selection:C76([PREFERENCES:116])=0)
				//add the the preferences list here
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-2
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			//this will be ONE record
			DM_BKDataModelBlobtoVariables
			$_l_ArraySize:=Size of array:C274(DM_at_BKModelNames)
			//just to prevent any mismatch
			ARRAY TEXT:C222(DM_at_BKModelNames; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKModelIDS; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKDataDefaults; $_l_ArraySize)
			$_l_ModelIDposition:=Find in array:C230(DM_al_BKModelIDS; BK_l_DataModelID)
			If ($_l_ModelIDposition>0)
				If (DM_at_BKModelNames{$_l_ModelIDposition}#BK_t_DataModelName) | (DM_al_BKAssModel1IDS{$_l_ModelIDposition}#BK_l_CustDataModelID) | (DM_al_BKAssModel2IDS{$_l_ModelIDposition}#BK_l_itemDataModelID)
					//model name has been changed
					READ WRITE:C146([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					$_bo_Continue:=$_bo_OK
					If ($_bo_Continue)
						DM_at_BKModelNames{$_l_ModelIDposition}:=BK_t_DataModelName
						DM_al_BKAssModel1IDS{$_l_ModelIDposition}:=BK_l_CustDataModelID
						DM_al_BKAssModel2IDS{$_l_ModelIDposition}:=BK_l_itemDataModelID
						DM_al_BKDataDefaults{$_l_ModelIDposition}:=DM_l_BKDataDefaults
						
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						VARIABLE TO BLOB:C532(DM_at_BKModelNames; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(DM_al_BKModelIDS; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(DM_al_BKAssModel1IDS; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(DM_al_BKAssModel2IDS; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(DM_al_BKDataDefaults; [PREFERENCES:116]DataBlob:2; *)
						DB_SaveRecord(->[PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
					End if 
					
				End if 
				
			Else 
				//it does not existQ!@!!!
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-2
				DB_SaveRecord(->[PREFERENCES:116])
				$_l_Offset:=0
				ARRAY TEXT:C222(DM_at_BKModelNames; 0)
				ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
				ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
				ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
				ARRAY LONGINT:C221(DM_al_BKDataDefaults; 0)
				
				DM_BKDataModelBlobtoVariables
				$_l_ArraySize:=Size of array:C274(DM_at_BKModelNames)
				//just to prevent any mismatch
				ARRAY TEXT:C222(DM_at_BKModelNames; $_l_ArraySize)
				ARRAY LONGINT:C221(DM_al_BKModelIDS; $_l_ArraySize)
				ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; $_l_ArraySize)
				ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; $_l_ArraySize)
				ARRAY LONGINT:C221(DM_al_BKDataDefaults; $_l_ArraySize)
				
				
				//now add to the array
				INSERT IN ARRAY:C227(DM_at_BKModelNames; Size of array:C274(DM_at_BKModelNames)+1; 1)
				INSERT IN ARRAY:C227(DM_al_BKModelIDS; Size of array:C274(DM_al_BKModelIDS)+1; 1)
				INSERT IN ARRAY:C227(DM_al_BKAssModel1IDS; Size of array:C274(DM_al_BKAssModel1IDS)+1; 1)
				INSERT IN ARRAY:C227(DM_al_BKAssModel2IDS; Size of array:C274(DM_at_BKModelNames)+1; 1)
				INSERT IN ARRAY:C227(DM_al_BKDataDefaults; Size of array:C274(DM_al_BKDataDefaults)+1; 1)
				DM_al_BKModelIDS{Size of array:C274(DM_al_BKModelIDS)}:=DS_l_ModelSeq
				DM_at_BKModelNames{Size of array:C274(DM_al_BKModelIDS)}:=BK_t_DataModelName
				DM_al_BKAssModel1IDS{Size of array:C274(DM_al_BKAssModel1IDS)}:=BK_l_CustDataModelID
				DM_al_BKAssModel2IDS{Size of array:C274(DM_al_BKAssModel2IDS)}:=BK_l_itemDataModelID
				DM_al_BKDataDefaults{Size of array:C274(DM_al_BKDataDefaults)}:=DM_l_BKDataDefaults
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				VARIABLE TO BLOB:C532(DM_at_BKModelNames; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(DM_al_BKModelIDS; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(DM_al_BKAssModel1IDS; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(DM_al_BKAssModel2IDS; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(DM_al_BKDataDefaults; [PREFERENCES:116]DataBlob:2; *)
				DB_SaveRecord(->[PREFERENCES:116])
				BK_l_DataModelID:=DS_l_ModelSeq
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
			End if 
		End if 
		CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
		
	Else 
		//new record
		//need an ID first
		DSS_bo_Enabled:=False:C215
		DS_l_ModelSeq:=0
		DS_l_ModelSeq:=AA_GetNextIDinMethod(->DS_l_ModelSeq)
		// (DS_l_ModelSeq will be the next ID)
		ARRAY TEXT:C222(DM_at_BKModelNames; 0)
		ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
		ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
		ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
		ARRAY LONGINT:C221(DM_al_BKDataDefaults; 0)
		$_l_Tries:=0
		While (Semaphore:C143("LoadingDataModelPrefs"))
			$_l_Tries:=$_l_Tries+1
			DelayTicks(2*(1+$_l_Tries))
		End while 
		READ ONLY:C145([PREFERENCES:116])
		$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
		If ($_l_ItemID>0)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			//here use a Check_Locked
			If (Records in selection:C76([PREFERENCES:116])=0)
				//add the the preferences list here
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-2
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			//this will be ONE record
			$_l_Offset:=0
			ARRAY TEXT:C222(DM_at_BKModelNames; 0)
			ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
			ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
			ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
			ARRAY LONGINT:C221(DM_al_BKDataDefaults; 0)
			DM_BKDataModelBlobtoVariables
			
			//just to prevent any mismatch
			
			//now add to the array
			INSERT IN ARRAY:C227(DM_at_BKModelNames; Size of array:C274(DM_at_BKModelNames)+1; 1)
			INSERT IN ARRAY:C227(DM_al_BKModelIDS; Size of array:C274(DM_al_BKModelIDS)+1; 1)
			INSERT IN ARRAY:C227(DM_al_BKAssModel1IDS; Size of array:C274(DM_al_BKAssModel1IDS)+1; 1)
			INSERT IN ARRAY:C227(DM_al_BKAssModel2IDS; Size of array:C274(DM_at_BKModelNames)+1; 1)
			INSERT IN ARRAY:C227(DM_al_BKDataDefaults; Size of array:C274(DM_al_BKDataDefaults)+1; 1)
			DM_al_BKModelIDS{Size of array:C274(DM_al_BKModelIDS)}:=DS_l_ModelSeq
			DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)}:=BK_t_DataModelName
			DM_al_BKAssModel1IDS{Size of array:C274(DM_al_BKAssModel1IDS)}:=BK_l_CustDataModelID
			DM_al_BKAssModel2IDS{Size of array:C274(DM_al_BKAssModel2IDS)}:=BK_l_itemDataModelID
			DM_al_BKDataDefaults{Size of array:C274(DM_al_BKDataDefaults)}:=DM_l_BKDataDefaults
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_at_BKModelNames; [PREFERENCES:116]DataBlob:2; *)
			
			VARIABLE TO BLOB:C532(DM_al_BKModelIDS; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_al_BKAssModel1IDS; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_al_BKAssModel2IDS; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_al_BKDataDefaults; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			BK_l_DataModelID:=DS_l_ModelSeq
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
		CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
		
		For ($_l_Index; 1; Size of array:C274(BK_at_BKFieldName))
			//New Record"
			CREATE RECORD:C68([EW_BK_FieldMap:121])
			[EW_BK_FieldMap:121]DayBookTableNumber:1:=BK_al_aDBTableNum{$_l_Index}
			[EW_BK_FieldMap:121]DayBookFieldNumber:2:=BK_al_ADBFIELDNUM{$_l_Index}
			[EW_BK_FieldMap:121]BKFieldName:3:=BK_at_BKFieldName{$_l_Index}
			If ([EW_BK_FieldMap:121]DayBookTableNumber:1>0) & ([EW_BK_FieldMap:121]DayBookFieldNumber:2>0)
				[EW_BK_FieldMap:121]DaybookFieldType:4:=Type:C295(Field:C253([EW_BK_FieldMap:121]DayBookTableNumber:1; [EW_BK_FieldMap:121]DayBookFieldNumber:2)->)
			End if 
			[EW_BK_FieldMap:121]x_DestinationContext:8:=BK_l_DayBookContext
			[EW_BK_FieldMap:121]DaybookFieldName:5:=BK_at_DBFieldName{$_l_Index}
			[EW_BK_FieldMap:121]BKTableName:6:=BK_t_BKCONTEXT
			[EW_BK_FieldMap:121]x_MapSetID:7:=BK_l_DataModelID
			DB_SaveRecord(->[EW_BK_FieldMap:121])
			AA_CheckFileUnlocked(->[EW_BK_FieldMap:121]x_MapSetID:7)
		End for 
		
		
	End if 
	
End if 
$0:=BK_l_DataModelID
ERR_MethodTrackerReturn("BK_EditDataModel"; $_t_oldMethodName)
