//%attributes = {}
If (False:C215)
	//Project Method Name:      AccBal_PL
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
	//C_UNKNOWN(cABL)
	//C_UNKNOWN(ch7)
	//C_UNKNOWN(i)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(v31)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vAmountF)
	//C_UNKNOWN(vAmountT)
	//C_UNKNOWN(vBalance)
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vControl)
	//C_UNKNOWN(vFld)
	//C_UNKNOWN(vGroup)
	//C_UNKNOWN(vHeading)
	//C_UNKNOWN(vPeriod)
	//C_UNKNOWN(vPGTot)
	//C_UNKNOWN(vPNTot)
	//C_UNKNOWN(vPTot)
	//C_UNKNOWN(vRec)
	//C_UNKNOWN(vStage)
	//C_UNKNOWN(vStockLevel)
	//C_UNKNOWN(vT1)
	//C_UNKNOWN(vT2)
	//C_UNKNOWN(vTerms)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(vTitle)
	//C_UNKNOWN(vTitle2)
	//C_UNKNOWN(vTitle3)
	//C_UNKNOWN(vTitle4)
	//C_UNKNOWN(vValueF)
	//C_UNKNOWN(vYGTot)
	//C_UNKNOWN(vYTot)
	ARRAY LONGINT:C221($_al_AccountCodes; 0)
	ARRAY LONGINT:C221($_al_AccountCodes2; 0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	ARRAY TEXT:C222($_at_PhantomsChecked; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_CheckPhantom; $_bo_MultiCurrency; $_bo_PhantomsCounted; $_bo_Query; $_bo_RecordChange; $1; DB_bo_RecordModified; $_bo_CheckPhantom; $_bo_MultiCurrency; $_bo_PhantomsCounted; $_bo_Query)
	C_BOOLEAN:C305($_bo_RecordChange; $1; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateFrom; $_d_YearPeriodsFrom; $_d_YearPeriodsFromDate2; $_d_YearPeriodsToDate3; <>DB_d_CurrentDate; $_d_DateFrom; $_d_YearPeriodsFrom; $_d_YearPeriodsFromDate2; $_d_YearPeriodsToDate3)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AccountRecords; $_l_AccountRow2; $_l_CurrentAccountRecord; $_l_CurrentProcess; $_l_Elements; $_l_Index; $_l_index2; $_l_LastAccountRow; $_l_PhantomCheckedPos; $_l_PhantomPosition)
	C_LONGINT:C283($_l_PrintHeight; cABL; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin; PRT_l_TopMargin; s1)
	C_LONGINT:C283(vAB; vControl; vStockLevel; <>SYS_l_CancelProcess; $_l_AccountRecords; $_l_AccountRow2; $_l_CurrentAccountRecord; $_l_CurrentProcess; $_l_Elements; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_LastAccountRow; $_l_PhantomCheckedPos; $_l_PhantomPosition; $_l_PrintHeight; ch6; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin; PRT_l_TopMargin)
	C_LONGINT:C283(vNo1)
	C_REAL:C285($_r_DifferenceAmount; $_r_DifferenceAmount2; $_r_PGTotal; $_r_PhantomAmount; $_r_PhantomAmountFrom; $_r_PhantomAmountTo; $_r_ProfiitCountFrom; $_r_ProfiitCountTo; $_r_RHAmountF; $_r_RHAmountT; $_r_V0)
	C_REAL:C285($_r_V31; $_r_YGTotal; v31; vAmountF; vAmountT; vBalance; vPGTot; vPNTot; vPTot; vT1; vT2)
	C_REAL:C285(vValueF; vYGTot; vYTot; $_r_DifferenceAmount; $_r_DifferenceAmount2; $_r_PGTotal; $_r_PhantomAmount; $_r_PhantomAmountFrom; $_r_PhantomAmountTo; $_r_ProfiitCountFrom; $_r_ProfiitCountTo)
	C_REAL:C285($_r_RHAmountF; $_r_RHAmountT; $_r_V0; $_r_V31; $_r_YGTotal; v0; vYNTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_GroupCode; $_t_oldMethodName; $_t_OutputCurrency; $_t_PhantomProfitString; $_t_ReportHeading; $_t_YearPeriodsFrom; $_t_YearPeriodsFrom2; $_t_YearPeriodsTo3; ACC_t_PeriodFrom; ACC_t_PeriodTo)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage3; vCallCode; vFld; vGroup; vHeading; vPeriod; vRec; vStage; vTerms; vText)
	C_TEXT:C284(vTitle; vTitle2; vTitle3; vTitle4; <>SYS_t_BaseCurrency; <>YrPerF; $_t_GroupCode; $_t_oldMethodName; $_t_OutputCurrency; $_t_PhantomProfitString; $_t_ReportHeading)
	C_TEXT:C284($_t_YearPeriodsFrom; $_t_YearPeriodsFrom2; $_t_YearPeriodsTo3; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; vTitle1)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AccBal_PL")
