If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	C_BOOLEAN:C305(MSG_bo_NewMessage; MSG_bo_QuickMessage; SMS_bo_LockedRecipients)
	C_LONGINT:C283($_l_BlankRow; $_l_Index; $_l_OK)
	C_TEXT:C284($_t_oldMethodName; SMS_AccountName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Variable24"; Form event code:C388)


MSG_bo_NewMessage:=True:C214
MSG_bo_QuickMessage:=False:C215  // 19/08/03 pb
FIRST RECORD:C50([CONTACTS:1])
//ARRAY STRING(255;SD2_at_EmailAddresses;0)
ARRAY TEXT:C222(SMS_at_Mobile; 0)
ARRAY TEXT:C222(SD2_at_ContactIDs; 0)
//SELECTION TO ARRAY([CONTACTS]Mobile;SD2_at_EmailAddresses;[CONTACTS]Contact Code
SELECTION TO ARRAY:C260([CONTACTS:1]Mobile:12; SMS_at_Mobile; [CONTACTS:1]Contact_Code:2; SD2_at_ContactIDs)
//$_l_BlankRow:=Find in array(SD2_at_EmailAddresses;"")
$_l_BlankRow:=Find in array:C230(SMS_at_Mobile; "")
If ($_l_BlankRow>0)
	Gen_Confirm("Some records do not have a mobile number to send SMS to"; "Stop"; "Ignore")
	$_l_OK:=OK
Else 
	$_l_OK:=0
End if 
If ($_l_OK=0)
	SORT ARRAY:C229(SMS_at_Mobile; SD2_at_ContactIDs; <)
	$_l_BlankRow:=Find in array:C230(SMS_at_Mobile; "")
	If ($_l_BlankRow>0)
		//   ARRAY STRING(255;SD2_at_EmailAddresses;$_l_BlankRow-1)
		ARRAY TEXT:C222(SMS_at_Mobile; 0)
		ARRAY TEXT:C222(SD2_at_ContactIDs; $_l_BlankRow-1)
	End if 
	SMS_LoadVariables
	For ($_l_Index; 1; Size of array:C274(SMS_at_Mobile))  // 19/08/03 pb
		SMS_at_Mobile{$_l_Index}:=SMS_IntlPhoneNumber(->SMS_at_Mobile{$_l_Index})
	End for 
	If (SMS_AccountName#"")
		If (Size of array:C274(SD2_at_ContactIDs)>1)  // 19/08/03 pb
			Gen_Confirm("Separate Records In Diary?"; "Yes"; "No")
			$_l_OK:=OK
		Else 
			$_l_OK:=0
		End if 
		//    $sent:=False
		// All $sent stuff out 19/08/03 pb
		SMS_bo_LockedRecipients:=True:C214
		If ($_l_OK=1)
			HIDE WINDOW:C436
			//   $sent:=SMS_SendMessage ("";"";->SD2_at_EmailAddresses;->SD2_at_ContactIDs;Tru
			SMS_SendMessage(""; ""; ->SMS_at_Mobile; ->SD2_at_ContactIDs; True:C214)
			SHOW WINDOW:C435
		Else 
			HIDE WINDOW:C436
			//    $sent:=SMS_SendMessage ("";"";->SD2_at_EmailAddresses;->SD2_at_ContactIDs;Fa
			SMS_SendMessage(""; ""; ->SMS_at_Mobile; ->SD2_at_ContactIDs; False:C215)
			SHOW WINDOW:C435
			
		End if 
		//   If ($sent)
		CANCEL:C270
		//   End if
	End if 
Else 
	Gen_Alert("You must set up your SMS account first")
	
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Print.Variable24"; $_t_oldMethodName)
