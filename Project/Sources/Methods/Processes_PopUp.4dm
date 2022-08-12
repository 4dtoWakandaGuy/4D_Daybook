//%attributes = {}
If (False:C215)
	//Project Method Name:      Processes_PopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/06/2010 13:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_LONGINT:C283($_l_Process; $1; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Processes_PopUp")
If (Count parameters:C259>=1)
	$_l_Process:=$1
	
	If ($_l_Process>0)
		Menu_RecordPop("Processes_PopUp"; $_l_Process)
	End if 
	
	While (Semaphore:C143("$ProcArr"))
		DelayTicks(2)
	End while 
	If (Count parameters:C259>=2)
		If (($_l_Process>0) & (Size of array:C274(PRC_al_ProcessNum)>=$_l_Process))
			If (PRC_at_ProcessName{$_l_Process}#"Telephony@")
				SHOW PROCESS:C325(PRC_al_ProcessNum{$_l_Process})
				BRING TO FRONT:C326(PRC_al_ProcessNum{$_l_Process})
				RESUME PROCESS:C320(PRC_al_ProcessNum{$_l_Process})
				SET PROCESS VARIABLE:C370(PRC_al_ProcessNum{$_l_Process}; DB_l_ButtonClickedFunction; DB_GetButtonFunction("FormWindows"))
				POST OUTSIDE CALL:C329(PRC_al_ProcessNum{$_l_Process})
				
			End if 
			PRC_al_ProcessNum:=1
			PRC_at_ProcessName:=1
		End if 
	Else 
		If (($_l_Process>0) & (Size of array:C274(<>PRC_al_ProcessNum)>=$_l_Process))
			If (<>PRC_at_ProcessName{$_l_Process}#"Telephony@") & (<>PRC_al_ProcessState{$_l_Process}>=0)
				
				SHOW PROCESS:C325(<>PRC_al_ProcessNum{$_l_Process})
				BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_Process})
				RESUME PROCESS:C320(<>PRC_al_ProcessNum{$_l_Process})
				SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_Process}; DB_l_ButtonClickedFunction; DB_GetButtonFunction("FormWindows"))
				POST OUTSIDE CALL:C329(<>PRC_al_ProcessNum{$_l_Process})
			End if 
			<>PRC_al_ProcessNum:=1
			<>PRC_at_ProcessName:=1
		End if 
	End if 
	
	CLEAR SEMAPHORE:C144("$ProcArr")
	
Else 
	$_l_Process:=<>PRC_at_ProcessName
	If ($_l_Process>0)
		Menu_RecordPop("Processes_PopUp"; $_l_Process)
	End if 
	
	While (Semaphore:C143("$ProcArr"))
		
		DelayTicks(2)
	End while 
	If (($_l_Process>0) & (Size of array:C274(<>PRC_al_ProcessNum)>=$_l_Process))
		If (<>PRC_at_ProcessName{$_l_Process}#"Telephony@")
			SHOW PROCESS:C325(<>PRC_al_ProcessNum{$_l_Process})
			BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_Process})
			RESUME PROCESS:C320(<>PRC_al_ProcessNum{$_l_Process})
			SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_Process}; DB_l_ButtonClickedFunction; DB_GetButtonFunction("FormWindows"))
			POST OUTSIDE CALL:C329(<>PRC_al_ProcessNum{$_l_Process})
			
		End if 
		<>PRC_al_ProcessNum:=1
		<>PRC_at_ProcessName:=1
	End if 
	CLEAR SEMAPHORE:C144("$ProcArr")
End if 
ERR_MethodTrackerReturn("Processes_PopUp"; $_t_oldMethodName)
