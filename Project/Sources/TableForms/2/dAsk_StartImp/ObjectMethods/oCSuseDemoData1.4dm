If (False:C215)
	//object Method Name: Object Name:      [COMPANIES].dAsk_StartImp.oCSuseDemoData1
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
	C_TEXT:C284($_t_oldMethodName; DB_t_Address; DB_T_Offscreen1; DB_T_Offscreen2; DB_t_Organisation; DB_t_Password1; DB_t_Password2; DB_t_User)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.oCSuseDemoData1"; Form event code:C388)
If (DB_t_User#"")
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
			Gen_Confirm("This option will setup a default set of preferences and data to enable assesment of the system. Please be aware that there many customisable features in the system to enable it to be configured to suit specific needs?")
			If (OK=1)
				ARRAY TEXT:C222(DB_at_UserNames; 0)  //Note these are the personnel NOT the Daybook user names
				ARRAY TEXT:C222(DB_at_UserLogin; 0)
				ARRAY TEXT:C222(DB_at_userType; 0)
				APPEND TO ARRAY:C911(DB_at_UserNames; "Donna Pilchard")
				APPEND TO ARRAY:C911(DB_at_UserLogin; "DaybookDemo")
				APPEND TO ARRAY:C911(DB_at_userType; "Administrator")
				APPEND TO ARRAY:C911(DB_at_UserNames; "Richard Code")
				APPEND TO ARRAY:C911(DB_at_UserLogin; "DaybookDemo")
				APPEND TO ARRAY:C911(DB_at_userType; "User")
				Gen_Alert("Note that for your convenience the default password for these users is "+Char:C90(39)+"DaybookDemo"+Char:C90(39))
				OBJECT SET VISIBLE:C603(*; "oClearUserNames"; True:C214)
				DB_T_Offscreen1:="DaybookDemo"
				DB_T_Offscreen2:="DaybookDemo"
				//create the personnel records
				
			End if 
		Else 
			Gen_Alert("You must enter an Address")
		End if 
	Else 
		Gen_Alert("You must enter a company or organisation name, this can be the same as the user name for a sole trader or partnership")
	End if 
Else 
	Gen_Alert("You must enter a user name")
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.oCSuseDemoData1"; $_t_oldMethodName)
