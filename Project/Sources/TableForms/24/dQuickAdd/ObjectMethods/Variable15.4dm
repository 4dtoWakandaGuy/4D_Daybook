If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable15
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
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_LONGINT:C283(vAct1)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vSerialNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable15"; Form event code:C388)
If (Abs:C99(vQuantity)#1)
	Gen_Confirm("You may only enter Serial Nos for Items with a Quantity of 1"; "Change to 1"; "Cancel")
	If (OK=1)
		vSerialNo:=Uppercase:C13(vSerialNo)
		// StockI_SubLPSN (»vProdCode;»vSerialNo)
		vQuantity:=1
		If (vAct1#0)
			ORD_ar_QuickAddQuantity{vAct1}:=vQuantity
			ORD_AT_QuickAddSerialNo{vAct1}:=vSerialNo
		End if 
	End if 
Else 
	vSerialNo:=Uppercase:C13(vSerialNo)
	// StockI_SubLPSN (»vProdCode;»vSerialNo)
	If (vAct1#0)
		ORD_AT_QuickAddSerialNo{vAct1}:=vSerialNo
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable15"; $_t_oldMethodName)
