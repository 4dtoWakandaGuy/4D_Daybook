If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable4
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
	_O_C_INTEGER:C282(<>iSMS_MaxMessageLength)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SMS_at_Mobile;0)
	//ARRAY TEXT(SMS_at_Name;0)
	C_BOOLEAN:C305(MSG_bo_NewMessage)
	C_LONGINT:C283($_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; tMessage; vT; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable4"; Form event code:C388)
Case of 
	: (MSG_bo_NewMessage=False:C215)
		// no need to do anything
		ACCEPT:C269
	: (Length:C16(vT)=0)
		//   ALERT("Please enter the message text!")
		Gen_Alert("Please enter the message text!")
		GOTO OBJECT:C206(vT)
	: (Length:C16(vT)><>iSMS_MaxMessageLength)  // shouldn't ever happen really
		//   ALERT("The maximum length of the message is "+String(◊iSMS_MaxMessageLength)+
		Gen_Alert("The maximum length of the message is "+String:C10(<>iSMS_MaxMessageLength)+" characters.")
	Else 
		If (WS_t_EmailName#"")
			CONFIRM:C162("Do you want to add "+WS_t_EmailName+" to the recipient list?"; "Yes!"; "No")
			If (OK=1)
				$_l_SizeofArray:=Size of array:C274(SMS_at_Name)+1
				INSERT IN ARRAY:C227(SMS_at_Name; $_l_SizeofArray)
				INSERT IN ARRAY:C227(SMS_at_Mobile; $_l_SizeofArray)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; $_l_SizeofArray)
				SMS_at_Name{$_l_SizeofArray}:=WS_t_EmailName
				SMS_at_Mobile{$_l_SizeofArray}:=WS_t_EmailAddress
				SD2_at_ContactIDs{$_l_SizeofArray}:=WS_t_ContactID
				WS_t_EmailName:=""
				WS_t_EmailAddress:=""
			End if 
		End if 
		tMessage:=vT
		ACCEPT:C269
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable4"; $_t_oldMethodName)
