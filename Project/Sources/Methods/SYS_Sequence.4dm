//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_Sequence
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: SYS_Sequence
	//
	//Written by  John Moore on 10/28/98
	//
	//Purpose: Returns an auto-incremented sequence number, initialised in
	//SYS_Init
	
	//
	//$0 - longint, sequence number
	//
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_REAL:C285(<>SYS_i_Sequence)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_Sequence")

//LOG_SetMethod ("SYS_Sequence")
$_t_Semaphore:="$System Sequence"
If (UTI_Semaphore($_t_Semaphore; 0))  //we HAVE to wait
	<>SYS_i_Sequence:=<>SYS_i_Sequence+1
	$0:=<>SYS_i_Sequence
	UTI_ClearSemaphore($_t_Semaphore)
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("SYS_Sequence"; $_t_oldMethodName)
