//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTrans_Rec
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

$_t_oldMethodName:=ERR_MethodTracker("ZTrans_Rec")
ZProc("Trans_Rec"; DB_ProcessMemoryinit(2); "Bank Reconciliation")
ERR_MethodTrackerReturn("ZTrans_Rec"; $_t_oldMethodName)