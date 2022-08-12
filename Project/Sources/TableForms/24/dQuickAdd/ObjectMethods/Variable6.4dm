If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable6
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
	C_LONGINT:C283($No; vAct1; vAct2)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName; vSerialNo)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable6"; Form event code:C388)
vAct1:=ORD_AT_QuickAddProdCode
If (vAct1#0)
	DELETE FROM ARRAY:C228(ORD_AT_QuickAddProdCode; vAct1; 1)
	DELETE FROM ARRAY:C228(ORD_AT_QuickAddProdName; vAct1; 1)
	DELETE FROM ARRAY:C228(ORD_ar_QuickAddQuantity; vAct1; 1)
	DELETE FROM ARRAY:C228(ORD_AT_QuickAddSerialNo; vAct1; 1)
	If (vAct1>Size of array:C274(ORD_AT_QuickAddProdCode))
		ORD_AT_QuickAddProdCode:=0
		ORD_AT_QuickAddProdName:=0
		ORD_ar_QuickAddQuantity:=0
		ORD_AT_QuickAddSerialNo:=0
		vAct1:=ORD_AT_QuickAddProdCode
		vProdCode:=""
		vProdName:=""
		vQuantity:=1
		vSerialNo:=""
	Else 
		vProdCode:=ORD_AT_QuickAddProdCode{vAct1}
		vProdName:=ORD_AT_QuickAddProdName{vAct1}
		vQuantity:=ORD_ar_QuickAddQuantity{vAct1}
		vSerialNo:=ORD_AT_QuickAddSerialNo{vAct1}
	End if 
End if 
vAct2:=Size of array:C274(ORD_AT_QuickAddProdCode)
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable6"; $_t_oldMethodName)