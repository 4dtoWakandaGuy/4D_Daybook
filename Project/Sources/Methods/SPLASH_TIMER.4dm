//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_TIMER
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
	C_LONGINT:C283(<>_l_splashtimer; $_l_actioncode; $_l_AvgStartTimeInSec; $1)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_TIMER")

//$_t_oldMethodName:=ERR_MethodTracker ("SPLASH_TIMER")
//call on startup & at the last line of on startup method with $1 1
If (False:C215)
	If ((Not:C34(Current user:C182="Designer")) & (Is compiled mode:C492))  //don't want splash for designer
		
		If (Count parameters:C259>0)
			$_l_actioncode:=$1
		Else 
			$_l_actioncode:=0
		End if 
		
		If (Count parameters:C259>1)
			$_l_AvgStartTimeInSec:=$2
		Else 
			$_l_AvgStartTimeInSec:=0
		End if 
		
		If ($_l_actioncode=1)  //on end of startup record timer
			SPLASH_SAVEAVGTIMER($_l_AvgStartTimeInSec)
		Else 
			<>_l_splashtimer:=SPLASH_GETAVGTIMER  //diff for each machine
		End if 
		
	End if 
End if 
//ERR_MethodTrackerReturn ("SPLASH_TIMER";$_t_oldMethodName)