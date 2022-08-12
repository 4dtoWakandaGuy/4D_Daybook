If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable16
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
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_LONGINT:C283(vAct1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName; vSerialNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable16"; Form event code:C388)
vAct1:=ORD_AT_QuickAddProdCode
QuickAdd_Update
If (vAct1>1)
	
	vAct1:=vAct1-1
	ORD_AT_QuickAddProdCode:=vAct1
	ORD_AT_QuickAddProdName:=vAct1
	ORD_ar_QuickAddQuantity:=vAct1
	ORD_AT_QuickAddSerialNo:=vAct1
	
	vProdCode:=ORD_AT_QuickAddProdCode{vAct1}
	vProdName:=ORD_AT_QuickAddProdName{vAct1}
	vQuantity:=ORD_ar_QuickAddQuantity{vAct1}
	vSerialNo:=ORD_AT_QuickAddSerialNo{vAct1}
Else 
	If (vAct1=0)
		vAct1:=Size of array:C274(ORD_AT_QuickAddProdCode)
		ORD_AT_QuickAddProdCode:=vAct1
		ORD_AT_QuickAddProdName:=vAct1
		ORD_ar_QuickAddQuantity:=vAct1
		ORD_AT_QuickAddSerialNo:=vAct1
		
		vProdCode:=ORD_AT_QuickAddProdCode{vAct1}
		vProdName:=ORD_AT_QuickAddProdName{vAct1}
		vQuantity:=ORD_ar_QuickAddQuantity{vAct1}
		vSerialNo:=ORD_AT_QuickAddSerialNo{vAct1}
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable16"; $_t_oldMethodName)
