//%attributes = {}

If (False:C215)
	//Project Method Name:      AccBAL_TBMC
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
	ARRAY LONGINT:C221($_al_AccountCodes; 0)
	ARRAY LONGINT:C221($_al_AccountCodes2; 0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	ARRAY TEXT:C222($_at_PeriodtoCodes; 0)
	ARRAY TEXT:C222($_at_PhantomsChecked; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_CheckPhantom; $_bo_PhantomsCounted; $_bo_Query; $1; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_PeriodFromDate; $_d_YearPeriodFromDate; $_d_YearPeriodFromDate2; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AccountCodeRow; $_l_ElementsIndex; $_l_Index; $_l_Index2; $_l_PeriodID; $_l_PhantomCheckRow; $_l_PhantomRow; $_l_PrintHeight; $_l_Process; cABL)
	C_LONGINT:C283(ch6; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin; PRT_l_TopMargin; s1; vAB)
	C_LONGINT:C283(vControl; vStockLevel)
	C_REAL:C285($_r_Hamount; $_r_HamountF; $_r_HamountT; $_r_PhantomAmountF; $_r_PhantomAmountT; vAmount; vAmountF; vAmountT; vANTot; vATot; vPNTot)
	C_REAL:C285(vPTot; vValueF; vYNTot; vYTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; $_t_oldMethodName; $_t_OutputCurrency; $_t_PhantomProfitString; $_t_ReportHeading; $_t_YearPeriodFrom; $_t_YearPeriodFrom2; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage)
	C_TEXT:C284(vCallCode; vFld; vHeading; vRec; vStage; vTerms; vText; vTitle; vTitle1; vTitle2; vTitle3)
	C_TEXT:C284(vTitle4; vTitle5)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AccBAL_TBMC")

//a rewrite of the trial balance to handle multicurrency correctly
//AccBal TB
$_t_oldMethodName:=ERR_MethodTracker("AccBAL_TBMC")
$_l_Process:=Current process:C322
$_t_YearPeriodFrom:=ACC_GetYearStart(Current date:C33(*))
QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_YearPeriodFrom)
$_d_YearPeriodFromDate:=[PERIODS:33]From_Date:3
//Start_Process
//AccBal File
//READ ONLY

