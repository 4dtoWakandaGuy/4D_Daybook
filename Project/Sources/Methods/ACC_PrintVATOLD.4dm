//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintVATOLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($OBal)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vAccName)
	//C_UNKNOWN(vBalance)
	//C_UNKNOWN(vCode)
	//C_UNKNOWN(vTitle)
	//C_UNKNOWN(vTotal)
	C_BOOLEAN:C305($OM)
	C_LONGINT:C283($_l_OK; $_l_Process; $i; vAB; $_l_CountRecords; $_l_OK; $_l_Process)
	C_REAL:C285($OBal; vBalance; vTotal; $IBal)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAccName; vCode; vTitle; $_t_CurrentActiveDirectory; $_t_oldMethodName)
	C_TEXT:C284(ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintVATOLD")
//ACC_PrintVATOLD

Start_Process
ACC_BalFile
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
			OK:=1
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				Gen_Confirm("NB: This VAT Return will include Trans- actions from Period(s) prior to "+ACC_t_PeriodFrom+"."+Char:C90(13)+"If you have not already printed Returns prior to this one, "+"you should Cancel and choose to print them instead."; "Continue"; "Cancel")
			End if 
			
			If (OK=1)
				Open_Pro_Window("VAT Return")
				$_l_OK:=PRINT_SetSIZE("A4"; "P"; "PL_Detail")
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
				
				If ($_l_OK=1)
					ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Period_Code:4; >)
					ACC_BalPrintHeader
					vCode:=""
					vAccName:="Output VAT"
					vTotal:=0
					
					//Find out if there is any Old Method data after the start Period
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
					$OM:=(Records in selection:C76([TRANSACTIONS:29])>0)
					
					//   SEARCH([TRANSACTIONS];[TRANSACTIONS]Tax Period<=ACC_t_PeriodTo;*)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18="O@"; *)  //Include Cash VAT Cash (OC)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS")  //Ignore Cash VAT Suspense
					If ($OM)
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
					
					vBalance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
					$OBal:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
					vTotal:=Gen_Round((vTotal+vBalance); 2; 2)
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail")
					
					vAccName:="Input VAT"
					//       SEARCH([TRANSACTIONS];[TRANSACTIONS]Tax Period<=ACC_t_PeriodTo;*)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18="I@")  //Include Cash VAT Cash (IC)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")  //Ignore Cash VAT Suspense
					If ($OM)
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
					vBalance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
					$IBal:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
					vTotal:=Gen_Round((vTotal+vBalance); 2; 2)
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail")
					
					ACC_BalPrintBlank
					
					vAccName:="Outputs + Inputs Balance"
					vBalance:=vTotal
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
					
					
					vAccName:="All VAT Transactions Balance"
					//  SEARCH([TRANSACTIONS];[TRANSACTIONS]Tax Period<=ACC_t_PeriodTo;*)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>=ACC_t_PeriodFrom; *)
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Tax_Period:27="")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
					If ($OM)
						CREATE SET:C116([TRANSACTIONS:29]; "NM")
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=ACC_t_PeriodFrom; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=ACC_t_PeriodTo; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27="*OM")
						CREATE SET:C116([TRANSACTIONS:29]; "OM")
						UNION:C120("OM"; "NM"; "NM")
						USE SET:C118("NM")
					End if 
					ACC_BalGetVatTransactions
					vBalance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
					
					ACC_CalculateBalance("N")
					vCode:=""
					vAccName:="VAT Account Balance for "+ACC_t_PeriodFrom+"-"+ACC_t_PeriodTo+" only"
					vBalance:=vTotal
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
					
					ACC_BalPrintBlank
					vAccName:="Total Outputs"
					vBalance:=$OBal
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]IO:5="I")
					vAccName:="Total Inputs"
					vBalance:=$IBal
					Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
					PAGE BREAK:C6
					
					If (OK=1)
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27="")
						$_l_CountRecords:=Records in selection:C76([TRANSACTIONS:29])
						If ($_l_CountRecords>0)
							Gen_Confirm("Was the VAT Return printed correctly?"+Char:C90(13)+"If so, the Tax Period of previously unprinted Transactions will be updated to "+ACC_t_PeriodTo+"."; "Update"; "Cancel")
							If (OK=0)
								Gen_Confirm("NB: If you Cancel these Transactions will be included in the next VAT Return pri"+"nted.  Do you wish to update now after all?"; "Update"; "Cancel")
							End if 
							If (OK=1)
								//```````
								
								//WRITE a set out
								CREATE SET:C116([TRANSACTIONS:29]; "VATPSET")
								$_t_CurrentActiveDirectory:=Get 4D folder:C485
								$_t_CurrentActiveDirectory:=$_t_CurrentActiveDirectory+"VAT RETURNTRANSET"
								SAVE SET:C184("VATPSET"; $_t_CurrentActiveDirectory)
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
								DOCUMENT TO BLOB:C525($_t_CurrentActiveDirectory; [DATA_AUDITS:102]DATA:6)
								DB_SaveRecord(->[DATA_AUDITS:102])
								AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
								UNLOAD RECORD:C212([DATA_AUDITS:102])
								//READ INTO A BLOB
								CLEAR SET:C117("VATPSET")
								
								//start a process on the server
								If (Application type:C494=4D Remote mode:K5:5)
									$_l_Process:=Execute on server:C373("GEN_UPDATETAXPERIOD"; DB_ProcessMemoryinit(1); "UPDATING TAX PERIOD"; [PERIODS:33]To_Date:4; "VAT RETURNTRANSET"; ACC_t_PeriodTo)
								Else 
									$_l_Process:=New process:C317("GEN_UPDATETAXPERIOD"; DB_ProcessMemoryinit(3); "UPDATING TAX PERIOD"; [PERIODS:33]To_Date:4; "VAT RETURNTRANSET"; ACC_t_PeriodTo)
									
								End if 
								
								
							End if 
						End if 
					End if 
					
					If ($OM)
						CLEAR SET:C117("NM")
						CLEAR SET:C117("OM")
					End if 
					PRT_SetPrinterPaperOptions("PL_Detail")
				End if 
				Close_ProWin
			End if 
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	Else 
		vAB:=0
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("ACC_PrintVATOLD"; $_t_oldMethodName)
