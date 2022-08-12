//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PrintPIDaybook
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 14:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoicesToPrint; 0)
	C_BOOLEAN:C305($_bo_AllocationsToPrint; $_bo_IncludeAllocations; $_bo_IncludeItems; $_bo_ItemsToPrint; $_bo_LastInvoice; $_bo_printHeader_1; $_bo_ShowPrintSettings)
	C_DATE:C307(INV_D_InvAllocDate)
	C_LONGINT:C283($_l_AllocationItemHeight; $_l_AllocationsIndex; $_l_FooterHeight; $_l_InvoiceIndex; $_l_ItemHeight; $_l_OK; $_l_PageNumber; $_l_PIIndex; $_l_PrintHeight; $_l_PurchaseItemsIndex; $_l_Subheader2Height)
	C_LONGINT:C283($_l_SubheaderHeight; $_l_TempItemHeight; $_l_TempSubHeaderHeight; $_l_TotalHeightPrinted; $heightPrinted; DB_l_CurrentDisplayedForm; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RightMargin; PRT_l_TopMargin)
	C_LONGINT:C283(vNo; vNo2; xNext)
	C_REAL:C285($_r_Amount; INV_R_InvAllocAmt; INV_R_InvAmount; INV_R_InvCostPrice; INV_R_InvQuantity; INV_R_InvSalesPrice; INV_R_InvTaxAmount; INV_R_InvTotal; vAmount; Vinvoiced; VPaid)
	C_REAL:C285(VT1; Vtotal)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage; PINV_t_InvAllocRef; PINV_t_InvTaxCode; PINV_t_PInvioceAllocationNo; PINV_t_PInvoiceAnalaysisCode; PINV_t_PInvoiceProductCode; PINV_t_PInvoiceProductName; PINV_t_PInvoiceSalesAcc; VPPage)
	C_TEXT:C284(vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PrintPIDaybook")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 

If (Records in selection:C76([PURCHASE_INVOICES:37])>=1)
	CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp2")
	QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Printed:27=True:C214)
	If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
		If (Records in selection:C76([PURCHASE_INVOICES:37])<Records in set:C195("$Temp2"))
			Gen_Alert("Your selection includes Purchases that have already been printed, they will be Excluded")
			USE SET:C118("$Temp2")
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Printed:27=False:C215)
		Else 
			Gen_Alert("Your selection has already been printed")
			REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
			
		End if 
	Else 
		USE SET:C118("$Temp2")
	End if 
	If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
		ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Posted_Date:12; >; [PURCHASE_INVOICES:37]Purchase_Code:1; >)
		
		ORDER BY:C49([PURCHASE_INVOICES:37]Posted_Date:12; >; [PURCHASE_INVOICES:37]Purchase_Code:1; >)
		If (Not:C34(SR_ReportOK("PurchDayBk")))
			$_bo_IncludeAllocations:=False:C215
			$_bo_IncludeItems:=False:C215
			Gen_Confirm3(Term_SLPLWT("In its basic form this report will list Purchase Ledger entries")+" showing total figures only."+Char:C90(13)+Term_SLPLWT("Do you also wish to print Payment Allocations and Purchase Invoice Items?"); "Both"; "Basic"; "Alloc Only")
			
			If (OK=1) | (xNext=1)
				If (xNext=1)  //Allocations onl;y
					DB_t_CurrentFormUsage:="ItemsA"
					$_bo_IncludeAllocations:=True:C214
				Else 
					//Items and allocations
					DB_t_CurrentFormUsage:="Items"
					$_bo_IncludeAllocations:=True:C214
					$_bo_IncludeItems:=True:C214
				End if 
			Else 
				DB_t_CurrentFormUsage:=""
			End if 
			Date_Time
			If (vNo2#vNo)
				ORDER BY:C49([PURCHASE_INVOICES:37]Posted_Date:12; >; [PURCHASE_INVOICES:37]Purchase_Code:1; >)
			End if 
			
			vTitle:=Uppercase:C13(Term_SLPLWT("PURCHASE LEDGER DAYBOOK"))
			FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases_Day")
			If (False:C215)
				BREAK LEVEL:C302(0)
				ACCUMULATE:C303([PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19; [PURCHASE_INVOICES:37]Total_Tax:25; [PURCHASE_INVOICES:37]Total_Invoiced:7; vAmount)
				PRINT SELECTION:C60([PURCHASE_INVOICES:37])
				
			Else 
				ARRAY TEXT:C222($_at_InvoicesToPrint; 0)
				SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_InvoicesToPrint)
				Vinvoiced:=0
				VT1:=0
				Vtotal:=0
				VPaid:=0
				$_l_PageNumber:=0
				//page setup A4 landscape.
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Purchases_Day")
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
					$_bo_printHeader_1:=True:C214
					$_l_TotalHeightPrinted:=0
					$_l_FooterHeight:=13
					$_l_ItemHeight:=31
					$_l_SubheaderHeight:=27
					$_l_Subheader2Height:=23
					$_l_AllocationItemHeight:=16
					For ($_l_InvoiceIndex; 1; Size of array:C274($_at_InvoicesToPrint))
						If ($_bo_printHeader_1)
							$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  // Print main header
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
							$_bo_printHeader_1:=False:C215
						End if 
						QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_InvoicesToPrint{$_l_InvoiceIndex})
						If ([COMPANIES:2]Company_Code:1#[PURCHASE_INVOICES:37]Company_Code:2)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
						End if 
						//If ([CONTACTS]Contact Code#[INVOICES]Contact Code)
						//QUERY([CONTACTS];[CONTACTS]Contact Code=[INVOICES]Contact Code)
						//End if
						$_bo_LastInvoice:=($_l_InvoiceIndex=Size of array:C274($_at_InvoicesToPrint))
						QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
						
						If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>0)
							If ($_bo_IncludeAllocations)
								$_bo_AllocationsToPrint:=True:C214
							Else 
								$_bo_AllocationsToPrint:=False:C215
							End if 
							
						Else 
							$_bo_AllocationsToPrint:=False:C215
						End if 
						QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
						
						
						If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])>0)
							If ($_bo_IncludeItems)
								$_bo_ItemsToPrint:=True:C214
							Else 
								$_bo_ItemsToPrint:=False:C215
							End if 
						Else 
							$_bo_ItemsToPrint:=False:C215
						End if 
						vInvoiced:=vInvoiced+([PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19)
						vT1:=vT1+([PURCHASE_INVOICES:37]Total_Tax:25)
						vTotal:=vTotal+[PURCHASE_INVOICES:37]Total_Invoiced:7
						If ([PURCHASE_INVOICES:37]State:24<-1)
							$_r_Amount:=[PURCHASE_INVOICES:37]Total_Paid:8
						Else 
							$_r_Amount:=0
						End if 
						VAmount:=$_r_Amount
						vPaid:=vPaid+$_r_Amount
						$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 0)  //Print detail section
						$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						If ($_bo_LastInvoice) & (Not:C34($_bo_AllocationsToPrint)) & (Not:C34($_bo_ItemsToPrint))
							//we are printing the last invoice and there are no allocations or items the amount of space needed for the footer is different
							If (($_l_TotalHeightPrinted+23+$_l_FooterHeight)>=PRT_l_MaxHeight)
								Repeat 
									$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
								$_l_PageNumber:=$_l_PageNumber+1
								VPPage:="Page "+String:C10($_l_PageNumber)
								
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
								$_l_FooterHeight:=$_l_PrintHeight
								PAGE BREAK:C6(>)
								$_l_TotalHeightPrinted:=0
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //prnt main header again
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
									$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
								$_l_PageNumber:=$_l_PageNumber+1
								VPPage:="Page "+String:C10($_l_PageNumber)
								
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
								$_l_FooterHeight:=$_l_PrintHeight
								PAGE BREAK:C6(>)
								$_l_TotalHeightPrinted:=0
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //prnt main header again
								$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								$_bo_printHeader_1:=False:C215
							End if 
							//there is room for the item header and at least one line of item
							If ($_bo_IncludeItems)
								QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
								
								
								
								FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
								If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])>0)
									$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 201)  //print the second header(items header)
									$_l_SubheaderHeight:=$_l_PrintHeight
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
									
									For ($_l_PurchaseItemsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
										If ($_bo_LastInvoice) & ($_l_PurchaseItemsIndex=Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])) & (Not:C34($_bo_AllocationsToPrint))
											//This is the last item to print-so we have to allow for the totals plust the footer
											If (($_l_TotalHeightPrinted+$_l_ItemHeight+23+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this item and  the total and a footer
												// print blank lines and then the footer
												Repeat 
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
												$_l_PageNumber:=$_l_PageNumber+1
												VPPage:="Page "+String:C10($_l_PageNumber)
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
												PAGE BREAK:C6(>)
												$_l_FooterHeight:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=0
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 201)  //print the second header(items header)
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_bo_printHeader_1:=False:C215
											End if 
										Else 
											If (($_l_TotalHeightPrinted+$_l_ItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this item and a footer
												// print blank lines and then the footer
												Repeat 
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
												$_l_PageNumber:=$_l_PageNumber+1
												VPPage:="Page "+String:C10($_l_PageNumber)
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
												PAGE BREAK:C6(>)
												$_l_FooterHeight:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=0
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 201)  //print the second header(items header)
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_bo_printHeader_1:=False:C215
											End if 
										End if 
										
										PINV_t_PInvoiceProductCode:=[PURCHASE_INVOICE_ITEMS:158]Product_Code:1
										PINV_t_PInvoiceProductName:=[PURCHASE_INVOICE_ITEMS:158]Description:13
										PINV_t_PInvoiceSalesAcc:=[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8
										PINV_t_PInvoiceAnalaysisCode:=[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9
										INV_R_InvQuantity:=[PURCHASE_INVOICE_ITEMS:158]Quantity:2
										INV_R_InvCostPrice:=[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4
										INV_R_InvSalesPrice:=[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15
										PINV_t_InvTaxCode:=[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5
										INV_R_InvAmount:=INV_R_InvQuantity*INV_R_InvCostPrice
										INV_R_InvTaxAmount:=[PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6
										INV_R_InvTotal:=[PURCHASE_INVOICE_ITEMS:158]Total_Amount:7
										$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 303)  //print the item
										$_l_ItemHeight:=$_l_PrintHeight
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
									End for 
								End if 
							End if 
							//Get the allocations. There is no point in worying about printing the allocations if there are none.
							If ($_bo_IncludeAllocations)
								If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>0)
									If ($_bo_LastInvoice)
										If (($_l_TotalHeightPrinted+$_l_Subheader2Height+$_l_AllocationItemHeight+23+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
											// print blank lines and then the footer
											Repeat 
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
											$_l_PageNumber:=$_l_PageNumber+1
											VPPage:="Page "+String:C10($_l_PageNumber)
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
											PAGE BREAK:C6(>)
											$_l_FooterHeight:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=0
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
											$_l_Subheader2Height:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											$_bo_printHeader_1:=False:C215
										End if 
										
									Else 
										If (($_l_TotalHeightPrinted+$_l_Subheader2Height+$_l_AllocationItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
											// print blank lines and then the footer
											Repeat 
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
											$_l_PageNumber:=$_l_PageNumber+1
											VPPage:="Page "+String:C10($_l_PageNumber)
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
											PAGE BREAK:C6(>)
											$_l_FooterHeight:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=0
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
											$_l_Subheader2Height:=$_l_PrintHeight
											$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
											$_bo_printHeader_1:=False:C215
										End if 
									End if 
									QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
									
									
									FIRST RECORD:C50([PURCHASE_INVOICE_ALLOCATIONS:159])
									For ($_l_AllocationsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
										//is there room for the next header
										If ($_bo_LastInvoice) & ($_l_AllocationsIndex=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
											If (($_l_TotalHeightPrinted+$_l_AllocationItemHeight+23+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
												// print blank lines and then the footer
												Repeat 
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
												$_l_PageNumber:=$_l_PageNumber+1
												VPPage:="Page "+String:C10($_l_PageNumber)
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
												PAGE BREAK:C6(>)
												$_l_FooterHeight:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=0
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
												$_l_Subheader2Height:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_bo_printHeader_1:=False:C215
											Else 
												If ($_l_AllocationsIndex=1)
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
													$_l_Subheader2Height:=$_l_PrintHeight
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												End if 
											End if 
											
										Else 
											If (($_l_TotalHeightPrinted+$_l_AllocationItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)  //not enough room for this allocation item +header and a footer...so go to another page
												// print blank lines and then the footer
												Repeat 
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
												$_l_PageNumber:=$_l_PageNumber+1
												VPPage:="Page "+String:C10($_l_PageNumber)
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
												PAGE BREAK:C6(>)
												$_l_FooterHeight:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=0
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
												$_l_Subheader2Height:=$_l_PrintHeight
												$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												$_bo_printHeader_1:=False:C215
											Else 
												If ($_l_AllocationsIndex=1)
													$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 202)  //print the third header(allocation items header)
													$_l_Subheader2Height:=$_l_PrintHeight
													$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
												End if 
											End if 
										End if 
										PINV_t_InvAllocRef:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1
										PINV_t_PInvioceAllocationNo:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4
										INV_D_InvAllocDate:=[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3
										INV_R_InvAllocAmt:=[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
										$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 301)  //print the footer section with the allocation detail
										$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
										NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
									End for 
								End if 
							End if 
						End if 
						
						//Get the invoice
						//ACCUMULATE VINVOICE,VT1,VTOTAL,VPAID
						If ($_l_InvoiceIndex=Size of array:C274($_at_InvoicesToPrint))  //last item
							Repeat 
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
								$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
							Until (($_l_TotalHeightPrinted+23+$_l_FooterHeight)>=PRT_l_MaxHeight)
							$_l_PageNumber:=$_l_PageNumber+1
							VPPage:="Page "+String:C10($_l_PageNumber)
							$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 300)  // Print main header
							$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footerPage Break(>)
							$_l_TotalHeightPrinted:=0
							PAGE BREAK:C6
						Else 
							If (($_l_TotalHeightPrinted+$_l_ItemHeight+$_l_FooterHeight)>=PRT_l_MaxHeight)
								//Not enought room to print an item
								Repeat 
									$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
									$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
								Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
								$_l_PageNumber:=$_l_PageNumber+1
								VPPage:="Page "+String:C10($_l_PageNumber)
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
								PAGE BREAK:C6(>)
								
								$_l_TotalHeightPrinted:=0
								$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 200)  //print main header
								$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
							End if 
						End if 
					End for 
					If ($_l_TotalHeightPrinted>0)
						Repeat 
							$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 302)  //This is a 1 pixel section so we stop as soon as we need
							$_l_TotalHeightPrinted:=$_l_TotalHeightPrinted+$_l_PrintHeight
						Until (($_l_TotalHeightPrinted+3+$_l_FooterHeight)>=PRT_l_MaxHeight)
						$_l_PageNumber:=$_l_PageNumber+1
						VPPage:="Page "+String:C10($_l_PageNumber)
						$_l_PrintHeight:=Print form:C5([PURCHASE_INVOICES:37]; "Purchases_Day"; 100)  //This is a the page footer
						PAGE BREAK:C6
						$_l_TotalHeightPrinted:=0
					Else 
						PAGE BREAK:C6
					End if 
				End if 
			End if 
			
		End if 
		
		If (OK=1)
			Gen_Confirm("Was the Daybook successfully printed?"; "Yes"; "No")
			If (OK=1)
				READ WRITE:C146([PURCHASE_INVOICES:37])
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[PURCHASE_INVOICES:37])
					QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_InvoicesToPrint)
					APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Printed:27:=True:C214)
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
				Else 
					FIRST RECORD:C50([PURCHASE_INVOICES:37])
					For ($_l_PIIndex; 1; Records in selection:C76([PURCHASE_INVOICES:37]))
						[PURCHASE_INVOICES:37]Printed:27:=True:C214
						DB_SaveRecord(->[PURCHASE_INVOICES:37])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
						NEXT RECORD:C51([PURCHASE_INVOICES:37])
					End for 
				End if 
				
			End if 
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("PUR_PrintPIDaybook"; $_t_oldMethodName)
