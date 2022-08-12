If (False:C215)
	//Table Form Method Name: [USER]DEI_Rescue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DEI_Rescue"; Form event code:C388)
DEI_RescueFormMethod
ERR_MethodTrackerReturn("FM [USER].DEI_Rescue"; $_t_oldMethodName)
