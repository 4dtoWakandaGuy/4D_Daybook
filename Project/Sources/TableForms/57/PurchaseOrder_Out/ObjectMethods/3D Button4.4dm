If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_Out.3D Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_Out.3D Button4"; Form event code:C388)
WT_SORT_TABLE_3(->[PURCHASE_ORDERS:57]; "Text4"; ->[PURCHASE_ORDERS:57]Purchase_Order_Date:3)
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_Out.3D Button4"; $_t_oldMethodName)