//%attributes = {}
If (False:C215)
	//Project Method Name:      V11Upgrade
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 16:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InitialsDone; 0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	C_LONGINT:C283($_l_ColumnsIndex; $_l_Index; $_l_InitialsRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("V11Upgrade")

READ WRITE:C146(*)
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="00105")
//No user personalisation on this one
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	DELETE SELECTION:C66([LIST_LAYOUTS:96])
	//these will recreate themselves
End if 

QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="00203")
//No user personalisation on this one

If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	DELETE SELECTION:C66([LIST_LAYOUTS:96])
	
End if 

QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="00903@")  //Products SUppliers
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutRefs)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		If (Length:C16($_at_LayoutRefs{$_l_Index})>5)
			$_at_LayoutRefs{$_l_Index}:=Substring:C12($_at_LayoutRefs{$_l_Index}; 6; Length:C16($_at_LayoutRefs{$_l_Index}))
		End if 
	End for 
	ARRAY TEXT:C222($_at_InitialsDone; 0)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		$_l_InitialsRow:=Find in array:C230($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
		If ($_l_InitialsRow<0)
			APPEND TO ARRAY:C911($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
			If ($_at_LayoutRefs{$_l_Index}#"00903")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="00903"+$_at_LayoutRefs{$_l_Index})
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="00903")
			End if 
			For ($_l_ColumnsIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
				If ([LIST_LAYOUTS:96]Table_Number:2=9)
					[LIST_LAYOUTS:96]Table_Number:2:=148
				End if 
				If ($_at_LayoutRefs{$_l_Index}#"00903")
					[LIST_LAYOUTS:96]Layout_Reference:1:="14803"+$_at_LayoutRefs{$_l_Index}
				Else 
					[LIST_LAYOUTS:96]Layout_Reference:1:="14803"
				End if 
				Case of 
					: ([LIST_LAYOUTS:96]Title:4="Company Name") & ([LIST_LAYOUTS:96]Table_Number:2=2)
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[COMPANIES:2]Company_Name:2)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[COMPANIES:2])
						[LIST_LAYOUTS:96]Formula:9:="RELATE ONE([PRODUCTS_SUPPLIERS]Company Code)"
					: ([LIST_LAYOUTS:96]Formula:9="Company Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						[LIST_LAYOUTS:96]Formula:9:=""
						
					: ([LIST_LAYOUTS:96]Formula:9="Cost Price")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Lead days")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Lead_Days:6)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Margin")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Margin:3)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Standard Cost")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Standard_Cost:5)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="SuppProdCode")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PRODUCTS_SUPPLIERS:148])
						
						[LIST_LAYOUTS:96]Formula:9:=""
				End case 
				
				[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7+2
				SAVE RECORD:C53([LIST_LAYOUTS:96])
				NEXT RECORD:C51([LIST_LAYOUTS:96])
			End for 
			If ($_at_LayoutRefs{$_l_Index}#"00903")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14803"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=148; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PRODUCTS_SUPPLIERS:148]Product_Code:8))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("14803"+$_at_LayoutRefs{$_l_Index}; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]Product_Code:8); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14803"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=148; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					
					Layouts_Create("14803"+$_at_LayoutRefs{$_l_Index}; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14803"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=148; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PRODUCTS_SUPPLIERS:148]Product_Code:8))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("14803"; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]Product_Code:8); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14803"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=148; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("14803"; 148; Field:C253(->[PRODUCTS_SUPPLIERS:148]ID:7); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
			End if 
			
			
		End if 
	End for 
End if 

QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03903@")  //invoice items
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutRefs)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		If (Length:C16($_at_LayoutRefs{$_l_Index})>5)
			$_at_LayoutRefs{$_l_Index}:=Substring:C12($_at_LayoutRefs{$_l_Index}; 6; Length:C16($_at_LayoutRefs{$_l_Index}))
		End if 
	End for 
	ARRAY TEXT:C222($_at_InitialsDone; 0)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		$_l_InitialsRow:=Find in array:C230($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
		If ($_l_InitialsRow<0)
			APPEND TO ARRAY:C911($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
			If ($_at_LayoutRefs{$_l_Index}#"03903")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03903"+$_at_LayoutRefs{$_l_Index})
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03903")
			End if 
			For ($_l_ColumnsIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
				If ([LIST_LAYOUTS:96]Table_Number:2=39)
					[LIST_LAYOUTS:96]Table_Number:2:=161
				End if 
				If ($_at_LayoutRefs{$_l_Index}#"03903")
					[LIST_LAYOUTS:96]Layout_Reference:1:="16103"+$_at_LayoutRefs{$_l_Index}
				Else 
					[LIST_LAYOUTS:96]Layout_Reference:1:="16103"
				End if 
				Case of 
					: ([LIST_LAYOUTS:96]Formula:9="Amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Amount:5)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Analysis Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Analysis_Code:10)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Cost amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Cost_Amount:15)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Description")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Description:13)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="item number")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Item_Number:12)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Order Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Order_Code:11)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Price Per")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Price_Per:16)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Print Desc")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Print_Description:14)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Product Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Code:1)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Product name")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Product_Name:2)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="quantity")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Quantity:3)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Sales Acc")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Account:9)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="sales Price")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Sales_Price:4)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Tax amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Tax_Amount:7)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Tax code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Tax_Code:6)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Total amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[INVOICES_ITEMS:161]Total_Amount:8)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[INVOICES_ITEMS:161])
						[LIST_LAYOUTS:96]Formula:9:=""
				End case 
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7+2
				SAVE RECORD:C53([LIST_LAYOUTS:96])
				NEXT RECORD:C51([LIST_LAYOUTS:96])
			End for 
			If ($_at_LayoutRefs{$_l_Index}#"03903")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16103"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=161; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16103"+$_at_LayoutRefs{$_l_Index}; 161; Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16103"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=161; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[INVOICES_ITEMS:161]ID:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16103"+$_at_LayoutRefs{$_l_Index}; 161; Field:C253(->[INVOICES_ITEMS:161]ID:17); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16103"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=161; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16103"; 161; Field:C253(->[INVOICES_ITEMS:161]INVOICES_CODE:18); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16103"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=161; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[INVOICES_ITEMS:161]ID:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16103"; 161; Field:C253(->[INVOICES_ITEMS:161]ID:17); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
				
			End if 
			
			
		End if 
	End for 
End if 

QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="05703@")  //invoice items
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutRefs)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		If (Length:C16($_at_LayoutRefs{$_l_Index})>5)
			$_at_LayoutRefs{$_l_Index}:=Substring:C12($_at_LayoutRefs{$_l_Index}; 6; Length:C16($_at_LayoutRefs{$_l_Index}))
		End if 
	End for 
	ARRAY TEXT:C222($_at_InitialsDone; 0)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		$_l_InitialsRow:=Find in array:C230($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
		If ($_l_InitialsRow<0)
			APPEND TO ARRAY:C911($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
			If ($_at_LayoutRefs{$_l_Index}#"05703")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="05703"+$_at_LayoutRefs{$_l_Index})
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="05703")
			End if 
			For ($_l_ColumnsIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
				If ([LIST_LAYOUTS:96]Table_Number:2=57)
					[LIST_LAYOUTS:96]Table_Number:2:=169
				End if 
				If ($_at_LayoutRefs{$_l_Index}#"05703")
					[LIST_LAYOUTS:96]Layout_Reference:1:="16903"+$_at_LayoutRefs{$_l_Index}
				Else 
					[LIST_LAYOUTS:96]Layout_Reference:1:="16903"
				End if 
				
				Case of 
					: ([LIST_LAYOUTS:96]Formula:9="cost amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="cost price")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="description")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Description:13)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="discount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Discount:10)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="internalcomments")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]InternalComments:15)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="item number")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Original cost")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="POitemid")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Price Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Price per")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="print desc")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Print_Description:14)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="product code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="product name")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="purch Inv_No")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="quantity")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="tax code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_ORDERS_ITEMS:169])
						[LIST_LAYOUTS:96]Formula:9:=""
				End case 
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7+2
				SAVE RECORD:C53([LIST_LAYOUTS:96])
				NEXT RECORD:C51([LIST_LAYOUTS:96])
			End for 
			If ($_at_LayoutRefs{$_l_Index}#"05703")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16903"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=169; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16903"+$_at_LayoutRefs{$_l_Index}; 161; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16903"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=169; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16903"+$_at_LayoutRefs{$_l_Index}; 161; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16903"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=169; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16903"; 161; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="16903"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=169; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("16903"; 161; Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
				
			End if 
			
			
		End if 
	End for 
End if 

QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03703@")  //invoice items
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutRefs)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		If (Length:C16($_at_LayoutRefs{$_l_Index})>5)
			$_at_LayoutRefs{$_l_Index}:=Substring:C12($_at_LayoutRefs{$_l_Index}; 6; Length:C16($_at_LayoutRefs{$_l_Index}))
		End if 
	End for 
	ARRAY TEXT:C222($_at_InitialsDone; 0)
	
	For ($_l_Index; 1; Size of array:C274($_at_LayoutRefs))
		$_l_InitialsRow:=Find in array:C230($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
		If ($_l_InitialsRow<0)
			APPEND TO ARRAY:C911($_at_InitialsDone; $_at_LayoutRefs{$_l_Index})
			If ($_at_LayoutRefs{$_l_Index}#"03703")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03703"+$_at_LayoutRefs{$_l_Index})
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="03703")
			End if 
			For ($_l_ColumnsIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
				If ([LIST_LAYOUTS:96]Table_Number:2=37)
					[LIST_LAYOUTS:96]Table_Number:2:=158
				End if 
				If ($_at_LayoutRefs{$_l_Index}#"03703")
					[LIST_LAYOUTS:96]Layout_Reference:1:="15803"+$_at_LayoutRefs{$_l_Index}
				Else 
					[LIST_LAYOUTS:96]Layout_Reference:1:="15803"
				End if 
				Case of 
					: ([LIST_LAYOUTS:96]Formula:9="Analysis code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Cost amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Cost price")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Description")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Description:13)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Item number")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="our order no")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="price per")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="product code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Purchase acc")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Quantity")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Quantity:2)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Sales Price")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Stock Code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Stock_Code:14)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Tax amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Tax code")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
					: ([LIST_LAYOUTS:96]Formula:9="Total Amount")
						[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)
						[LIST_LAYOUTS:96]Table_Number:2:=Table:C252(->[PURCHASE_INVOICE_ITEMS:158])
						[LIST_LAYOUTS:96]Formula:9:=""
				End case 
				[LIST_LAYOUTS:96]Formula:9:=""
				[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7+2
				SAVE RECORD:C53([LIST_LAYOUTS:96])
				NEXT RECORD:C51([LIST_LAYOUTS:96])
			End for 
			If ($_at_LayoutRefs{$_l_Index}#"03703")
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="15803"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=158; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("15803"+$_at_LayoutRefs{$_l_Index}; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="15803"+$_at_LayoutRefs{$_l_Index}; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=158; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("15803"+$_at_LayoutRefs{$_l_Index}; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
			Else 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="15803"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=158; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("15803"; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17); "Record"; ""; 0; 1; False:C215; True:C214)
				End if 
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="15803"; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=158; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16))
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					Layouts_Create("15803"; 158; Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16); "ID"; ""; 0; 2; False:C215; False:C215)
				End if 
				
			End if 
			
			
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("V11Upgrade"; $_t_oldMethodName)
