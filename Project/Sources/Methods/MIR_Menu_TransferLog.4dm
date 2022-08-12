//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_Menu_TransferLog
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
	C_LONGINT:C283($LProcessID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_Menu_TransferLog")


$LProcessID:=Execute on server:C373("Mir_SendLogFile"; 256000; "SendLogFile")
ERR_MethodTrackerReturn("MIR_Menu_TransferLog"; $_t_oldMethodName)