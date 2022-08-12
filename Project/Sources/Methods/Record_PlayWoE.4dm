//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayWoE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Record_PlayWoE
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_ExecutionProcess; <>SCPT_l_PlayerActive; $_l_CurrentProcess; $_l_ProcessNumber; $RPU)
	C_TEXT:C284(<>SCPT_EXECUTE; $_t_oldMethodName; $_t_WaitFlag; $1; vMTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayWoE")
//Record_PlayWoE - Wait on Event

While (Semaphore:C143("WOEBUSY"))  //only one wait can happen at a time!!!-if we want to wait we have to wait till the queued event is done
	DelayTicks(2)
End while 
<>SCPT_l_ExecutionProcess:=Current process:C322

If (Count parameters:C259>1)
	$_t_WaitFlag:=$1
Else 
	$_t_WaitFlag:=STR_RemQuote(First_Param(vMTitle2))
End if 


$_l_CurrentProcess:=Current process:C322

$_l_ProcessNumber:=Process_No("$EventsWait")
If ($_l_ProcessNumber=0)
	ON EVENT CALL:C190("")
	Start_Event
End if 
//Process_Wait on event works by waiting till an event happens
<>SCPT_EXECUTE:="Wait "+$_t_WaitFlag
If ($_t_WaitFlag#"")
	DelayTicks(120*60)
	If (<>SCPT_EXECUTE=("Wait "+$_t_WaitFlag))
		<>SCPT_EXECUTE:=""
	End if 
End if 

<>SCPT_l_ExecutionProcess:=0
CLEAR SEMAPHORE:C144("WOEBUSY")
ERR_MethodTrackerReturn("Record_PlayWoE"; $_t_oldMethodName)
