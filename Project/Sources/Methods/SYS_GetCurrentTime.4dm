//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_GetCurrentTime
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: SYS_GetCurrentTime
	//
	//Written by  John Moore on 1/17/99
	//
	//$0 - string 80, current time to millisecond
	
	//******************************************************************************
	//$MS:=(Milliseconds-<>SYS_i_StartupMS)%1000
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_GetCurrentTime")
$0:=String:C10(Current time:C178; 1)  //+`":"+String($MS)
ERR_MethodTrackerReturn("SYS_GetCurrentTime"; $_t_oldMethodName)
