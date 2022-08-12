If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_UserLogin;0)
	//ARRAY TEXT(DB_at_UserNames;0)
	//ARRAY TEXT(DB_at_userType;0)
	C_BOOLEAN:C305(CS_bo_ImportFromDaybook)
	C_TEXT:C284($_t_oldMethodName; DB_t_Address; DB_T_Offscreen1; DB_T_Offscreen2; DB_t_Organisation; DB_t_Password1; DB_t_Password2; DB_t_userName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.Variable6"; Form event code:C388)
Case of 
	: (FORM Get current page:C276=1)
		If (CS_bo_ImportFromDaybook)
			ACCEPT:C269
		Else 
			If (DB_t_userName#"")
				If (DB_t_Organisation#"")
					If (DB_t_Address#"")
						ARRAY TEXT:C222(DB_at_UserNames; 0)  //Note these are the personnel NOT the Daybook user names
						ARRAY TEXT:C222(DB_at_UserLogin; 0)
						ARRAY TEXT:C222(DB_at_userType; 0)
						
						OBJECT SET VISIBLE:C603(*; "oClearUserNames"; False:C215)
						
						DB_T_Offscreen1:=""
						DB_T_Offscreen2:=""
						DB_t_Password1:=""
						DB_t_Password2:=""
						FORM GOTO PAGE:C247(2)
					Else 
						Gen_Alert("You must enter an Address")
					End if 
				Else 
					Gen_Alert("You must enter a company or organisation name, this can be the same as the user name for a sole trader or partnership")
				End if 
			Else 
				Gen_Alert("You mustr enter a user name")
			End if 
		End if 
	: (FORM Get current page:C276=2)
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.Variable6"; $_t_oldMethodName)
