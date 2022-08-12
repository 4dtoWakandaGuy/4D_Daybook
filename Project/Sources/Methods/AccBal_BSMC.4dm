//%attributes = {}
If (False:C215)
	//Project Method Name:      AccBal_BSMC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 12:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AccountCode; 0)
	ARRAY LONGINT:C221($_al_AccountCode2; 0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	ARRAY TEXT:C222($_at_PhantomsChecked; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_CheckPhantom; $_bo_PhantomsCounted; $_bo_Print; $_bo_Query; $1; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_PeriodFromDate; $_d_YearPeriodFromDate; $_d_YearPeriodFromDate2; $_d_YearStartPeriodCode3)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AccountCodeIndex; $_l_AccountCodeRow; $_l_BlankRow; $_l_Index; $_l_Index2; $_l_PhantomAccountRow; $_l_PHantomRow; $_l_PrintHeight; $_l_Process; cABL)
	C_LONGINT:C283(ch6; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin; PRT_l_TopMargin; s1; vAB)
	C_LONGINT:C283(vControl; vStockLevel)
	C_REAL:C285($_r_PhantomAmount; $_r_RHAMountFrom; vAmountF; VPGTOT; VPNTOT; VPTOT; vValueF; VYGTOT; VYNTOT; VYTOT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; $_t_GroupHeading; $_t_oldMethodName; $_t_OutputCurrency; $_t_PhantomProfitString; $_t_ReportHeading; $_t_YearPeriodFrom; $_t_YearPeriodFromCode3; $_t_YearStartPeriodCode; ACC_t_PeriodTo)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode; vFld; vGroup; vHeading; vPeriod; vRec; vStage; vTerms)
	C_TEXT:C284(vText; vTitle; vTitle3; vTitle4)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AccBal_BSMC")
//AccBal_BSMC
$_l_Process:=Current process:C322

