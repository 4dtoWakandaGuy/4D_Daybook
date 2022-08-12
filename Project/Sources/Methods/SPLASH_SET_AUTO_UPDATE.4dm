//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_SET_AUTO_UPDATE
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
	C_LONGINT:C283(<>_l_SplashUpdateCode; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_SET_AUTO_UPDATE")

If (False:C215)  //method name
	//BSW 28/07/04
End if 
$_t_oldMethodName:=ERR_MethodTracker("SPLASH_SET_AUTO_UPDATE")

If ((Current user:C182="Designer") & (Not:C34(Is compiled mode:C492)))  //don't want splash for designer
	<>_l_SplashUpdateCode:=0
	SPLASH_ENABLE_CANCEL
	SPLASH_THERMO
Else 
	
	If (Count parameters:C259>0)
		<>_l_SplashUpdateCode:=$1
	Else 
		<>_l_SplashUpdateCode:=1
	End if 
End if 
ERR_MethodTrackerReturn("SPLASH_SET_AUTO_UPDATE"; $_t_oldMethodName)