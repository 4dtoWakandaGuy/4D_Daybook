//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Process ManMin
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
	C_LONGINT:C283(<>AutoProc; $_l_CurrentProcess; $_l_FrontMostProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process ManMin")
$_l_CurrentProcess:=Current process:C322
While (<>AutoProc#999999999)
	IDLE:C311  // 7/04/03 pb
	$_l_FrontMostProcess:=Frontmost process:C327(*)
	If (Process state:C330($_l_FrontMostProcess)=5)
		RESUME PROCESS:C320($_l_FrontMostProcess)
	End if 
	DelayTicks(45)
End while 
ERR_MethodTrackerReturn("Process ManMin"; $_t_oldMethodName)