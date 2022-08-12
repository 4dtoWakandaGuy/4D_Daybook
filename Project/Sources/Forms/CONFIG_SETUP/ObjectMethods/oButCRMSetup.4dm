If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oButCRMSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2012 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_SetupSection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oButCRMSetup"; Form event code:C388)
//Remember to save whatever we are looking at first

//CRM-Left hand options are..Contacts(contacts and companies)
//                           Diary Manager
DB_l_SetupSection:=3
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oButCRMSetup"; $_t_oldMethodName)