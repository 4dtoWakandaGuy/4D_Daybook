//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTrans_Update
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

$_t_oldMethodName:=ERR_MethodTracker("ZTrans_Update")
ZProc("Trans_Update"; DB_ProcessMemoryinit(2); "Repost Trans")
ERR_MethodTrackerReturn("ZTrans_Update"; $_t_oldMethodName)
