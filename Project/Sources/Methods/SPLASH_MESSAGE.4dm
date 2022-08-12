//%attributes = {}
If (False:C215)
	//Project Method Name:      SPLASH_MESSAGE
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
	C_TEXT:C284(<>Splash_t_SplashProgressMessage; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_MESSAGE")
If (Count parameters:C259>0)
	While (Semaphore:C143("SplashMessageUpdate"))
		DelayTicks(10)
	End while 
	<>Splash_t_SplashProgressMessage:=$1
	CLEAR SEMAPHORE:C144("SplashMessageUpdate")
End if 
ERR_MethodTrackerReturn("SPLASH_MESSAGE"; $_t_oldMethodName)