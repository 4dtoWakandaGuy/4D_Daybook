//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>PersAnOver; $_bo_NL; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vInvDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Calc; $_l_Count; $_l_Cr; $_l_Create; $_l_InvoiceNumber; $_l_No; $_l_NP; $_l_PeriodID; $_l_WindowReferenceRow; vAdd)
	C_LONGINT:C283(vIn; vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_Account; $_t_AddressLine1; $_t_AddressLine2; $_t_Amount; $_t_AnalysisCode; $_t_AreaCode; $_t_BaseText; $_t_CachVAT; $_t_Comments)
	C_TEXT:C284($_t_CompanyCode; $_t_CompanyName; $_t_ContactTitle; $_t_ContCode; $_t_Country; $_t_County; $_t_CreditStage; $_t_CurrencyCode; $_t_DebtorsAccount; $_t_DeliverToAddress; $_t_DeliverToCompany)
	C_TEXT:C284($_t_DeliverToContact; $_t_Description; $_t_DueDateSTR; $_t_FieldDelimiter; $_t_ForeName; $_t_ImportName; $_t_InvNoPrev; $_t_InvoiceDateSTR; $_t_InvoiceNumber; $_t_LayerCode; $_t_oldMethodName)
	C_TEXT:C284($_t_Period; $_t_Person; $_t_PostCode; $_t_PostedDateSTR; $_t_Postedstate; $_t_PricePerSTR; $_t_PriceSTR; $_t_PrintCommentSTR; $_t_PrintDescription; $_t_ProductCode; $_t_ProductName)
	C_TEXT:C284($_t_QuantitySTR; $_t_RecordDelimiter; $_t_Surname; $_t_TAXCode; $_t_Telephone; $_t_Terms; $_t_Total; $_t_TotalDueSTR; $_t_TotalInvoicedSTR; $_t_TotalPaidSTR; $_t_Town)
	C_TEXT:C284($_t_UKEC; $_t_VATAmount; $_t_VATPref; $_t_VATRegNo; $_t_YourOrderNumber; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; vT; vText)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Imp")
//`Project Method Invoices_Imp 26/3/2(ID 19637-19722)

