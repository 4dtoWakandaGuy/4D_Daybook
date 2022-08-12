//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TrialBalanceOLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 18:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305(ACC_bo_RunOld; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_PeriodID; $_l_PrintHeight; $_l_Process; ch6; ch7; i; s1; vAB; vControl; vStockLevel)
	C_REAL:C285($_r_Hamount; $_r_HamountF; $_r_HamountT; vAmount; vAmountF; vAmountT; vANTot; vATot; vBalance; vPNTot; vPTot)
	C_REAL:C285(vValueF; vYNTot; vYTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>YrPerF; $_t_oldMethodName; $_t_OutputCurrency; $_t_ReportHeading; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode)
	C_TEXT:C284(vFld; vHeading; vRec; vStage; vTerms; vText; vTitle; vTitle1; vTitle2; vTitle3; vTitle4)
	C_TEXT:C284(vTitle5)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TrialBalanceOLD")

If (False:C215) | (ACC_bo_RunOld)
	ACC_bo_RunOld:=False:C215
	
	$_l_Process:=Current process:C322
	
	Start_Process
	ACC_BalFile
	READ ONLY:C145([ACCOUNT_BALANCES:34])
	
	While (vAB=1)
		//IDLE  ` 03/04/03 pb
		vTitle:="TRIAL BALANCE "
		DB_t_CurrentFormUsage:="TB"
		ACC_BalSelect
		If (vAB=1)
			If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
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
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4>=<>YrPerF)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Year")
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_t_PeriodTo)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra2")
					DIFFERENCE:C122("Year"; "Extra2"; "Year")
					DIFFERENCE:C122("Master"; "Extra2"; "Master")
					vTitle2:=ACC_t_PeriodTo
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
					vTitle:="TRIAL BALANCE "+[PERIODS:33]Period_Name:2
					vDate:=[PERIODS:33]From_Date:3-1
					$_l_PeriodID:=Check_Period
					vTitle1:=ACC_t_PeriodFrom+" to "+[PERIODS:33]Period_Code:1
					vTitle5:=ACC_t_PeriodFrom+" to "+ACC_t_PeriodTo
					
					If (Not:C34(SR_ReportOK("AccBalTB")))
						Acc_BalRepPS("Trial Balance")
						
						If (OK=1)
							
							Accounts_LaySrc(vText)
							QUERY SELECTION:C341([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
							Accounts_ZeroSr
							ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1; >; [ACCOUNTS:32]Account_Code:2; >)
							
							If (s1=1)
								Print form:C5([HEADINGS:84]; "All_Hdr"; 200)
								
								Print form:C5([HEADINGS:84]; "TB_Header")
								If (ch6=1)
									Print form:C5([HEADINGS:84]; "All_Gap")
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
								
								If ([HEADINGS:84]Heading_Level:3=vValueF)
									$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1+"@"
								Else 
									$_t_ReportHeading:=[ACCOUNTS:32]Report_Heading:1
								End if 
								$_r_HamountF:=0
								$_r_HamountT:=0
								$_r_Hamount:=0
								
								While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Report_Heading:1=$_t_ReportHeading) & (<>SYS_l_CancelProcess#$_l_Process))
									
									vAmountF:=0
									vAmountT:=0
									QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
									CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
									If ([ACCOUNTS:32]PB:4="P")
										INTERSECTION:C121("Year"; "Extra"; "Extra3")
									Else 
										INTERSECTION:C121("Master"; "Extra"; "Extra3")
									End if 
									USE SET:C118("Extra3")
									DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_CurrencyToconvert)
									Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
									vAmountT:=vBalance
									INTERSECTION:C121("Extra2"; "Extra"; "Extra3")
									USE SET:C118("Extra3")
									Calc_Balance2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
									vAmountF:=vBalance
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
												Print form:C5([HEADINGS:84]; "TB_Details")
											End if 
										Else 
											vHeading:=(" "*(vControl+3))+[ACCOUNTS:32]Account_Code:2+(" "*(7-Length:C16([ACCOUNTS:32]Account_Code:2)))+[ACCOUNTS:32]Account_Name:3
											If ((ch7=0) | (vAmountF#0) | (vAmountT#0) | (vAmount#0))
												SEND PACKET:C103(vHeading+vFld+String:C10(vAmountT; "|Accounts")+vFld+String:C10(vAmountF; "|Accounts")+vFld+String:C10(vAmount; "|Accounts")+vRec)
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
										Print form:C5([HEADINGS:84]; "TB_Heading")
										Acc_BalPage(1; 2; "TB_Header")
									Else 
										SEND PACKET:C103(vHeading+vFld+String:C10(vAmountT; "|Accounts")+vFld+String:C10(vAmountF; "|Accounts")+vFld+String:C10(vAmount; "|Accounts")+vRec)
									End if 
								End if 
								
								If ((DB_bo_RecordModified) & ([ACCOUNTS:32]Report_Heading:1#vTerms))
									If (s1=1)
										Print form:C5([HEADINGS:84]; "TB_Subtotal")
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
									Print form:C5([HEADINGS:84]; "TB_Totals")
									PAGE BREAK:C6
								End if 
								PRT_SetPrinterPaperOptions("Trial Balance")  //NG June 2005
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
	Process_End
Else 
	AccBAL_TBMC
	
End if 
ERR_MethodTrackerReturn("ACC_TrialBalanceOLD"; $_t_oldMethodName)
