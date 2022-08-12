//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AN_ViaJavaScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2009 11:58`Method: CCM_AN_ViaJavaScript
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

$_t_oldMethodName:=ERR_MethodTracker("CCM_AN_ViaJavaScript")
ERR_MethodTrackerReturn("CCM_AN_ViaJavaScript"; $_t_oldMethodName)