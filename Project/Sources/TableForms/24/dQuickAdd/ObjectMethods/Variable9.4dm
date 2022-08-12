If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable9
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
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	//Array REAL(ORD_ar_QuickAddQuantity;0)
	C_LONGINT:C283(vAct1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName; vSerialNo)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable9"; Form event code:C388)
QuickAdd_Update
If (ORD_AT_QuickAddProdCode>0)
	vProdCode:=ORD_AT_QuickAddProdCode{ORD_AT_QuickAddProdCode}
	vProdName:=ORD_AT_QuickAddProdName{ORD_AT_QuickAddProdCode}
	vQuantity:=ORD_ar_QuickAddQuantity{ORD_AT_QuickAddProdCode}
	vSerialNo:=ORD_AT_QuickAddSerialNo{ORD_AT_QuickAddProdCode}
Else 
	vProdCode:=""
	vProdName:=""
	vQuantity:=1
	vSerialNo:=""
End if 
vAct1:=ORD_AT_QuickAddProdCode
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable9"; $_t_oldMethodName)