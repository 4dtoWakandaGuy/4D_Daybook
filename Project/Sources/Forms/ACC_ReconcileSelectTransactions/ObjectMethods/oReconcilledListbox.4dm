If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.oReconcilledListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2013 21:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.oReconcilledListbox"; Form event code:C388)
$_l_Event:=Form event code:C388
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oReconcilledListbox"; $_t_oldMethodName)