//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_Semaphore
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Locked; $0)
	C_LONGINT:C283(<>UTI_i_SemaphoreWait; $_l_TimeOutpoint; $_l_TimeoutTicks; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_Semaphore")
//******************************************************************************
//
//Method: UTI_Semaphore
//
//Purpose:  Tests a Semaphore in a Loop
//Inputs:
//$1:  String (31) - Semaphore Name
//$2:  Longint (Optional) - Ticks to timeout. If 0, don't time out
//Outputs:
//$0:  Boolean - TRUE if Semaphore OK

//******************************************************************************

If (<>UTI_i_SemaphoreWait=0)
	<>UTI_i_SemaphoreWait:=5*60
End if 

$_bo_Locked:=False:C215
If (Count parameters:C259>0)
	$_t_SemaphoreName:=$1
	If (Semaphore:C143($_t_SemaphoreName))
		If (Count parameters:C259=2)
			$_l_TimeoutTicks:=$2
			If ($_l_TimeoutTicks=0)
				$_l_TimeOutpoint:=MAXLONG:K35:2
			End if 
		Else 
			$_l_TimeoutTicks:=<>UTI_i_SemaphoreWait  //5 second timeout as default
		End if 
		$_l_TimeOutpoint:=Tickcount:C458+$_l_TimeoutTicks
		Repeat 
			$_bo_Locked:=Semaphore:C143($_t_SemaphoreName)
			If ($_bo_Locked)
				DelayTicks
			End if 
		Until (Not:C34($_bo_Locked) | (Tickcount:C458>$_l_TimeOutpoint))
		//Else $Locked was false
	End if 
Else 
	$_bo_Locked:=True:C214  //we have to fail, because a parameter is missing!
End if 

If ($_bo_Locked)
	$0:=False:C215
Else 
	$0:=True:C214
	//If (◊LOG_bo_Debug)
	//we need to add this semaphore to the current semaphores
	//for this process
	//LOG_s_Semaphore:=$sSemaphore
	//$z:=UTI_ArrayFindOrInsert (->LOG_as_Semaphore;->LOG_s_Semaphore)
	//End if
End if 
ERR_MethodTrackerReturn("UTI_Semaphore"; $_t_oldMethodName)
