//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_StatementDueAmounts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/11/2010 11:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(INV_ad_ReceiptDates;0)
	//ARRAY REAL(INV_ar_ReceiptAmounts;0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	//ARRAY TEXT(INV_at_ReceiptInvoices;0)
	//ARRAY TEXT(INV_at_receiptnumbers;0)
	C_BOOLEAN:C305($_bo_StartProcess; $_bo_UseOld; ACC_bo_ShowDate; INV_bo_INCDetails)
	C_DATE:C307(Acc_D_CutOffDate)
	C_LONGINT:C283($_l_CompanyRecordsCount; $_l_CountInvoices; $_l_CountLines; $_l_Element; $_l_Index; $_l_index2; $_l_MaxLines; $_l_OK; $_l_PrintHeight; $_l_PrintIndex; $_l_Process)
	C_LONGINT:C283($_l_pSubLines; $_l_RemainingHeight; $_l_TestSubLines; $_l_CurrentWinRefOLD; DB_l_CurrentDisplayedForm; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RightMargin; PRT_l_TopMargin; vIn)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(Acc_R_Cutoffamount; PRT_FooterHeight)
	C_TEXT:C284($_t_LastReceipt; $_t_MenuItemParameter; $_t_oldMethodName; $_t_ReceiptType; $1; Acc_t_AccountCodeFrom; ACC_t_Message; DB_t_CurrentContext; DB_t_CurrentFormUsage; INV_T_DetailLine)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_StatementDueAmounts")

$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
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
		
		$_bo_StartProcess:=True:C214
	End if 
End if 
If ($_bo_StartProcess)
	$_l_Process:=New process:C317("INV_StatementDueAmounts"; 128000; "Sales Daybook"; "NoCurrentSelection2")
	
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection2")
		Start_Process
	End if 
	If (Records in selection:C76([INVOICES:39])=0)
		vIn:=1
		DB_t_CurrentFormUsage:="Statement"
		Invoices_SelP
		
	Else 
		
	End if 
End if 



