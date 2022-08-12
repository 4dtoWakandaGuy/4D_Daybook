//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_UpdateLogArrays
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
	//ARRAY LONGINT(<>IWS_al_ProcessTicks;0)
	//ARRAY TEXT(<>IWS_at_ProcessName;0)
	//ARRAY TEXT(<>IWS_at_ProcessStates;0)
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_Row; $i)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_UpdateLogArrays")
While (Semaphore:C143("$UpdatingLogArrays"))
	DelayTicks
End while 
//changed to use wrapper, John, 1/22/01
UTI_ArrayResize(0; -><>IWS_at_ProcessName; -><>IWS_at_ProcessStates; -><>IWS_al_ProcessTicks)

For ($i; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($i; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	If ($_t_ProcessName=(<>IWS_t_HandlerProcess+"@"))
		$_l_Row:=Size of array:C274(<>IWS_at_ProcessName)+1
		//changed to use wrapper, John, 1/22/01
		UTI_ArrayResize($_l_Row; -><>IWS_at_ProcessName; -><>IWS_at_ProcessStates; -><>IWS_al_ProcessTicks)
		
		<>IWS_at_ProcessName{$_l_Row}:=$_t_ProcessName
		//Changed by John, 1/22/01, to use constants instead of numbers
		Case of 
			: ($_l_ProcessState=Aborted:K13:1)
				<>IWS_at_ProcessStates{$_l_Row}:="Aborted"
			: ($_l_ProcessState=Delayed:K13:2)
				<>IWS_at_ProcessStates{$_l_Row}:="Delayed"
			: ($_l_ProcessState=Does not exist:K13:3)
				<>IWS_at_ProcessStates{$_l_Row}:="Does not exist"
			: ($_l_ProcessState=Executing:K13:4)
				<>IWS_at_ProcessStates{$_l_Row}:="Executing"
			: ($_l_ProcessState=Paused:K13:6)
				<>IWS_at_ProcessStates{$_l_Row}:="Paused"
			: ($_l_ProcessState=_o_Hidden modal dialog:K13:5)
				<>IWS_at_ProcessStates{$_l_Row}:="Hidden modal dialog"
			: ($_l_ProcessState=Waiting for input output:K13:7)
				<>IWS_at_ProcessStates{$_l_Row}:="Waiting for input output"
			: ($_l_ProcessState=Waiting for internal flag:K13:8)
				<>IWS_at_ProcessStates{$_l_Row}:="Waiting for internal flag"
			: ($_l_ProcessState=Waiting for user event:K13:9)
				<>IWS_at_ProcessStates{$_l_Row}:="Waiting for user event"
			Else 
				<>IWS_at_ProcessStates{$_l_Row}:="Unknown state"  //added just in case...
		End case 
		<>IWS_al_ProcessTicks{$_l_Row}:=$_l_ProcessTime
	End if 
	IDLE:C311
End for 
SORT ARRAY:C229(<>IWS_at_ProcessName; <>IWS_at_ProcessStates; <>IWS_al_ProcessTicks; >)
ERR_MethodTrackerReturn("IWS_UpdateLogArrays"; $_t_oldMethodName)
CLEAR SEMAPHORE:C144("$UpdatingLogArrays")
ERR_MethodTrackerReturn("IWS_UpdateLogArrays"; $_t_oldMethodName)