//Invoices General Import
$_t_ImportName:="Import Invoices"
Start_Process
If (Invoices_File)
	If (vIn=1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
		If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1))
			vAdd:=1
			Gen_Confirm("Have you created an Invoice File in the correct Text format?"; "Yes"; "No")
			If (OK=1)
				Gen_Confirm("Do you want to print & post the Invoices to the General Ledger after importing, "+"or import them as opening balances in the Sales Ledger only?"; "SL Only"; "Post to GL")
				If (OK=1)
					$_bo_NL:=False:C215
				Else 
					$_bo_NL:=True:C214
				End if 
				SET CHANNEL:C77(10; "")
				If (OK=1)
					$_l_Count:=0
					CREATE EMPTY SET:C140([INVOICES:39]; "IMaster")
					$_t_RecordDelimiter:=Char:C90(13)
					$_t_FieldDelimiter:=Char:C90(9)
					$_l_InvoiceNumber:=0
					vText:="sdfsdf"
					Open_PrD_Window($_t_ImportName+": Command-. to Cancel")
					While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
						IDLE:C311  // 03/04/03 pb
						RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
						Gen_ImpStrip
						$_t_InvoiceNumber:=First_Field(->vT; $_t_FieldDelimiter)
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
						$_t_ContactTitle:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_ForeName:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Surname:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_InvoiceDateSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Period:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DebtorsAccount:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Terms:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_YourOrderNumber:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Postedstate:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_PostedDateSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_TotalInvoicedSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_TotalPaidSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_TotalDueSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Comments:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_ProductName:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_QuantitySTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_PriceSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Amount:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_TAXCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_VATAmount:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Total:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Account:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_AnalysisCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_CurrencyCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_LayerCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_PricePerSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Description:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_PrintDescription:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_PrintCommentSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Person:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_CreditStage:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DueDateSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DeliverToCompany:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DeliverToContact:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DeliverToAddress:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_BaseText:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_VATPref:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_VATRegNo:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_UKEC:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_AreaCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_CachVAT:=First_Field(->vT; $_t_FieldDelimiter)
						$_l_Create:=0
						If (Num:C11($_t_InvoiceNumber)>$_l_InvoiceNumber)
							$_l_InvoiceNumber:=Num:C11($_t_InvoiceNumber)
						End if 
						$_l_No:=0
						
						If (($_t_InvoiceNumber#"") & (Character code:C91(Substring:C12($_t_InvoiceNumber; Length:C16($_t_InvoiceNumber); 1))#64) & ($_t_InvoiceNumber#"Invoice N@") & ($_t_InvoiceNumber#"Inv N@"))
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
							If (Records in selection:C76([INVOICES:39])=1)
								If (([INVOICES:39]State:10>1) & ($_t_InvoiceNumber#$_t_InvNoPrev))
									MESSAGE:C88("Invoice "+$_t_InvoiceNumber+" exists, and cannot be changed"+Char:C90(13))
									$_l_No:=1
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
									$_l_Cr:=0
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
										[COMPANIES:2]Status:12:="CI"
										$_l_Cr:=1
									Else 
										$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
									End if 
									If (($_t_CompanyName#"") | ($_l_Cr=1))
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
											QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=$_t_CompanyCode; *)
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
											MESSAGE:C88("Creating Contact "+$_t_ForeName+" "+$_t_Surname+Char:C90(13))
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
											[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145])
											[CONTACTS_COMPANIES:145]Company_Code:1:=$_t_CompanyCode
											[CONTACTS:1]Surname:5:=$_t_Surname
											[CONTACTS:1]Forename:4:=$_t_ForeName
											[CONTACTS:1]Title:3:=$_t_ContactTitle
											DB_SaveRecord(->[CONTACTS_COMPANIES:145])
											
											DB_SaveRecord(->[CONTACTS:1])
											AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
										End if 
									End if 
								End if 
								
								MESSAGE:C88("Creating Invoice "+$_t_InvoiceNumber+Char:C90(13))
								CREATE RECORD:C68([INVOICES:39])
								[INVOICES:39]Invoice_Number:1:=$_t_InvoiceNumber
								[INVOICES:39]Company_Code:2:=$_t_CompanyCode
								If (($_t_ContCode#"") | ($_t_Surname#""))
									[INVOICES:39]Contact_Code:3:=[CONTACTS:1]Contact_Code:2
								End if 
								[INVOICES:39]Invoice_Date:4:=Date:C102($_t_InvoiceDateSTR)
								If ([INVOICES:39]Invoice_Date:4=!00-00-00!)
									[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
								End if 
								vInvDate:=[INVOICES:39]Invoice_Date:4
								[INVOICES:39]Total_Invoiced:5:=Num:C11($_t_TotalInvoicedSTR)
								[INVOICES:39]Total_Paid:6:=Num:C11($_t_TotalPaidSTR)
								[INVOICES:39]Total_Due:7:=Num:C11($_t_TotalDueSTR)
								[INVOICES:39]Posted_Date:8:=Date:C102($_t_PostedDateSTR)
								If ($_bo_NL=False:C215)
									[INVOICES:39]State:10:=3
									If ([INVOICES:39]Posted_Date:8=!00-00-00!)
										[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
									End if 
								Else 
									[INVOICES:39]State:10:=Num:C11($_t_Postedstate)
								End if 
								[INVOICES:39]Terms:11:=$_t_Terms
								[INVOICES:39]Comments:12:=Replace string:C233($_t_Comments; "*"; Char:C90(13))
								[INVOICES:39]Period_Code:13:=$_t_Period
								RELATE ONE:C42([INVOICES:39]Period_Code:13)
								If ([PERIODS:33]Period_Code:1="")
									vDate:=[INVOICES:39]Invoice_Date:4
									$_l_PeriodID:=Check_Period
									[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
								End if 
								Check_PerCloseI
								[INVOICES:39]Your_Order_Number:14:=$_t_YourOrderNumber
								[INVOICES:39]Debtors_Account:15:=$_t_DebtorsAccount
								RELATE ONE:C42([INVOICES:39]Debtors_Account:15)
								If ([ACCOUNTS:32]Account_Code:2="")
									[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
								End if 
								If ($_t_CurrencyCode="")
									[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
								Else 
									[INVOICES:39]Currency_Code:27:=$_t_CurrencyCode
								End if 
								If ($_t_LayerCode="")
									[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
								Else 
									[INVOICES:39]Layer_Code:38:=$_t_LayerCode
								End if 
								If ($_t_AnalysisCode="")
									If (<>PersAnOver)
										[INVOICES:39]Analysis_Code:17:=<>Per_t_CurrentDefaultAnalCode
									End if 
								Else 
									[INVOICES:39]Analysis_Code:17:=$_t_AnalysisCode
								End if 
								RELATE ONE:C42([INVOICES:39]Analysis_Code:17)
								If (([ANALYSES:36]Analysis_Code:1="") & ([INVOICES:39]Analysis_Code:17#""))
									[INVOICES:39]Analysis_Code:17:=[TRANSACTION_TYPES:31]Analysis_Code:7
								End if 
								[INVOICES:39]Print_Comments:25:=Str_toBool($_t_PrintCommentSTR)
								[INVOICES:39]Person:42:=$_t_Person
								[INVOICES:39]Credit_Stage:22:=$_t_CreditStage
								[INVOICES:39]Due_Date:18:=Date:C102($_t_DueDateSTR)
								[INVOICES:39]Delivery_Company:30:=$_t_DeliverToCompany
								[INVOICES:39]Delivery_Contact:31:=$_t_DeliverToContact
								[INVOICES:39]Deliver_To:32:=$_t_DeliverToAddress
								[INVOICES:39]Base_Text:23:=Replace string:C233($_t_BaseText; "*"; Char:C90(13))
								[INVOICES:39]TAX_Prefix:19:=$_t_VATPref
								[INVOICES:39]TAX_Registration_Number:20:=$_t_VATRegNo
								If (($_t_UKEC="") | (($_t_UKEC#"U") & ($_t_UKEC#"E")))
									[INVOICES:39]UK_EC:21:="U"
								Else 
									[INVOICES:39]UK_EC:21:=$_t_UKEC
								End if 
								[INVOICES:39]Area_Code:29:=$_t_AreaCode
								[INVOICES:39]Cash_TAX:41:=Str_toBool($_t_CachVAT)
								If (($_t_ProductCode="") & ($_t_ProductName=""))
									DB_SaveRecord(->[INVOICES:39])
									ADD TO SET:C119([INVOICES:39]; "IMaster")
								End if 
								$_l_Create:=1
							End if 
							$_l_Calc:=0
							$_l_NP:=0
							
							//Items
							If ((($_t_ProductCode#"") | ($_t_ProductName#"")) & ($_l_No=0))
								MESSAGE:C88("     "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
								CREATE RECORD:C68([INVOICES_ITEMS:161])
								[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
								[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
								[INVOICES_ITEMS:161]Product_Code:1:=$_t_ProductCode
								RELATE ONE:C42([INVOICES_ITEMS:161]Product_Code:1)
								If (($_t_ProductName#"") & ($_t_ProductCode#"") & ([PRODUCTS:9]Product_Code:1=""))
									MESSAGE:C88("     Creating Product "+$_t_ProductCode+Char:C90(13))
									CREATE RECORD:C68([PRODUCTS:9])
									[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
									[PRODUCTS:9]Group_Code:3:=Substring:C12($_t_ProductCode; 1; 3)
									[PRODUCTS:9]Brand_Code:4:=Substring:C12($_t_ProductCode; 4; 3)
									[PRODUCTS:9]Model_Code:5:=Substring:C12($_t_ProductCode; 7; 15)
									[PRODUCTS:9]Product_Name:2:=$_t_ProductName
									[PRODUCTS:9]Sales_Account:7:=$_t_Account
									[PRODUCTS:9]Analysis_Code:18:=$_t_AnalysisCode
									[PRODUCTS:9]Sales_Price:9:=Num:C11($_t_PriceSTR)
									[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
									If ($_t_PricePerSTR="")
										[PRODUCTS:9]Price_Per:40:=1
									Else 
										[PRODUCTS:9]Price_Per:40:=Num:C11($_t_PricePerSTR)
									End if 
									[PRODUCTS:9]Description:6:=$_t_Description
									DB_SaveRecord(->[PRODUCTS:9])
									AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
									$_l_NP:=1
								End if 
								If ($_t_ProductName="")
									[INVOICES_ITEMS:161]Product_Name:2:=[PRODUCTS:9]Product_Name:2
								Else 
									[INVOICES_ITEMS:161]Product_Name:2:=$_t_ProductName
								End if 
								[INVOICES_ITEMS:161]Quantity:3:=Num:C11($_t_QuantitySTR)
								[INVOICES_ITEMS:161]Sales_Price:4:=Num:C11($_t_PriceSTR)
								[INVOICES_ITEMS:161]Amount:5:=Num:C11($_t_Amount)
								If ([INVOICES_ITEMS:161]Amount:5=0)
									[INVOICES_ITEMS:161]Amount:5:=Round:C94(([INVOICES_ITEMS:161]Quantity:3*[INVOICES_ITEMS:161]Sales_Price:4); 2)
								End if 
								[INVOICES_ITEMS:161]Tax_Code:6:=$_t_TAXCode
								RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
								If ([TAX_CODES:35]Tax_Code:1="")
									[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
								End if 
								[INVOICES_ITEMS:161]Tax_Amount:7:=Num:C11($_t_VATAmount)
								[INVOICES_ITEMS:161]Total_Amount:8:=Num:C11($_t_Total)
								If ($_t_PricePerSTR="")
									[INVOICES_ITEMS:161]Price_Per:16:=1
								Else 
									[INVOICES_ITEMS:161]Price_Per:16:=Num:C11($_t_PricePerSTR)
								End if 
								If (($_t_Total="") | ([INVOICES_ITEMS:161]Total_Amount:8=0))
									Inv_ItemCalc
									$_l_Calc:=1
								End if 
								[INVOICES_ITEMS:161]Sales_Account:9:=$_t_Account
								RELATE ONE:C42([INVOICES_ITEMS:161]Sales_Account:9)
								If ([ACCOUNTS:32]Account_Code:2="")
									If (([PRODUCTS:9]Sales_Account:7#"") & ($_l_NP=0))
										[INVOICES_ITEMS:161]Sales_Account:9:=[PRODUCTS:9]Sales_Account:7
									Else 
										[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
									End if 
								End if 
								If ([INVOICES:39]Analysis_Code:17#"")
									[INVOICES_ITEMS:161]Analysis_Code:10:=[INVOICES:39]Analysis_Code:17
								Else 
									[INVOICES_ITEMS:161]Analysis_Code:10:=$_t_AnalysisCode
								End if 
								RELATE ONE:C42([INVOICES_ITEMS:161]Analysis_Code:10)
								If (([ANALYSES:36]Analysis_Code:1="") & ([INVOICES_ITEMS:161]Analysis_Code:10#""))
									If (([PRODUCTS:9]Sales_Account:7#"") & ($_l_NP=0))
										[INVOICES_ITEMS:161]Analysis_Code:10:=[PRODUCTS:9]Analysis_Code:18
									Else 
										[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
									End if 
								End if 
								[INVOICES_ITEMS:161]Description:13:=Replace string:C233($_t_Description; "*"; Char:C90(13))
								[INVOICES_ITEMS:161]Print_Description:14:=Str_toBool($_t_PrintDescription)
								DB_SaveRecord(->[INVOICES_ITEMS:161])
								
								QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
								[INVOICES:39]Total_Invoiced:5:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Total_Amount:8)); 2; 2)
								[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
								[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Amount:5)); 2; 2)
								[INVOICES:39]Total_Tax:35:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7)); 2; 2)
								If ([INVOICES:39]Cash_TAX:41)
									[INVOICES:39]Cash_TAX_Due:40:=[INVOICES:39]Total_Tax:35
								End if 
								
								DB_SaveRecord(->[INVOICES:39])
								ADD TO SET:C119([INVOICES:39]; "IMaster")
							End if 
							
						Else 
							MESSAGE:C88("Line without Invoice No"+Char:C90(13))
						End if 
						
						$_t_InvNoPrev:=$_t_InvoiceNumber
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
					USE SET:C118("IMaster")
					If (Records in selection:C76([INVOICES:39])>0)
						Gen_Confirm("Check the Invoices before Printing?"; "Yes"; "No")
						If (OK=1)
							DB_t_CurrentFormUsage:=""
							vNo:=Records in selection:C76([INVOICES:39])
							Open_Pro_Window($_t_ImportName; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
							FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[INVOICES:39]))
							WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
							MODIFY SELECTION:C204([INVOICES:39]; *)
							Close_ProWin
						End if 
						
						Gen_Confirm("Print the Invoices?"; "Yes"; "No")
						If (OK=1)
							FORM SET OUTPUT:C54([INVOICES:39]; "Form")
							PRINT SELECTION:C60([INVOICES:39])
						End if 
						
						If ($_bo_NL)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=0)
							If (Records in selection:C76([INVOICES:39])>0)
								Gen_Confirm("Batch the Postings?"; "Yes"; "No")
								If (OK=1)
									DB_lockFile(->[INVOICES:39])
									APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]State:10:=1)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
								Else 
									Gen_Confirm("Post the Amounts now?"; "Yes"; "No")
									If (OK=1)
										DB_t_CurrentFormUsage2:="NWin"
										Open_AnyTypeWindow(200; 340; 5; "General Ledger Postings"+Char:C90(13))
										FIRST RECORD:C50([INVOICES:39])
										While (Not:C34(End selection:C36([INVOICES:39])))
											MESSAGE:C88(Char:C90(13)+Char:C90(13)+"   Invoice No "+[INVOICES:39]Invoice_Number:1)
											Inv_InvCalc
											Inv_InvPost
											NEXT RECORD:C51([INVOICES:39])
										End while 
										CLOSE WINDOW:C154
										If (WIN_bo_TrackerInited)
											$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
											If ($_l_WindowReferenceRow>0)
												WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
											End if 
										End if 
										
									End if 
								End if 
							End if 
						End if 
						
					Else 
						Gen_Alert("No Invoices created"; "Cancel")
					End if 
					
				End if 
			End if 
		Else 
			Gen_Alert("Required Setups have not been completed"; "")
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices_Imp"; $_t_oldMethodName)
