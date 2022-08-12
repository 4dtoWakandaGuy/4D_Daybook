//%attributes = {}

If (False:C215)
	//Project Method Name:      invoices_state
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(INV_ad_ReceiptDates;0)
	//ARRAY REAL(INV_ar_ReceiptAmounts;0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	//ARRAY TEXT(INV_at_ReceiptInvoices;0)
	//ARRAY TEXT(INV_at_receiptnumbers;0)
	C_BOOLEAN:C305(ACC_bo_ShowDate; INV_bo_INCDetails)
	C_DATE:C307(Acc_D_CutOffDate; VDate)
	C_LONGINT:C283($_l_CountCompanyRecords; $_l_CountLines; $_l_CountRecordsInvoices; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Index; $_l_MaxLines; $_l_OK; $_l_PrintHeight; $_l_PrintIndex; $_l_PrintSublines)
	C_LONGINT:C283($_l_ReceiptIndex; $_l_RecordsInSelection; $_l_RemainingHeight; $_l_TestSubLines; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RightMargin; PRT_l_TopMargin; vIn; vNo)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_REAL:C285(Acc_R_Cutoffamount; PRT_FooterHeight)
	C_TEXT:C284($_t_LastReceipt; $_t_oldMethodName; $_t_PostingType; $_t_CurrentOutputform; Acc_t_AccountCodeFrom; ACC_t_Message; DB_t_CurrentFormUsage; INV_T_DetailLine; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("invoices_state")

//Thu, Nov 24, 2005 bwalia: Supert report version of statement implemented

$_t_oldMethodName:=ERR_MethodTracker("invoices_state")
//invoices_state
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Invoices_File)
	READ ONLY:C145
	
	While (vIn>0)
		vIn:=1
		DB_t_CurrentFormUsage:="Statement"
		Invoices_SelP
		//the following lines keep the management of the options form simple
		VDate:=Current date:C33(*)
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
		
		If (vIn=1)
			Invoices_StaChk
			If (vIn=1)
				If (Acc_R_Cutoffamount>0)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7>=Acc_R_Cutoffamount)
				End if 
				If (Acc_D_CutOffDate>!00-00-00!)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4>=Acc_D_CutOffDate)
				End if 
				
				If (Records in selection:C76([INVOICES:39])>0)
					
					vNo:=Records in selection:C76([INVOICES:39])
					DB_t_CurrentFormUsage:="Print"
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					Open_Pro_Window("Statements - Due Am"; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([INVOICES:39]; *)  //NG may 2004 added table
					
					If (OK=1)
						//(False)
						Case of 
							: ((Shift down:C543=False:C215) & ((Form_SRProOK("Statement"; ""))))
								SR_StatementOnPrint  //init the variables / run print sr code
								
							: ((Shift down:C543=False:C215) & ((Form_SRProOK("Statement Email"; ""))))  //load super report if we have SuperReport
								SR_StatementOnPrint  //init the variables / run print sr code
								
							Else 
								
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
									$_l_CurrentRow:=0
									FIRST RECORD:C50([INVOICES:39])
									
									$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
									
									For ($_l_Index; 1; $_l_RecordsInSelection)
										//GOTO SELECTED RECORD([INVOICES];$_l_Index)
										
										INV_GetAllocations([INVOICES:39]Invoice_Number:1)
										For ($_l_ReceiptIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
											If ([XInvoiceAllocation:126]xAmount:7#0)
												$_l_CurrentRow:=$_l_CurrentRow+1
												
												If ($_l_CurrentRow>Size of array:C274(INV_at_receiptnumbers))
													INSERT IN ARRAY:C227(INV_at_ReceiptInvoices; Size of array:C274(INV_at_ReceiptInvoices)+1; 1)
													INSERT IN ARRAY:C227(INV_at_receiptnumbers; Size of array:C274(INV_at_receiptnumbers)+1; 1)
													INSERT IN ARRAY:C227(INV_ad_ReceiptDates; Size of array:C274(INV_ad_ReceiptDates)+1; 1)
													INSERT IN ARRAY:C227(INV_ar_ReceiptAmounts; Size of array:C274(INV_ar_ReceiptAmounts)+1; 1)
													
												End if 
												INV_at_ReceiptInvoices{$_l_CurrentRow}:=[INVOICES:39]Invoice_Number:1
												Case of 
													: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#[INVOICES:39]Invoice_Number:1)
														INV_at_receiptnumbers{$_l_CurrentRow}:=[XInvoiceAllocation:126]xInvoiceNumber:2
													: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#[INVOICES:39]Invoice_Number:1)
														INV_at_receiptnumbers{$_l_CurrentRow}:=[XInvoiceAllocation:126]xReceiptNumber:4
													: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#[INVOICES:39]Invoice_Number:1)
														INV_at_receiptnumbers{$_l_CurrentRow}:=[XInvoiceAllocation:126]xDepositNumber:5
													: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#[INVOICES:39]Invoice_Number:1)
														INV_at_receiptnumbers{$_l_CurrentRow}:=[XInvoiceAllocation:126]xCreditNumber:3
												End case 
												INV_ad_ReceiptDates{$_l_CurrentRow}:=[XInvoiceAllocation:126]xAllocationDate:6
												INV_ar_ReceiptAmounts{$_l_CurrentRow}:=[XInvoiceAllocation:126]xAmount:7
											End if 
											NEXT RECORD:C51([XInvoiceAllocation:126])
											
										End for 
										
										
										
										NEXT RECORD:C51([INVOICES:39])
									End for 
									ARRAY TEXT:C222(INV_at_ReceiptInvoices; $_l_CurrentRow)
									ARRAY TEXT:C222(INV_at_receiptnumbers; $_l_CurrentRow)
									ARRAY DATE:C224(INV_ad_ReceiptDates; $_l_CurrentRow)
									ARRAY REAL:C219(INV_ar_ReceiptAmounts; $_l_CurrentRow)
									
									
									
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
													$_l_CountCompanyRecords:=Records in selection:C76([COMPANIES:2])
													
													For ($_l_PrintIndex; 1; $_l_CountCompanyRecords)
														
														GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
														$_l_PrintHeight:=Print form:C5([COMPANIES:2]; "StatementWDetail")
														
														//GOTO SELECTED RECORD([INVOICES];1)
														$_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
														$_l_CountLines:=0
														$_l_MaxLines:=20
														PRT_FooterHeight:=171
														//Max line is recalculated after the first print line
														FIRST RECORD:C50([INVOICES:39])
														$_l_CountRecordsInvoices:=Records in selection:C76([INVOICES:39])
														For ($_l_Index; 1; $_l_CountRecordsInvoices)
															//USE SET("toPrint")
															//GOTO SELECTED RECORD([INVOICES];$_l_Index)
															
															$_l_TestSubLines:=0
															For ($_l_ReceiptIndex; 1; Size of array:C274(INV_at_ReceiptInvoices))
																If (INV_at_ReceiptInvoices{$_l_ReceiptIndex}=[INVOICES:39]Invoice_Number:1)
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
															$_l_PrintSublines:=0
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
																For ($_l_ReceiptIndex; 1; Size of array:C274(INV_at_ReceiptInvoices))
																	INV_T_DetailLine:=""
																	If (INV_at_ReceiptInvoices{$_l_ReceiptIndex}=[INVOICES:39]Invoice_Number:1)
																		If (INV_at_receiptnumbers{$_l_ReceiptIndex}#$_t_LastReceipt)
																			$_t_LastReceipt:=INV_at_receiptnumbers{$_l_ReceiptIndex}
																			Case of 
																				: (Position:C15("*R"; INV_at_receiptnumbers{$_l_ReceiptIndex})>0)
																					$_t_PostingType:="Receipt"
																				: (Position:C15("*C"; INV_at_receiptnumbers{$_l_ReceiptIndex})>0)
																					$_t_PostingType:="Credit"
																				: (Position:C15("*D"; INV_at_receiptnumbers{$_l_ReceiptIndex})>0)
																					$_t_PostingType:="Deposit"
																				Else 
																					$_t_PostingType:=""
																			End case 
																			
																			INV_T_DetailLine:=String:C10(INV_ad_ReceiptDates{$_l_ReceiptIndex})+":"+$_t_PostingType+" "+INV_at_receiptnumbers{$_l_ReceiptIndex}+":"
																			
																			If (INV_ar_ReceiptAmounts{$_l_ReceiptIndex}>0)
																				INV_T_DetailLine:=INV_T_DetailLine+String:C10(INV_ar_ReceiptAmounts{$_l_ReceiptIndex})
																			Else 
																				INV_T_DetailLine:=INV_T_DetailLine+"("+String:C10(INV_ar_ReceiptAmounts{$_l_ReceiptIndex})+")"
																			End if 
																		End if 
																	End if 
																	If (INV_T_DetailLine#"")
																		$_l_PrintHeight:=Print form:C5([INVOICES:39]; "Inv_State_SubDetail")
																		$_l_RemainingHeight:=$_l_RemainingHeight-$_l_PrintHeight
																		$_l_PrintSublines:=$_l_PrintSublines+1
																		$_l_CountLines:=$_l_CountLines+1
																		If ($_l_CountLines>$_l_MaxLines) | ($_l_RemainingHeight<=($_l_PrintHeight+PRT_FooterHeight))
																			If ($_l_PrintSublines<$_l_TestSubLines) | ($_l_Index<Records in selection:C76([INVOICES:39]))
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
						
					End if 
					
					Close_ProWin
					vIn:=0
				Else 
					Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
				End if 
			End if 
		End if 
	End while 
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("invoices_state"; $_t_oldMethodName)