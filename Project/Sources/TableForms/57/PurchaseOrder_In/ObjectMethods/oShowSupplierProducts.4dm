If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_In.oShowSupplierProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(STK_ar_CopiedProductQuantites;0)
	//ARRAY TEXT(STK_at_CopiedProductCodes;0)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; STK_l_ProductProcesses; STK_l_ShowSupplierProducts)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oShowSupplierProducts"; Form event code:C388)

If ([PURCHASE_ORDERS:57]Company_Code:1#"")
	
	If (STK_l_ProductProcesses=0)
		OBJECT GET COORDINATES:C663(STK_l_ShowSupplierProducts; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		ARRAY TEXT:C222(STK_at_CopiedProductCodes; 0)
		ARRAY REAL:C219(STK_ar_CopiedProductQuantites; 0)
		STK_l_ProductProcesses:=New process:C317("STK_ShowSupplierProducts"; 64000; "Supplier Products"; Current process:C322; [PURCHASE_ORDERS:57]Company_Code:1; $_l_ObjectLeft; $_l_ObjectBottom)
	Else 
		BRING TO FRONT:C326(STK_l_ProductProcesses)
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oShowSupplierProducts"; $_t_oldMethodName)
