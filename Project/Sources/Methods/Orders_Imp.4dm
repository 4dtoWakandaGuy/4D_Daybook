//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>StatesLoaded; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Calc; $_l_Create; $_l_CreateCompany; $_l_number; $_l_PeriodID; $_l_WindowReferenceRow; vAdd; vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_AddressLine1; $_t_AddressLine2; $_t_AnalysisCode; $_t_CompanyCode; $_t_CompanyName; $_t_ContCode; $_t_CostPrice; $_t_Country; $_t_County)
	C_TEXT:C284($_t_CurrencyCode; $_t_CustomerOrderNumber; $_t_DeliveryCompany; $_t_DeliveryContact; $_t_DeliveryDate; $_t_DeliveryNumber; $_t_EnquiryDate; $_t_FieldDelimiter; $_t_ForecastDate; $_t_ForeName; $_t_InvoiceDate)
	C_TEXT:C284($_t_InvoiceNumber; $_t_ItemDescription; $_t_ItemQuantity; $_t_LayerCode; $_t_OCP; $_t_oldMethodName; $_t_OrderCode; $_t_OrderComments; $_t_OrderDate; $_t_OrderPeriod; $_t_OrderState)
	C_TEXT:C284($_t_OrderType; $_t_PostCode; $_t_PriceCode; $_t_PrintDescription; $_t_ProductCode; $_t_ProductName; $_t_PurchaseOrderDate; $_t_PurchaseOrderNumber; $_t_QuotationDate; $_t_RecordDelimiter; $_t_RequiredDate)
	C_TEXT:C284($_t_RetailPrice; $_t_SalesPerson; $_t_SalesPrice; $_t_SerialNumber; $_t_Source; $_t_SupplierCode; $_t_Surname; $_t_TakenBy; $_t_TaxAmount; $_t_TaxCode; $_t_Telephone)
	C_TEXT:C284($_t_Terms; $_t_Title; $_t_TotalAmount; $_t_TotalCost; $_t_TotalMargin; $_t_TotalTax; $_t_TotalTotal; $_t_Town; $_t_WindowTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; vCompName; vT; vText; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_Imp")
//Orders_Import

$_t_WindowTitle:="Import Orders"
Start_Process
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
Orders_File
vAdd:=0
Gen_Confirm("Have you created an Orders_File in the correct Text format?"; "Yes"; "No")
If (OK=1)
	SET CHANNEL:C77(10; "")
	If (OK=1)
		
		CREATE EMPTY SET:C140([ORDERS:24]; "Master")
		$_t_RecordDelimiter:=Char:C90(13)
		$_t_FieldDelimiter:=Char:C90(9)
		$_t_OCP:=""
		vText:="sdfsdf"
		Open_PrD_Window($_t_WindowTitle+": Command-. to Cancel")
		MESSAGE:C88(Char:C90(13))
		While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
			RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
			Gen_ImpStrip
			$_t_OrderCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CompanyName:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressLine1:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressLine2:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Town:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_County:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PostCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Country:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Telephone:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ContCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Title:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ForeName:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Surname:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OrderDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OrderPeriod:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_EnquiryDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_QuotationDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ForecastDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_RequiredDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SalesPerson:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TakenBy:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Source:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OrderType:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Terms:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CustomerOrderNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OrderState:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OrderComments:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_DeliveryCompany:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_DeliveryContact:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TotalAmount:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TotalTax:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TotalTotal:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TotalCost:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TotalMargin:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AnalysisCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CurrencyCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_LayerCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductName:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ItemDescription:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PrintDescription:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ItemQuantity:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_RetailPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SalesPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TaxCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_TaxAmount:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CostPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PriceCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SerialNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SupplierCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PurchaseOrderNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PurchaseOrderDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_DeliveryNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_DeliveryDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_InvoiceNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_InvoiceDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_l_Create:=0
			
			$_l_number:=0
			
			If ($_t_OrderCode="")
				$_t_OrderCode:=$_t_OCP
			End if 
			
			If (($_t_OrderCode#"") & (Length:C16($_t_OrderCode)>1) & ($_t_OrderCode#"Order @"))
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
				If (Records in selection:C76([ORDERS:24])=1)
				Else 
					
					If (($_t_CompanyCode#"") | (($_t_CompanyName#"") & ($_t_Town#"")))
						If ($_t_CompanyCode#"")
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
						Else 
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
							QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town)
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine1)
						End if 
						$_l_CreateCompany:=0
						If (Records in selection:C76([COMPANIES:2])=0)
							MESSAGE:C88("  Creating Company "+$_t_CompanyCode+" "+$_t_CompanyName+Char:C90(13))
							CREATE RECORD:C68([COMPANIES:2])
							If ($_t_CompanyCode#"")
								[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
							Else 
								vCompName:=$_t_CompanyName
								Company_No
								$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
							End if 
							[COMPANIES:2]Status:12:="CI"
							$_l_CreateCompany:=1
						Else 
							$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
						End if 
						If (($_t_CompanyName#"") | ($_l_CreateCompany=1))
							[COMPANIES:2]Company_Name:2:=$_t_CompanyName
							[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr([COMPANIES:2]Company_Name:2)
							[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
							[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
							[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_Town)
							[COMPANIES:2]County_or_State:6:=$_t_County
							[COMPANIES:2]Postal_Code:7:=$_t_PostCode
							[COMPANIES:2]Country:8:=$_t_Country
							[COMPANIES:2]Telephone:9:=$_t_Telephone
							DB_SaveRecord(->[COMPANIES:2])
							AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						End if 
						
						If (($_t_ContCode#"") | ($_t_Surname#""))
							If ($_t_ContCode#"")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContCode)
							Else 
								QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode; *)
								QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
								SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
								QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								CREATE SET:C116([CONTACTS:1]; "$Set1")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName)
								CREATE SET:C116([CONTACTS:1]; "$Set2")
								INTERSECTION:C121("$Set1"; "$Set2"; "$Set1")
								USE SET:C118("$Set1")
							End if 
							If (Records in selection:C76([CONTACTS:1])=0)
								MESSAGE:C88("  Creating Contact "+$_t_ForeName+" "+$_t_Surname+Char:C90(13))
								CREATE RECORD:C68([CONTACTS:1])
								If ($_t_ContCode="")
									Contact_Code
								Else 
									[CONTACTS:1]Contact_Code:2:=$_t_ContCode
								End if 
								[CONTACTS:1]Company_Code:1:=$_t_CompanyCode
								CREATE RECORD:C68([CONTACTS_COMPANIES:145])
								[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
								[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
								[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
								[CONTACTS_COMPANIES:145]Company_Code:1:=$_t_CompanyCode
								[CONTACTS:1]Surname:5:=$_t_Surname
								[CONTACTS:1]Forename:4:=$_t_ForeName
								[CONTACTS:1]Title:3:=$_t_Title
								DB_SaveRecord(->[CONTACTS_COMPANIES:145])
								DB_SaveRecord(->[CONTACTS:1])
								AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
							End if 
						End if 
					End if 
					
					MESSAGE:C88("  Creating Order "+$_t_OrderCode+Char:C90(13))
					CREATE RECORD:C68([ORDERS:24])
					[ORDERS:24]Order_Code:3:=$_t_OrderCode
					[ORDERS:24]Company_Code:1:=$_t_CompanyCode
					If (($_t_ContCode#"") | ($_t_Surname#""))
						[ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
					End if 
					[ORDERS:24]Order_Date:4:=Date:C102($_t_OrderDate)
					If ([ORDERS:24]Order_Date:4=!00-00-00!)
						[ORDERS:24]Order_Date:4:=<>DB_d_CurrentDate
					End if 
					[ORDERS:24]Order_Period:42:=$_t_OrderPeriod
					[ORDERS:24]Enquiry_Date:25:=Date:C102($_t_EnquiryDate)
					[ORDERS:24]Quotation_Date:26:=Date:C102($_t_QuotationDate)
					[ORDERS:24]Forecast_Date:23:=Date:C102($_t_ForecastDate)
					[ORDERS:24]Required_Date:9:=Date:C102($_t_RequiredDate)
					[ORDERS:24]Person:5:=$_t_SalesPerson
					[ORDERS:24]Taken_By:17:=$_t_TakenBy
					[ORDERS:24]Source:18:=$_t_Source
					[ORDERS:24]Order_Type:43:=$_t_OrderType
					[ORDERS:24]Terms:16:=$_t_Terms
					[ORDERS:24]Your_Order_Number:10:=$_t_CustomerOrderNumber
					If ($_t_OrderState="")
						[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{3}
					Else 
						[ORDERS:24]State:15:=$_t_OrderState
						QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$_t_OrderState)
						If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
							QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=$_t_OrderState; *)
							QUERY:C277([TABLE_RECORD_STATES:90];  | ; [TABLE_RECORD_STATES:90]Entry_Name:5=$_t_OrderState)
							[ORDERS:24]State:15:=[TABLE_RECORD_STATES:90]State_Reference:4
						End if 
					End if 
					[ORDERS:24]Comments:14:=$_t_OrderComments
					[ORDERS:24]Delivery_Company:29:=$_t_DeliveryCompany
					[ORDERS:24]Delivery_Contact:30:=$_t_DeliveryContact
					[ORDERS:24]Total_Amount:6:=Num:C11($_t_TotalAmount)
					[ORDERS:24]Total_TAX:7:=Num:C11($_t_TotalTax)
					[ORDERS:24]Total_Total:8:=Num:C11($_t_TotalTotal)
					[ORDERS:24]Total_Cost:11:=Num:C11($_t_TotalCost)
					[ORDERS:24]Total_Margin:12:=Num:C11($_t_TotalMargin)
					If (($_t_AnalysisCode="") & (<>Per_t_CurrentDefaultAnalCode#""))
						[ORDERS:24]Analysis_Code:33:=<>Per_t_CurrentDefaultAnalCode
					Else 
						[ORDERS:24]Analysis_Code:33:=$_t_AnalysisCode
					End if 
					If ($_t_CurrencyCode="")
						[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
					Else 
						[ORDERS:24]Currency_Code:32:=$_t_CurrencyCode
					End if 
					If ($_t_LayerCode="")
						[ORDERS:24]Layer_Code:47:=DB_GetLedgerActualLayer
					Else 
						[ORDERS:24]Layer_Code:47:=$_t_LayerCode
					End if 
					RELATE ONE:C42([ORDERS:24]Order_Period:42)
					If ([PERIODS:33]Period_Code:1="")
						vDate:=[ORDERS:24]Order_Date:4
						$_l_PeriodID:=Check_Period
						[ORDERS:24]Order_Period:42:=[PERIODS:33]Period_Code:1
					End if 
					DB_SaveRecord(->[ORDERS:24])
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
					ADD TO SET:C119([ORDERS:24]; "Master")
					$_l_Create:=1
				End if 
				
				
				
				//Items
				If ((($_t_ProductCode#"") | ($_t_ProductName#"")) & ($_l_number=0))
					MESSAGE:C88("     "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
					CREATE RECORD:C68([ORDER_ITEMS:25])
					[ORDER_ITEMS:25]Order_Code:1:=$_t_OrderCode
					[ORDER_ITEMS:25]Product_Code:2:=$_t_ProductCode
					OrderI_No
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					If (($_t_ProductName#"") & ($_t_ProductCode#"") & ([PRODUCTS:9]Product_Code:1=""))
						MESSAGE:C88("     Creating Product "+$_t_ProductCode+Char:C90(13))
						CREATE RECORD:C68([PRODUCTS:9])
						[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
						[PRODUCTS:9]Group_Code:3:=Substring:C12($_t_ProductCode; 1; 3)
						[PRODUCTS:9]Brand_Code:4:=Substring:C12($_t_ProductCode; 4; 3)
						[PRODUCTS:9]Model_Code:5:=Substring:C12($_t_ProductCode; 7; 15)
						[PRODUCTS:9]Product_Name:2:=$_t_ProductName
						[PRODUCTS:9]Sales_Price:9:=Num:C11($_t_SalesPrice)
						[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
						DB_SaveRecord(->[PRODUCTS:9])
						AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
						
					End if 
					If ($_t_ProductName="")
						[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
					Else 
						[ORDER_ITEMS:25]Product_Name:13:=$_t_ProductName
					End if 
					[ORDER_ITEMS:25]Description:44:=$_t_ItemDescription
					If (($_t_PrintDescription="Y@") | ($_t_PrintDescription="True") | ($_t_PrintDescription="1"))
						[ORDER_ITEMS:25]Print_Description:45:=True:C214
					End if 
					[ORDER_ITEMS:25]Quantity:3:=Num:C11($_t_ItemQuantity)
					[ORDER_ITEMS:25]Retail_Price:38:=Num:C11($_t_RetailPrice)
					[ORDER_ITEMS:25]Sales_Price:4:=Num:C11($_t_SalesPrice)
					[ORDER_ITEMS:25]Cost_Price:5:=Num:C11($_t_CostPrice)
					[ORDER_ITEMS:25]Tax_Code:12:=$_t_TaxCode
					RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
					If ([TAX_CODES:35]Tax_Code:1="")
						[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
					End if 
					[ORDER_ITEMS:25]TAX_Amount:8:=Num:C11($_t_TaxAmount)
					Calc_Item
					[ORDER_ITEMS:25]Price_Code:36:=$_t_PriceCode
					[ORDER_ITEMS:25]Serial_Number:24:=$_t_SerialNumber
					[ORDER_ITEMS:25]Supplier_Code:20:=$_t_SupplierCode
					[ORDER_ITEMS:25]Purchase_Order_Number:18:=$_t_PurchaseOrderNumber
					[ORDER_ITEMS:25]Purchase_Order_Date:19:=Date:C102($_t_PurchaseOrderDate)
					[ORDER_ITEMS:25]Delivery_Number:49:=$_t_DeliveryNumber
					[ORDER_ITEMS:25]Delivery_Date:11:=Date:C102($_t_DeliveryDate)
					[ORDER_ITEMS:25]Invoice_Number:17:=$_t_InvoiceNumber
					[ORDER_ITEMS:25]Invoice_Date:25:=Date:C102($_t_InvoiceDate)
					
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					Orders_InLPTot
					DB_SaveRecord(->[ORDERS:24])
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
					ADD TO SET:C119([ORDERS:24]; "Master")
				End if 
				
			Else 
				MESSAGE:C88("  Line without Order Code"+Char:C90(13))
			End if 
			
			$_t_OCP:=$_t_OrderCode
		End while 
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		
		SET CHANNEL:C77(11)
		
		//Checking, Printing & Processing
		USE SET:C118("Master")
		If (Records in selection:C76([ORDERS:24])>0)
			Gen_Confirm("Do you want to View the Orders_Imported?"; "Yes"; "No")
			If (OK=1)
				DB_t_CurrentFormUsage:=""
				vNo:=Records in selection:C76([ORDERS:24])
				Open_Pro_Window($_t_WindowTitle; 0; 1; ->[ORDERS:24]; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[ORDERS:24]; WIN_t_CurrentOutputform)
				MODIFY SELECTION:C204([ORDERS:24]; *)
				Close_ProWin
			End if 
		Else 
			Gen_Alert("No Orders were created"; "Cancel")
		End if 
		
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Orders_Imp"; $_t_oldMethodName)