While (vAB=1)
	vTitle:="TRIAL BALANCE "
	DB_t_CurrentFormUsage:="TB"
	vCallCode:=""
	If (Count parameters:C259>=1)
		$_bo_Query:=$1
	Else 
		$_bo_Query:=True:C214
	End if 
	If ($_bo_Query)
		ACC_BalSelect
	Else 
		//TRACE
		SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Period_Code:4; $_at_PeriodtoCodes)
		SORT ARRAY:C229($_at_PeriodtoCodes; <)
		
		ACC_t_PeriodTo:=$_at_PeriodtoCodes{1}
	End if 
	
	
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
			If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
				vCallCode:=$_t_OutputCurrency
			End if 
			
			If ($_t_OutputCurrency#"")
				Acc_BalRepTit($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
				
				$_d_YearPeriodFromDate2:=[PERIODS:33]From_Date:3
				$_t_YearPeriodFrom2:=ACC_GetYearStart([PERIODS:33]To_Date:4)
				If ($_d_YearPeriodFromDate2<$_d_YearPeriodFromDate)
					//the report is printed for a previous year
					//if that year is not CLOSED..behave as if it is open
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
					$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
					If ($_d_PeriodFromDate<=$_d_YearPeriodFromDate2)
						$_t_YearPeriodFrom:=$_t_YearPeriodFrom2
					End if 
				End if 
				
				USE SET:C118("Master")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=$_t_YearPeriodFrom)
				CREATE SET:C116([ACCOUNT_BALANCES:34]; "Year")
				QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_t_PeriodTo)
				CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra2")
				DIFFERENCE:C122("Year"; "Extra2"; "Year")
				DIFFERENCE:C122("Master"; "Extra2"; "Master")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
				vTitle2:=ACC_t_PeriodTo
				
				
				vTitle:="TRIAL BALANCE "+[PERIODS:33]Period_Name:2
				vDate:=[PERIODS:33]From_Date:3-1
				$_l_PeriodID:=Check_Period
				vTitle1:=ACC_t_PeriodFrom+" to "+[PERIODS:33]Period_Code:1
				vTitle5:=ACC_t_PeriodFrom+" to "+ACC_t_PeriodTo
				USE SET:C118("Master")
				UNION:C120("Master"; "Extra2"; "ALL")
				USE SET:C118("ALL")
				ACC_LoadToArrays($_t_OutputCurrency; (cABL=1); $_t_YearPeriodFrom; ACC_t_PeriodTo)  //NG Modified 21/1/2002
				
				CLEAR SET:C117("ALL")
				If (Not:C34(SR_ReportOK("AccBalTB")))
					Acc_BalRepPS("Trial Balance")
					
					If (OK=1)
						If (s1=1)
							GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
							GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
						End if 
						
						
						Accounts_LaySrc(vText)
						QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
						Accounts_ZeroSr
						ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1; >; [ACCOUNTS:32]Account_Code:2; >)
						
						If (s1=1)
							$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr"; 200)
							PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
							
							$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Header")
							PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
							If (ch6=1)
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap")
								PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
								
								i:=i+1
							End if 
						Else 
							SEND PACKET:C103(vTitle+vRec+vRec+String:C10(<>DB_d_CurrentDate)+vFld+String:C10(<>CTime; 2)+vRec+vRec)
							SEND PACKET:C103(vTitle4+vFld+vFld+vFld+vTitle3+vRec+vRec)
							SEND PACKET:C103(vFld+vTitle1+vFld+vTitle2+vFld+vTitle5+vRec+vRec)
						End if 
						
						vPNTot:=0
						vYNTot:=0
						vANTot:=0
						vStockLevel:=1
						vStage:=""
						
						FIRST RECORD:C50([ACCOUNTS:32])
						While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (<>SYS_l_CancelProcess#$_l_Process))
							
							$_l_PrintHeight:=Acc_BalRepHdg("ACC_TrialBalancePrintHeading")
							PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
							If ([HEADINGS:84]Heading_Level:3=vValueF)
								$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1+"@"
							Else 
								$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1
							End if 
							$_r_HamountF:=0
							$_r_HamountT:=0
							$_r_Hamount:=0
							
							While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Report_Heading:1=$_t_ReportHeading) & (<>SYS_l_CancelProcess#$_l_Process))
								If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerBroughtforwardACC)
									//TRACE
								End if 
								
								vAmountF:=0
								vAmountT:=0
								ARRAY LONGINT:C221($_al_AccountCodes; 0)
								ARRAY LONGINT:C221($_al_AccountCodes2; 0)
								//  QUERY([ACC BALANCES];[ACC BALANCES]Account Code=[ACCOUNTS]Account Code)
								ARRAY LONGINT:C221($_al_AccountCodes; Size of array:C274(ACC_at_BalAccountCodes))
								ARRAY LONGINT:C221($_al_AccountCodes2; Size of array:C274(ACC_at_BalAccountCodes))
								$_bo_CheckPhantom:=False:C215
								For ($_l_ElementsIndex; 1; Size of array:C274(ACC_at_BalAccountCodes))
									$_l_PhantomCheckRow:=Find in array:C230(ACC_at_BalAccountCodes; [ACCOUNTS:32]Account_Code:2; $_l_ElementsIndex)
									If ($_l_PhantomCheckRow>0)
										$_l_ElementsIndex:=$_l_PhantomCheckRow
									Else 
										$_l_ElementsIndex:=Size of array:C274(ACC_at_BalAccountCodes)
									End if 
									
									If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)  // & (ACC_at_BalPeriodCodes{$_l_ElementsIndex}="2001/04")
										$_bo_CheckPhantom:=True:C214
									End if 
									If (ACC_at_BalAccountCodes{$_l_ElementsIndex}=[ACCOUNTS:32]Account_Code:2)
										If ([ACCOUNTS:32]PB:4="P")
											If (ACC_at_BalPeriodCodes{$_l_ElementsIndex}>=$_t_YearPeriodFrom)
												If (ACC_at_BalPeriodCodes{$_l_ElementsIndex}<ACC_t_PeriodTo)
													$_al_AccountCodes{$_l_ElementsIndex}:=$_l_ElementsIndex
												Else 
													$_al_AccountCodes2{$_l_ElementsIndex}:=$_l_ElementsIndex
												End if 
											End if 
										Else 
											If (ACC_at_BalPeriodCodes{$_l_ElementsIndex}#ACC_t_PeriodTo)
												$_al_AccountCodes{$_l_ElementsIndex}:=$_l_ElementsIndex
											Else 
												$_al_AccountCodes2{$_l_ElementsIndex}:=$_l_ElementsIndex
											End if 
										End if 
										
									End if 
									
								End for 
								SORT ARRAY:C229($_al_AccountCodes; <)
								$_l_AccountCodeRow:=Find in array:C230($_al_AccountCodes; 0)
								If ($_l_AccountCodeRow>0)
									ARRAY LONGINT:C221($_al_AccountCodes; $_l_AccountCodeRow-1)
								End if 
								SORT ARRAY:C229($_al_AccountCodes; >)
								SORT ARRAY:C229($_al_AccountCodes2; <)
								$_l_AccountCodeRow:=Find in array:C230($_al_AccountCodes2; 0)
								If ($_l_AccountCodeRow>0)
									ARRAY LONGINT:C221($_al_AccountCodes2; $_l_AccountCodeRow-1)
								End if 
								SORT ARRAY:C229($_al_AccountCodes2; >)
								
								If (False:C215)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
									If ([ACCOUNTS:32]PB:4="P")
										INTERSECTION:C121("Year"; "Extra"; "Extra3")
									Else 
										INTERSECTION:C121("Master"; "Extra"; "Extra3")
									End if 
									USE SET:C118("Extra3")
								End if 
								
								//the amounts are calculated already
								$_r_PhantomAmountT:=0
								$_bo_PhantomsCounted:=False:C215
								For ($_l_Index; 1; Size of array:C274($_al_AccountCodes))  //Records in selection([ACC BALANCES]))
									$_l_PhantomCheckRow:=$_al_AccountCodes{$_l_Index}
									//Find in array(ACC_at_BalAccountIdentity;[ACC BALANCES]Unique_stringIDent)
									If ($_l_PhantomCheckRow>0)
										VAmountT:=VAmountT+ACC_ar_BalOuptutAccountBalance{$_l_PhantomCheckRow}
										If (ACC_at_BalAccountCodes{$_l_PhantomCheckRow}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
											$_bo_PhantomsCounted:=True:C214
											ARRAY TEXT:C222($_at_PhantomsChecked; 0)
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}=ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountT:=$_r_PhantomAmountT+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}=ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountT:=$_r_PhantomAmountT+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
											
										End if 
										If (ACC_at_BalAccountCodes{$_l_PhantomCheckRow}=DB_GetLedgerBroughtforwardACC) & ($_bo_PhantomsCounted=False:C215)
											$_bo_PhantomsCounted:=True:C214
											ARRAY TEXT:C222($_at_PhantomsChecked; 0)
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}=ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountT:=$_r_PhantomAmountT+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
										End if 
										
										
									End if 
									//NEXT RECORD([ACC BALANCES])
								End for 
								
								//Calc_Balance2
								//vAmountT:=vBalance
								
								INTERSECTION:C121("Extra2"; "Extra"; "Extra3")
								USE SET:C118("Extra3")
								$_r_PhantomAmountF:=0
								$_bo_PhantomsCounted:=False:C215
								For ($_l_Index; 1; Size of array:C274($_al_AccountCodes2))
									$_l_PhantomCheckRow:=$_al_AccountCodes2{$_l_Index}
									If ($_l_PhantomCheckRow>0)
										VAmountF:=VAmountF+ACC_ar_BalOuptutAccountBalance{$_l_PhantomCheckRow}
										If (ACC_at_BalAccountCodes{$_l_PhantomCheckRow}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
											$_bo_PhantomsCounted:=True:C214
											ARRAY TEXT:C222($_at_PhantomsChecked; 0)
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}<ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountF:=$_r_PhantomAmountF+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}<ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountF:=$_r_PhantomAmountF+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
											
										End if 
										If (ACC_at_BalAccountCodes{$_l_PhantomCheckRow}=DB_GetLedgerBroughtforwardACC) & ($_bo_PhantomsCounted=False:C215)
											$_bo_PhantomsCounted:=True:C214
											ARRAY TEXT:C222($_at_PhantomsChecked; 0)
											For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
												If (ACC_at_BalPeriodCodes{$_l_Index2}<ACC_t_PeriodTo)
													$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
													$_l_PhantomCheckRow:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
													If ($_l_PhantomCheckRow<0)
														INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
														$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
														$_l_PhantomRow:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
														If ($_l_PhantomRow>0)
															$_r_PhantomAmountF:=$_r_PhantomAmountF+ACC_ar_BalOuptutAccountBalance{$_l_PhantomRow}
														End if 
													End if 
												End if 
											End for 
										End if 
										
									End if 
									//NEXT RECORD([ACC BALANCES])
								End for 
								// vAmountF:=vBalance
								If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)
									vAmountF:=vAmountF+$_r_PhantomAmountF
									vAmountT:=vAmountT+$_r_PhantomAmountT
								End if 
								
								vAmount:=vAmountF+vAmountT
								
								vPTot:=vPTot+vAmountF
								vYTot:=vYTot+vAmountT
								vATot:=vATot+vAmount
								vPNTot:=vPNTot+vAmountF
								vYNTot:=vYNTot+vAmountT
								vANTot:=vANTot+vAmount
								$_r_HamountF:=$_r_HamountF+vAmountF
								$_r_HamountT:=$_r_HamountT+vAmountT
								$_r_Hamount:=$_r_Hamount+vAmount
								
								If (ch6=0)
									DB_bo_RecordModified:=True:C214
									If (s1=1)
										vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Code:2+(" "*(7-Length:C16([ACCOUNTS:32]Account_Code:2)))+[ACCOUNTS:32]Account_Name:3
										If ((ch7=0) | (vAmountF#0) | (vAmountT#0) | (vAmount#0))
											Acc_BalPage(2; 1; "TB_Header")
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Details")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											If ($_r_PhantomAmountF#0) | ($_r_PhantomAmountT#0)  //& (False)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Code:2+(" "*(7-Length:C16([ACCOUNTS:32]Account_Code:2)))+"Currency Adjustment "+[ACCOUNTS:32]Account_Name:3
												vAmountT:=$_r_PhantomAmountF
												vAmountF:=$_r_PhantomAmountT
												vPTot:=vPTot+$_r_PhantomAmountF
												vYTot:=vYTot+$_r_PhantomAmountT
												Vamount:=$_r_PhantomAmountF+$_r_PhantomAmountT
												vATot:=vATot+vAmount
												vPNTot:=vPNTot+$_r_PhantomAmountF
												vYNTot:=vYNTot+$_r_PhantomAmountT
												vANTot:=vANTot+vAmount
												$_r_HamountF:=$_r_HamountF+$_r_PhantomAmountF
												$_r_HamountT:=$_r_HamountT+$_r_PhantomAmountT
												$_r_Hamount:=$_r_Hamount+vAmount
												Acc_BalPage(2; 1; "TB_Header")
												$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Details")
												PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											End if 
											
										End if 
									Else 
										vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Code:2+(" "*(7-Length:C16([ACCOUNTS:32]Account_Code:2)))+[ACCOUNTS:32]Account_Name:3
										If ((ch7=0) | (vAmountF#0) | (vAmountT#0) | (vAmount#0))
											SEND PACKET:C103(vHeading+vFld+String:C10(vAmountT; "|Accounts")+vFld+String:C10(vAmountF; "|Accounts")+vFld+String:C10(vAmount; "|Accounts")+vRec)
											If ($_r_PhantomAmountF#0) | ($_r_PhantomAmountT#0)  // & (False)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Code:2+(" "*(7-Length:C16([ACCOUNTS:32]Account_Code:2)))+"Currency Adjustment "+[ACCOUNTS:32]Account_Name:3
												vAmountT:=$_r_PhantomAmountF
												vAmountF:=$_r_PhantomAmountT
												vPTot:=vPTot+$_r_PhantomAmountF
												vYTot:=vYTot+$_r_PhantomAmountT
												Vamount:=$_r_PhantomAmountF+$_r_PhantomAmountT
												vATot:=vATot+vAmount
												vPNTot:=vPNTot+$_r_PhantomAmountF
												vYNTot:=vYNTot+$_r_PhantomAmountT
												vANTot:=vANTot+vAmount
												$_r_HamountF:=$_r_HamountF+$_r_PhantomAmountF
												$_r_HamountT:=$_r_HamountT+$_r_PhantomAmountT
												$_r_Hamount:=$_r_Hamount+vAmount
												SEND PACKET:C103(vHeading+vFld+String:C10(vAmountT; "|Accounts")+vFld+String:C10(vAmountF; "|Accounts")+vFld+String:C10(vAmount; "|Accounts")+vRec)
												
											End if 
											
										End if 
									End if 
								End if 
								
								NEXT RECORD:C51([ACCOUNTS:32])
							End while 
							
							If (ch6=1)
								vAmountF:=$_r_HamountF
								vAmountT:=$_r_HamountT
								vAmount:=$_r_Hamount
								If (s1=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Heading")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									Acc_BalPage(1; 2; "TB_Header")
								Else 
									SEND PACKET:C103(vHeading+vFld+String:C10(vAmountT; "|Accounts")+vFld+String:C10(vAmountF; "|Accounts")+vFld+String:C10(vAmount; "|Accounts")+vRec)
								End if 
							End if 
							
							If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
								If (s1=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Subtotal")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									Acc_BalPage(2; 2; "TB_Header")
								Else 
									SEND PACKET:C103("   Subtotal"+vFld+String:C10(vYTot; "|Accounts")+vFld+String:C10(vPTot; "|Accounts")+vFld+String:C10(vATot; "|Accounts")+vRec+vRec)
								End if 
								vStockLevel:=1
								vStage:=""
							End if 
							
						End while 
						
						If (s1=1)
							If (<>SYS_l_CancelProcess=$_l_Process)
								PAGE BREAK:C6(*)
							Else 
								If (vYNTot#0) | (vPNTot#0)
									//the trial balance does not balance
									If (Size of array:C274(CUR_at_CurrencyToconvert)>1)
										//its converted so the imbalance is because of a currency p/l
										Vheading:="Currency Conversion Profits/Losses"
										VamountT:=(vYNTot)
										VamountF:=(vPNTot)
										Vamount:=VamountT+VamountF
										vYNTot:=vYNTot-VamountT
										vPNTot:=vPNTot-VamountF
										vANTot:=vYNTot+vPNTot
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Heading")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									End if 
									
								End if 
								
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "TB_Totals")
								PAGE BREAK:C6
								CLOSE WINDOW:C154
								
								PRT_SetPrinterPaperOptions("Trial Balance")  //NG June 2005
							End if 
						Else 
							SEND PACKET:C103("BALANCE"+vFld+String:C10(vYNTot; "|Accounts")+vFld+String:C10(vPNTot; "|Accounts")+vFld+String:C10(vANTot; "|Accounts")+vRec)
							SET CHANNEL:C77(11)
							OK:=1
						End if 
						
					End if 
					Close_ProWin
					
				End if 
			End if 
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	End if 
End while 
//Process_End
ERR_MethodTrackerReturn("AccBAL_TBMC"; $_t_oldMethodName)
