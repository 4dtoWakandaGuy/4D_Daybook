//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SetBuildTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:45
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

$_t_oldMethodName:=ERR_MethodTracker("IWS_SetBuildTime")
//LOG_SetMethod ("IWS_SetBuildTime")

//IWS_l_MSendPageBuild:=Milliseconds-IWS_l_MSStartPageBuild

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_SetBuildTime"; $_t_oldMethodName)