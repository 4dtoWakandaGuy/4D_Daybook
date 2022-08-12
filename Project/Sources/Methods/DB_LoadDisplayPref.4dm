//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadDisplayPref
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2009 15:55`Method: DB_LoadDisplayPref
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ARS_al_FormTable;0)
	//ARRAY TEXT(ARS_at_ColWidths;0)
	//ARRAY TEXT(ARS_at_FormFind;0)
	//ARRAY TEXT(ARS_at_FormName;0)
	//ARRAY TEXT(ARS_at_Sortname;0)
	C_BOOLEAN:C305($_bo_Save; $4)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ArraySize; $_l_FormRow; $_l_ItemID; $_l_offset; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableSTR; $0; $2; $3; $5)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_LoadDisplayPref")
While (Semaphore:C143("LoadingASpref"))
	DelayTicks(2)
End while 
READ WRITE:C146([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Array Soft preference")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL:11]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)

If (Records in selection:C76([PREFERENCES:116])=0)
	ARRAY LONGINT:C221(ARS_al_FormTable; 0)
	ARRAY TEXT:C222(ARS_at_FormName; 0)
	ARRAY TEXT:C222(ARS_at_FormFind; 0)
	ARRAY TEXT:C222(ARS_at_Sortname; 0)
	ARRAY TEXT:C222(ARS_at_ColWidths; 0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
	[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[PERSONNEL:11])
	VARIABLE TO BLOB:C532(ARS_al_FormTable; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(ARS_at_FormName; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(ARS_at_FormFind; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(ARS_at_Sortname; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(ARS_at_ColWidths; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	
End if 
If (Count parameters:C259>=2)
	
	ARRAY LONGINT:C221(ARS_al_FormTable; 0)
	ARRAY TEXT:C222(ARS_at_FormName; 0)
	ARRAY TEXT:C222(ARS_at_FormFind; 0)
	ARRAY TEXT:C222(ARS_at_Sortname; 0)
	ARRAY TEXT:C222(ARS_at_ColWidths; 0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ARS_al_FormTable; $_l_offset)
	If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ARS_at_FormName; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ARS_at_FormFind; $_l_offset)
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ARS_at_Sortname; $_l_offset)
				If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ARS_at_ColWidths; $_l_offset)
				End if 
			End if 
		End if 
	End if 
	$_l_ArraySize:=Size of array:C274(ARS_al_FormTable)
	ARRAY LONGINT:C221(ARS_al_FormTable; $_l_ArraySize)
	ARRAY TEXT:C222(ARS_at_FormName; $_l_ArraySize)
	ARRAY TEXT:C222(ARS_at_FormFind; $_l_ArraySize)
	ARRAY TEXT:C222(ARS_at_Sortname; $_l_ArraySize)
	ARRAY TEXT:C222(ARS_at_ColWidths; $_l_ArraySize)
	If (Count parameters:C259>=4)
		$_bo_Save:=$4
	Else 
		$_bo_Save:=False:C215
	End if 
	
	$0:=""
	If (Not:C34($_bo_Save))  // load A value
		
		Case of 
			: ($1=Table:C252(->[PRODUCTS:9]))
				$_t_TableSTR:=String:C10(Table:C252(->[PRODUCTS:9]))
				
				Case of 
					: ($2="dAsk_Product")
						$_l_FormRow:=Find in array:C230(ARS_at_FormFind; ($_t_TableSTR+$2))
						If ($_l_FormRow>0)
							If (Count parameters:C259>=5)
								$0:=ARS_at_ColWidths{$_l_FormRow}
							Else 
								$0:=ARS_at_Sortname{$_l_FormRow}
							End if 
							
						End if 
				End case 
		End case 
		
	Else 
		//Save a value
		Case of 
			: ($1=Table:C252(->[PRODUCTS:9]))
				$_t_TableSTR:=String:C10(Table:C252(->[PRODUCTS:9]))
				$0:=$3
				Case of 
					: ($2="dAsk_Product")
						$_l_FormRow:=Find in array:C230(ARS_at_FormFind; ($_t_TableSTR+$2))
						If ($_l_FormRow>0)
							ARS_at_Sortname{$_l_FormRow}:=$3
							If (Count parameters:C259>=5)
								ARS_at_ColWidths{$_l_FormRow}:=$5
							End if 
						Else 
							APPEND TO ARRAY:C911(ARS_al_FormTable; $1)
							APPEND TO ARRAY:C911(ARS_at_FormName; $2)
							APPEND TO ARRAY:C911(ARS_at_FormFind; $_t_TableSTR+$2)
							APPEND TO ARRAY:C911(ARS_at_Sortname; $3)
							If (Count parameters:C259>=5)
								APPEND TO ARRAY:C911(ARS_at_ColWidths; $5)
							Else 
								APPEND TO ARRAY:C911(ARS_at_ColWidths; "")
							End if 
						End if 
				End case 
		End case 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(ARS_al_FormTable; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ARS_at_FormName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ARS_at_FormFind; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ARS_at_Sortname; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ARS_at_ColWidths; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
	End if 
End if 
CLEAR SEMAPHORE:C144("LoadingASpref")
ERR_MethodTrackerReturn("DB_LoadDisplayPref"; $_t_oldMethodName)