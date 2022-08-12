//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalBS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vControl)
	//C_UNKNOWN(vStockLevel)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_print; ACC_bo_RunOld; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_PrintHeight; $_l_Process; ch6; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin)
	C_LONGINT:C283(PRT_l_TopMargin)
	C_REAL:C285($RHAmF; vAmountF; vBalance; VPGTOT; VPNTOT; VPTOT; vValueF; VYGTOT; VYNTOT; VYTOT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_OutputCurrency; $_t_Text; $Group; $Report; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode)
	C_TEXT:C284(vFld; vGroup; vHeading; vPeriod; vRec; vStage; vTerms; vText; vTitle; vTitle3; vTitle4)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalBS")
//Acc_BalBS

If (False:C215) | (ACC_bo_RunOld)
	ACC_bo_RunOld:=False:C215
	//AccBal TB
	$_l_Process:=Current process:C322
	
	Start_Process
	ACC_BalFile
	READ ONLY:C145([ACCOUNT_BALANCES:34])
	While (vAB=1)
		// 03/04/03 pb
		vTitle:="BALANCE SHEET "
		DB_t_CurrentFormUsage:="BS"
		ACC_BalSelect
		If (vAB=1)
			If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
				$_t_Text:=""
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
				ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; >)
				
				FIRST RECORD:C50([PERIODS:33])
				While (Not:C34(End selection:C36([PERIODS:33])))
					If ([PERIODS:33]Profit_Posted:9=False:C215)
						$_t_Text:=$_t_Text+[PERIODS:33]Period_Code:1+"  "
					End if 
					NEXT RECORD:C51([PERIODS:33])
				End while 
				OK:=0
				If ($_t_Text#"")
					Gen_Confirm("The Balance Sheet may not balance because the Profit/Loss"+" has not been fully posted for the Period(s):"+Char:C90(13)+Char:C90(13)+$_t_Text; "Cancel"; "Continue")
				End if 
				If (OK=0)
					
					OK:=1
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
					ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
					$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
					If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
						vCallCode:=$_t_OutputCurrency
					End if 
					//CurrConv_Ask
					If (OK=1)
						Acc_BalRepTit
						USE SET:C118("Master")
						vPeriod:=ACC_t_PeriodTo
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
						vTitle:="BALANCE SHEET "+[PERIODS:33]Period_Name:2
						vPGTot:=0
						vYGTot:=0
						
						If (Not:C34(SR_ReportOK("AccBalBS")))
							Acc_BalRepPS("Balance Sheet")
							
							If (OK=1)
								If (s1=1)
									GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
									GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
								End if 
								
								Accounts_LaySrc(vText)
								QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B")
								Accounts_ZeroSr
								ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1; >; [ACCOUNTS:32]Account_Code:2; >)
								
								If (s1=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr"; 200)
									PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Hdr")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If (ch6=1)
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										i:=i+1
									End if 
								Else 
									SEND PACKET:C103(vTitle+vRec+vRec+String:C10(<>DB_d_CurrentDate)+vFld+String:C10(<>CTime; 2)+vRec+vRec)
									SEND PACKET:C103(vTitle4+vFld+vFld+vFld+vTitle3+vRec+vRec)
									SEND PACKET:C103(vFld+vPeriod+vRec+vRec)
								End if 
								
								vPNTot:=0
								vStockLevel:=1
								vStage:=""
								
								FIRST RECORD:C50([ACCOUNTS:32])
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (<>SYS_l_CancelProcess#$_l_Process))
									
									RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
									vGroup:=Uppercase:C13([HEADINGS:84]Heading_Name:2)
									$Group:=[ACCOUNTS:32]Group_Heading:6
									If (s1=1)
										$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalBSHdg")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									Else 
										$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalBSHdg")
									End if 
									
									If ([HEADINGS:84]Heading_Level:3=vValueF)
										$Report:=[ACCOUNTS:32]Report_Heading:1+"@"
									Else 
										$Report:=[ACCOUNTS:32]Report_Heading:1
									End if 
									$RHAmF:=0
									
									While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Report_Heading:1=$Report) & (<>SYS_l_CancelProcess#$_l_Process))
										
										vAmountF:=0
										QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
										CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
										INTERSECTION:C121("Master"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
										vAmountF:=vBalance
										
										vPTot:=vPTot+vAmountF
										vPGTot:=vPGTot+vAmountF
										$RHAmF:=$RHAmF+vAmountF
										
										If (ch6=0)
											DB_bo_RecordModified:=True:C214
											If (s1=1)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0))
													Acc_BalPage(2; 1; "BS_Hdr")
													$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Det")
													PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
													
												End if 
											Else 
												vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0))
													SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Accounts")+vRec)
												End if 
											End if 
										End if 
										
										NEXT RECORD:C51([ACCOUNTS:32])
									End while 
									
									If (ch6=1)
										vAmountF:=$RHAmF
										If (s1=1)
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Heading")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(1; 2; "BS_Hdr")
										Else 
											SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Accounts")+vRec)
										End if 
									End if 
									
									If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
										If (s1=1)
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Subtotal")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(2; 2; "BS_Hdr")
										Else 
											SEND PACKET:C103("   Subtotal"+vFld+String:C10(vPTot; "|Accounts")+vRec+vRec)
										End if 
										vStockLevel:=1
										vStage:=""
									End if 
									
									If ($Group#[ACCOUNTS:32]Group_Heading:6)
										If ([ACCOUNTS:32]Group_Heading:6="GB1")
											vYGTot:=vPGTot
											vPNTot:=0
											$_bo_print:=False:C215
										Else 
											If ([ACCOUNTS:32]Group_Heading:6="GB2")
												vPNTot:=vPGTot
												$_bo_print:=True:C214
											Else 
												If ([ACCOUNTS:32]Group_Heading:6="GB3")
													vPNTot:=vPGTot+vYGTot+vPNTot
													$_bo_print:=True:C214
												Else 
													vPNTot:=vPGTot
													$_bo_print:=True:C214
												End if 
											End if 
										End if 
										vPGTot:=0
										If ($_bo_print)
											If (s1=1)
												$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Totals")
												PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
												If (Not:C34(End selection:C36([ACCOUNTS:32])))
													Acc_BalPage(1; 2; "BS_Hdr")
												End if 
											Else 
												SEND PACKET:C103(vGroup+vFld+vFld+String:C10(vPNTot; "|Accounts")+vRec)
												OK:=1
											End if 
										End if 
									End if 
									
								End while 
								
								If (s1=1)
									If (<>SYS_l_CancelProcess=$_l_Process)
										PAGE BREAK:C6(*)
									Else 
										PAGE BREAK:C6
									End if 
								Else 
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
	Process_End
Else 
	AccBal_BSMC
	
	
End if 
ERR_MethodTrackerReturn("Acc_BalBS"; $_t_oldMethodName)
