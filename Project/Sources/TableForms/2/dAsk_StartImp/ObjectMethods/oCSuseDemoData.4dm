If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.oCSuseDemoData
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
	C_BOOLEAN:C305(CS_bo_DemoData)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.oCSuseDemoData"; Form event code:C388)
Gen_Confirm("Are you sure you want to import the demo user names?")
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
	//_O_DISABLE BUTTON(CS_bo_DemoData)
	OBJECT SET ENABLED:C1123(CS_bo_DemoData; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.oCSuseDemoData"; $_t_oldMethodName)
