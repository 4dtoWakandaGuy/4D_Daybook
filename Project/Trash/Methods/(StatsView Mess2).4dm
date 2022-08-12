//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Mess2
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
	C_LONGINT:C283(<>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; vTitle20)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView Mess2")
CLOSE WINDOW:C154
vTitle20:=""
<>SYS_l_CancelProcess:=0
ERR_MethodTrackerReturn("StatsView Mess2"; $_t_oldMethodName)