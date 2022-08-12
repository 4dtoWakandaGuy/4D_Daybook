//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_THERMO
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
	C_BOOLEAN:C305(<>_bo_SplashHideThermo; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_THERMO")

//$_t_oldMethodName:=ERR_MethodTracker ("SPLASH_THERMO")

If (Count parameters:C259>0)
	<>_bo_SplashHideThermo:=$1
Else 
	<>_bo_SplashHideThermo:=True:C214
End if 
//ERR_MethodTrackerReturn ("SPLASH_THERMO";$_t_oldMethodName)