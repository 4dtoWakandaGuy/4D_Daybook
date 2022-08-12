//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_NL; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Calc; $_l_CreateCompany; $_l_LastPurchaseInvoiceNumber; $_l_NP; $_l_PeriodID; $_l_PurchcaseInvoiceCreated; $_l_PurchInvoiceIndex; $_l_PurchsaseInvoiceItemCreated; $_l_WindowReferenceRow; vAdd)
	C_LONGINT:C283(vNo; vPu; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Account; $_t_AddressLine1; $_t_AddressLine2; $_t_Amount; $_t_AnalysisCode; $_t_AreaCode; $_t_CashTax; $_t_CompanyCode; $_t_CompanyName; $_t_Country)
	C_TEXT:C284($_t_County; $_t_CreditStage; $_t_CurrencyCode; $_t_DueDate; $_t_FieldDelimiter; $_t_InvoiceDate; $_t_LayerCode; $_t_Name; $_t_oldMethodName; $_t_PostalCode; $_t_Posted)
	C_TEXT:C284($_t_PostedDate; $_t_PostedPeriod; $_t_ProductCode; $_t_ProductName; $_t_PurchaseCode; $_t_PurchaseCostPrice; $_t_PurchaseCreditorsAccount; $_t_PurchaseOrderDate; $_t_PurchaseOrderNumber; $_t_PurchasePricPer; $_t_PurchaseQuantity)
	C_TEXT:C284($_t_PurchInvoiceNumber; $_t_PurchInvoiceNumberPrevious; $_t_RecordDelimiter; $_t_TaxAmount; $_t_TaxCode; $_t_Telephone; $_t_Total; $_t_TotalDue; $_t_Totalinvoiced; $_t_TotalPaid; $_t_Town)
	C_TEXT:C284($_t_UKEC; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; vT; vText; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_Imp")
//Purchase Invoices General Import
$_t_Name:="Import Purchases"
Start_Process
Purchases_File
If (vPu=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
	If ((DB_GetLedgerTRANSPURpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1))
		vAdd:=1
		Gen_Confirm("Have you created a Purchases_File in the correct Text format?"; "Yes"; "No")
		If (OK=1)
			Gen_Confirm("Do you want to post the Purchases to the General Ledger after importing, "+"or import them as opening balances in the Purchase Ledger only?"; "PL Only"; "Post to GL")
			If (OK=1)
				$_bo_NL:=False:C215
			Else 
				$_bo_NL:=True:C214
			End if 
			SET CHANNEL:C77(10; "")
			If (OK=1)
				CREATE EMPTY SET:C140([PURCHASE_INVOICES:37]; "Master")
				$_t_RecordDelimiter:=Char:C90(13)
				$_t_FieldDelimiter:=Char:C90(9)
				$_l_LastPurchaseInvoiceNumber:=0
				vText:="sdfsdf"
				Open_PrD_Window($_t_Name+": Command-. to Cancel")
				While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
					RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
					Gen_ImpStrip
					$_t_PurchInvoiceNumber:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_CompanyName:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_AddressLine1:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_AddressLine2:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Town:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_County:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PostalCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Country:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Telephone:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_InvoiceDate:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PostedPeriod:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseCreditorsAccount:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseOrderDate:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseOrderNumber:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Posted:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PostedDate:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Totalinvoiced:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_TotalPaid:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_TotalDue:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_ProductName:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseQuantity:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchaseCostPrice:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_PurchasePricPer:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Amount:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_TaxCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_TaxAmount:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Total:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_Account:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_AnalysisCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_CurrencyCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_LayerCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_CreditStage:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_DueDate:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_UKEC:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_AreaCode:=First_Field(->vT; $_t_FieldDelimiter)
					$_t_CashTax:=First_Field(->vT; $_t_FieldDelimiter)
					$_l_PurchcaseInvoiceCreated:=0
					
					If (Num:C11($_t_PurchInvoiceNumber)>$_l_LastPurchaseInvoiceNumber)
						$_l_LastPurchaseInvoiceNumber:=Num:C11($_t_PurchInvoiceNumber)
					End if 
					$_l_PurchsaseInvoiceItemCreated:=0
					
					If (($_t_PurchInvoiceNumber#"") & (Length:C16($_t_PurchInvoiceNumber)>1) & ($_t_PurchInvoiceNumber#"Purch@") & ($_t_PurchInvoiceNumber#"Inv@"))
						If ($_t_PurchaseCode#"")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$_t_PurchInvoiceNumber; *)
							QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_PurchaseCode)
						Else 
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$_t_PurchInvoiceNumber)
						End if 
						If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
							If (([PURCHASE_INVOICES:37]Posted_Date:12>!00-00-00!) & ($_t_PurchInvoiceNumber#$_t_PurchInvoiceNumberPrevious))
								MESSAGE:C88("Purchase Invoice "+$_t_PurchInvoiceNumber+" exists, and cannot be changed"+Char:C90(13))
								$_l_PurchsaseInvoiceItemCreated:=1
							End if 
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
									MESSAGE:C88("Creating Company "+$_t_CompanyCode+" "+$_t_CompanyName+Char:C90(13))
									CREATE RECORD:C68([COMPANIES:2])
									If ($_t_CompanyCode#"")
										[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
									Else 
										vCompName:=$_t_CompanyName
										Company_No
										$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
									End if 
									[COMPANIES:2]Status:12:="SI"
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
									[COMPANIES:2]Postal_Code:7:=$_t_PostalCode
									[COMPANIES:2]Country:8:=$_t_Country
									[COMPANIES:2]Telephone:9:=$_t_Telephone
									DB_SaveRecord(->[COMPANIES:2])
									AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
								End if 
							End if 
							
							MESSAGE:C88("Creating Purchase Invoice "+$_t_PurchInvoiceNumber+Char:C90(13))
							CREATE RECORD:C68([PURCHASE_INVOICES:37])
							[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=$_t_PurchInvoiceNumber
							If ($_t_PurchaseCode#"")
								[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_PurchaseCode
							Else 
								Purch_Code
							End if 
							[PURCHASE_INVOICES:37]Company_Code:2:=$_t_CompanyCode
							[PURCHASE_INVOICES:37]Invoice_Date:5:=Date:C102($_t_InvoiceDate)
							If ([PURCHASE_INVOICES:37]Invoice_Date:5=!00-00-00!)
								[PURCHASE_INVOICES:37]Invoice_Date:5:=<>DB_d_CurrentDate
							End if 
							[PURCHASE_INVOICES:37]Total_Invoiced:7:=Num:C11($_t_Totalinvoiced)
							[PURCHASE_INVOICES:37]Total_Paid:8:=Num:C11($_t_TotalPaid)
							[PURCHASE_INVOICES:37]Total_Due:9:=Num:C11($_t_TotalDue)
							[PURCHASE_INVOICES:37]Posted_Date:12:=Date:C102($_t_PostedDate)
							If (($_bo_NL=False:C215) & ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!))
								[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
							End if 
							[PURCHASE_INVOICES:37]Period_Code:3:=$_t_PostedPeriod
							RELATE ONE:C42([PURCHASE_INVOICES:37]Period_Code:3)
							If ([PERIODS:33]Period_Code:1="")
								vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
								$_l_PeriodID:=Check_Period
								[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
							End if 
							Check_PerCloseP
							[PURCHASE_INVOICES:37]Order_Number:10:=$_t_PurchaseOrderNumber
							[PURCHASE_INVOICES:37]Order_Date:6:=Date:C102($_t_PurchaseOrderDate)
							[PURCHASE_INVOICES:37]Creditors_Account:13:=$_t_PurchaseCreditorsAccount
							RELATE ONE:C42([PURCHASE_INVOICES:37]Creditors_Account:13)
							If ([ACCOUNTS:32]Account_Code:2="")
								[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
							End if 
							
							If ($_t_CurrencyCode="")
								[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
							Else 
								[PURCHASE_INVOICES:37]Currency_Code:23:=$_t_CurrencyCode
							End if 
							If ($_t_LayerCode="")
								[PURCHASE_INVOICES:37]Layer_Code:28:=DB_GetLedgerActualLayer
							Else 
								[PURCHASE_INVOICES:37]Layer_Code:28:=$_t_LayerCode
							End if 
							
							[PURCHASE_INVOICES:37]Credit_Stage:34:=$_t_CreditStage
							[PURCHASE_INVOICES:37]Due_Date:17:=Date:C102($_t_DueDate)
							If (($_t_UKEC="") | (($_t_UKEC#"U") & ($_t_UKEC#"E")))
								[PURCHASE_INVOICES:37]UK_EC:18:="U"
							Else 
								[PURCHASE_INVOICES:37]UK_EC:18:=$_t_UKEC
							End if 
							[PURCHASE_INVOICES:37]Area_Code:21:=$_t_AreaCode
							[PURCHASE_INVOICES:37]Cash_TAX:33:=Str_toBool($_t_CashTax)
							If (($_t_ProductCode="") & ($_t_ProductName=""))
								DB_SaveRecord(->[PURCHASE_INVOICES:37])
								ADD TO SET:C119([PURCHASE_INVOICES:37]; "Master")
							End if 
							$_l_PurchcaseInvoiceCreated:=1
						End if 
						$_l_Calc:=0
						$_l_NP:=0
						
						//Items
						If ((($_t_ProductCode#"") | ($_t_ProductName#"")) & ($_l_PurchsaseInvoiceItemCreated=0))
							MESSAGE:C88("     "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
							CREATE RECORD:C68([PURCHASE_INVOICE_ITEMS:158])
							[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
							[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
							
							[PURCHASE_INVOICE_ITEMS:158]Product_Code:1:=$_t_ProductCode
							RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
							If (($_t_ProductName#"") & ($_t_ProductCode#"") & ([PRODUCTS:9]Product_Code:1=""))
								MESSAGE:C88("     Creating Product "+$_t_ProductCode+Char:C90(13))
								CREATE RECORD:C68([PRODUCTS:9])
								[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
								[PRODUCTS:9]Group_Code:3:=Substring:C12($_t_ProductCode; 1; 3)
								[PRODUCTS:9]Brand_Code:4:=Substring:C12($_t_ProductCode; 4; 3)
								[PRODUCTS:9]Model_Code:5:=Substring:C12($_t_ProductCode; 7; 15)
								[PRODUCTS:9]Product_Name:2:=$_t_ProductName
								[PRODUCTS:9]Purchase_Account:13:=$_t_Account
								[PRODUCTS:9]Analysis_Code:18:=$_t_AnalysisCode
								CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
								[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
								[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
								
								[PRODUCTS_SUPPLIERS:148]Company_Code:1:=$_t_CompanyCode
								[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=Num:C11($_t_PurchaseCostPrice)
								DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
								[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
								DB_SaveRecord(->[PRODUCTS:9])
								AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
								$_l_NP:=1
							End if 
							If ($_t_ProductName="")
								[PURCHASE_INVOICE_ITEMS:158]Description:13:=[PRODUCTS:9]Product_Name:2
							Else 
								[PURCHASE_INVOICE_ITEMS:158]Description:13:=$_t_ProductName
							End if 
							[PURCHASE_INVOICE_ITEMS:158]Quantity:2:=Num:C11($_t_PurchaseQuantity)
							[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=Num:C11($_t_PurchaseCostPrice)
							[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=Num:C11($_t_PurchasePricPer)
							If ([PURCHASE_INVOICE_ITEMS:158]Price_Per:10=0)
								[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=1
							End if 
							[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Num:C11($_t_Amount)
							If ([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4=0)
								[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round(([PURCHASE_INVOICE_ITEMS:158]Quantity:2*[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2; 2)
							End if 
							[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=$_t_TaxCode
							RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
							If ([TAX_CODES:35]Tax_Code:1="")
								[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=DB_GetLedgerDefaultSalesTax
							End if 
							[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6:=Num:C11($_t_TaxAmount)
							[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7:=Num:C11($_t_Total)
							If (($_t_Total="") | ([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7=0))
								Purch_ItemCalc
								$_l_Calc:=1
							End if 
							[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=$_t_Account
							RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8)
							[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=$_t_AnalysisCode
							RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)
							If (([ACCOUNTS:32]Account_Code:2="") | (([ANALYSES:36]Analysis_Code:1="") & ($_t_AnalysisCode#"")))
								If (([PRODUCTS:9]Purchase_Account:13#"") & ($_l_NP=0))
									[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[PRODUCTS:9]Purchase_Account:13
									[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PRODUCTS:9]Analysis_Code:18
								Else 
									[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
									[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[TRANSACTION_TYPES:31]Analysis_Code:7
								End if 
							End if 
							DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
							QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
							
							[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)); 2; 2)
							[PURCHASE_INVOICES:37]Total_Due:9:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Paid:8); 2; 2)
							[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)); 2; 2)
							[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)); 2; 2)
							If ([PURCHASE_INVOICES:37]Cash_TAX:33)
								[PURCHASE_INVOICES:37]Cash_TAX_Due:32:=[PURCHASE_INVOICES:37]Total_Tax:25
							End if 
							
							DB_SaveRecord(->[PURCHASE_INVOICES:37])
							ADD TO SET:C119([PURCHASE_INVOICES:37]; "Master")
						End if 
						
					Else 
						MESSAGE:C88("Line without Purchase Invoice No"+Char:C90(13))
					End if 
					
					$_t_PurchInvoiceNumberPrevious:=$_t_PurchInvoiceNumber
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
				If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
					Gen_Confirm("Check the Purchase Invoices_Imported?"; "Yes"; "No")
					If (OK=1)
						DB_t_CurrentFormUsage:=""
						vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
						Open_Pro_Window($_t_Name; 0; 1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
						FS_SetFormSort(WIN_t_CurrentOutputform)
						WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
						MODIFY SELECTION:C204([PURCHASE_INVOICES:37]; *)
						Close_ProWin
					End if 
					
					If ($_bo_NL)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=0)
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							Gen_Confirm("Batch the Postings?"; "Yes"; "No")
							If (OK=1)
								If (Not:C34(In transaction:C397))
									DB_lockFile(->[PURCHASE_INVOICES:37])
									APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24:=1)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
								Else 
									FIRST RECORD:C50([PURCHASE_INVOICES:37])
									For ($_l_PurchInvoiceIndex; 1; Records in selection:C76([PURCHASE_INVOICES:37]))
										[PURCHASE_INVOICES:37]State:24:=1
										DB_SaveRecord(->[PURCHASE_INVOICES:37])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
										NEXT RECORD:C51([PURCHASE_INVOICES:37])
									End for 
								End if 
								
							Else 
								Gen_Confirm("Post the Amounts now?"; "Yes"; "No")
								If (OK=1)
									FIRST RECORD:C50([PURCHASE_INVOICES:37])
									While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
										
										Purch_InvCalc
										Purch_InvPost
										NEXT RECORD:C51([PURCHASE_INVOICES:37])
									End while 
								End if 
							End if 
						End if 
					End if 
					
				Else 
					Gen_Alert("No Purchase Invoices created"; "Cancel")
				End if 
				
			End if 
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Purchases_Imp"; $_t_oldMethodName)
