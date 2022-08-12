//%attributes = {}
If (False:C215)
	//Project Method Name:      V11_ListLayoutsValidate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/11/2009 15:50`Method: V11_ListLayoutsValidate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Save)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("V11_ListLayoutsValidate")

//this is a temp method to validate the changes made to list box areas
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14405@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	Case of 
		: ([LIST_LAYOUTS:96]Formula:9="Further Code") | (([LIST_LAYOUTS:96]Formula:9="") & ([LIST_LAYOUTS:96]Title:4="Code"))
			
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144])
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1)
			[LIST_LAYOUTS:96]Formula:9:=""
			DB_SaveRecord(->[LIST_LAYOUTS:96])
		: ([LIST_LAYOUTS:96]Table_Number:2#144) & ([LIST_LAYOUTS:96]Table_Number:2#53)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144])
			DB_SaveRecord(->[LIST_LAYOUTS:96])
			
	End case 
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End for 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14601@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	Case of 
		: ([LIST_LAYOUTS:96]Formula:9="Further Code") | (([LIST_LAYOUTS:96]Formula:9="") & ([LIST_LAYOUTS:96]Title:4="Code"))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1)
			[LIST_LAYOUTS:96]Formula:9:=""
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146])
			SAVE RECORD:C53([LIST_LAYOUTS:96])
		: ([LIST_LAYOUTS:96]Table_Number:2#146) & ([LIST_LAYOUTS:96]Table_Number:2#53)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146])
			SAVE RECORD:C53([LIST_LAYOUTS:96])
		: ([LIST_LAYOUTS:96]Table_Number:2=146) & ([LIST_LAYOUTS:96]Field_Number:3=2) & ([LIST_LAYOUTS:96]Formula:9#"")
			[LIST_LAYOUTS:96]Table_Number:2:=53
			SAVE RECORD:C53([LIST_LAYOUTS:96])
	End case 
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End for 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14803@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	$_bo_Save:=False:C215
	Case of 
		: ([LIST_LAYOUTS:96]Title:4="Company Name") & ([LIST_LAYOUTS:96]Table_Number:2=2)
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[COMPANIES:2]Company_Name:2)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[COMPANIES:2])
			
			[LIST_LAYOUTS:96]Formula:9:="RELATE ONE([PRODUCTS_SUPPLIERS]Company Code)"
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Company Code") | (([LIST_LAYOUTS:96]Formula:9="") & ([LIST_LAYOUTS:96]Title:4="Supplier"))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Cost Price") | (([LIST_LAYOUTS:96]Formula:9="") & ([LIST_LAYOUTS:96]Title:4="Cost Price")) | (([LIST_LAYOUTS:96]Formula:9="") & ([LIST_LAYOUTS:96]Title:4="Actual Cost"))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Lead days") | (([LIST_LAYOUTS:96]Title:4="Days") & ([LIST_LAYOUTS:96]Formula:9=""))
			
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Lead_Days:6)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Margin") | (([LIST_LAYOUTS:96]Title:4="Margin") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Margin:3)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Standard Cost") | (([LIST_LAYOUTS:96]Title:4="Standard Cost") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Standard_Cost:5)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="SuppProdCode") | (([LIST_LAYOUTS:96]Title:4="Their Code") & ([LIST_LAYOUTS:96]Formula:9="")) | (([LIST_LAYOUTS:96]Title:4="Vendor Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
			
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
	End case 
	If ($_bo_Save)
		SAVE RECORD:C53([LIST_LAYOUTS:96])
	End if 
	NEXT RECORD:C51([LIST_LAYOUTS:96])
	
End for 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16103@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	$_bo_Save:=False:C215
	Case of 
		: ([LIST_LAYOUTS:96]Formula:9="Amount") | (([LIST_LAYOUTS:96]Title:4="Amount") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Amount:5)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Analysis Code") | (([LIST_LAYOUTS:96]Title:4="Analysis") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Analysis_Code:10)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Cost amount") | (([LIST_LAYOUTS:96]Title:4="Cost Amount") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Cost_Amount:15)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Description") | (([LIST_LAYOUTS:96]Title:4="Description") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Description:13)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="item number") | (([LIST_LAYOUTS:96]Title:4="Item Number") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Item_Number:12)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Order Code") | (([LIST_LAYOUTS:96]Title:4="Order Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Order_Code:11)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Price Per") | (([LIST_LAYOUTS:96]Title:4="Price Per") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Price_Per:16)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Print Desc") | (([LIST_LAYOUTS:96]Title:4="Print Desc@") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Print_Description:14)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Product Code") | (([LIST_LAYOUTS:96]Title:4="Product Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Code:1)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Product name") | (([LIST_LAYOUTS:96]Title:4="Product Name") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Name:2)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="quantity") | (([LIST_LAYOUTS:96]Title:4="Qty") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Quantity:3)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Sales Acc") | (([LIST_LAYOUTS:96]Title:4="Sales") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Account:9)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="sales Price") | (([LIST_LAYOUTS:96]Title:4="Sales Price") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Tax amount") | (([LIST_LAYOUTS:96]Title:4="Tax Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Tax code") | (([LIST_LAYOUTS:96]Title:4="Tax") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Tax_Code:6)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Total amount") | (([LIST_LAYOUTS:96]Title:4="Total Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Total_Amount:8)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
	End case 
	If ($_bo_Save)
		SAVE RECORD:C53([LIST_LAYOUTS:96])
	End if 
	
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End for 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16903@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	$_bo_Save:=False:C215
	Case of 
		: ([LIST_LAYOUTS:96]Formula:9="Cost amount") | (([LIST_LAYOUTS:96]Title:4="Cost Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="cost price") | (([LIST_LAYOUTS:96]Title:4="Cost price") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="description") | (([LIST_LAYOUTS:96]Title:4="Description") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Description:13)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="discount") | (([LIST_LAYOUTS:96]Title:4="Disc") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Discount:10)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="internalcomments") | (([LIST_LAYOUTS:96]Title:4="Comments") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]InternalComments:15)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="item number") | (([LIST_LAYOUTS:96]Title:4="ord item no") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Original cost") | (([LIST_LAYOUTS:96]Title:4="Orig Cost") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="POitemid") | (([LIST_LAYOUTS:96]Title:4="Item iD") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Price Code") | (([LIST_LAYOUTS:96]Title:4="Pr Grp") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Price per") | (([LIST_LAYOUTS:96]Title:4="Pric per") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="print desc") | (([LIST_LAYOUTS:96]Title:4="Print Desc@") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Print_Description:14)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="product code") | (([LIST_LAYOUTS:96]Title:4="Product Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="product name") | (([LIST_LAYOUTS:96]Title:4="Product Name") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="purch Inv_No") | (([LIST_LAYOUTS:96]Title:4="Purch Inv_No") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="quantity") | (([LIST_LAYOUTS:96]Title:4="quantity") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="tax code") | (([LIST_LAYOUTS:96]Title:4="Tax") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
	End case 
	If ($_bo_Save)
		SAVE RECORD:C53([LIST_LAYOUTS:96])
	End if 
	
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End for 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="15803@")
For ($_l_Index; 1; Records in selection:C76([LIST_LAYOUTS:96]))
	$_bo_Save:=False:C215
	Case of 
		: ([LIST_LAYOUTS:96]Formula:9="Analysis code") | (([LIST_LAYOUTS:96]Title:4="Analysis") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Cost amount") | (([LIST_LAYOUTS:96]Title:4="Cost Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Cost price") | (([LIST_LAYOUTS:96]Title:4="Cost Price") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Description") | (([LIST_LAYOUTS:96]Title:4="Description") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Description:13)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Item number") | (([LIST_LAYOUTS:96]Title:4="Iten number") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="our order no") | (([LIST_LAYOUTS:96]Title:4="Purch Ord") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="price per") | (([LIST_LAYOUTS:96]Title:4="Price per") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="product code") | (([LIST_LAYOUTS:96]Title:4="Product Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Purchase acc") | (([LIST_LAYOUTS:96]Title:4="Purch Acc") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Quantity") | (([LIST_LAYOUTS:96]Title:4="Qty") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Sales Price") | (([LIST_LAYOUTS:96]Title:4="Price 2") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Stock Code") | (([LIST_LAYOUTS:96]Title:4="Stock Code") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Stock_Code:14)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Tax amount") | (([LIST_LAYOUTS:96]Title:4="Tax Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Tax code") | (([LIST_LAYOUTS:96]Title:4="Tax") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Formula:9="Total Amount") | (([LIST_LAYOUTS:96]Title:4="Total Amt") & ([LIST_LAYOUTS:96]Formula:9=""))
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)
			[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
			[LIST_LAYOUTS:96]Formula:9:=""
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Title:4="Record")
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17)
			$_bo_Save:=True:C214
		: ([LIST_LAYOUTS:96]Title:4="ID")
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
			$_bo_Save:=True:C214
			
	End case 
	If ($_bo_Save)
		SAVE RECORD:C53([LIST_LAYOUTS:96])
	End if 
	NEXT RECORD:C51([LIST_LAYOUTS:96])
End for 
ERR_MethodTrackerReturn("V11_ListLayoutsValidate"; $_t_oldMethodName)
