If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	//ARRAY TEXT(SMS_at_Name;0)
	C_BOOLEAN:C305($_bo_CanDelete)
	C_LONGINT:C283($_l_SelectedRow; WS_l_SelectedEmailName)
	C_TEXT:C284($_t_oldMethodName; SMS_t_Mobile; SMS_t_Name; WS_t_ContactID)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Button1"; Form event code:C388)

$_bo_CanDelete:=True:C214
If (SMS_at_Name>0)
	If (SD2_at_ContactIDs{SMS_at_Name}#"")
		If (SD2_at_ContactIDs{SMS_at_Name}=[DIARY:12]Contact_Code:2)
			//     ALERT("Sorry, you cannot remove the main contact from this SMS.")
			Gen_Alert("Sorry, you cannot remove the main contact from this SMS.")
			$_bo_CanDelete:=False:C215
		Else 
		End if 
		
	End if 
End if 
//SETEMAILFORMOBJECTS
If ($_bo_CanDelete)
	$_l_SelectedRow:=SMS_at_Name
	//      DELETE ELEMENT(SD2_at_EmailType;$_l_SelectedRow;1)
	DELETE FROM ARRAY:C228(SMS_at_Mobile; $_l_SelectedRow; 1)
	DELETE FROM ARRAY:C228(SMS_at_Name; $_l_SelectedRow; 1)
	DELETE FROM ARRAY:C228(SD2_at_ContactIDs; $_l_SelectedRow; 1)
	WS_l_SelectedEmailName:=0
	SMS_t_Name:=""
	SMS_t_Mobile:=""
	WS_t_ContactID:=""
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Button1"; $_t_oldMethodName)