//AccBal_PL - see also ACC_BalPL12

$_l_CurrentProcess:=Current process:C322
$_bo_MultiCurrency:=False:C215  //THIS WILL GET SET TO TRUE IF THERE IS A CONVERSION

//Start_Process
//`AccBal File

READ ONLY:C145([ACCOUNT_BALANCES:34])
While (vAB=1)
	//IDLE  ` 03/04/03 pb
	vTitle:=Uppercase:C13(Term_NLWT("PROFIT & LOSS "))
	DB_t_CurrentFormUsage:="P&L"
	If (Count parameters:C259>=1)
		$_bo_Query:=$1
	Else 
		$_bo_Query:=True:C214
	End if 
	If ($_bo_Query)
		ACC_BalSelect
	End if 
	$_t_YearPeriodsFrom:=ACC_GetYearStart(Current date:C33(*))
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_YearPeriodsFrom)
	$_d_YearPeriodsFrom:=[PERIODS:33]From_Date:3
	
	
	
	
	
	
	
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
			$_t_YearPeriodsFrom2:=ACC_GetYearStart([PERIODS:33]To_Date:4)
			$_d_YearPeriodsFromDate2:=[PERIODS:33]From_Date:3
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
			$_t_YearPeriodsTo3:=ACC_GetYearStart([PERIODS:33]From_Date:3)
			$_d_YearPeriodsToDate3:=[PERIODS:33]To_Date:4
			
			If ($_d_YearPeriodsFromDate2<$_d_YearPeriodsFrom)
				//the report is printed for a previous year
				//if that year is not CLOSED..behave as if it is open
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
				$_d_DateFrom:=[PERIODS:33]From_Date:3
				If ($_d_DateFrom<=$_d_YearPeriodsToDate3)
					$_t_YearPeriodsFrom:=$_t_YearPeriodsTo3
				End if 
			End if 
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			If (ACC_t_CurrencyCode#<>SYS_t_BaseCurrency)
				$_bo_MultiCurrency:=True:C214  //profit is converted
				
			End if 
			
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
			If ($_t_OutputCurrency#"")
				If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
					vCallCode:=$_t_OutputCurrency
				End if 
				
				//CurrConv_Ask
				If (OK=1)
					Acc_BalRepTit($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
					USE SET:C118("Master")
					ACC_LoadToArrays($_t_OutputCurrency; (cABL=1); $_t_YearPeriodsFrom; ACC_t_PeriodTo)  //NG Modified 2/3/2005
					
					
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_t_PeriodTo)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra2")
					vPeriod:=ACC_t_PeriodTo
					vTitle1:=ACC_t_PeriodTo
					vTitle2:=ACC_t_PeriodFrom+"-"+ACC_t_PeriodTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
					vTitle:=Uppercase:C13(Term_NLWT("PROFIT & LOSS "))+[PERIODS:33]Period_Name:2
					vNo1:=0
					vT1:=0
					vT2:=0
					vPNTot:=0
					vYNTot:=0
					vPTot:=0
					vYTot:=0
					
					If (Not:C34(SR_ReportOK("AccBalPL")))
						Acc_BalRepPS(Term_NLWT("Profit & Loss"))
						
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
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Detail"; Form header:K43:3; Form detail:K43:1)
								
								PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
								If (ch6=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									i:=i+1
								End if 
							Else 
								SEND PACKET:C103(vTitle+vRec+vRec+String:C10(<>DB_d_CurrentDate)+vFld+String:C10(<>CTime; 2)+vRec+vRec)
								SEND PACKET:C103(vTitle4+vFld+vFld+vFld+vTitle3+vRec+vRec)
								SEND PACKET:C103(vFld+vTitle1+vFld+vFld+vTitle2+vRec+vRec)
							End if 
							COPY NAMED SELECTION:C331([ACCOUNTS:32]; "ToReport")
							$_l_AccountRecords:=Records in selection:C76([ACCOUNTS:32])
							$_l_CurrentAccountRecord:=0
							
							FIRST RECORD:C50([ACCOUNTS:32])
							//SELECTION TO ARRAY([ACCOUNTS]Account Code
							While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
								RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
								vGroup:=Uppercase:C13([HEADINGS:84]Heading_Name:2)
								$_t_GroupCode:=[ACCOUNTS:32]Group_Heading:6
								DB_bo_RecordModified:=False:C215
								vPGTot:=0
								vYGTot:=0
								vStockLevel:=1
								vStage:=""
								//FIRST RECORD(ACCOUNTS])
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($_t_GroupCode=[ACCOUNTS:32]Group_Heading:6) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
									$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalPLHdg")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									
									If ([HEADINGS:84]Heading_Level:3=vValueF)
										$_t_ReportHeading:=[HEADINGS:84]Heading_Code:1+"@"
									Else 
										$_t_ReportHeading:=[HEADINGS:84]Heading_Code:1
									End if 
									$_r_RHAmountF:=0
									$_r_RHAmountT:=0
									$_bo_RecordChange:=False:C215
									//FIRST RECORD(ACCOUNTS])
									
									While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($_t_GroupCode=[ACCOUNTS:32]Group_Heading:6) & ([ACCOUNTS:32]Report_Heading:1=$_t_ReportHeading) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
										vAmountF:=0
										vAmountT:=0
										QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
										CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
										INTERSECTION:C121("Master"; "Extra"; "Extra3")
										USE SET:C118("Extra3")
										If (True:C214)
											ARRAY LONGINT:C221($_al_AccountCodes; 0)
											ARRAY LONGINT:C221($_al_AccountCodes2; 0)
											ARRAY LONGINT:C221($_al_AccountCodes; Size of array:C274(ACC_at_BalAccountCodes))
											ARRAY LONGINT:C221($_al_AccountCodes2; Size of array:C274(ACC_at_BalAccountCodes))
											//````
											For ($_l_Elements; 1; Size of array:C274(ACC_at_BalAccountCodes))
												$_l_AccountRow2:=Find in array:C230(ACC_at_BalAccountCodes; [ACCOUNTS:32]Account_Code:2; $_l_Elements)
												If ($_l_AccountRow2>0)
													$_l_Elements:=$_l_AccountRow2
												Else 
													$_l_Elements:=Size of array:C274(ACC_at_BalAccountCodes)+1
												End if 
												$_bo_CheckPhantom:=True:C214
												
												If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerBroughtforwardACC)  // & (ACC_at_BalPeriodCodes{$_l_Elements}="2001/04")
													
													//
													$_bo_CheckPhantom:=True:C214
												End if 
												If ($_l_Elements<=Size of array:C274(ACC_at_BalAccountCodes))
													If (ACC_at_BalAccountCodes{$_l_Elements}=[ACCOUNTS:32]Account_Code:2)
														If ([ACCOUNTS:32]PB:4="P")
															If (ACC_at_BalPeriodCodes{$_l_Elements}<ACC_t_PeriodTo)
																$_al_AccountCodes2{$_l_Elements}:=$_l_Elements
															Else 
																$_al_AccountCodes2{$_l_Elements}:=$_l_Elements
																$_al_AccountCodes{$_l_Elements}:=$_l_Elements
															End if 
														Else 
															If (ACC_at_BalPeriodCodes{$_l_Elements}=ACC_t_PeriodTo)
																$_al_AccountCodes{$_l_Elements}:=$_l_Elements
																$_al_AccountCodes2{$_l_Elements}:=$_l_Elements
															Else 
																$_al_AccountCodes2{$_l_Elements}:=$_l_Elements
															End if 
														End if 
													End if 
													
												End if 
												
											End for 
											SORT ARRAY:C229($_al_AccountCodes; <)
											$_l_LastAccountRow:=Find in array:C230($_al_AccountCodes; 0)
											If ($_l_LastAccountRow>0)
												ARRAY LONGINT:C221($_al_AccountCodes; $_l_LastAccountRow-1)
											End if 
											SORT ARRAY:C229($_al_AccountCodes; >)
											SORT ARRAY:C229($_al_AccountCodes2; <)
											$_l_LastAccountRow:=Find in array:C230($_al_AccountCodes2; 0)
											If ($_l_LastAccountRow>0)
												ARRAY LONGINT:C221($_al_AccountCodes2; $_l_LastAccountRow-1)
											End if 
											SORT ARRAY:C229($_al_AccountCodes2; >)
											$_r_PhantomAmount:=0
											$_bo_PhantomsCounted:=False:C215
											For ($_l_Index; 1; Size of array:C274($_al_AccountCodes2))  // Periods before the  to period--go in the T
												
												$_l_AccountRow2:=$_al_AccountCodes2{$_l_Index}
												If ($_l_AccountRow2>0)
													VAmountT:=VAmountT+ACC_ar_BalOuptutAccountBalance{$_l_AccountRow2}
													If (ACC_at_BalAccountCodes{$_l_AccountRow2}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
														$_bo_PhantomsCounted:=True:C214
														//& (False)
														ARRAY TEXT:C222($_at_PhantomsChecked; 0)
														For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
															$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
															$_l_AccountRow2:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
															If ($_l_AccountRow2<0)
																INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
																$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
																$_l_PhantomPosition:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
																If ($_l_PhantomPosition>0)
																	$_r_PhantomAmount:=$_r_PhantomAmount+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition}
																End if 
															End if 
														End for 
													End if 
												End if 
												//NEXT RECORD([ACC BALANCES])
											End for 
											If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)  //& (False)
												
												VAmountT:=VAmountT+$_r_PhantomAmount
											End if 
											For ($_l_Index; 1; Size of array:C274($_al_AccountCodes))  // the to current period--go in the T
												
												$_l_AccountRow2:=$_al_AccountCodes{$_l_Index}
												If ($_l_AccountRow2>0)
													VAmountF:=VAmountF+ACC_ar_BalOuptutAccountBalance{$_l_AccountRow2}
													If (ACC_at_BalAccountCodes{$_l_AccountRow2}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
														$_bo_PhantomsCounted:=True:C214
														//& (False)
														ARRAY TEXT:C222($_at_PhantomsChecked; 0)
														For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
															$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
															$_l_AccountRow2:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
															If ($_l_AccountRow2<0)
																INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
																$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
																$_l_PhantomPosition:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
																If ($_l_PhantomPosition>0)
																	$_r_PhantomAmount:=$_r_PhantomAmount+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition}
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
										End if 
										
										//``````
										If (False:C215)
											Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
											vAmountT:=vBalance
											INTERSECTION:C121("Extra2"; "Extra"; "Extra3")
											USE SET:C118("Extra3")
											Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
											vAmountF:=vBalance
										End if 
										
										vPTot:=vPTot+vAmountF
										vYTot:=vYTot+vAmountT
										vPGTot:=vPGTot+vAmountF
										vYGTot:=vYGTot+vAmountT
										$_r_RHAmountF:=$_r_RHAmountF+vAmountF
										$_r_RHAmountT:=$_r_RHAmountT+vAmountT
										
										If (ch6=0)
											DB_bo_RecordModified:=True:C214
											If (s1=1)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0) | (vAmountT#0))
													
													Acc_BalPage(2; 1; "PL_Detail"; Form header:K43:3)
													
													$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Detail")
													PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
													
												End if 
											Else 
												vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vAmountF#0) | (vAmountT#0))
													SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Inverse Accounts")+vFld+vFld+String:C10(vAmountT; "|Inverse Accounts")+vRec)
												End if 
											End if 
										End if 
										$_bo_RecordChange:=True:C214
										NEXT RECORD:C51([ACCOUNTS:32])
									End while 
									
									If (ch6=1)
										vAmountF:=$_r_RHAmountF
										vAmountT:=$_r_RHAmountT
										If (s1=1)
											
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Heading")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(1; 2; "PL_Detail"; Form header:K43:3)
											
										Else 
											SEND PACKET:C103(vHeading+vFld+String:C10(vAmountF; "|Inverse Accounts")+vFld+vFld+String:C10(vAmountT; "|Inverse Accounts")+vRec)
										End if 
									End if 
									
									If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
										If (s1=1)
											
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Subtotal")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage(2; 2; "PL_Detail"; Form header:K43:3)
											
										Else 
											SEND PACKET:C103(vFld+vFld+String:C10(vPTot; "|Inverse Accounts")+vFld+vFld+String:C10(vYTot; "|Inverse Accounts")+vRec+vRec)
										End if 
									End if 
									
									If ((vNo1=0) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
										vT1:=vPTot
										vT2:=vYTot
										vNo1:=1
									End if 
									If ($_bo_RecordChange=False:C215)
										NEXT RECORD:C51([ACCOUNTS:32])
										
									End if 
								End while 
								
								vPNTot:=vPNTot+vPGTot
								vYNTot:=vYNTot+vYGTot
								v0:=Round:C94(((vPGTot/vT1)*100); 2)
								v31:=Round:C94(((vYGTot/vT2)*100); 2)
								
								If (s1=1)
									
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Group")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If (ch6=1)
										
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										Acc_BalPage(1+Num:C11(End selection:C36([ACCOUNTS:32])); 3; "PL_Detail"; Form header:K43:3)
										
									Else 
										Acc_BalPage(1+Num:C11(End selection:C36([ACCOUNTS:32])); 2; "PL_Detail"; Form header:K43:3)
										
									End if 
								Else 
									SEND PACKET:C103(vRec+vGroup+vFld+vFld+String:C10(vPGTot; "|Inverse Accounts")+vFld+vFld+String:C10(vYGTot; "|Inverse Accounts")+vRec+vRec)
								End if 
								
							End while 
							
							v0:=Round:C94(((vPNTot/vT1)*100); 2)
							v31:=Round:C94(((vYNTot/vT2)*100); 2)
							If (s1=1)
								If (<>SYS_l_CancelProcess=$_l_CurrentProcess)
									PAGE BREAK:C6(*)
								Else 
									If ($_bo_MultiCurrency)
										
										//the Profit in v0 is the sum of the profit accounts...this is NOT the calculated profit
										//which is based on the sum of BALANCE sheet amounts...and it maybe converted at a different rate
										//So HERE we have to extract the profit amounts from the arrays and COMPARE that to v0..if there is a difference then modify the profit
										//AND include an extra line to display the currency fluctuation.
										$_bo_PhantomsCounted:=False:C215
										$_r_PhantomAmountFrom:=0
										$_r_PhantomAmountTo:=0
										$_r_ProfiitCountFrom:=0
										$_r_ProfiitCountTo:=0
										
										For ($_l_Index; 1; Size of array:C274(ACC_at_BalAccountCodes))  // Periods before the  to period--go in the T
											If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)  //| (ACC_at_BalAccountCodes{$_l_Index}="-"-◊ProfAcc) | (ACC_at_BalAccountCodes{$_l_Index}="-"+◊ProfBFWD)
												
												
												If (ACC_at_BalPeriodCodes{$_l_Index}<ACC_t_PeriodTo)
													$_r_ProfiitCountFrom:=$_r_ProfiitCountFrom+ACC_ar_BalOuptutAccountBalance{$_l_Index}
												Else 
													$_r_ProfiitCountTo:=$_r_ProfiitCountTo+ACC_ar_BalOuptutAccountBalance{$_l_Index}
												End if 
												
												If ((ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)) & ($_bo_PhantomsCounted=False:C215)
													ARRAY TEXT:C222($_at_PhantomsChecked; 0)
													For ($_l_index2; $_l_Index; Size of array:C274(ACC_at_BalAnalysisCodes))
														If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC)
															$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
														Else 
															$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
														End if 
														$_l_PhantomCheckedPos:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
														If ($_l_PhantomCheckedPos<0)
															INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
															$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
															$_l_PhantomPosition:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
															If ($_l_PhantomPosition>0)
																If (ACC_at_BalPeriodCodes{$_l_index2}<ACC_t_PeriodTo)
																	$_r_PhantomAmountFrom:=$_r_PhantomAmountFrom+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition}
																Else 
																	$_r_PhantomAmountTo:=$_r_PhantomAmountTo+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition}
																End if 
															End if 
															
														Else 
															$_l_index2:=Size of array:C274(ACC_at_BalAccountCodes)
														End if 
													End for 
												End if 
											End if 
											
										End for 
										
										
										
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Totals")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										
										If ((($_r_ProfiitCountFrom+$_r_PhantomAmountFrom)#vYNTot) | (($_r_ProfiitCountTo+$_r_PhantomAmountTo)#vPNTot)) & (False:C215)
											
											
											$_r_DifferenceAmount:=($_r_ProfiitCountFrom+$_r_PhantomAmountFrom)-vYNTot
											$_r_DifferenceAmount2:=($_r_ProfiitCountTo+$_r_PhantomAmountTo)-vPNTot
											vYNTot:=($_r_ProfiitCountFrom+$_r_PhantomAmountFrom)
											vPNTot:=($_r_ProfiitCountTo+$_r_PhantomAmountTo)
											//Here print the line with the difference on.
											VGroup:="Currency Fluctuation"
											$_r_PGTotal:=vPGTot
											$_r_YGTotal:=vYGTot
											$_r_V0:=v0
											$_r_V31:=v31
											vPGTot:=0
											vYGTot:=$_r_DifferenceAmount
											vPGTot:=$_r_DifferenceAmount2
											v0:=0
											v31:=0
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Group")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											
											vPGTot:=$_r_PGTotal
											vYGTot:=$_r_YGTotal
											
										End if 
										
										PAGE BREAK:C6
									Else 
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Totals")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										PAGE BREAK:C6
									End if 
									CLOSE WINDOW:C154
									PRT_SetPrinterPaperOptions(Term_NLWT("Profit & Loss"))
									//NG June 2005
								End if 
							Else 
								SEND PACKET:C103("NET PROFT/(LOSS)"+vFld+vFld+String:C10(vPNTot; "|Inverse Accounts")+vFld+vFld+String:C10(vYNTot; "|Inverse Accounts")+vRec)
								SET CHANNEL:C77(11)
								OK:=1
							End if 
							
						End if 
						
						Close_ProWin
					End if 
					If (<>SYS_l_CancelProcess#$_l_CurrentProcess)
						Acc_BalPL2
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
ERR_MethodTrackerReturn("AccBal_PL"; $_t_oldMethodName)
