If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	C_LONGINT:C283(vAct1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vSerialNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable14"; Form event code:C388)
If ((vSerialNo#"") & (vQuantity#1))
	Gen_Alert("The Quantity must be 1 for Items with Serial Nos"; "OK")
	vQuantity:=1
End if 
If (vAct1#0)
	ORD_ar_QuickAddQuantity{vAct1}:=vQuantity
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable14"; $_t_oldMethodName)
