If (False:C215)
	//object Name: [USER]Error_Report.oListofattachments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Error_Report.oListofattachments"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].Error_Report.oListofattachments"; $_t_oldMethodName)