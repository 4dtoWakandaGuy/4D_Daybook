//%attributes = {}
If (False:C215)
	//Project Method Name:      ZRemote_MainDU
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZRemote_MainDU")
ZProc("Remote_MainDU"; DB_ProcessMemoryinit(6); "Remote Users D&U")
ERR_MethodTrackerReturn("ZRemote_MainDU"; $_t_oldMethodName)