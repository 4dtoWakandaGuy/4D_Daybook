//%attributes = {}
If (False:C215)
	//Project Method Name:      ZMenu_Process
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
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZMenu_Process")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
<>MenuProc:=New process:C317("Menu_Process"; 128000; "$Menu_Process")
ERR_MethodTrackerReturn("ZMenu_Process"; $_t_oldMethodName)