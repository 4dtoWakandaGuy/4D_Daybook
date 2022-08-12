//%attributes = {}
If (False:C215)
	//Project Method Name:      ScrnSav_Process
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
	C_BOOLEAN:C305(<>ScrnSavEv; <>SYS_bo_CurrentWindowModal)
	C_LONGINT:C283(<>ScrnSavMin; $_l_CurrentProcess; $_l_InactiveCount; $_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ScrnSav_Process")
//ScrnSav_Process
<>ScrnSavEv:=False:C215
$_l_CurrentProcess:=Current process:C322
DelayTicks(3600)
$_l_InactiveCount:=1
While (<>ScrnSavMin>0)
	IDLE:C311  // 7/04/03 pb
	If (<>ScrnSavEv)
		$_l_InactiveCount:=0
	Else 
		$_l_InactiveCount:=$_l_InactiveCount+1
		If (<>SYS_bo_CurrentWindowModal=False:C215)
			If ($_l_InactiveCount><>ScrnSavMin)
				If (ZScrnSav_Proc>0)
					PAUSE PROCESS:C319($_l_CurrentProcess)
				End if 
				$_l_InactiveCount:=0
			End if 
		End if 
	End if 
	<>ScrnSavEv:=False:C215
	DelayTicks(3600)
End while 
ERR_MethodTrackerReturn("ScrnSav_Process"; $_t_oldMethodName)
