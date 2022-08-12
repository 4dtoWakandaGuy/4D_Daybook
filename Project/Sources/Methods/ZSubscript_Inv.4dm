//%attributes = {}
If (False:C215)
	//Project Method Name:      ZSubscript_Inv
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

$_t_oldMethodName:=ERR_MethodTracker("ZSubscript_Inv")
ZProc("Subscript_Inv"; DB_ProcessMemoryinit(4); "Subscription Billing")
ERR_MethodTrackerReturn("ZSubscript_Inv"; $_t_oldMethodName)