//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_No
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_isUnique)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseOrderNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_No")
$_t_PurchaseOrderNumber:=""
Repeat 
	$_t_PurchaseOrderNumber:=Gen_CodePref(16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
	SET QUERY DESTINATION:C396(3; $_l_isUnique)
	QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_PurchaseOrderNumber)
	SET QUERY DESTINATION:C396(0)
Until ($_l_isUnique=0)
[PURCHASE_ORDERS:57]Purchase_Order_Number:2:=$_t_PurchaseOrderNumber
ERR_MethodTrackerReturn("PurchOrd_No"; $_t_oldMethodName)