//Start_Process
//AccBal File
READ ONLY:C145([ACCOUNT_BALANCES:34])
While (vAB=1)
	$_t_YearPeriodFrom:=ACC_GetYearStart(Current date:C33(*))
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_YearPeriodFrom)
	$_d_YearPeriodFromDate:=[PERIODS:33]From_Date:3
	vTitle:="BALANCE SHEET "
	DB_t_CurrentFormUsage:="BS"
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
			
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
			$_t_YearStartPeriodCode:=ACC_GetYearStart([PERIODS:33]To_Date:4)
			$_d_YearPeriodFromDate2:=[PERIODS:33]From_Date:3
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
			$_t_YearPeriodFromCode3:=ACC_GetYearStart([PERIODS:33]From_Date:3)
			$_d_YearStartPeriodCode3:=[PERIODS:33]To_Date:4
			
			If ($_d_YearPeriodFromDate2<$_d_YearPeriodFromDate)
				//the report is printed for a previous year
				//if that year is not CLOSED..behave as if it is open
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
				$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
				If ($_d_PeriodFromDate<=$_d_YearStartPeriodCode3)
					$_t_YearPeriodFrom:=$_t_YearPeriodFromCode3
				End if 
			End if 
			
			//$Text:=""
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
			FIRST RECORD:C50([PERIODS:33])
			While (Not:C34(End selection:C36([PERIODS:33])))
				If ([PERIODS:33]Profit_Posted:9=False:C215)
					//$Text:=$Text+[PERIODS]Period_Code+"  "
				End if 
				NEXT RECORD:C51([PERIODS:33])
			End while 
			OK:=0
			//If ($Text#"")
			//("The Balance Sheet may not balance because the Profit/Loss"+" has not been full
			//End if
			If (OK=0)
				
				OK:=1
				CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
				ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
				$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
				If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
					vCallCode:=$_t_OutputCurrency
				End if 
				//CurrConv_Ask
				If ($_t_OutputCurrency#"")
					Acc_BalRepTit($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
					USE SET:C118("Master")
					ACC_LoadToArrays($_t_OutputCurrency; (cABL=1); $_t_YearPeriodFrom; ACC_t_PeriodTo)  //NG Modified 21/1/2002
					
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
							//DEFAULT TABLE([ACCOUNTS])
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
								$_t_GroupHeading:=[ACCOUNTS:32]Group_Heading:6
								
								If (s1=1)
									$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalBSHdg")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
								Else 
									$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalBSHdg")
								End if 
								
								If ([HEADINGS:84]Heading_Level:3=vValueF)
									$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1+"@"
								Else 
									$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1
								End if 
								$_r_RHAMountFrom:=0
								
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Report_Heading:1=$_t_ReportHeading) & (<>SYS_l_CancelProcess#$_l_Process))
									
									vAmountF:=0
									
									ARRAY LONGINT:C221($_al_AccountCode; 0)
									ARRAY LONGINT:C221($_al_AccountCode2; 0)
									// QUERY([ACC BALANCES];[ACC BALANCES]Account Code=[ACCOUNTS]Account Code)
									// CREATE SET([ACC BALANCES];"Extra")
									// INTERSECTION("Master";"Extra";"Extra3")
									//USE SET("Extra3")
									ARRAY LONGINT:C221($_al_AccountCode; Size of array:C274(ACC_at_BalAccountCodes))
									ARRAY LONGINT:C221($_al_AccountCode2; Size of array:C274(ACC_at_BalAccountCodes))
									//````
									For ($_l_AccountCodeIndex; 1; Size of array:C274(ACC_at_BalAccountCodes))
										$_l_AccountCodeRow:=Find in array:C230(ACC_at_BalAccountCodes; [ACCOUNTS:32]Account_Code:2; $_l_AccountCodeIndex)
										If ($_l_AccountCodeRow>0)
											$_l_AccountCodeIndex:=$_l_AccountCodeRow
										Else 
											$_l_AccountCodeIndex:=Size of array:C274(ACC_at_BalAccountCodes)
										End if 
										$_bo_CheckPhantom:=True:C214
										
										If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerBroughtforwardACC)  // & (ACC_at_BalPeriodCodes{$_l_AccountCodeIndex}="2001/04")
											$_bo_CheckPhantom:=True:C214
										End if 
										If (ACC_at_BalAccountCodes{$_l_AccountCodeIndex}=[ACCOUNTS:32]Account_Code:2)
											If ([ACCOUNTS:32]PB:4="P")
												If (ACC_at_BalPeriodCodes{$_l_AccountCodeIndex}>=$_t_YearPeriodFrom)
													If (ACC_at_BalPeriodCodes{$_l_AccountCodeIndex}<ACC_t_PeriodTo)
														$_al_AccountCode2{$_l_AccountCodeIndex}:=$_l_AccountCodeIndex
													Else 
														$_al_AccountCode2{$_l_AccountCodeIndex}:=$_l_AccountCodeIndex
													End if 
												End if 
											Else 
												If (ACC_at_BalPeriodCodes{$_l_AccountCodeIndex}#ACC_t_PeriodTo)
													$_al_AccountCode2{$_l_AccountCodeIndex}:=$_l_AccountCodeIndex
												Else 
													$_al_AccountCode2{$_l_AccountCodeIndex}:=$_l_AccountCodeIndex
												End if 
											End if 
											
										End if 
										
									End for 
									SORT ARRAY:C229($_al_AccountCode; <)
									$_l_BlankRow:=Find in array:C230($_al_AccountCode; 0)
									If ($_l_BlankRow>0)
										ARRAY LONGINT:C221($_al_AccountCode; $_l_BlankRow-1)
									End if 
									SORT ARRAY:C229($_al_AccountCode; >)
									SORT ARRAY:C229($_al_AccountCode2; <)
									$_l_BlankRow:=Find in array:C230($_al_AccountCode2; 0)
									If ($_l_BlankRow>0)
										ARRAY LONGINT:C221($_al_AccountCode2; $_l_BlankRow-1)
									End if 
									SORT ARRAY:C229($_al_AccountCode2; >)
									$_r_PhantomAmount:=0
									$_bo_PhantomsCounted:=False:C215
									For ($_l_Index; 1; Size of array:C274($_al_AccountCode2))
										$_l_AccountCodeRow:=$_al_AccountCode2{$_l_Index}
										If ($_l_AccountCodeRow>0)
											VAmountF:=VAmountF+ACC_ar_BalOuptutAccountBalance{$_l_AccountCodeRow}
											If (ACC_at_BalAccountCodes{$_l_AccountCodeRow}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
												$_bo_PhantomsCounted:=True:C214
												//& (False)
												ARRAY TEXT:C222($_at_PhantomsChecked; 0)
												
												For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PHantomRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PHantomRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomAccountRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomAccountRow>0)
															$_r_PhantomAmount:=$_r_PhantomAmount+ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}
														End if 
													End if 
												End for 
												For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PHantomRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PHantomRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomAccountRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomAccountRow>0)
															$_r_PhantomAmount:=$_r_PhantomAmount+ACC_ar_BalOuptutAccountBalance{$_l_PhantomAccountRow}
														End if 
													End if 
												End for 
												
											End if 
										End if 
										//NEXT RECORD([ACC BALANCES])
									End for 
									If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)  //& (False)
										VAmountF:=VAmountF+$_r_PhantomAmount
									End if 
									
									//```
									//Calc_Balance2 ($_t_OutputCurrency;->CUR_at_CurrencyToconvert)
									//vAmountF:=vBalance
									
									vPTot:=vPTot+vAmountF
									vPGTot:=vPGTot+vAmountF
									$_r_RHAMountFrom:=$_r_RHAMountFrom+vAmountF
									
									If (ch6=0)
										DB_bo_RecordModified:=True:C214
										If (s1=1)
											vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Name:3
											If ((ch7=0) | (vAmountF#0))
												Acc_BalPage(2; 1; "BS_Hdr")
												$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Det")
												PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
												
												If ($_bo_CheckPhantom) & (False:C215)
													If ($_r_PhantomAmount#0)
														vAmountF:=$_r_PhantomAmount
														vHeading:=(" "*(((vControl/3)*4)+4))+"Currency Adjustment"+[ACCOUNTS:32]Account_Name:3
														
														vPTot:=vPTot+$_r_PhantomAmount
														vPGTot:=vPGTot+$_r_PhantomAmount
														$_r_RHAMountFrom:=$_r_RHAMountFrom+$_r_PhantomAmount
														Acc_BalPage(2; 1; "BS_Hdr")
														$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "BS_Det")
														PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
														
														
													End if 
												End if 
											End if 
										Else 
											vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Name:3
											If ((ch7=0) | (vAmountF#0))
												SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Accounts")+vRec)
												If ($_bo_CheckPhantom) & (False:C215)
													If ($_r_PhantomAmount#0)
														vAmountF:=$_r_PhantomAmount
														vHeading:=(" "*(((vControl/3)*4)+4))+"Currency Adjustment"+[ACCOUNTS:32]Account_Name:3
														
														vPTot:=vPTot+$_r_PhantomAmount
														vPGTot:=vPGTot+$_r_PhantomAmount
														$_r_RHAMountFrom:=$_r_RHAMountFrom+$_r_PhantomAmount
														SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Accounts")+vRec)
													End if 
												End if 
											End if 
										End if 
									End if 
									
									NEXT RECORD:C51([ACCOUNTS:32])
								End while 
								
								If (ch6=1)
									vAmountF:=$_r_RHAMountFrom
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
								
								If ($_t_GroupHeading#[ACCOUNTS:32]Group_Heading:6)
									If ([ACCOUNTS:32]Group_Heading:6="GB1")
										vYGTot:=vPGTot
										vPNTot:=0
										$_bo_Print:=False:C215
									Else 
										If ([ACCOUNTS:32]Group_Heading:6="GB2")
											vPNTot:=vPGTot
											$_bo_Print:=True:C214
										Else 
											If ([ACCOUNTS:32]Group_Heading:6="GB3")
												vPNTot:=vPGTot+vYGTot+vPNTot
												$_bo_Print:=True:C214
											Else 
												vPNTot:=vPGTot
												$_bo_Print:=True:C214
											End if 
										End if 
									End if 
									vPGTot:=0
									If ($_bo_Print)
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
								//CLOSE WINDOW
								
								PRT_SetPrinterPaperOptions("Balance Sheet")
								//NG June 2005
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
ERR_MethodTrackerReturn("AccBal_BSMC"; $_t_oldMethodName)
