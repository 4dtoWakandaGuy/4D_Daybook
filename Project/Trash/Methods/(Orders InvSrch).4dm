//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InVSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/10/2010 01:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InVSrch")

QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17="")
If (Records in selection:C76([ORDER_ITEMS:25])=0)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17="N")
End if 
$0:=(Records in selection:C76([ORDER_ITEMS:25])>0)

If ($0)
	If (DB_LedgerAllowZeroInvoices=False:C215)
		$_r_Sum:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
		If ($_r_Sum=0)
			$0:=False:C215
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_InVSrch"; $_t_oldMethodName)