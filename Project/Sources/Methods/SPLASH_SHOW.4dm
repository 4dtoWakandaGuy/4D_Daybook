//%attributes = {}
If (False:C215)
	//Project Method Name:      SPLASH_SHOW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>_bo_splashbringtofront; <>_bo_SplashHidden)
	C_LONGINT:C283(<>_l_splashscreenprocess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_SHOW")
If (<>_l_splashscreenprocess>0)
	<>_bo_splashbringtofront:=True:C214
	<>_bo_SplashHidden:=False:C215
	
	SHOW PROCESS:C325(<>_l_splashscreenprocess)
	
	RESUME PROCESS:C320(<>_l_splashscreenprocess)
End if 
ERR_MethodTrackerReturn("SPLASH_SHOW"; $_t_oldMethodName)