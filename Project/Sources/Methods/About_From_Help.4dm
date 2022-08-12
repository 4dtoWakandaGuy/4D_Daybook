//%attributes = {}
If (False:C215)
	//Project Method Name:      About_From_Help
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
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

$_t_oldMethodName:=ERR_MethodTracker("About_From_Help")
About_Daybook(True:C214)
ERR_MethodTrackerReturn("About_From_Help"; $_t_oldMethodName)
