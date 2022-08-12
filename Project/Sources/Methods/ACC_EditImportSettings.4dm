//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_EditImportSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2012 14:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	C_BOOLEAN:C305($3; ACC_bo_AllowAdditions; ACC_bo_CSVhasHeader; ACC_bo_NotresetArrays)
	C_DATE:C307(ACC_D_OpeningBalanceDate)
	C_LONGINT:C283($_l_Offset; ACC_l_LoadPreferencesID; ACC_l_LoadPreferencesIDOLD)
	C_POINTER:C301($4)
	C_REAL:C285(ACC_r_OpeningBalance)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_AccountCode; $_t_oldMethodName; $1; $2; STK_t_editType)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ACC_EditImportSettings")
If (Count parameters:C259>=1)
	$_t_AccountCode:=$1
Else 
	$_t_AccountCode:=Gen_Request("Enter Account Code"; "")
End if 
If (Count parameters:C259>=2)
	STK_t_editType:=$2
Else 
	STK_t_editType:="CSV"
End if 
If (Count parameters:C259>=3)
	ACC_bo_AllowAdditions:=$3
Else 
	ACC_bo_AllowAdditions:=True:C214
End if 
ARRAY TEXT:C222(ACC_at_DaybookFields; 0)
ARRAY TEXT:C222(ACC_at_StatementFields; 0)
ACC_l_LoadPreferencesIDOLD:=0

ACC_l_LoadPreferencesID:=PREF_GetPreferenceID("Bank Account"+String:C10($_t_AccountCode))
ACC_l_LoadPreferencesIDOLD:=ACC_l_LoadPreferencesID
If (Count parameters:C259>=4)
	//New definition settings..
	ACC_l_LoadPreferencesIDOLD:=ACC_l_LoadPreferencesID
	ACC_bo_CSVhasHeader:=False:C215
	ARRAY TEXT:C222(ACC_at_QIFFields; 0)
	ARRAY TEXT:C222(ACC_at_StatementFields; 0)
	ACC_r_OpeningBalance:=0
	ACC_D_OpeningBalanceDate:=!00-00-00!
	If ([PREFERENCES:116]IDNumber:1#ACC_l_LoadPreferencesID)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
	End if 
	
	
End if 
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=ACC_l_LoadPreferencesID
	AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
	<>SYS_t_LastSavedTableName:="PREFERENCES"
	SAVE RECORD:C53([PREFERENCES:116])
End if 
$_l_Offset:=0
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_D_OpeningBalanceDate; $_l_Offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_r_OpeningBalance; $_l_Offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_StatementFields; $_l_Offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DaybookFields; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_bo_CSVhasHeader; $_l_Offset)  //QIF Format Fields
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFFields; $_l_Offset)  //QIF Format Fields
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFDBFields; $_l_Offset)  //QIF map to 4D
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
Case of 
	: (STK_t_editType="CSV")
		ACC_l_LoadPreferencesID:=0
		If (Count parameters:C259>=4)
			ACC_bo_NotresetArrays:=True:C214
			COPY ARRAY:C226($4->; ACC_at_StatementFields)
			ARRAY TEXT:C222(ACC_at_DaybookFields; Size of array:C274(ACC_at_StatementFields))
			ARRAY TEXT:C222(ACC_at_QIFFields; 0)
			ARRAY TEXT:C222(ACC_at_QIFDBFields; 0)
		End if 
	: (STK_t_editType="QIF")
End case 




Open window:C153((Screen width:C187/2)-170; (Screen height:C188/2)-140; (Screen width:C187/2)+170; (Screen height:C188/2)+140; Palette window:K34:3)
DIALOG:C40("ACC_ImportFieldMap")
ACC_l_LoadPreferencesID:=ACC_l_LoadPreferencesIDOLD
If (OK=1)
	If (Size of array:C274(ACC_at_DaybookFields)=Size of array:C274(ACC_at_StatementFields)) & (Size of array:C274(ACC_at_QIFFields)=Size of array:C274(ACC_at_QIFDBFields))
		//if user is manually adding just make sure this is correct
		Case of 
			: (STK_t_editType="CSV")
				
			: (STK_t_editType="QIF")
		End case 
		READ WRITE:C146([PREFERENCES:116])
		If ([PREFERENCES:116]IDNumber:1#ACC_l_LoadPreferencesID)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=ACC_l_LoadPreferencesID
				
			Else 
				LOAD RECORD:C52([PREFERENCES:116])
			End if 
		Else 
			LOAD RECORD:C52([PREFERENCES:116])
		End if 
		$_l_Offset:=0
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(ACC_D_OpeningBalanceDate; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_r_OpeningBalance; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_at_StatementFields; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_at_DaybookFields; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_bo_CSVhasHeader; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_at_QIFFields; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(ACC_at_QIFDBFields; [PREFERENCES:116]DataBlob:2; *)
		AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
		<>SYS_t_LastSavedTableName:="PREFERENCES"
		SAVE RECORD:C53([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
	End if 
End if 

CLOSE WINDOW:C154
ERR_MethodTrackerReturn("ACC_EditImportSettings"; $_t_oldMethodName)