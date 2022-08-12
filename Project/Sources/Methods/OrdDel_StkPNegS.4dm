//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdDel_StkPNegS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/11/2010 14:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdDel_StkPNegS")
//OrdDel_StkPNegS - StockP Negative Search
If ([CURRENT_STOCK:62]Item_Number:5#[ORDER_ITEMS:25]Item_Number:27) & ([ORDER_ITEMS:25]Item_Number:27#0)
	RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
End if 
If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1) & ([ORDER_ITEMS:25]Order_Code:1#"")
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
End if 
$0:=([ORDERS:24]Company_Code:1=vCompCode)
ERR_MethodTrackerReturn("OrdDel_StkPNegS"; $_t_oldMethodName)