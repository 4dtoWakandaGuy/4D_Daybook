If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable3
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
	C_LONGINT:C283($_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable3"; Form event code:C388)
Case of 
	: (WS_t_EmailName="")
		//   ALERT("Please enter a Contact's name!")
		Gen_Alert("Please enter a Contact's name!")
		GOTO OBJECT:C206(WS_t_EmailName)
	: (WS_t_EmailAddress="")
		//   ALERT("There is no Mobile Number for the selected Contact.")
		Gen_Alert("There is no Mobile Number for the selected Contact.")
	: (Find in array:C230(SD2_at_ContactIDs; WS_t_ContactID)>0)
		//   ALERT("That contact has already been selected.")
		Gen_Alert("That contact has already been selected.")
		WS_t_EmailName:=""
		WS_t_EmailAddress:=""
		GOTO OBJECT:C206(WS_t_EmailName)
	Else 
		$_l_SizeofArray:=Size of array:C274(SMS_at_Name)+1
		INSERT IN ARRAY:C227(SMS_at_Name; $_l_SizeofArray)
		INSERT IN ARRAY:C227(SMS_at_Mobile; $_l_SizeofArray)
		INSERT IN ARRAY:C227(SD2_at_ContactIDs; $_l_SizeofArray)
		SMS_at_Name{$_l_SizeofArray}:=WS_t_EmailName
		SMS_at_Mobile{$_l_SizeofArray}:=WS_t_EmailAddress
		SD2_at_ContactIDs{$_l_SizeofArray}:=WS_t_ContactID
		WS_t_EmailName:=""
		WS_t_EmailAddress:=""
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable3"; $_t_oldMethodName)
