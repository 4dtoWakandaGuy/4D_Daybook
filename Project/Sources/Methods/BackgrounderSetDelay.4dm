//%attributes = {}
If (False:C215)
	//Project Method Name:      BackgrounderSetDelay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DelayTime; $1; SYS_l_DelaySeconds)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BackgrounderSetDelay")

If (Count parameters:C259>0)
	$_l_DelayTime:=$1
Else 
	$_l_DelayTime:=60*60*5
End if 

SYS_l_DelaySeconds:=$_l_DelayTime
ERR_MethodTrackerReturn("BackgrounderSetDelay"; $_t_oldMethodName)
