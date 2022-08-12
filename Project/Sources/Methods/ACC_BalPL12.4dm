//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalPL12
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
	//C_UNKNOWN(<>YrPerF)
	//C_UNKNOWN(cABL)
	//C_UNKNOWN(ch6)
	//C_UNKNOWN(ch7)
	//C_UNKNOWN(i)
	//C_UNKNOWN(s1)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vBalance)
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vControl)
	//C_UNKNOWN(vFld)
	//C_UNKNOWN(vGroup)
	//C_UNKNOWN(vHeading)
	//C_UNKNOWN(vMod2)
	//C_UNKNOWN(vPeriod)
	//C_UNKNOWN(vPNTot)
	//C_UNKNOWN(vRec)
	//C_UNKNOWN(vStage)
	//C_UNKNOWN(vStockLevel)
	//C_UNKNOWN(vT1)
	//C_UNKNOWN(vT10)
	//C_UNKNOWN(vT12)
	//C_UNKNOWN(vT2)
	//C_UNKNOWN(vT3)
	//C_UNKNOWN(vT4)
	//C_UNKNOWN(vT5)
	//C_UNKNOWN(vT6)
	//C_UNKNOWN(vT7)
	//C_UNKNOWN(vT8)
	//C_UNKNOWN(vT9)
	//C_UNKNOWN(vTerms)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(vTitle1)
	//C_UNKNOWN(vTitle10)
	//C_UNKNOWN(vTitle11)
	//C_UNKNOWN(vTitle12)
	//C_UNKNOWN(vTitle13)
	//C_UNKNOWN(vTitle14)
	//C_UNKNOWN(vTitle15)
	//C_UNKNOWN(vTitle16)
	//C_UNKNOWN(vTitle2)
	//C_UNKNOWN(vTitle3)
	//C_UNKNOWN(vTitle4)
	//C_UNKNOWN(vTitle6)
	//C_UNKNOWN(vTitle7)
	//C_UNKNOWN(vTitle8)
	//C_UNKNOWN(vTitle9)
	//C_UNKNOWN(vTot)
	//C_UNKNOWN(vValueF)
	//C_UNKNOWN(xNT10)
	//C_UNKNOWN(xNT11)
	//C_UNKNOWN(xNT12)
	//C_UNKNOWN(xNT2)
	//C_UNKNOWN(xNT3)
	//C_UNKNOWN(xNT4)
	//C_UNKNOWN(xNT5)
	//C_UNKNOWN(xNT6)
	//C_UNKNOWN(xNT7)
	//C_UNKNOWN(xNT8)
	//C_UNKNOWN(xNT9)
	ARRAY LONGINT:C221($_al_AccountCodeIndex2; 0)
	ARRAY LONGINT:C221($_al_AccountCodes; 0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	ARRAY TEXT:C222($_at_PhantomsChecked; 0)
	ARRAY TEXT:C222($_at_ReportingPeriods; 0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_CheckPhantom; $_bo_MultiCurrency; $_bo_PhantomsCounted; $_bo_Query; $1; DB_bo_RecordModified; vMod2; $_bo_CheckPhantom; $_bo_MultiCurrency; $_bo_PhantomsCounted; $_bo_Query)
	C_BOOLEAN:C305($1; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_PeriodFromDate; $_d_YearPeriodDate2; $_d_YearPeriodDate3; $_d_YearPeriodDateF; <>DB_d_CurrentDate; $_d_PeriodFromDate; $_d_YearPeriodDate2; $_d_YearPeriodDate3; $_d_YearPeriodDateF)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AccountIndex; $_l_AccountIndexPosition; $_l_AccountRow; $_l_CurrentProcess; $_l_Index; $_l_Index2; $_l_Last; $_l_NextAccountCodePosition; $_l_PhantomCheckedPosition; $_l_PhantomPosition)
	C_LONGINT:C283($_l_PhantomPosition2; $_l_PrintHeight; cABL; ch6; ch7; i; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight; PRT_l_RightMargin)
	C_LONGINT:C283(PRT_l_TopMargin; s1; vAB; vControl; vStockLevel; <>SYS_l_CancelProcess; $_l_AccountIndex; $_l_AccountIndexPosition; $_l_AccountRow; $_l_CurrentProcess; $_l_Index)
	C_LONGINT:C283($_l_Index2; $_l_Last; $_l_NextAccountCodePosition; $_l_PhantomCheckedPosition; $_l_PhantomPosition; $_l_PhantomPosition2; $_l_PrintHeight; PRT_l_BottomMargin; PRT_l_LeftMargin; PRT_l_MaxHeight; PRT_l_RemainingHeight)
	C_LONGINT:C283(PRT_l_RightMargin; PRT_l_TopMargin; r0)
	C_POINTER:C301($_ptr_VtVariable; $_ptr_VtVariableT; $_ptr_xtVariable2; $_ptr_VtVariable; $_ptr_VtVariableT; $_ptr_xtVariable2)
	C_REAL:C285($_r_Difference; $_r_GT1; $_r_GT10; $_r_GT11; $_r_GT12; $_r_GT2; $_r_GT3; $_r_GT4; $_r_GT5; $_r_GT6; $_r_GT7)
	C_REAL:C285($_r_GT8; $_r_GT9; $_r_Ham1; $_r_Ham10; $_r_Ham11; $_r_Ham12; $_r_Ham2; $_r_Ham3; $_r_Ham4; $_r_Ham5; $_r_Ham6)
	C_REAL:C285($_r_Ham7; $_r_Ham8; $_r_Ham9; $_r_NT1; $_r_NT10; $_r_NT11; $_r_NT12; $_r_NT2; $_r_NT3; $_r_NT4; $_r_NT5)
	C_REAL:C285($_r_NT6; $_r_NT7; $_r_NT8; $_r_NT9; $_r_PantomAmountF; $_r_PhantomAmount; $_r_ProfitCountF; $_r_T1; $_r_T10; $_r_T11; $_r_T12)
	C_REAL:C285($_r_T2; $_r_T3; $_r_T4; $_r_T5; $_r_T6; $_r_T7; $_r_T8; $_r_T9; vBalance; vPNTot; vT1)
	C_REAL:C285(vT10; vT12; vT2; vT3; vT4; vT5; vT6; vT7; vT8; vT9; vTot)
	C_REAL:C285(vValueF; xNT10; xNT11; xNT12; xNT2; xNT3; xNT4; xNT5; xNT6; xNT7; xNT8)
	C_REAL:C285(xNT9; $_r_Difference; $_r_GT1; $_r_GT10; $_r_GT11; $_r_GT12; $_r_GT2; $_r_GT3; $_r_GT4; $_r_GT5; $_r_GT6)
	C_REAL:C285($_r_GT7; $_r_GT8; $_r_GT9; $_r_Ham1; $_r_Ham10; $_r_Ham11; $_r_Ham12; $_r_Ham2; $_r_Ham3; $_r_Ham4; $_r_Ham5)
	C_REAL:C285($_r_Ham6; $_r_Ham7; $_r_Ham8; $_r_Ham9; $_r_NT1; $_r_NT10; $_r_NT11; $_r_NT12; $_r_NT2; $_r_NT3; $_r_NT4)
	C_REAL:C285($_r_NT5; $_r_NT6; $_r_NT7; $_r_NT8; $_r_NT9; $_r_PantomAmountF; $_r_PhantomAmount; $_r_ProfitCountF; $_r_T1; $_r_T10; $_r_T11)
	C_REAL:C285($_r_T12; $_r_T2; $_r_T3; $_r_T4; $_r_T5; $_r_T6; $_r_T7; $_r_T8; $_r_T9; vT11; xNT1)
	C_REAL:C285(xTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; $_t_GroupHeading; $_t_HeadingCode; $_t_oldMethodName; $_t_OutputCurrency; $_t_PeriodCode; $_t_PhantomProfitString; $_t_YearPeriodF; $_t_YearPeriodF2; $_t_YearPeriodT3)
	C_TEXT:C284(ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; vCallCode; vFld; vGroup; vHeading; vPeriod; vRec; vStage; vTerms)
	C_TEXT:C284(vText; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle2; vTitle3)
	C_TEXT:C284(vTitle4; vTitle6; vTitle7; vTitle8; vTitle9; <>SYS_t_BaseCurrency; $_t_GroupHeading; $_t_HeadingCode; $_t_oldMethodName; $_t_OutputCurrency; $_t_PeriodCode)
	C_TEXT:C284($_t_PhantomProfitString; $_t_YearPeriodF; $_t_YearPeriodF2; $_t_YearPeriodT3; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; vTitle; vTitle5)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalPL12")
