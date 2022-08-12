//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Close After
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Close After")
PROCESS PROPERTIES:C336(Current process:C322; vTitle2; $_l_ProcessState; $_l_ProcessTime)
$_l_ProcessState:=Num:C11(First_Param(vTitle2))
$_l_ProcessTime:=Num:C11(First_Param(vTitle2))
DelayTicks(Int:C8($_l_ProcessState*60))
<>AutoProc:=Current process:C322
POST OUTSIDE CALL:C329(Current process:C322)
ERR_MethodTrackerReturn("Close After"; $_t_oldMethodName)