//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalPLBudget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($Group)
	//C_UNKNOWN($Report)
	//C_UNKNOWN($RHAmF)
	//C_UNKNOWN($RHAmT)
	//C_UNKNOWN($RHChF)
	//C_UNKNOWN(ch6)
	//C_UNKNOWN(ch7)
	//C_UNKNOWN(i)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vAmountF)
	//C_UNKNOWN(vAmountT)
	//C_UNKNOWN(vBalance)
	//C_UNKNOWN(vChargesF)
	//C_UNKNOWN(vChargesT)
	//C_UNKNOWN(vControl)
	//C_UNKNOWN(vFld)
	//C_UNKNOWN(vGroup)
	//C_UNKNOWN(vHeading)
	//C_UNKNOWN(vInvF)
	//C_UNKNOWN(vInvoiced)
	//C_UNKNOWN(vInvT)
	//C_UNKNOWN(vPaid)
	//C_UNKNOWN(vPeriod)
	//C_UNKNOWN(vRec)
	//C_UNKNOWN(vStage)
	//C_UNKNOWN(vStockLevel)
	//C_UNKNOWN(vT1)
	//C_UNKNOWN(vT2)
	//C_UNKNOWN(vT3)
	//C_UNKNOWN(vT4)
	//C_UNKNOWN(vT5)
	//C_UNKNOWN(vT6)
	//C_UNKNOWN(vTerms)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(vTitle)
	//C_UNKNOWN(vTitle1)
	//C_UNKNOWN(vTitle4)
	//C_UNKNOWN(vValueF)
	//C_UNKNOWN(vYTot)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($1; DB_bo_RecordModified; $_bo_Query; $1; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_PrintHeight; $_l_Process; ch6; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin; s1)
	C_LONGINT:C283(vAB; vControl; vStockLevel; <>SYS_l_CancelProcess; $_l_PrintHeight; $_l_Process; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin)
	C_LONGINT:C283(PRT_l_TopMargin)
	C_REAL:C285($_r_PtotT; $_r_T1G; $_r_T1T; $_r_T4G; $_r_T4T; $_r_YTotG; $_r_YtotT; $RHAmF; $RHAmT; $RHChF; VamountF)
	C_REAL:C285(VamountT; vBalance; vChargesF; vChargesT; vIncT; VinvF; vInvoiced; vInvT; vPaid; vT1; vT2)
	C_REAL:C285(vT3; vT4; vT5; vT6; vValueF; vYTot; $_r_PTotG; $_r_PtotT; $_r_T1G; $_r_T1T; $_r_T4G)
	C_REAL:C285($_r_T4T; $_r_YTotG; $_r_YtotT; $RHChT; vPTot)
	C_TEXT:C284($_t_oldMethodName; $_t_OutputCurrency; $Group; $Heading; $Report; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFld)
	C_TEXT:C284(vGroup; vHeading; vPeriod; vRec; vStage; vTerms; vText; vTitle; vTitle1; vTitle4; <>SYS_t_BaseCurrency)
	C_TEXT:C284($_t_oldMethodName; $_t_OutputCurrency; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; vCallCode; vTitle3)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalPLBudget")
//ACC_BalPLBudget
$_l_Process:=Current process:C322

//Start_Process
//AccBal File
READ ONLY:C145([ACCOUNT_BALANCES:34])

