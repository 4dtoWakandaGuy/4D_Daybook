If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable12
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
	C_LONGINT:C283(vAct1)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable12"; Form event code:C388)
Check_ProductNC(->vProdCode; "")
If ([PRODUCTS:9]Product_Name:2#"")
	vProdName:=[PRODUCTS:9]Product_Name:2
End if 
If (vAct1#0)
	ORD_AT_QuickAddProdCode{vAct1}:=vProdCode
	ORD_AT_QuickAddProdName{vAct1}:=vProdName
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable12"; $_t_oldMethodName)
