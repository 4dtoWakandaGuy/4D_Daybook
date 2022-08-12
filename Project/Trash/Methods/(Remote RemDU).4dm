//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote RemDU
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
	C_LONGINT:C283(<>Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote RemDU")
//Remote RemDU
Start_Process
<>Process:=Current process:C322
Remote_RemEx
Remote_RemIm
Process_End
ERR_MethodTrackerReturn("Remote RemDU"; $_t_oldMethodName)