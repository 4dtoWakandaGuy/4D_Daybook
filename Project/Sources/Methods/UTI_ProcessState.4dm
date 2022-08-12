//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ProcessState
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
	C_LONGINT:C283($_l_ProcessState; $1; $ProcessNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $0; $Description)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ProcessState")
//Method: UTI_ProcessState
//
//Purpose: Passed a longint process ID, returns string form of state
//
//$1 - longint, process number
//$0 - description as string

If (Count parameters:C259>=1)
	$ProcessNumber:=$1
	
	$_l_ProcessState:=Process state:C330($ProcessNumber)
	Case of 
		: ($_l_ProcessState=-1)
			$Description:="Aborted"
		: ($_l_ProcessState=1)
			$Description:="Delayed"
		: ($_l_ProcessState=-100)
			$Description:="Does not exist"
		: ($_l_ProcessState=0)
			$Description:="Executing"
		: ($_l_ProcessState=5)
			$Description:="Paused"
		: ($_l_ProcessState=6)
			$Description:="Hidden modal dialog"
		: ($_l_ProcessState=3)
			$Description:="Waiting for input output"
		: ($_l_ProcessState=4)
			$Description:="Waiting for internal flag"
		: ($_l_ProcessState=2)
			$Description:="Waiting for user event"
	End case 
	$0:=$Description
Else 
	$0:=""
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_ProcessState"; $_t_oldMethodName)