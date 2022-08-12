//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintTaxReturnPart2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_DataSets;0)
	C_BOOLEAN:C305($_bo_OMPeriod)
	C_LONGINT:C283($_l_ConvertIndex; $_l_CountRecords; $_l_OK; $_l_Process; vAB)
	C_OBJECT:C1216($_obj_esTransactions; $_obj_form; $_obj_formValues; $_obj_TransactionQuery)
	C_REAL:C285($_r_B1; $_r_B2; $_r_B3; $_r_B4; $_r_B5; $_r_B6; $_r_B7; $_r_B8; $_r_B9; $_r_ConvertedAmount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrentActiveDirectory; $_t_oldMethodName; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalCodeT)
	C_TEXT:C284(vText; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17)
	C_TEXT:C284(vTitle18; vTitle19; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8; vTitle9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintTaxReturnPart2")
//ACC_PrintTaxReturnPart2

//Start_Process
//AccBal File
READ ONLY:C145([ACCOUNT_BALANCES:34])
READ ONLY:C145([TRANSACTIONS:29])
While (vAB=1)
	//IDLE  ` 03/04/03 pb
	DB_t_CurrentFormUsage:="VAT"
	vTitle:="VAT RETURN"
	DB_t_CurrentFormUsage2:="NCS"
	ACC_BalSelect
	If (OK=1)
		
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			
			//Find out if there are any Transactions in earlier Periods
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<ACC_t_PeriodFrom; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="")
			ACC_BalGetVatTransactions
			
			//$_obj_esTransactions:=ds.TRANSACTIONS.query("Period_Code =:1 and Tax_Period =:"; $_obj_form.periodFrom; "")
			
			
			
			
			OK:=1
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				Gen_Confirm("NB: This VAT Return will include Transactions from Period(s) prior to "+ACC_t_PeriodFrom+"."+Char:C90(13)+"If you have not already printed Returns prior to this one, "+"you should Cancel and choose to print them instead."; "Continue"; "Cancel")
			End if 
			
			If (OK=1)
				If (Not:C34(SR_ReportOK("AccBalVAT")))
					Open_Pro_Window("VAT Return")
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "VAT Return")
					If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
						If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
							PRINT SETTINGS:C106
							$_l_OK:=OK
						Else 
							$_l_OK:=1
						End if 
					Else 
						$_l_OK:=0
					End if 
					//PAGE SETUP([ACC BALANCES];"VAT Return")
					// PRINT SETTINGS
					If ($_l_OK=1)
						ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Period_Code:4; >)
						vTitle1:="For the period"+Char:C90(13)+ACC_t_PeriodFrom+" to "+ACC_t_PeriodTo
						vTitle2:=DB_GetOrganisationVAT
						If (ACC_t_CurrencyCode#"")
							vTitle3:=ACC_t_CurrencyCode
						Else 
							vTitle3:=<>SYS_t_BaseCurrency
						End if 
						If ((ACC_t_AnalysisCodeFrom="") & (vAnalCodeT=""))
							vTitle4:="All"
						Else 
							If (ACC_t_AnalysisCodeFrom=vAnalCodeT)
								vTitle4:=ACC_t_AnalysisCodeFrom
							Else 
								vTitle4:=ACC_t_AnalysisCodeFrom+" to "+vAnalCodeT
							End if 
						End if 
						If (vText#"")
							vTitle19:=vText
						Else 
							vTitle19:=DB_GetLedgerActualLayer
						End if 
						FIX_VATPERIODCODE(ACC_t_PeriodTo)
						
						//Find out if there is any Old Method data after the start Period
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
						$_bo_OMPeriod:=(Records in selection:C76([TRANSACTIONS:29])>0)
						
						//box 1,6 & 8 - Outputs & Total Outputs & Total EC Outputs
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
						QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18="O@"; *)  //Include Cash VAT Cash (OC)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS")  //Ignore Cash VAT Suspense
						If ($_bo_OMPeriod)
							CREATE SET:C116([TRANSACTIONS:29]; "NM")
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="O"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
							CREATE SET:C116([TRANSACTIONS:29]; "OM")
							UNION:C120("OM"; "NM"; "NM")
							USE SET:C118("NM")
						End if 
						ACC_BalGetVatTransactions
						CREATE SET:C116([TRANSACTIONS:29]; "B1Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						$_r_B1:=Gen_Round((0-(GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Tax_Amount:16))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B1SET"))
							USE SET:C118("B1SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Tax_Amount:16; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B1:=$_r_B1+Gen_Round((0-($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B1SET")
						End if 
						CLEAR SET:C117("B1SET")
						
						
						
						
						
						
						
						Gen_PoundsPence(->vTitle5; ->vTitle6; $_r_B1)
						CREATE SET:C116([TRANSACTIONS:29]; "B6Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						$_r_B6:=Gen_Round((0-(GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Amount:6))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B6SET"))
							USE SET:C118("B6SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Amount:6; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B6:=$_r_B6+Gen_Round((0-($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B6SET")
						End if 
						CLEAR SET:C117("B6SET")
						vTitle15:=String:C10(Gen_Integer($_r_B6))
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]UK_EC:21="E")
						CREATE SET:C116([TRANSACTIONS:29]; "B8Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency)
						$_r_B8:=Gen_Round((0-(GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Amount:6))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B8SET"))
							USE SET:C118("B8SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Amount:6; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B8:=$_r_B8+Gen_Round((0-($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B8SET")
						End if 
						CLEAR SET:C117("B8SET")
						vTitle17:=String:C10(Gen_Integer($_r_B8))
						
						//box 4, 7 - Input VAT, Total Inputs
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
						QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18="I@"; *)  //Include Cash VAT Cash (IC)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)  //Ignore Cash VAT Suspense
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]UK_EC:21="U")
						If ($_bo_OMPeriod)
							CREATE SET:C116([TRANSACTIONS:29]; "NM")
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="I"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
							CREATE SET:C116([TRANSACTIONS:29]; "OM")
							UNION:C120("OM"; "NM"; "NM")
							USE SET:C118("NM")
						End if 
						ACC_BalGetVatTransactions
						CREATE SET:C116([TRANSACTIONS:29]; "B4Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						$_r_B4:=Gen_Round(((GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Tax_Amount:16))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B4SET"))
							USE SET:C118("B4SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Tax_Amount:16; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B4:=$_r_B4+Gen_Round(($_r_ConvertedAmount); 2; 2)
							USE SET:C118("B4SET")
						End if 
						CLEAR SET:C117("B4SET")
						CREATE SET:C116([TRANSACTIONS:29]; "B7Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						
						$_r_B7:=Gen_Round(((GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Amount:6))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B7SET"))
							USE SET:C118("B7SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Amount:6; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B7:=$_r_B7+Gen_Round((($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B7SET")
						End if 
						CLEAR SET:C117("B7SET")
						//2 & 9 - EC Inputs & Total EC Inputs - sep cos not Cash VAT
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
						QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18="I@"; *)  //Include Cash VAT Suspense
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IC"; *)  //Ignore Cash VAT Cash
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]UK_EC:21="E")
						CREATE SET:C116([TRANSACTIONS:29]; "B2Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						$_r_B2:=Gen_Round(((GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Tax_Amount:16))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B2SET"))
							USE SET:C118("B2SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Tax_Amount:16; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B2:=$_r_B2+Gen_Round((($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B2SET")
						End if 
						CLEAR SET:C117("B2SET")
						Gen_PoundsPence(->vTitle7; ->vTitle8; $_r_B2)
						CREATE SET:C116([TRANSACTIONS:29]; "B9Set")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=<>SYS_t_BaseCurrency; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
						$_r_B9:=Gen_Round(((GEN_SUM(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Amount:6))); 2; 2)
						If (Records in selection:C76([TRANSACTIONS:29])<Records in set:C195("B9SET"))
							USE SET:C118("B9SET")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22#<>SYS_t_BaseCurrency; *)
							QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22#"")
							$_r_ConvertedAmount:=0
							For ($_l_ConvertIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								$_r_ConvertedAmount:=$_r_ConvertedAmount+GEN_CONVERT([TRANSACTIONS:29]Currency_Code:22; [TRANSACTIONS:29]Amount:6; [TRANSACTIONS:29]Trans_Date:5)
								
								NEXT RECORD:C51([TRANSACTIONS:29])
							End for 
							$_r_B9:=$_r_B9+Gen_Round((($_r_ConvertedAmount)); 2; 2)
							USE SET:C118("B9SET")
						End if 
						CLEAR SET:C117("B9SET")
						vTitle18:=String:C10(Gen_Integer($_r_B9))
						
						
						$_r_B4:=Gen_Round(($_r_B4+$_r_B2); 2; 2)
						Gen_PoundsPence(->vTitle11; ->vTitle12; $_r_B4)
						$_r_B7:=Gen_Round(($_r_B7+$_r_B9); 2; 2)
						vTitle16:=String:C10(Gen_Integer($_r_B7))
						
						//box 3 - sum of 1 & 2
						$_r_B3:=Gen_Round(($_r_B1+$_r_B2); 2; 2)
						Gen_PoundsPence(->vTitle9; ->vTitle10; $_r_B3)
						
						//box 5 - VAT due
						$_r_B5:=Gen_Round(($_r_B3-$_r_B4); 2; 2)
						Gen_PoundsPence(->vTitle13; ->vTitle14; $_r_B5)
						$_l_OK:=PRINT_SetSIZE("A4"; "P")
						If ($_l_OK>=0)
							Print form:C5([ACCOUNT_BALANCES:34]; "VAT_Return")
							PAGE BREAK:C6
							
							If (OK=1)
								//reselect all VAT Transactions
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
								QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
								// SEARCH SELECTION([TRANSACTIONS]; & ;[TRANSACTIONS]IO#"OS";*)  `mark them anyway
								// SEARCH SELECTION([TRANSACTIONS]; & ;[TRANSACTIONS]IO#"IS")  `& is nec for EC
								If ($_bo_OMPeriod)
									CREATE SET:C116([TRANSACTIONS:29]; "NM")
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
									CREATE SET:C116([TRANSACTIONS:29]; "OM")
									UNION:C120("OM"; "NM"; "NM")
									USE SET:C118("NM")
								End if 
								ACC_BalGetVatTransactions
								//search for those without a Tax Period
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27="")
								$_l_CountRecords:=Records in selection:C76([TRANSACTIONS:29])
								If ($_l_CountRecords>0)
									Gen_Confirm("Was the VAT Return printed correctly?"+Char:C90(13)+"If so, the Tax Period of previously unprinted Transactions will be updated to "+ACC_t_PeriodTo+"."; "Update"; "Cancel")
									If (OK=0)
										Gen_Confirm("NB: If you Cancel these Transactions will be included in the next VAT Return pri"+"nted.  Do you wish to update now after all?"; "Update"; "Cancel")
									End if 
									If (OK=1)
										//WRITE a set out
										CREATE SET:C116([TRANSACTIONS:29]; "VATPSET")
										$_t_CurrentActiveDirectory:=Get 4D folder:C485
										ARRAY LONGINT:C221(WS_al_DataSets; 0)
										LONGINT ARRAY FROM SELECTION:C647([TRANSACTIONS:29]; WS_al_DataSets)
										$_t_CurrentActiveDirectory:=$_t_CurrentActiveDirectory+"VAT RETURNTRANSET"
										
										//SAVE SET("VATPSET";$_t_CurrentActiveDirectory)
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
										READ WRITE:C146([DATA_AUDITS:102])
										QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=-2; *)
										QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]START_DATE:3=[PERIODS:33]To_Date:4)
										
										If (Records in selection:C76([DATA_AUDITS:102])=0)
											
											CREATE RECORD:C68([DATA_AUDITS:102])
											[DATA_AUDITS:102]TABLE_NUMBER:2:=-2
											[DATA_AUDITS:102]START_DATE:3:=[PERIODS:33]To_Date:4
											DB_SaveRecord(->[DATA_AUDITS:102])
											AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
										End if 
										[DATA_AUDITS:102]DOCUMENT_NAME:5:="VAT RETURNTRANSET"
										
										//  If ($platform<3)
										//   DOCUMENT TO BLOB($_t_CurrentActiveDirectory;[DATA_AUDITS]DATA)
										//  Else
										//   DOCUMENT TO BLOB($_t_CurrentActiveDirectory+".4ST";[DATA_AUDITS]DATA)
										//End if  End if
										VARIABLE TO BLOB:C532(WS_al_DataSets; [DATA_AUDITS:102]DATA:6)
										DB_SaveRecord(->[DATA_AUDITS:102])
										AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
										UNLOAD RECORD:C212([DATA_AUDITS:102])
										//READ INTO A BLOB
										CLEAR SET:C117("VATPSET")
										
										//start a process on the server
										If (Application type:C494=4D Remote mode:K5:5)
											
											$_l_Process:=Execute on server:C373("GEN_UPDATETAXPERIOD"; DB_ProcessMemoryinit(1); "UPDATING TAX PERIOD"; [PERIODS:33]To_Date:4; "VAT RETURNTRANSET"; ACC_t_PeriodTo)
											
										Else 
											$_l_Process:=New process:C317("GEN_UPDATETAXPERIOD"; DB_ProcessMemoryinit(1); "UPDATING TAX PERIOD"; [PERIODS:33]To_Date:4; "VAT RETURNTRANSET"; ACC_t_PeriodTo)
											
										End if 
										
									End if 
								End if 
							End if 
							PRT_SetPrinterPaperOptions("VAT Return")  //NG June 2005
						End if 
						If ($_bo_OMPeriod)
							CLEAR SET:C117("NM")
							CLEAR SET:C117("OM")
						End if 
						
					End if 
					Close_ProWin
				End if 
			End if 
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	Else 
		
		vAB:=0
	End if 
	
End while 
//Process_End
ERR_MethodTrackerReturn("ACC_PrintTaxReturnPart2"; $_t_oldMethodName)
