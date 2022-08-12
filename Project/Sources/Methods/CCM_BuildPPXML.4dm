//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_BuildPPXML
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2012 13:04
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

$_t_oldMethodName:=ERR_MethodTracker("CCM_BuildPPXML")
ERR_MethodTrackerReturn("CCM_BuildPPXML"; $_t_oldMethodName)