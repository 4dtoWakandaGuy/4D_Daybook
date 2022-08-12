If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.oNulReconcile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_ReconcileManual; ACC_bo_ReconcileModified)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.oNulReconcile"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		ACC_bo_ReconcileModified:=True:C214
		If (ACC_bo_ReconcileManual)
			Gen_Confirm("Are you sure you want to do this?"; "Yes"; "No")
			If (OK=0)
				ACC_bo_ReconcileManual:=False:C215
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oNulReconcile"; $_t_oldMethodName)
