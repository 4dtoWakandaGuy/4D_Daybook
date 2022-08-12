//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_CloseRelatedProcesses
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
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	C_LONGINT:C283($_l_Index; $_l_Process; $_l_Retries; $_l_waiting; $1; $2; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CloseRelatedProcesses")

//method DB_CLoseRelatedProcesses
$_t_oldMethodName:=ERR_MethodTracker("DB_CloseRelatedProcesses")
$_l_Retries:=0
While (Semaphore:C143("$ProcArr"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 

For ($_l_Index; Size of array:C274(<>PRC_al_ProcessNum); 1; -1)
	If (<>PRC_al_ProcessCalledBy{$_l_Index}=$1) & (<>PRC_al_ProcessState{$_l_Index}>=0)
		$_l_Process:=<>PRC_al_ProcessNum{$_l_Index}
		If ($2=DB_GetButtonFunction("OK")) | ($2=DB_GetButtonFunction("Cancel"))
			$_l_waiting:=0
			If (Process state:C330($_l_Process)>=0)
				SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; $2)
				RESUME PROCESS:C320($_l_Process)
				If (Application type:C494#4D Server:K5:6)
					BRING TO FRONT:C326($_l_Process)
					POST OUTSIDE CALL:C329($_l_Process)
					//$Waiting:=$Waiting+1
					//kmw - 13/10/08 v631b120, "$Waiting:=$Waiting+1" moved from before repeat loop to inside repeat loop where it belongs
				End if 
				
			End if 
			
		Else 
			
			If (Process state:C330($_l_Process)>=0)
				SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("OK"))
				RESUME PROCESS:C320($_l_Process)
				If (Application type:C494#4D Server:K5:6)
					BRING TO FRONT:C326($_l_Process)
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
				
			End if 
		End if 
		
	End if 
End for 
CLEAR SEMAPHORE:C144("$ProcArr")
ERR_MethodTrackerReturn("DB_CloseRelatedProcesses"; $_t_oldMethodName)