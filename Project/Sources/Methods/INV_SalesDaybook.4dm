//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_SalesDaybook
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    12/11/2010 18:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_aCurrencyToconvert; 0)
	ARRAY TEXT:C222($_at_InvoicesToPrint; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_AllocationsToPrint; $_bo_IncludeAllocations; $_bo_IncludeItems; $_bo_ItemsToPrint; $_bo_LastInvoice; $_bo_printHeader_1; $_bo_ShowPrintSettings; $_bo_StartProcess; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_DATE:C307(INV_D_InvAllocDate)
	C_LONGINT:C283($_l_AllocationItemHeight; $_l_AllocationsIndex; $_l_CurrencyRow; $_l_CurrencyRow2; $_l_FooterHeight; $_l_InvoiceItemsIndex; $_l_InvoicesIndex; $_l_ItemHeight; $_l_OK; $_l_Page; $_l_PrintHeight)
	C_LONGINT:C283($_l_Process; $_l_Subheader2Height; $_l_SubheaderHeight; $_l_TempItemHeight; $_l_TempSubHeaderHeight; $_l_TotalHeightPrinted; $heightPrinted; DB_l_CurrentDisplayedForm; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight)
	C_LONGINT:C283(PRT_l_RightMargin; PRT_l_TopMargin; xNext)
	C_REAL:C285($_r_Amount; $_r_AmountBeforeTax; $_r_TaxAmount; $_r_TotalInvoiced; $_r_TotalPaid; INV_R_InvAllocAmt; INV_R_InvAmount; INV_R_InvCostPrice; INV_R_InvQuantity; INV_R_InvSalesPrice; INV_R_InvTaxAmount)
	C_REAL:C285(INV_R_InvTotal; VAmount; Vinvoiced; VPaid; VT1; Vtotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Layout; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OutputCurrency; $1; ACC_t_CurrencyCode; CUR_t_ouputCurrency; DB_t_CurrentContext; DB_t_CurrentFormUsage; INV_t_InvAllocRef)
	C_TEXT:C284(INV_t_InvoiceAnalaysisCode; INV_t_InvoiceProductCode; INV_t_InvoiceProductName; INV_t_InvoiceSalesAcc; INV_t_InvoiceTaxCode; VPPage; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_SalesDaybook")
$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_t_Layout:=""
$_bo_StartProcess:=False:C215
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	
	CREATE SET:C116([INVOICES:39]; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		Gen_Confirm("Print Selected Records?"; "Yes"; "No")
		If (OK=1)
			USE SET:C118("ListboxSet0")
		Else 
			$_bo_StartProcess:=True:C214
		End if 
		OK:=1
	Else 
		If (Records in selection:C76([INVOICES:39])>0)
			Gen_Confirm("Print on screen selection?"; "Yes"; "No")
			If (OK=0)
				REDUCE SELECTION:C351([INVOICES:39]; 0)
				$_bo_StartProcess:=True:C214
			End if 
			OK:=1
			
		Else 
			$_bo_StartProcess:=True:C214
		End if 
	End if 
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		REDUCE SELECTION:C351([INVOICES:39]; 0)
		$_bo_StartProcess:=True:C214
	End if 
End if 
If ($_bo_StartProcess)
	$_l_Process:=New process:C317("INV_SalesDaybook"; 128000; "Sales Daybook"; "NoCurrentSelection2")
	
	
Else 
	If (Records in selection:C76([INVOICES:39])=0)
		Gen_Confirm(Term_SLPLWT("Print only Sales Ledger entries that ")+"have not been printed to date, or select others?"; "Not printed"; "Select")
		If (OK=1)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Printed:37=False:C215; *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10#-1)
		Else 
			Invoices_Sel
		End if 
	Else 
		Gen_Confirm(Term_SLPLWT("Print only Sales Ledger entries that ")+"have not been printed to date?"; "Not printed"; "All")
		If (OK=1)
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Printed:37=False:C215; *)
			QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]State:10#-1)
		End if 
	End if 
End if 

If (OK=1) & (Records in selection:C76([INVOICES:39])>0)
	
	If (Not:C34(SR_ReportOK("SLDayBk")))
		
		CREATE SET:C116([INVOICES:39]; "PrintSelection")
		ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
		DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; $_at_aCurrencyToconvert)
		$_l_CurrencyRow:=Find in array:C230($_at_aCurrencyToconvert; "")
		If ($_l_CurrencyRow>0)
			$_l_CurrencyRow2:=Find in array:C230($_at_aCurrencyToconvert; <>SYS_t_BaseCurrency)
			If ($_l_CurrencyRow2<0)
				$_at_aCurrencyToconvert{$_l_CurrencyRow}:=<>SYS_t_BaseCurrency
			Else 
				DELETE FROM ARRAY:C228($_at_aCurrencyToconvert; $_l_CurrencyRow)
			End if 
		End if 
		
		Case of 
			: (Size of array:C274($_at_aCurrencyToconvert)=1)
				If ($_at_aCurrencyToconvert{1}="")
					$_at_aCurrencyToconvert{1}:=<>SYS_t_BaseCurrency
				End if 
				ACC_t_CurrencyCode:=$_at_aCurrencyToconvert{1}
			Else 
				ACC_t_CurrencyCode:=""
		End case 
		CB_bo_ConvertAtOldRate:=True:C214
		
		$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert; Table:C252(->[INVOICES:39]); "PrintSelection")
		CUR_t_ouputCurrency:=$_t_OutputCurrency
		$_bo_IncludeItems:=False:C215
		$_bo_IncludeAllocations:=False:C215
		Gen_Confirm3(Term_SLPLWT("In its basic form this report will list Sales Ledger entries")+" showing total figures only."+Char:C90(13)+Char:C90(13)+"Do you also wish to print Receipt Allocations and Sales Invoice Items?"; "Both"; "Basic"; "Alloc Only")
		If (OK=1) | (xNext=1)
			If (xNext=1)
				DB_t_CurrentFormUsage:="ItemsA"  //Allocations only
				$_bo_IncludeAllocations:=True:C214
			Else 
				DB_t_CurrentFormUsage:="Items"  //Items and allocations
				$_bo_IncludeAllocations:=True:C214
				$_bo_IncludeItems:=True:C214
				
			End if 
		Else 
			DB_t_CurrentFormUsage:=""  //NO items and allocations
		End if 
		Date_Time
		//If (vNo2#vNo)
		ORDER BY:C49([INVOICES:39]Posted_Date:8; >; [INVOICES:39]Invoice_Number:1; >)
		//End if
		vTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger Daybook"))
		ARRAY TEXT:C222($_at_InvoicesToPrint; 0)
		SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoicesToPrint)
		Vinvoiced:=0
		VT1:=0
		Vtotal:=0
		VPaid:=0
		$_l_Page:=0
		//page setup A4 landscape.
		$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Invoices_Day")
		$_bo_ShowPrintSettings:=False:C215
		If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
			If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
				$_bo_ShowPrintSettings:=True:C214
			End if 
		End if 
		If ($_bo_ShowPrintSettings)
			PRINT SETTINGS:C106
		End if 
		If (OK=1)
			GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
			GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
			PRT_l_MaxHeight:=PRT_l_MaxHeight-1
			$_bo_printHeader_1:=True:C214
			$_l_TotalHeightPrinted:=0
			$_l_FooterHeight:=16
			$_l_ItemHeight:=31
			$_l_SubheaderHeight:=27
			$_l_Subheader2Height:=23
			$_l_AllocationItemHeight:=16
			For ($_l_InvoicesIndex; 1; Size of array:C274($_at_InvoicesToPrint))
				If ($_bo_printHeader_1)
					$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  // Print main header
					$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
					$_bo_printHeader_1:=False:C215
				End if 
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoicesToPrint{$_l_InvoicesIndex})
				If ([COMPANIES:2]Company_Code:1#[INVOICES:39]Company_Code:2)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
				End if 
				If ([CONTACTS:1]Contact_Code:2#[INVOICES:39]Contact_Code:3)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
				End if 
				INV_GetAllocations([INVOICES:39]Invoice_Number:1)
				$_bo_LastInvoice:=($_l_InvoicesIndex=Size of array:C274($_at_InvoicesToPrint))
				
				If (Records in selection:C76([XInvoiceAllocation:126])>0)
					If ($_bo_IncludeAllocations)
						$_bo_AllocationsToPrint:=True:C214
					Else 
						$_bo_AllocationsToPrint:=False:C215
					End if 
				Else 
					$_bo_AllocationsToPrint:=False:C215
				End if 
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
				
				If (Records in selection:C76([INVOICES_ITEMS:161])>0)
					If ($_bo_IncludeItems=True:C214)
						$_bo_ItemsToPrint:=True:C214
					Else 
						$_bo_ItemsToPrint:=False:C215
					End if 
				Else 
					$_bo_ItemsToPrint:=False:C215
				End if 
				$_r_AmountBeforeTax:=CUR_ConvertValue([INVOICES:39]Total_Invoiced_Excluding_Tax:26; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
				$_r_TaxAmount:=CUR_ConvertValue([INVOICES:39]Total_Tax:35; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
				$_r_TotalInvoiced:=CUR_ConvertValue([INVOICES:39]Total_Invoiced:5; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
				$_r_TotalPaid:=CUR_ConvertValue([INVOICES:39]Total_Paid:6; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
				vInvoiced:=vInvoiced+($_r_AmountBeforeTax)
				vT1:=vT1+($_r_TaxAmount)
				vTotal:=vTotal+$_r_TotalInvoiced
				If ([INVOICES:39]State:10<-1)
					$_r_Amount:=$_r_TotalPaid
				Else 
					$_r_Amount:=0
				End if 
				VAmount:=$_r_Amount
				vPaid:=vPaid+$_r_Amount
				$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 0)  //Print detail section
				$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
				If ($_bo_LastInvoice) & (Not:C34($_bo_AllocationsToPrint)) & (Not:C34($_bo_ItemsToPrint))
					//we are printing the last invoice and there are no allocations or items the amount of space needed for the footer is different
					If (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
						Repeat 
							$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
						$_l_Page:=$_l_Page+1
						VPPage:="Page "+String:C10($_l_Page)
						
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
						$_l_FooterHeight:=$_l_PrintHeight
						PAGE BREAK:C6(>)
						$_l_FooterHeight:=$_l_PrintHeight
						$_l_TotalHeightPrinted:=0
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //prnt main header again
						$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						
					End if 
				Else 
					If ($_bo_ItemsToPrint)
						$_l_TempSubHeaderHeight:=$_l_SubheaderHeight
						$_l_TempItemHeight:=$_l_ItemHeight
					Else 
						$_l_TempSubHeaderHeight:=0  // no need to leave space for the sub header
						$_l_TempItemHeight:=0
					End if 
					If (($_l_TotalHeightPrinted+$_l_TempSubHeaderHeight+$_l_TempItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)
						// print blank lines and then the footer
						Repeat 
							$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
						$_l_Page:=$_l_Page+1
						VPPage:="Page "+String:C10($_l_Page)
						
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
						$_l_FooterHeight:=$_l_PrintHeight
						PAGE BREAK:C6(>)
						$_l_FooterHeight:=$_l_PrintHeight
						$_l_TotalHeightPrinted:=0
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //prnt main header again
						$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						$_bo_printHeader_1:=False:C215
					End if 
					//there is room for the item header and at least one line of item
					If ($_bo_IncludeItems)
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
						
						
						FIRST RECORD:C50([INVOICES_ITEMS:161])
						If (Records in selection:C76([INVOICES_ITEMS:161])>0)
							
							$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 201)  //print the second header(items header)
							$_l_SubheaderHeight:=$_l_PrintHeight
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
							
							For ($_l_InvoiceItemsIndex; 1; Records in selection:C76([INVOICES_ITEMS:161]))
								If ($_bo_LastInvoice) & ($_l_InvoiceItemsIndex=Records in selection:C76([INVOICES_ITEMS:161])) & (Not:C34($_bo_AllocationsToPrint))
									//This is the last item to print-so we have to allow for the totals plust the footer
									If (($_l_TotalHeightPrinted+$_l_ItemHeight+23+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this item and  the total and a footer
										// print blank lines and then the footer
										Repeat 
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
										$_l_Page:=$_l_Page+1
										VPPage:="Page "+String:C10($_l_Page)
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
										$_l_FooterHeight:=$_l_PrintHeight
										PAGE BREAK:C6(>)
										$_l_FooterHeight:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=0
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 201)  //print the second header(items header)
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_bo_printHeader_1:=False:C215
									End if 
								Else 
									If (($_l_TotalHeightPrinted+$_l_ItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this item and a footer
										// print blank lines and then the footer
										Repeat 
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
										$_l_Page:=$_l_Page+1
										VPPage:="Page "+String:C10($_l_Page)
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
										$_l_FooterHeight:=$_l_PrintHeight
										PAGE BREAK:C6(>)
										$_l_FooterHeight:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=0
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 201)  //print the second header(items header)
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_bo_printHeader_1:=False:C215
									End if 
								End if 
								
								INV_t_InvoiceProductCode:=[INVOICES_ITEMS:161]Product_Code:1
								INV_t_InvoiceProductName:=[INVOICES_ITEMS:161]Product_Name:2
								INV_t_InvoiceSalesAcc:=[INVOICES_ITEMS:161]Sales_Account:9
								INV_t_InvoiceAnalaysisCode:=[INVOICES_ITEMS:161]Analysis_Code:10
								INV_R_InvQuantity:=[INVOICES_ITEMS:161]Quantity:3
								INV_R_InvCostPrice:=[INVOICES_ITEMS:161]Cost_Amount:15
								INV_R_InvSalesPrice:=[INVOICES_ITEMS:161]Sales_Price:4
								INV_t_InvoiceTaxCode:=[INVOICES_ITEMS:161]Tax_Code:6
								INV_R_InvAmount:=[INVOICES_ITEMS:161]Amount:5
								INV_R_InvTaxAmount:=[INVOICES_ITEMS:161]Tax_Amount:7
								INV_R_InvTotal:=[INVOICES_ITEMS:161]Total_Amount:8
								$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 303)  //print the item
								$_l_ItemHeight:=$_l_PrintHeight
								$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								NEXT RECORD:C51([INVOICES_ITEMS:161])
							End for 
						End if 
					End if 
					//Get the allocations. There is no point in worying about printing the allocations if there are none.
					If ($_bo_IncludeAllocations)
						If (Records in selection:C76([XInvoiceAllocation:126])>0)
							If ($_bo_LastInvoice)
								If (($_l_TotalHeightPrinted+$_l_Subheader2Height+$_l_AllocationItemHeight+3+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
									// print blank lines and then the footer
									Repeat 
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
									$_l_Page:=$_l_Page+1
									VPPage:="Page "+String:C10($_l_Page)
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
									$_l_FooterHeight:=$_l_PrintHeight
									PAGE BREAK:C6(>)
									$_l_FooterHeight:=$_l_PrintHeight
									$_l_TotalHeightPrinted:=0
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
									$_l_Subheader2Height:=$_l_PrintHeight
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									$_bo_printHeader_1:=False:C215
								End if 
								
							Else 
								If (($_l_TotalHeightPrinted+$_l_Subheader2Height+$_l_AllocationItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
									// print blank lines and then the footer
									Repeat 
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
									$_l_Page:=$_l_Page+1
									VPPage:="Page "+String:C10($_l_Page)
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
									$_l_FooterHeight:=$_l_PrintHeight
									PAGE BREAK:C6(>)
									$_l_FooterHeight:=$_l_PrintHeight
									$_l_TotalHeightPrinted:=0
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
									$_l_Subheader2Height:=$_l_PrintHeight
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									$_bo_printHeader_1:=False:C215
								End if 
							End if 
							FIRST RECORD:C50([XInvoiceAllocation:126])
							For ($_l_AllocationsIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
								//is there room for the next header
								If ($_bo_LastInvoice) & ($_l_AllocationsIndex=Records in selection:C76([XInvoiceAllocation:126]))
									If (($_l_TotalHeightPrinted+$_l_AllocationItemHeight+23+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
										// print blank lines and then the footer
										Repeat 
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
										$_l_Page:=$_l_Page+1
										VPPage:="Page "+String:C10($_l_Page)
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
										$_l_FooterHeight:=$_l_PrintHeight
										PAGE BREAK:C6(>)
										$_l_FooterHeight:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=0
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
										$_l_Subheader2Height:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_bo_printHeader_1:=False:C215
									Else 
										If ($_l_AllocationsIndex=1)
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
											$_l_Subheader2Height:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										End if 
									End if 
									
								Else 
									If (($_l_TotalHeightPrinted+$_l_AllocationItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
										// print blank lines and then the footer
										Repeat 
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
										$_l_Page:=$_l_Page+1
										VPPage:="Page "+String:C10($_l_Page)
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
										$_l_FooterHeight:=$_l_PrintHeight
										PAGE BREAK:C6(>)
										$_l_FooterHeight:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=0
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  //print main header
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
										$_l_Subheader2Height:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										$_bo_printHeader_1:=False:C215
									Else 
										If ($_l_AllocationsIndex=1)
											$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 202)  //print the third header(allocation items header)
											$_l_Subheader2Height:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										End if 
									End if 
								End if 
								Case of 
									: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#[INVOICES:39]Invoice_Number:1)
										INV_t_InvAllocRef:=[XInvoiceAllocation:126]xInvoiceNumber:2
									: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#[INVOICES:39]Invoice_Number:1)
										INV_t_InvAllocRef:=[XInvoiceAllocation:126]xReceiptNumber:4
									: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#[INVOICES:39]Invoice_Number:1)
										INV_t_InvAllocRef:=[XInvoiceAllocation:126]xDepositNumber:5
									: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#[INVOICES:39]Invoice_Number:1)
										INV_t_InvAllocRef:=[XInvoiceAllocation:126]xCreditNumber:3
								End case 
								INV_D_InvAllocDate:=[XInvoiceAllocation:126]xAllocationDate:6
								INV_R_InvAllocAmt:=[XInvoiceAllocation:126]xAmount:7
								$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 301)  //print the footer section with the allocation detail
								$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								NEXT RECORD:C51([XInvoiceAllocation:126])
							End for 
						End if 
					End if 
				End if 
				
				//Get the invoice
				//ACCUMULATE VINVOICE,VT1,VTOTAL,VPAID
				If ($_l_InvoicesIndex=Size of array:C274($_at_InvoicesToPrint))  //last item
					Repeat 
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
						$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
					Until (($_l_TotalHeightPrinted+23+$_l_FooterHeight)>=PRT_l_MaxHeight)
					$_l_Page:=$_l_Page+1
					VPPage:="Page "+String:C10($_l_Page)
					$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 300)  // Print total area
					$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is  thefooter
				Else 
					If (($_l_TotalHeightPrinted+$_l_ItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)
						//Not enought room to print an item
						Repeat 
							$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
						$_l_Page:=$_l_Page+1
						VPPage:="Page "+String:C10($_l_Page)
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
						$_l_FooterHeight:=$_l_PrintHeight
						PAGE BREAK:C6(>)
						$_l_FooterHeight:=$_l_PrintHeight
						$_l_TotalHeightPrinted:=0
						$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 200)  // Print main header
						$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						
					End if 
				End if 
			End for 
			If ($_l_TotalHeightPrinted>0)
				Repeat 
					$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
					$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
				Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
				$_l_Page:=$_l_Page+1
				VPPage:="Page "+String:C10($_l_Page)
				
				$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Invoices_Day"; 100)  //This is a the page footer
				$_l_FooterHeight:=$_l_PrintHeight
				PAGE BREAK:C6
			Else 
				PAGE BREAK:C6
			End if 
		End if 
		If (False:C215)
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303([INVOICES:39]Total_Invoiced_Excluding_Tax:26; [INVOICES:39]Total_Tax:35; [INVOICES:39]Total_Invoiced:5; vAmount)
			FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_Day")
			PRINT SELECTION:C60([INVOICES:39])
		End if 
		If (OK=1)
			Gen_Confirm("Was the Daybook successfully printed?"; "Yes"; "No")
			If (OK=1)
				READ WRITE:C146([INVOICES:39])
				DB_lockFile(->[INVOICES:39])
				QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoicesToPrint)
				APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Printed:37:=True:C214)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
			End if 
		End if 
	End if 
End if 
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
ERR_MethodTrackerReturn("INV_SalesDaybook"; $_t_oldMethodName)