If (Records in selection:C76([INVOICES:39])>0)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
	Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Debit_Account:4
	ACC_bo_ShowDate:=False:C215
	
	If (Records in selection:C76([INVOICES:39])>0)
		ACC_t_Message:="Filter Debtors"
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1984; "Report Options")
		DIALOG:C40([USER:15]; "Aged_Debtors")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
	vIn:=1
	
	Invoices_StaChk
	
	
	If (Vin=1)
		If (Acc_R_Cutoffamount>0)
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7>=Acc_R_Cutoffamount)
		End if 
		If (Acc_D_CutOffDate>!00-00-00!)
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4>=Acc_D_CutOffDate)
		End if 
		
		If (Records in selection:C76([INVOICES:39])>0)
			ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
			
			
			
			//(False)
			Case of 
				: ((Shift down:C543=False:C215) & ((Form_SRProOK("Statement Email"; ""))))  //load super report if we have SuperReport
					SR_StatementOnPrint  //init the variables / run print sr code
					
				: ((Shift down:C543=False:C215) & ((Form_SRProOK("Statement"; ""))))
					SR_StatementOnPrint  //init the variables / run print sr code
					
					
				Else 
					//TRACE
					Gen_Confirm("Print multiple Invoices per page, or one per page?"; "Multiple"; "One")
					If (OK=1)
						ARRAY TEXT:C222(INV_at_ReceiptInvoices; 0)
						ARRAY TEXT:C222(INV_at_receiptnumbers; 0)
						ARRAY DATE:C224(INV_ad_ReceiptDates; 0)
						ARRAY REAL:C219(INV_ar_ReceiptAmounts; 0)
						Gen_Confirm("Include Allocation Detail?"; "Include"; "Exclude")
						If (OK=1)
							INV_bo_INCDetails:=True:C214
						Else 
							INV_bo_INCDetails:=False:C215
						End if 
						OK:=1
						CREATE SET:C116([INVOICES:39]; "toPrint")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Number:1#"*R"+"@")
						ARRAY TEXT:C222(INV_at_ReceiptInvoices; 0)
						ARRAY TEXT:C222(INV_at_receiptnumbers; 0)
						ARRAY DATE:C224(INV_ad_ReceiptDates; 0)
						ARRAY REAL:C219(INV_ar_ReceiptAmounts; 0)
						$_l_Element:=0
						FIRST RECORD:C50([INVOICES:39])
						$_bo_UseOld:=False:C215
						$_l_CountInvoices:=Records in selection:C76([INVOICES:39])
						
						For ($_l_Index; 1; $_l_CountInvoices)
							//GOTO SELECTED RECORD([INVOICES];$_l_Index)
							If ($_bo_UseOld)
								QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
								
								
								FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
								
								For ($_l_index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
									If ([INVOICES_ALLOCATIONS:162]Amount:2#0)
										$_l_Element:=$_l_Element+1
										If ($_l_Element>Size of array:C274(INV_at_receiptnumbers))
											INSERT IN ARRAY:C227(INV_at_ReceiptInvoices; Size of array:C274(INV_at_ReceiptInvoices)+1; 1)
											INSERT IN ARRAY:C227(INV_at_receiptnumbers; Size of array:C274(INV_at_receiptnumbers)+1; 1)
											INSERT IN ARRAY:C227(INV_ad_ReceiptDates; Size of array:C274(INV_ad_ReceiptDates)+1; 1)
											INSERT IN ARRAY:C227(INV_ar_ReceiptAmounts; Size of array:C274(INV_ar_ReceiptAmounts)+1; 1)
											
										End if 
										INV_at_receiptnumbers{$_l_Element}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
										INV_at_ReceiptInvoices{$_l_Element}:=[INVOICES:39]Invoice_Number:1
										INV_ad_ReceiptDates{$_l_Element}:=[INVOICES_ALLOCATIONS:162]Date:3
										INV_ar_ReceiptAmounts{$_l_Element}:=[INVOICES_ALLOCATIONS:162]Amount:2
									End if 
									NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
									
								End for 
							Else 
								INV_GetAllocations([INVOICES:39]Invoice_Number:1)
								For ($_l_index2; 1; Records in selection:C76([XInvoiceAllocation:126]))
									If ([XInvoiceAllocation:126]xAmount:7#0)
										$_l_Element:=$_l_Element+1
										
										If ($_l_Element>Size of array:C274(INV_at_receiptnumbers))
											INSERT IN ARRAY:C227(INV_at_ReceiptInvoices; Size of array:C274(INV_at_ReceiptInvoices)+1; 1)
											INSERT IN ARRAY:C227(INV_at_receiptnumbers; Size of array:C274(INV_at_receiptnumbers)+1; 1)
											INSERT IN ARRAY:C227(INV_ad_ReceiptDates; Size of array:C274(INV_ad_ReceiptDates)+1; 1)
											INSERT IN ARRAY:C227(INV_ar_ReceiptAmounts; Size of array:C274(INV_ar_ReceiptAmounts)+1; 1)
											
										End if 
										INV_at_ReceiptInvoices{$_l_Element}:=[INVOICES:39]Invoice_Number:1
										Case of 
											: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#[INVOICES:39]Invoice_Number:1)
												INV_at_receiptnumbers{$_l_Element}:=[XInvoiceAllocation:126]xInvoiceNumber:2
											: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#[INVOICES:39]Invoice_Number:1)
												INV_at_receiptnumbers{$_l_Element}:=[XInvoiceAllocation:126]xReceiptNumber:4
											: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#[INVOICES:39]Invoice_Number:1)
												INV_at_receiptnumbers{$_l_Element}:=[XInvoiceAllocation:126]xDepositNumber:5
											: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#[INVOICES:39]Invoice_Number:1)
												INV_at_receiptnumbers{$_l_Element}:=[XInvoiceAllocation:126]xCreditNumber:3
										End case 
										INV_ad_ReceiptDates{$_l_Element}:=[XInvoiceAllocation:126]xAllocationDate:6
										INV_ar_ReceiptAmounts{$_l_Element}:=[XInvoiceAllocation:126]xAmount:7
									End if 
									NEXT RECORD:C51([XInvoiceAllocation:126])
									
								End for 
								
							End if 
							
							NEXT RECORD:C51([INVOICES:39])
						End for 
						ARRAY TEXT:C222(INV_at_ReceiptInvoices; $_l_Element)
						ARRAY TEXT:C222(INV_at_receiptnumbers; $_l_Element)
						ARRAY DATE:C224(INV_ad_ReceiptDates; $_l_Element)
						ARRAY REAL:C219(INV_ar_ReceiptAmounts; $_l_Element)
						
						
						
						//the amount received is displayed on the line. no point in showing it TWICE
						//NG June 2003--error reported by client.
						//I am assuming the that the SR version is the same.
						
						If (Not:C34(SR_ReportOK("CompState")))
							Mail_StateComp
							//this report shows the invoiced amount and the receipt amount against the invoice
							If (Not:C34(INV_bo_INCDetails))
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Statement")
								If ($_l_OK>=0)
									FORM SET OUTPUT:C54([COMPANIES:2]; "Statement")
									PRINT SELECTION:C60([COMPANIES:2])
									PRT_SetPrinterPaperOptions("Statement")
								End if 
							Else 
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; "StatementwDetail")
								If ($_l_OK>=0)
									If ($_l_OK=1)
										PRINT SETTINGS:C106
										$_l_OK:=OK
									Else 
										$_l_OK:=1
									End if 
									If ($_l_OK=1)
										GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
										USE SET:C118("toPrint")
										DISTINCT VALUES:C339([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
										QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
										$_l_CompanyRecordsCount:=Records in selection:C76([COMPANIES:2])
										
										For ($_l_PrintIndex; 1; $_l_CompanyRecordsCount)
											
											GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
											$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
											
											//GOTO SELECTED RECORD([INVOICES];1)
											$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
											$_l_CountLines:=0
											$_l_MaxLines:=20
											PRT_FooterHeight:=171
											//Max line is recalculated after the first print line
											FIRST RECORD:C50([INVOICES:39])
											$_l_CountInvoices:=Records in selection:C76([INVOICES:39])
											For ($_l_Index; 1; $_l_CountInvoices)
												//USE SET("toPrint")
												//GOTO SELECTED RECORD([INVOICES];$_l_Index)
												
												$_l_TestSubLines:=0
												For ($_l_index2; 1; Size of array:C274(INV_at_ReceiptInvoices))
													If (INV_at_ReceiptInvoices{$_l_index2}=[INVOICES:39]Invoice_Number:1)
														$_l_TestSubLines:=$_l_TestSubLines+1
													End if 
												End for 
												If ($_l_CountLines+$_l_TestSubLines>=$_l_MaxLines) & ($_l_CountLines>0)
													//this will not fit on this page
													//but dont do this if the quantity is 2 many to fit on any page!
													Repeat 
														$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Inv_StateSubBLANK")
														If ($_l_Index=1)
															$_l_MaxLines:=Int:C8(($_l_RemainingHeight--PRT_FooterHeight)/$_l_PrintHeight)
														End if 
														$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
														$_l_CountLines:=$_l_CountLines+1
													Until ($_l_CountLines=$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
													
													PRT_FooterHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooter1")
													$_l_RemainingHeight:=$_l_RemainingHeight-PRT_FooterHeight
													PAGE BREAK:C6(>)
													$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
													$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
													$_l_CountLines:=0
												End if 
												$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Inv_StateSubwdetail")
												
												If ($_l_Index=1)
													$_l_MaxLines:=Int:C8(($_l_RemainingHeight-PRT_FooterHeight)/$_l_PrintHeight)
												End if 
												$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
												$_l_CountLines:=$_l_CountLines+1
												$_l_pSubLines:=0
												If ($_l_TestSubLines>0)
													If ($_l_CountLines>$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooter1")
														$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
														PAGE BREAK:C6(>)
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
														$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
														$_l_CountLines:=0
													End if 
													INV_T_DetailLine:=""
													$_t_LastReceipt:=""
													For ($_l_index2; 1; Size of array:C274(INV_at_ReceiptInvoices))
														INV_T_DetailLine:=""
														If (INV_at_ReceiptInvoices{$_l_index2}=[INVOICES:39]Invoice_Number:1)
															If (INV_at_receiptnumbers{$_l_index2}#$_t_LastReceipt)
																$_t_LastReceipt:=INV_at_receiptnumbers{$_l_index2}
																Case of 
																	: (Position:C15("*R"; INV_at_receiptnumbers{$_l_index2})>0)
																		$_t_ReceiptType:="Receipt"
																	: (Position:C15("*C"; INV_at_receiptnumbers{$_l_index2})>0)
																		$_t_ReceiptType:="Credit"
																	: (Position:C15("*D"; INV_at_receiptnumbers{$_l_index2})>0)
																		$_t_ReceiptType:="Deposit"
																	Else 
																		$_t_ReceiptType:=""
																End case 
																
																INV_T_DetailLine:=String:C10(INV_ad_ReceiptDates{$_l_index2})+":"+$_t_ReceiptType+" "+INV_at_receiptnumbers{$_l_index2}+":"
																
																If (INV_ar_ReceiptAmounts{$_l_index2}>0)
																	INV_T_DetailLine:=INV_T_DetailLine+String:C10(INV_ar_ReceiptAmounts{$_l_index2})
																Else 
																	INV_T_DetailLine:=INV_T_DetailLine+"("+String:C10(INV_ar_ReceiptAmounts{$_l_index2})+")"
																End if 
															End if 
														End if 
														If (INV_T_DetailLine#"")
															$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Inv_State_SubDetail")
															$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
															$_l_pSubLines:=$_l_pSubLines+1
															$_l_CountLines:=$_l_CountLines+1
															If ($_l_CountLines>$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
																If ($_l_pSubLines<$_l_TestSubLines) | ($_l_Index<Records in selection:C76([INVOICES:39]))
																	//more to print
																	$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooter1")
																	$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
																	PAGE BREAK:C6(>)
																	$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
																	$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
																	$_l_CountLines:=0
																Else 
																	//nothing more to print anyway
																	$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooterFinal")
																	$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
																	$_l_CountLines:=0
																	PAGE BREAK:C6
																End if 
																
															End if 
														End if 
														
													End for 
													
												End if 
												If ($_l_CountLines>=$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
													If ($_l_Index<Records in selection:C76([INVOICES:39]))
														//more to print
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooter1")
														$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
														PAGE BREAK:C6(>)
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
														$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
														$_l_CountLines:=0
													Else 
														//nothing more to print anyway
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooterFinal")
														$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
														$_l_CountLines:=0
														PAGE BREAK:C6
														$_l_CountLines:=0
													End if 
													
												End if 
												
												NEXT RECORD:C51([INVOICES:39])
											End for 
											
											If ($_l_CountLines>0)
												If ($_l_CountLines<$_l_MaxLines) & ($_l_RemainingHeight>($_l_PrintHeight+PRT_FooterHeight))
													Repeat 
														$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Inv_StateSubBLANK")
														$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
														$_l_CountLines:=$_l_CountLines+1
													Until ($_l_CountLines=$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
												End if 
												
												$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetailFooterFinal")
												PAGE BREAK:C6
												$_l_CountLines:=0
												
											End if 
											NEXT RECORD:C51([COMPANIES:2])
										End for 
										
										PRT_SetPrinterPaperOptions("StatementwDetail")
									End if 
								End if 
							End if 
							
						End if 
					Else 
						If (Not:C34(SR_ReportOK("SLState")))
							//this form DOES Not show the amount received therefore not filtering out receipts
							ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
							FORM SET OUTPUT:C54([INVOICES:39]; "Form")
							DB_t_CurrentFormUsage:="State"
							PRINT SELECTION:C60([INVOICES:39])
							
						End if 
					End if 
			End case 
			
			Close_ProWin
		End if 
	End if 
End if 
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
ERR_MethodTrackerReturn("INV_StatementDueAmounts"; $_t_oldMethodName)