//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_ENABLE_CANCEL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>_bo_SplashEnableCancel)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_ENABLE_CANCEL")

//$_t_oldMethodName:=ERR_MethodTracker ("SPLASH_ENABLE_CANCEL")
<>_bo_SplashEnableCancel:=True:C214
//ERR_MethodTrackerReturn ("SPLASH_ENABLE_CANCEL";$_t_oldMethodName)