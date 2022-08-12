//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDI_RejectCells
	//------------------ Method Notes ------------------
	//when listbox is showing data the normal LPI method is executed AFTER the record is already saved so fields the user cant edit on a given row
	//(rather than columns that are locked)
	//bring up the alert and try to set 'old' but it fails because the record is already saved with the new value
	//so here  we want to test whether the cell is enterable for the current record.
	//so this is BASED on  OrderI LPX but with stuff removed
	//------------------ Revision Control ----------------
	//Date Created: 29/08/2012 14:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Silent; $_bo_UseOldValueArray; $0; $2; DB_bo_SectionAlertsoff; ORD_bo_ItemsModified; ORD_bo_OrderModified; ORD_bo_UseCatalogues)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Array; $1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCodeOLD; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_RejectCells")



//Modified NG to put ORD_bo_ItemsModified in Orders_InLPM
//OrderI_InLPX
//NG march 2004, the following is to handle the context from order lines

$_l_TableNumber:=Table:C252(->[ORDERS:24])

$0:=False:C215
If (Count parameters:C259>=2)
	$_bo_Silent:=$2
Else 
	$_bo_Silent:=False:C215
End if 
$_bo_UseOldValueArray:=False:C215
If (Count parameters:C259>=3)
	$_ptr_Array:=$3
	$_bo_UseOldValueArray:=True:C214
End if 
DB_bo_SectionAlertsoff:=$_bo_Silent

Case of 
	: ($1=(->[ORDER_ITEMS:25]Order_Code:1))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Order_Code:1; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Product_Code:2))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Product_Code:2; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			Else 
				$_t_ProductCodeOLD:=Old:C35([ORDER_ITEMS:25]Product_Code:2)
				If ($_t_ProductCodeOLD="") & ($_bo_UseOldValueArray)
					$_t_ProductCodeOLD:=$_ptr_Array->{0}
				End if 
				If (($_t_ProductCodeOLD#"") & ([ORDER_ITEMS:25]Allocated:28>0))
					If (Not:C34(DB_bo_SectionAlertsoff))
						Gen_Alert("You cannot modify the Product of an Allocated Order Item"; "Cancel")
					End if 
					$0:=True:C214
				End if 
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Product_Name:13))  // Not enterable under contracts
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Product_Name:13; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Description:44))  //not enterable under contract
		
	: ($1=(->[ORDER_ITEMS:25]Print_Description:45))  //not enterable under contract
		
	: ($1=(->[ORDER_ITEMS:25]Sort_Order:26))  //not enterable under contract
		
	: ($1=(->[ORDER_ITEMS:25]Price_Code:36))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Price_Code:36; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Discount:37))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Discount:37; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Quantity:3))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Quantity:3; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Price_Per:50))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Price_Per:50; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Tax_Code:12))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Tax_Code:12; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Sales_Price:4))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Sales_Price:4; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Retail_Price:38))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Retail_Price:38; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Cost_Price:5))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Cost_Price:5; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Cost_Amount:15))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Cost_Amount:15; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		If (OK=1)
			If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE@") & (DB_t_CurrentFormUsage#"None")
				If (Not:C34(DB_bo_SectionAlertsoff))
					Gen_Alert("You cannot edit the Cost Amount of Bundles - edit them at the 'Next Level'"; "Cancel")
				End if 
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Margin:6))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Margin:6; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Sales_Amount:7))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Sales_Amount:7; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]TAX_Amount:8))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]TAX_Amount:8; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Total_Amount:9))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Total_Amount:9; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
		
	: ($1=(->[ORDER_ITEMS:25]Delivery_Date:11))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Delivery_Date:11)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
		
	: ($1=(->[ORDER_ITEMS:25]Serial_Number:24))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Serial_Number:24)
			If (OK=0)
				$0:=True:C214
			Else 
				If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3)) & (DB_t_CurrentFormUsage#"None")
					If (Not:C34(DB_bo_SectionAlertsoff))
						Gen_Alert("You cannot modify the Serial No field"; "Cancel")
					End if 
					$0:=True:C214
				End if 
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Person:14))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Person:14)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Supplier_Code:20))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Supplier_Code:20; ->[ORDER_ITEMS:25]Item_Locked:16; 1)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Purchase_Order_Number:18))  //not enterable under contract
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Purchase_Order_Number:18)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Purchase_Order_Date:19))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Purchase_Order_Date:19)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Received_Date:21))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Received_Date:21)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Invoice_Number:17))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Invoice_Number:17; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Invoice_Date:25))
		If (DB_t_CurrentFormUsage#"None")
			Check_Sec(->[ORDER_ITEMS:25]Invoice_Date:25; ->[ORDER_ITEMS:25]Item_Locked:16)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Contract_Code:29))
		
		
	: ($1=(->[ORDER_ITEMS:25]Job_Code:34))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Job_Code:34)
			
			Check_MinorNC(->[ORDER_ITEMS:25]Job_Code:34; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
	: ($1=(->[ORDER_ITEMS:25]Job_Stage:35))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Job_Stage:35)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]State:46))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]State:46)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Supply_by_Date:31))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supply_by_Date:31)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Received_Date:21))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Received_Date:21)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Supplier_Invoice_Number:22))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Invoice_Number:22)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Supplier_Reference:33))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Reference:33)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Supplier_Delivery_Number:23))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Supplier_Delivery_Number:23)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Level_Up_Item_Number:48))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Level_Up_Item_Number:48)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Component_Level:47))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Component_Level:47)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Finance_Method:32))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Finance_Method:32)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
	: ($1=(->[ORDER_ITEMS:25]Required_Date:10))
		If (DB_t_CurrentFormUsage#"None")
			Check_SecRO(->[ORDER_ITEMS:25]Required_Date:10)
			If (OK=0)
				$0:=True:C214
			End if 
		End if 
		
End case 
OK:=1
ERR_MethodTrackerReturn("ORDI_RejectCells"; $_t_oldMethodName)
