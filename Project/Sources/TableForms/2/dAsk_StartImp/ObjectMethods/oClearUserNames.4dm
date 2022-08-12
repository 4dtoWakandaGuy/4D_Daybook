If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.oClearUserNames
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.oClearUserNames"; Form event code:C388)
Gen_Confirm("Are you sure you want to Delete the demo user names?")
If (OK=1)
	ARRAY TEXT:C222(DB_at_UserNames; 0)  //Note these are the personnel NOT the Daybook user names
	ARRAY TEXT:C222(DB_at_UserLogin; 0)
	ARRAY TEXT:C222(DB_at_userType; 0)
	OBJECT SET VISIBLE:C603(*; "oClearUserNames"; False:C215)
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.oClearUserNames"; $_t_oldMethodName)
