//%attributes = {}
If (False:C215)
	//Project Method Name:      SPLASH_END_GRACEFULLY
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
	C_BOOLEAN:C305(<>_bo_SplashAutoUpdate; $_bo_closesplash; $2)
	C_LONGINT:C283(<>_l_splashThermoMeter)
	C_TEXT:C284($_s41_message; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_END_GRACEFULLY")

If (Count parameters:C259>0)
	$_s41_message:=$1
Else 
	$_s41_message:="Finishing ..."
End if 

If (Count parameters:C259>1)
	$_bo_closesplash:=$2
Else 
	$_bo_closesplash:=True:C214
End if 

<>_bo_SplashAutoUpdate:=True:C214

SPLASH_UPDATE($_s41_message)

If (<>_l_splashThermoMeter>85)
	SPLASH_UPDATE($_s41_message; 98)
Else 
	Repeat 
		IDLE:C311
		DelayTicks(1)
		<>_l_splashThermoMeter:=<>_l_splashThermoMeter+1
		If (<>_l_splashThermoMeter>85)
			SPLASH_MESSAGE("Finishing ...")
		End if 
	Until (<>_l_splashThermoMeter>98)
End if 

If ($_bo_closesplash)
	$_s41_message:="Finishing ..."
	SPLASH_UPDATE($_s41_message; 100; -1; False:C215)  //-1 as $3 will stop splash screen
End if 
ERR_MethodTrackerReturn("SPLASH_END_GRACEFULLY"; $_t_oldMethodName)