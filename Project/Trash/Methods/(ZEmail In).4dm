//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZEmail In
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

$_t_oldMethodName:=ERR_MethodTracker("ZEmail In")
ZProc("Letters_In"; DB_ProcessMemoryinit(3); "Enter Email Template"; "3")
ERR_MethodTrackerReturn("ZEmail In"; $_t_oldMethodName)