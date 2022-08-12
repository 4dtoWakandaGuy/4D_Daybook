//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_Split2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/02/2012 14:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Reset; $1)
	C_LONGINT:C283($_l_NextSortReference)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Split2")
If (Count parameters:C259>=1)  //When we split an item because we are allocating some from stock the split off item should not inherite the cost price from the first
	
	$_bo_Reset:=$1
Else 
	$_bo_Reset:=False:C215
End if 
[ORDER_ITEMS:25]Quantity:3:=Gen_Round(([ORDER_ITEMS:25]Quantity:3-vQuantity); 2; 6)
Calc_Item
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)

DUPLICATE RECORD:C225([ORDER_ITEMS:25])
[ORDER_ITEMS:25]x_ID:58:=0
[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
If ($_bo_Reset) | ([ORDER_ITEMS:25]Cost_Price:5=0)
	
	If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
	End if 
	OrderI_SubLPPC3
End if 
OrderI_No
[ORDER_ITEMS:25]Quantity:3:=Gen_Round(vQuantity; 2; 6)
[ORDER_ITEMS:25]Allocated:28:=0
[ORDER_ITEMS:25]Delivered:51:=0
[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
[ORDER_ITEMS:25]Item_Locked:16:=False:C215
[ORDER_ITEMS:25]Invoice_Number:17:=""
[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=""
[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=""
[ORDER_ITEMS:25]Serial_Number:24:=""
[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
$_l_NextSortReference:=1
[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
//$_l_NextSortReference:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextSortReference)
$_l_NextSortReference:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextSortReference; Records in selection:C76([ORDER_ITEMS:25]))

[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextSortReference
[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26

Calc_Item
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
ERR_MethodTrackerReturn("OrderI_Split2"; $_t_oldMethodName)
