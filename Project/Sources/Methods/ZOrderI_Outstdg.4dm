//%attributes = {}
If (False:C215)
	//Project Method Name:      ZOrderI_Outstdg
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

$_t_oldMethodName:=ERR_MethodTracker("ZOrderI_Outstdg")
ZProc("OrderI_Outstdg"; DB_ProcessMemoryinit(2); "Outstanding Order Items")
ERR_MethodTrackerReturn("ZOrderI_Outstdg"; $_t_oldMethodName)