//ACC_BalPL12

$_l_CurrentProcess:=Current process:C322
ARRAY TEXT:C222($_at_ReportingPeriods; 0)
ARRAY TEXT:C222($_at_ReportingPeriods; 12)
//Start_Process
//AccBal File
READ ONLY:C145([ACCOUNT_BALANCES:34])
While (vAB=1)
	//IDLE  ` 03/04/03 pb
	vTitle:=Uppercase:C13(Term_NLWT("PROFIT & LOSS "))
	DB_t_CurrentFormUsage:="P&L"
	r0:=0
	If (Count parameters:C259>=1)
		$_bo_Query:=$1
	Else 
		$_bo_Query:=True:C214
	End if 
	If ($_bo_Query)
		ACC_BalSelect
	End if 
	$_t_YearPeriodF:=ACC_GetYearStart(Current date:C33(*))
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_YearPeriodF)
	$_d_YearPeriodDateF:=[PERIODS:33]From_Date:3
	
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			If (ACC_t_PeriodTo#"")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; >)
				$_t_YearPeriodF2:=ACC_GetYearStart([PERIODS:33]To_Date:4)
				$_d_YearPeriodDate2:=[PERIODS:33]From_Date:3
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
				$_t_YearPeriodT3:=ACC_GetYearStart([PERIODS:33]From_Date:3)
				$_d_YearPeriodDate3:=[PERIODS:33]To_Date:4
			Else 
				ALL RECORDS:C47([PERIODS:33])
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
				$_t_YearPeriodF2:=ACC_GetYearStart([PERIODS:33]To_Date:4)
				$_d_YearPeriodDate2:=[PERIODS:33]From_Date:3
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_t_PeriodFrom)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
				$_t_YearPeriodT3:=ACC_GetYearStart([PERIODS:33]From_Date:3)
				$_d_YearPeriodDate3:=[PERIODS:33]To_Date:4
			End if 
			If ($_d_YearPeriodDate2<$_d_YearPeriodDateF)
				//the report is printed for a previous year
				//if that year is not CLOSED..behave as if it is open
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
				$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
				If ($_d_PeriodFromDate<=$_d_YearPeriodDate3)
					$_t_YearPeriodF:=$_t_YearPeriodT3
				End if 
			End if 
			
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
			//CurrConv_Ask
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
			If (ACC_t_CurrencyCode#<>SYS_t_BaseCurrency)
				$_bo_MultiCurrency:=True:C214  //profit is converted
			End if 
			If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
				vCallCode:=$_t_OutputCurrency
			End if 
			If ($_t_OutputCurrency#"")
				Acc_BalRepTit($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
				vTitle15:=vTitle4
				vTitle14:=vTitle3
				USE SET:C118("Master")
				ACC_LoadToArrays($_t_OutputCurrency; (cABL=1); $_t_YearPeriodF; ACC_t_PeriodTo)  //NG Modified 2/3/2005
				vPeriod:=ACC_t_PeriodTo
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_t_PeriodFrom; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]Period_Code:1<=ACC_t_PeriodTo)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
				ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; >)
				
				FIRST RECORD:C50([PERIODS:33])
				$_l_Index:=Records in selection:C76([PERIODS:33])
				If ($_l_Index>12)
					//       Gen_Confirm ("NB: Periods up to and  you have selected will be reported u
					While ($_l_Index>12)
						NEXT RECORD:C51([PERIODS:33])
						$_l_Index:=$_l_Index-1
					End while 
				End if 
				If (OK=1)
					$_l_Index:=1
					$_l_Last:=12
					While ($_l_Index<13)
						IDLE:C311  // 03/04/03 pb
						$_ptr_VtVariable:=Get pointer:C304("vTitle"+String:C10($_l_Index))
						If (Not:C34(End selection:C36([PERIODS:33])))
							$_ptr_VtVariable->:=[PERIODS:33]Period_Code:1
							NEXT RECORD:C51([PERIODS:33])
						Else 
							If ($_l_Last=12)
								$_l_Last:=$_l_Index-1
							End if 
							$_ptr_VtVariable->:=""
						End if 
						$_at_ReportingPeriods{$_l_Index}:=$_ptr_VtVariable->
						$_l_Index:=$_l_Index+1
					End while 
					If (vTitle1=ACC_t_PeriodFrom)
						vTitle16:=""
					Else 
						vTitle16:=ACC_t_PeriodFrom+" to "
					End if 
					vTitle13:="TOTALS"
					
					LAST RECORD:C200([PERIODS:33])
					vTitle:=Uppercase:C13(Term_NLWT("PROFIT & LOSS "))+[PERIODS:33]Period_Name:2
					$_r_NT1:=0
					$_r_NT2:=0
					$_r_NT3:=0
					$_r_NT4:=0
					$_r_NT5:=0
					$_r_NT6:=0
					$_r_NT7:=0
					$_r_NT8:=0
					$_r_NT9:=0
					$_r_NT10:=0
					$_r_NT11:=0
					$_r_NT12:=0
					$_r_T1:=0
					$_r_T2:=0
					$_r_T3:=0
					$_r_T4:=0
					$_r_T5:=0
					$_r_T6:=0
					$_r_T7:=0
					$_r_T8:=0
					$_r_T9:=0
					$_r_T10:=0
					$_r_T11:=0
					$_r_T12:=0
					
					If (Not:C34(SR_ReportOK("AccBalPL12")))
						Acc_BalRepPS(Term_NLWT("P&L_12 Periods"))
						If (s1=1)
							GET PRINTABLE MARGIN:C711(PRT_l_LeftMargin; PRT_l_TopMargin; PRT_l_RightMargin; PRT_l_BottomMargin)
							GET PRINTABLE AREA:C703(PRT_l_MaxHeight)
						End if 
						i:=7
						
						If (OK=1)
							
							Accounts_LaySrc(vText)
							QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="P")
							Accounts_ZeroSr
							ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Group_Heading:6; >; [ACCOUNTS:32]Report_Heading:1; >; [ACCOUNTS:32]Account_Code:2; >)
							
							If (s1=1)
								//Print form([HEADINGS];"All_Hdr12")
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Hdr12")
								PRT_l_RemainingHeight:=PRT_l_MaxHeight-$_l_PrintHeight
								$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Detail12")
								PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
								
								If (ch6=1)
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap12")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									
									i:=i+1
								End if 
							Else 
								SEND PACKET:C103(vTitle+vRec+vRec+String:C10(<>DB_d_CurrentDate)+vFld+String:C10(<>CTime; 2)+vRec+vRec)
								SEND PACKET:C103(vTitle15+vFld+vFld+vFld+vTitle14+vRec+vRec)
								SEND PACKET:C103(vFld+vTitle1+vFld+vTitle2+vFld+vTitle3+vFld+vTitle4+vFld+vTitle5+vFld+vTitle6+vFld+vTitle7+vFld+vTitle8+vFld+vTitle9+vFld+vTitle10+vFld+vTitle11+vFld+vTitle12+vFld+vTitle13+vRec+vRec)
							End if 
							
							FIRST RECORD:C50([ACCOUNTS:32])
							While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
								RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
								vGroup:=Uppercase:C13([HEADINGS:84]Heading_Name:2)
								$_t_GroupHeading:=[ACCOUNTS:32]Group_Heading:6
								DB_bo_RecordModified:=False:C215
								
								$_r_GT1:=0
								$_r_GT2:=0
								$_r_GT3:=0
								$_r_GT4:=0
								$_r_GT5:=0
								$_r_GT6:=0
								$_r_GT7:=0
								$_r_GT8:=0
								$_r_GT9:=0
								$_r_GT10:=0
								$_r_GT11:=0
								$_r_GT12:=0
								
								vStockLevel:=1
								vStage:=""
								
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($_t_GroupHeading=[ACCOUNTS:32]Group_Heading:6) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
									
									vMod2:=False:C215
									
									$_l_PrintHeight:=Acc_BalRepHdg("Acc_BalPLHdg12")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If (vMod2)
										$_r_T1:=0
										$_r_T2:=0
										$_r_T3:=0
										$_r_T4:=0
										$_r_T5:=0
										$_r_T6:=0
										$_r_T7:=0
										$_r_T8:=0
										$_r_T9:=0
										$_r_T10:=0
										$_r_T11:=0
										$_r_T12:=0
									End if 
									
									If ([HEADINGS:84]Heading_Level:3=vValueF)
										$_t_HeadingCode:=[HEADINGS:84]Heading_Code:1+"@"
									Else 
										$_t_HeadingCode:=[HEADINGS:84]Heading_Code:1
									End if 
									$_r_Ham1:=0
									$_r_Ham2:=0
									$_r_Ham3:=0
									$_r_Ham4:=0
									$_r_Ham5:=0
									$_r_Ham6:=0
									$_r_Ham7:=0
									$_r_Ham8:=0
									$_r_Ham9:=0
									$_r_Ham10:=0
									$_r_Ham11:=0
									$_r_Ham12:=0
									
									While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ($_t_GroupHeading=[ACCOUNTS:32]Group_Heading:6) & ([ACCOUNTS:32]Report_Heading:1=$_t_HeadingCode) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
										
										$_l_Index:=1
										While ($_l_Index<13)
											IDLE:C311  // 03/04/03 pb
											$_ptr_VtVariable:=Get pointer:C304("vTitle"+String:C10($_l_Index))
											$_ptr_VtVariableT:=Get pointer:C304("vT"+String:C10($_l_Index))
											If ($_ptr_VtVariable->="")
												$_ptr_VtVariableT->:=0
											Else 
												USE SET:C118("Master")
												If (False:C215)
													If (($_l_Index=1) & (vTitle1#ACC_t_PeriodFrom))
														QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=ACC_t_PeriodFrom; *)
														QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=vTitle1; *)
														QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
													Else 
														QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2; *)
														QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$_ptr_VtVariable->)
													End if 
													If (r0#1)
														CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra3")
													End if 
													DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_CurrencyToconvert)
													Calc_Balance2(<>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
													$_ptr_VtVariableT->:=vBalance
												Else 
													
													//````
													ARRAY LONGINT:C221($_al_AccountCodes; 0)
													ARRAY LONGINT:C221($_al_AccountCodeIndex2; 0)
													
													ARRAY LONGINT:C221($_al_AccountCodes; Size of array:C274(ACC_at_BalAccountCodes))
													ARRAY LONGINT:C221($_al_AccountCodeIndex2; Size of array:C274(ACC_at_BalAccountCodes))
													//````
													For ($_l_AccountRow; 1; Size of array:C274(ACC_at_BalAccountCodes))
														$_l_NextAccountCodePosition:=Find in array:C230(ACC_at_BalAccountCodes; [ACCOUNTS:32]Account_Code:2; $_l_AccountRow)
														If ($_l_NextAccountCodePosition>0)
															If (($_l_Index=1) & (vTitle1#ACC_t_PeriodFrom))
																If (ACC_at_BalPeriodCodes{$_l_NextAccountCodePosition}>=ACC_t_PeriodFrom) & (ACC_at_BalPeriodCodes{$_l_NextAccountCodePosition}<=VTitle1)
																	$_l_AccountRow:=$_l_NextAccountCodePosition
																Else 
																	$_l_AccountRow:=-$_l_NextAccountCodePosition
																End if 
															Else 
																If (ACC_at_BalPeriodCodes{$_l_NextAccountCodePosition}=$_ptr_VtVariable->)
																	$_l_AccountRow:=$_l_NextAccountCodePosition
																Else 
																	$_l_AccountRow:=-$_l_NextAccountCodePosition
																End if 
																
															End if 
															
															
														Else 
															$_l_AccountRow:=Size of array:C274(ACC_at_BalAccountCodes)+1
														End if 
														$_bo_CheckPhantom:=True:C214
														
														If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerBroughtforwardACC)  // & (ACC_at_BalPeriodCodes{$elements}="2001/04")
															//TRACE
															$_bo_CheckPhantom:=True:C214
														End if 
														If ($_l_NextAccountCodePosition>0)
															If ($_l_AccountRow>0)
																If ($_l_AccountRow<=Size of array:C274(ACC_at_BalAccountCodes))
																	If (ACC_at_BalAccountCodes{$_l_AccountRow}=[ACCOUNTS:32]Account_Code:2)
																		$_al_AccountCodeIndex2{$_l_AccountRow}:=$_l_AccountRow
																	End if 
																End if 
															Else 
																$_l_AccountRow:=Abs:C99($_l_AccountRow)
															End if 
														Else 
															$_l_AccountRow:=Size of array:C274(ACC_at_BalAccountCodes)+1
														End if 
														
													End for 
													SORT ARRAY:C229($_al_AccountCodeIndex2; <)
													$_l_AccountIndexPosition:=Find in array:C230($_al_AccountCodeIndex2; 0)
													If ($_l_AccountIndexPosition>0)
														ARRAY LONGINT:C221($_al_AccountCodeIndex2; $_l_AccountIndexPosition-1)
													End if 
													SORT ARRAY:C229($_al_AccountCodeIndex2; >)
													$_r_PhantomAmount:=0
													$_bo_PhantomsCounted:=False:C215
													Vbalance:=0
													For ($_l_AccountRow; 1; Size of array:C274($_al_AccountCodeIndex2))  // Periods before the  to period--go in the T
														$_l_AccountIndex:=$_al_AccountCodeIndex2{$_l_AccountRow}
														If ($_l_AccountIndex>0)
															Vbalance:=Vbalance+ACC_ar_BalOuptutAccountBalance{$_l_AccountIndex}
															If (ACC_at_BalAccountCodes{$_l_AccountIndex}=DB_GetLedgerProfitACC) & ($_bo_PhantomsCounted=False:C215)
																$_bo_PhantomsCounted:=True:C214
																//& (False)
																ARRAY TEXT:C222($_at_PhantomsChecked; 0)
																For ($_l_Index2; 1; Size of array:C274(ACC_at_BalAnalysisCodes))
																	$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index2}; ACC_at_BalPeriodCodes{$_l_Index2}; ACC_at_BalLayerCodes{$_l_Index2}; ACC_at_BalCurrencyCodes{$_l_Index2})
																	$_l_PhantomPosition:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
																	If ($_l_PhantomPosition<0)
																		INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
																		$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
																		$_l_PhantomPosition2:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
																		If ($_l_PhantomPosition2>0)
																			$_r_PhantomAmount:=$_r_PhantomAmount+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition2}
																		End if 
																	End if 
																End for 
															End if 
														End if 
														//NEXT RECORD([ACC BALANCES])
													End for 
													If ([ACCOUNTS:32]Account_Code:2=DB_GetLedgerProfitACC)  //& (False)
														Vbalance:=Vbalance+$_r_PhantomAmount
													End if 
													$_ptr_VtVariableT->:=vBalance
													
												End if 
												
												//````
											End if 
											$_l_Index:=$_l_Index+1
										End while 
										vTot:=vT1+vT2+vT3+vT4+vT5+vT6+vT7+vT8+vT9+vT10+vT11+vT12
										
										$_r_T1:=$_r_T1+vT1
										$_r_T2:=$_r_T2+vT2
										$_r_T3:=$_r_T3+vT3
										$_r_T4:=$_r_T4+vT4
										$_r_T5:=$_r_T5+vT5
										$_r_T6:=$_r_T6+vT6
										$_r_T7:=$_r_T7+vT7
										$_r_T8:=$_r_T8+vT8
										$_r_T9:=$_r_T9+vT9
										$_r_T10:=$_r_T10+vT10
										$_r_T11:=$_r_T11+vT11
										$_r_T12:=$_r_T12+vT12
										
										$_r_GT1:=$_r_GT1+vT1
										$_r_GT2:=$_r_GT2+vT2
										$_r_GT3:=$_r_GT3+vT3
										$_r_GT4:=$_r_GT4+vT4
										$_r_GT5:=$_r_GT5+vT5
										$_r_GT6:=$_r_GT6+vT6
										$_r_GT7:=$_r_GT7+vT7
										$_r_GT8:=$_r_GT8+vT8
										$_r_GT9:=$_r_GT9+vT9
										$_r_GT10:=$_r_GT10+vT10
										$_r_GT11:=$_r_GT11+vT11
										$_r_GT12:=$_r_GT12+vT12
										
										$_r_Ham1:=$_r_Ham1+vT1
										$_r_Ham2:=$_r_Ham2+vT2
										$_r_Ham3:=$_r_Ham3+vT3
										$_r_Ham4:=$_r_Ham4+vT4
										$_r_Ham5:=$_r_Ham5+vT5
										$_r_Ham6:=$_r_Ham6+vT6
										$_r_Ham7:=$_r_Ham7+vT7
										$_r_Ham8:=$_r_Ham8+vT8
										$_r_Ham9:=$_r_Ham9+vT9
										$_r_Ham10:=$_r_Ham10+vT10
										$_r_Ham11:=$_r_Ham11+vT11
										$_r_Ham12:=$_r_Ham12+vT12
										
										If (ch6=0)
											DB_bo_RecordModified:=True:C214
											If (s1=1)
												vHeading:=(" "*(((vControl/3)*4)+4))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vTot#0))
													Acc_BalPage12(2; 1; "PL_Detail12")
													$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Detail12")
													PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
													
												End if 
											Else 
												vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Name:3
												If ((ch7=0) | (vTot#0))
													SEND PACKET:C103(vHeading+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vFld+String:C10(vT7; "|Inverse Accounts")+vFld+String:C10(vT8; "|Inverse Accounts")+vFld+String:C10(vT9; "|Inverse Accounts")+vFld+String:C10(vT10; "|Inverse Accounts")+vFld+String:C10(vT11; "|Inverse Accounts")+vFld+String:C10(vT12; "|Inverse Accounts")+vFld+String:C10(vTot; "|Inverse Accounts")+vRec)
												End if 
											End if 
										End if 
										
										NEXT RECORD:C51([ACCOUNTS:32])
									End while 
									
									If (ch6=1)
										vT1:=$_r_Ham1
										vT2:=$_r_Ham2
										vT3:=$_r_Ham3
										vT4:=$_r_Ham4
										vT5:=$_r_Ham5
										vT6:=$_r_Ham6
										vT7:=$_r_Ham7
										vT8:=$_r_Ham8
										vT9:=$_r_Ham9
										vT10:=$_r_Ham10
										vT11:=$_r_Ham11
										vT12:=$_r_Ham12
										vTot:=vT1+vT2+vT3+vT4+vT5+vT6+vT7+vT8+vT9+vT10+vT11+vT12
										If (s1=1)
											
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Heading12")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											Acc_BalPage12(1; 2; "PL_Detail12")
										Else 
											SEND PACKET:C103(vHeading+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vFld+String:C10(vT7; "|Inverse Accounts")+vFld+String:C10(vT8; "|Inverse Accounts")+vFld+String:C10(vT9; "|Inverse Accounts")+vFld+String:C10(vT10; "|Inverse Accounts")+vFld+String:C10(vT11; "|Inverse Accounts")+vFld+String:C10(vT12; "|Inverse Accounts")+vFld+String:C10(vTot; "|Inverse Accounts")+vRec)
										End if 
									End if 
									
									If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
										vT1:=$_r_T1
										vT2:=$_r_T2
										vT3:=$_r_T3
										vT4:=$_r_T4
										vT5:=$_r_T5
										vT6:=$_r_T6
										vT7:=$_r_T7
										vT8:=$_r_T8
										vT9:=$_r_T9
										vT10:=$_r_T10
										vT11:=$_r_T11
										vT12:=$_r_T12
										vTot:=vT1+vT2+vT3+vT4+vT5+vT6+vT7+vT8+vT9+vT10+vT11+vT12
										If (s1=1)
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Subtotal12")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											
											Acc_BalPage12(2; 2; "PL_Detail12")
										Else 
											SEND PACKET:C103(vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vFld+String:C10(vT7; "|Inverse Accounts")+vFld+String:C10(vT8; "|Inverse Accounts")+vFld+String:C10(vT9; "|Inverse Accounts")+vFld+String:C10(vT10; "|Inverse Accounts")+vFld+String:C10(vT11; "|Inverse Accounts")+vFld+String:C10(vT12; "|Inverse Accounts")+vFld+String:C10(vTot; "|Inverse Accounts")+vRec+vRec)
										End if 
									End if 
									
								End while 
								
								$_r_NT1:=$_r_NT1+$_r_GT1
								$_r_NT2:=$_r_NT2+$_r_GT2
								$_r_NT3:=$_r_NT3+$_r_GT3
								$_r_NT4:=$_r_NT4+$_r_GT4
								$_r_NT5:=$_r_NT5+$_r_GT5
								$_r_NT6:=$_r_NT6+$_r_GT6
								$_r_NT7:=$_r_NT7+$_r_GT7
								$_r_NT8:=$_r_NT8+$_r_GT8
								$_r_NT9:=$_r_NT9+$_r_GT9
								$_r_NT10:=$_r_NT10+$_r_GT10
								$_r_NT11:=$_r_NT11+$_r_GT11
								$_r_NT12:=$_r_NT12+$_r_GT12
								
								vT1:=$_r_GT1
								vT2:=$_r_GT2
								vT3:=$_r_GT3
								vT4:=$_r_GT4
								vT5:=$_r_GT5
								vT6:=$_r_GT6
								vT7:=$_r_GT7
								vT8:=$_r_GT8
								vT9:=$_r_GT9
								vT10:=$_r_GT10
								vT11:=$_r_GT11
								vT12:=$_r_GT12
								vTot:=vT1+vT2+vT3+vT4+vT5+vT6+vT7+vT8+vT9+vT10+vT11+vT12
								If (s1=1)
									
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Group12")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									If (ch6=1)
										
										$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "All_Gap12")
										PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
										Acc_BalPage12(1+Num:C11(End selection:C36([ACCOUNTS:32])); 3; "PL_Detail12")
									Else 
										Acc_BalPage12(1+Num:C11(End selection:C36([ACCOUNTS:32])); 2; "PL_Detail12")
									End if 
								Else 
									SEND PACKET:C103(vRec+vGroup+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vFld+String:C10(vT7; "|Inverse Accounts")+vFld+String:C10(vT8; "|Inverse Accounts")+vFld+String:C10(vT9; "|Inverse Accounts")+vFld+String:C10(vT10; "|Inverse Accounts")+vFld+String:C10(vT11; "|Inverse Accounts")+vFld+String:C10(vT12; "|Inverse Accounts")+vFld+String:C10(vTot; "|Inverse Accounts")+vRec+vRec)
								End if 
								
							End while 
							
							vT1:=$_r_NT1
							vT2:=$_r_NT2
							vT3:=$_r_NT3
							vT4:=$_r_NT4
							vT5:=$_r_NT5
							vT6:=$_r_NT6
							vT7:=$_r_NT7
							vT8:=$_r_NT8
							vT9:=$_r_NT9
							vT10:=$_r_NT10
							vT11:=$_r_NT11
							vT12:=$_r_NT12
							vTot:=vT1+vT2+vT3+vT4+vT5+vT6+vT7+vT8+vT9+vT10+vT11+vT12
							$_ptr_VtVariableT:=Get pointer:C304("vT"+String:C10($_l_Last))
							vPNTot:=$_ptr_VtVariableT->
							If (s1=1)
								If (<>SYS_l_CancelProcess=$_l_CurrentProcess)
									PAGE BREAK:C6(*)
								Else 
									
									
									$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Totals12")
									PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
									//Here calculate the 12 differences and print the currency fluctuation
									If ($_bo_MultiCurrency)
										xNT1:=0
										xNT2:=0
										xNT3:=0
										xNT4:=0
										xNT5:=0
										xNT6:=0
										xNT7:=0
										xNT8:=0
										xNT9:=0
										xNT10:=0
										xNT11:=0
										xNT12:=0
										xTot:=0
										
										
										For ($_l_Index; 1; 12)
											$_t_PeriodCode:=$_at_ReportingPeriods{$_l_Index}
											$_r_ProfitCountF:=0
											$_r_PantomAmountF:=0
											For ($_l_Index; 1; Size of array:C274(ACC_at_BalAccountCodes))  // Periods before the  to period--go in the T
												If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC) & ($_t_PeriodCode=ACC_at_BalPeriodCodes{$_l_Index})
													$_r_ProfitCountF:=$_r_ProfitCountF+ACC_ar_BalOuptutAccountBalance{$_l_Index}
													
													
													If ((ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC) | (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerBroughtforwardACC)) & ($_bo_PhantomsCounted=False:C215)
														ARRAY TEXT:C222($_at_PhantomsChecked; 0)
														For ($_l_Index2; $_l_Index; Size of array:C274(ACC_at_BalAnalysisCodes))
															If (ACC_at_BalAccountCodes{$_l_Index}=DB_GetLedgerProfitACC)
																$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerProfitACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
															Else 
																$_t_PhantomProfitString:=ACC_Buildunique("-"+DB_GetLedgerBroughtforwardACC; ACC_at_BalAnalysisCodes{$_l_Index}; ACC_at_BalPeriodCodes{$_l_Index}; ACC_at_BalLayerCodes{$_l_Index}; ACC_at_BalCurrencyCodes{$_l_Index})
															End if 
															$_l_PhantomCheckedPosition:=Find in array:C230($_at_PhantomsChecked; $_t_PhantomProfitString)
															If ($_l_PhantomCheckedPosition<0)
																INSERT IN ARRAY:C227($_at_PhantomsChecked; Size of array:C274($_at_PhantomsChecked)+1; 1)
																$_at_PhantomsChecked{Size of array:C274($_at_PhantomsChecked)}:=$_t_PhantomProfitString
																$_l_PhantomPosition:=Find in array:C230(ACC_at_BalAccountIdentity; $_t_PhantomProfitString)
																If ($_l_PhantomPosition>0)
																	$_r_PantomAmountF:=$_r_PantomAmountF+ACC_ar_BalOuptutAccountBalance{$_l_PhantomPosition}
																End if 
															Else 
																$_l_Index2:=Size of array:C274(ACC_at_BalAccountCodes)
															End if 
														End for 
													End if 
												End if 
												
											End for 
											$_ptr_VtVariable:=Get pointer:C304("Vt"+String:C10($_l_Index))
											If (($_r_ProfitCountF+$_r_PantomAmountF)#$_ptr_VtVariable->) & (False:C215)
												
												$_r_Difference:=($_r_ProfitCountF+$_r_PantomAmountF)-$_ptr_VtVariable->
												$_ptr_xtVariable2:=Get pointer:C304("xNT"+String:C10($_l_Index))
												
												$_ptr_xtVariable2->:=$_r_Difference
											End if 
											
										End for 
										xTot:=xNT1+xNT2+xNT3+xNT4+xNT5+xNT6+xNT7+xNT8+xNT9+xNT10+xNT11+xNT12
										vT1:=xNT1
										vT2:=xNT2
										vT3:=xNT3
										vT4:=xNT4
										vT5:=xNT5
										vT6:=xNT6
										vT7:=xNT7
										vT8:=xNT8
										vT9:=xNT9
										vT10:=xNT10
										vT11:=xNT11
										vT12:=xNT12
										vTot:=xTot
										VHeading:="Currency Fluctuation"
										If (Vtot#0)
											$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PL_Heading12")
											PRT_l_RemainingHeight:=PRT_l_RemainingHeight-$_l_PrintHeight
											
											
										End if 
										
									End if 
									
									PAGE BREAK:C6
								End if 
								
								PRT_SetPrinterPaperOptions(Term_NLWT("P&L 12 Periods"))  //NG June 2005
							Else 
								SEND PACKET:C103("NET PROFT/(LOSS)"+vFld+String:C10(vT1; "|Inverse Accounts")+vFld+String:C10(vT2; "|Inverse Accounts")+vFld+String:C10(vT3; "|Inverse Accounts")+vFld+String:C10(vT4; "|Inverse Accounts")+vFld+String:C10(vT5; "|Inverse Accounts")+vFld+String:C10(vT6; "|Inverse Accounts")+vFld+String:C10(vT7; "|Inverse Accounts")+vFld+String:C10(vT8; "|Inverse Accounts")+vFld+String:C10(vT9; "|Inverse Accounts")+vFld+String:C10(vT10; "|Inverse Accounts")+vFld+String:C10(vT11; "|Inverse Accounts")+vFld+String:C10(vT12; "|Inverse Accounts")+vFld+String:C10(vTot; "|Inverse Accounts")+vRec)
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
ERR_MethodTrackerReturn("ACC_BalPL12"; $_t_oldMethodName)
