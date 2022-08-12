//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_BarRec
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
	C_BOOLEAN:C305(<>RecRecord; <>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>SCPT_l_RecordEdit; $_l_BarProcess; xMinus; xOpen; xPlus; xSearch; xSelect)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; vStatus)
	C_TIME:C306(<>EvTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarRec")
//Record_BarRec
If (vStatus="Rec@")
	xPlus:=1
Else 
	If (<>SCPT_bo_NoAutoScripts=False:C215)
		PLAY:C290("Mer On"; 0)
	End if 
	ON EVENT CALL:C190("")
	ON EVENT CALL:C190("On_EventRec"; "$Events")
	xPlus:=1
	xOpen:=0
	xSearch:=0
	OBJECT SET ENABLED:C1123(xSearch; False:C215)
	OBJECT SET ENABLED:C1123(xSelect; False:C215)
	OBJECT SET ENABLED:C1123(xOpen; True:C214)
	OBJECT SET ENABLED:C1123(xMinus; True:C214)
	If (<>SCPT_l_RecordEdit>0)
		$_l_BarProcess:=<>SCPT_l_RecordEdit
		<>SCPT_l_RecordEdit:=0
		POST OUTSIDE CALL:C329($_l_BarProcess)
	End if 
	If (vStatus#"RecPaused")
		<>RecText:=""
	End if 
	vStatus:="Record"
	<>RecRecord:=True:C214
	<>EvTime:=Current time:C178
End if 
ERR_MethodTrackerReturn("Record_BarRec"; $_t_oldMethodName)