While (vAB=1)
	//IDLE  ` 03/04/03 pb
	vTitle:=Uppercase:C13(Term_NLWT("PROFIT & LOSS "))
	DB_t_CurrentFormUsage:="PL_B"
	If (Count parameters:C259>=1)
		$_bo_Query:=$1
	Else 
		$_bo_Query:=True:C214
	End if 
	If ($_bo_Query)
		ACC_BalSelect
	End if 
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
			//CurrConv_Ask
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
			If ($_t_OutputCurrency#"")
				If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
					vCallCode:=$_t_OutputCurrency
				End if 
				If (OK=1)
					Acc_BalRepTit($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
					USE SET:C118("Master")
					
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=vText)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "All Budgets")
					DIFFERENCE:C122("Master"; "All Budgets"; "Master")
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_t_PeriodTo)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Period Budgets")
					USE SET:C118("Master")
					
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_t_PeriodTo)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra2")
					vPeriod:=ACC_t_PeriodTo
					vTitle1:=ACC_t_PeriodFrom+"-"+ACC_t_PeriodTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
					vTitle:=Term_NLWT("PL_v Budget ")+Uppercase:C13(vText)+" "+[PERIODS:33]Period_Name:2
					
					If (Not:C34(SR_ReportOK("AccBalPLB")))
						Acc_BalRepPS(Term_NLWT("P&L v Budgets"))
						
						If (OK=1)
							If (s1=1)
								GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
								GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
							End if 
							
							Accounts_LaySrc(vText)
							QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
							Accounts_ZeroSr
							ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Group_Heading:6; >; [ACCOUNTS:32]Report_Heading:1; >; [ACCOUNTS:32]Account_Code:2; >)
							
							If (s1=1)
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr"; 200)
								PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
								
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Hdr")
								PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
								If (ch6=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									
									i:=i+1
								End if 
							Else 
								SEND PACKET:C103(vTitle+vRec+vRec+String:C10(<>DB_d_CurrentDate)+vFld+String:C10(<>CTime; 2)+vRec+vRec)
								SEND PACKET:C103(vTitle4+vFld+vFld+vFld+vTitle3+vRec+vRec)
								SEND PACKET:C103(vFld+vFld+vFld+vPeriod+vFld+vFld+vFld+vTitle1)
								SEND PACKET:C103(vFld+"Budget"+vFld+"Actual"+vFld+"Variance"+vFld+"%"+vFld+"Budget"+vFld+"Actual"+vFld+"Variance"+vFld+"%"+vRec+vRec)
							End if 
							$_r_PtotT:=0
							$_r_YtotT:=0
							$_r_T1T:=0
							$_r_T4T:=0
							
							FIRST RECORD:C50([ACCOUNTS:32])
							While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (<>SYS_l_CancelProcess#$_l_Process))
								RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
								vGroup:=Uppercase:C13([HEADINGS:84]Heading_Name:2)
								$Group:=[ACCOUNTS:32]Group_Heading:6
								DB_bo_RecordModified:=False:C215
								$_r_PTotG:=0
								$_r_YTotG:=0
								$_r_T1G:=0
								$_r_T4G:=0
								vStockLevel:=1
								vStage:=""
								
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($Group=[ACCOUNTS:32]Group_Heading:6) & (<>SYS_l_CancelProcess#$_l_Process))
									
									
									$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalPLBHdg")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If ([HEADINGS:84]Heading_Level:3=vValueF)
										$Report:=[ACCOUNTS:32]Report_Heading:1+"@"
									Else 
										$Report:=[ACCOUNTS:32]Report_Heading:1
									End if 
									$RHAmF:=0
									$RHAmT:=0
									$RHChF:=0
									$RHChT:=0
									
									While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($Group=[ACCOUNTS:32]Group_Heading:6) & ([ACCOUNTS:32]Report_Heading:1=$Report) & (<>SYS_l_CancelProcess#$_l_Process))
										
										vChargesF:=0
										vChargesT:=0
										vAmountF:=0
										vAmountT:=0
										QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
										CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
										INTERSECTION:C121("Master"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
										vAmountT:=vBalance
										INTERSECTION:C121("All Budgets"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
										vChargesT:=vBalance
										INTERSECTION:C121("Extra2"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
										vAmountF:=vBalance
										INTERSECTION:C121("Period Budgets"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
										vChargesF:=vBalance
										vInvF:=vAmountF-vChargesF
										
										
										vInvT:=vAmountT-vChargesT
										vInvoiced:=Calc_Percent(vInvF; vChargesF)
										vPaid:=Calc_Percent(vInvT; vChargesT)
										
										vPTot:=vPTot+vAmountF
										vYTot:=vYTot+vAmountT
										vT1:=vT1+vChargesF
										vT4:=vT4+vChargesT
										
										$_r_PTotG:=$_r_PTotG+vAmountF
										$_r_YTotG:=$_r_YTotG+vAmountT
										$_r_T1G:=$_r_T1G+vChargesF
										$_r_T4G:=$_r_T4G+vChargesT
										
										$RHAmF:=$RHAmF+vAmountF
										$RHAmT:=$RHAmT+vAmountT
										$RHChF:=$RHChF+vChargesF
										$RHChT:=$RHChT+vChargesT
										
										If (ch6=0)
											DB_bo_RecordModified:=True:C214
											If (s1=1)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0) | (vAmountT#0) | (vChargesF#0) | (vChargesT#0) | (vInvF#0) | (vInvT#0))
													Acc_BalPage(2; 1; "PLB_Hdr")
													
													$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Det")
													PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
												End if 
											Else 
												vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0) | (vAmountT#0) | (vChargesF#0) | (vChargesT#0) | (vInvF#0) | (vInvT#0))
													SEND PACKET:C103(vHeading+vFld+String:C10(vChargesF; "|Inverse Accounts")+vFld+String:C10(vAmountF; "|Inverse Accounts")+vFld+String:C10(vInvF; "|Inverse Accounts")+vFld+String:C10(vInvoiced; "|Inverse Accounts")+vFld+String:C10(vChargesT; "|Inverse Accounts")+vFld+String:C10(vAmountT; "|Inverse Accounts")+vFld+String:C10(vInvT; "|Inverse Accounts")+vFld+String:C10(vPaid; "|Inverse Accounts")+vRec)
												End if 
											End if 
										End if 
										
										NEXT RECORD:C51([ACCOUNTS:32])
									End while 
									
									If (ch6=1)
										vAmountF:=$RHAmF
										vAmountT:=$RHAmT
										vChargesF:=$RHChF
										vChargesT:=$RHChT
										vInvF:=vAmountF-vChargesF
										vInvT:=vAmountT-vChargesT
										vInvoiced:=Calc_Percent(vInvF; vChargesF)
										vPaid:=Calc_Percent(vInvT; vChargesT)
										If (s1=1)
											
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Heading")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(1; 2; "PLB_Hdr")
										Else 
											SEND PACKET:C103(vHeading+vFld+String:C10(vChargesF; "|Inverse Accounts")+vFld+String:C10(vAmountF; "|Inverse Accounts")+vFld+String:C10(vInvF; "|Inverse Accounts")+vFld+String:C10(vInvoiced; "|Inverse Accounts")+vFld+String:C10(vChargesT; "|Inverse Accounts")+vFld+String:C10(vAmountT; "|Inverse Accounts")+vFld+String:C10(vInvT; "|Inverse Accounts")+vFld+String:C10(vPaid; "|Inverse Accounts")+vRec)
										End if 
									End if 
									
									If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
										vT2:=vPTot-vT1
										vT5:=vYTot-vT4
										vT3:=Calc_Percent(vT2; vT1)
										vT6:=Calc_Percent(vT5; vT4)
										If (s1=1)
											
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Subtotal")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(2; 2; "PLB_Hdr")
										Else 
											SEND PACKET:C103("   Subtotals"+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vPTot; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vYTot; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vRec+vRec)
										End if 
									End if 
									
								End while 
								
								$_r_PtotT:=$_r_PtotT+$_r_PTotG
								$_r_YtotT:=$_r_YtotT+$_r_YTotG
								$_r_T1T:=$_r_T1T+$_r_T1G
								$_r_T4T:=$_r_T4T+$_r_T4G
								
								vPTot:=$_r_PTotG
								vYTot:=$_r_YTotG
								vT1:=$_r_T1G
								vT4:=$_r_T4G
								vT2:=vPTot-vT1
								vT5:=vYTot-vT4
								vT3:=Calc_Percent(vT2; vT1)
								vT6:=Calc_Percent(vT5; vT4)
								If (s1=1)
									
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Group")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If (ch6=1)
										
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										Acc_BalPage(1+Num:C11(End selection:C36([ACCOUNTS:32])); 3; "PLB_Hdr")
									Else 
										Acc_BalPage(1+Num:C11(End selection:C36([ACCOUNTS:32])); 2; "PLB_Hdr")
									End if 
								Else 
									SEND PACKET:C103(vRec+vGroup+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vPTot; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vYTot; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vRec+vRec)
								End if 
								
							End while 
							
							vPTot:=$_r_PtotT
							vYTot:=$_r_YtotT
							vT1:=$_r_T1T
							vT4:=$_r_T4T
							vT2:=vPTot-vT1
							vT5:=vYTot-vT4
							vT3:=Calc_Percent(vT2; vT1)
							vT6:=Calc_Percent(vT5; vT4)
							If (s1=1)
								If (<>SYS_l_CancelProcess=$_l_Process)
									PAGE BREAK:C6(*)
								Else 
									
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Totals")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									PAGE BREAK:C6
								End if 
								CLOSE WINDOW:C154
								PRT_SetPrinterPaperOptions(Term_NLWT("P&l v Budgets"))
								//NG June 2005
							Else 
								SEND PACKET:C103("NET PROFT/(LOSS)"+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vPTot; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vYTot; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vRec+vRec)
								SET CHANNEL:C77(11)
								OK:=1
							End if 
							
						End if 
						
						
						Close_ProWin
					End if 
				End if 
			End if 
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	End if 
End while 
//Process_End
ERR_MethodTrackerReturn("ACC_BalPLBudget"; $_t_oldMethodName)
