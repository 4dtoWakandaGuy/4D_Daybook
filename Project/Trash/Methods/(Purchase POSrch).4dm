//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchase_POSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 10:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchase_POSrch")
QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)

QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8="")
$0:=(Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
ERR_MethodTrackerReturn("Purchase_POSrch"; $_t_oldMethodName)