//%attributes = {}
If (False:C215)
	//Project Method Name:      Year_Close2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 12:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_ad_FinancialYearTo;0)
	//ARRAY LONGINT(ACC_Al_FinancialYearID;0)
	ARRAY TEXT:C222($_at_AnalCodes2; 0)
	ARRAY TEXT:C222($_at_analysisCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes2; 0)
	ARRAY TEXT:C222($_at_LayerCodes; 0)
	ARRAY TEXT:C222($_at_LayerCodes2; 0)
	ARRAY TEXT:C222($_at_UniqueCodes; 0)
	C_BOOLEAN:C305($_bo_EnterFirstYear; $_bo_unload)
	C_DATE:C307(<>DB_d_CurrentDate; $1)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_DatePosition; $_l_element; $_l_Index; $_l_Index2; $_l_NextYear; $_l_OK; $_l_RecordsInSelection; $_l_SepPosition; $_l_TransPostStatus)
	C_LONGINT:C283($_l_Year; ACC_l_YearID; DS_l_BATCHITEMRef; GEN_CB1; GEN_CB2; vAdd; vNo)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_Choice1; $_t_Choice2; $_t_MessageString; $_t_oldMethodName; $_t_PeriodFrom; $_t_uniqueID; ACC_t_PeriodFrom; ACC_t_PeriodTo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Year_Close2")  //Year_Close2 - done Transaction by Transaction.
$_bo_unload:=(Records in selection:C76([USER:15])=0)
Start_Process
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=4))
	
	$_t_Choice1:=" All required postings have been made to the previous"+" year"
	$_t_Choice2:="Profit & Loss for all periods has been run & allowed posting of the Profit"
	$_l_OK:=GEN_Choices(2; $_t_Choice1; $_t_Choice2)
	
	ACC_LoadFinancialYears(True:C214)  //Added NG 2004
	
	//Gen_Confirm ("Only run this Utility when all required postings have been made to
	$_l_OK:=GEN_CB1
	If ($_l_OK=1)
		$_l_OK:=GEN_CB2
		//Gen_Confirm ("Have you run the Profit & Loss for all periods & allowed posting o
		//NG August 2004...Modifying this section. WHAT IF the year from has ALREADY been entered into the prefs
		If ($_l_OK=1)
			$_bo_EnterFirstYear:=False:C215
			If (Size of array:C274(ACC_ad_FinancialYearFrom)=0)
				Gen_Alert("For historical purposes please confirm the start period of the financial year you"+" a"+"re closing. This MUST be correct!")
				$_t_PeriodFrom:=Gen_Request("First Period for the OLD year:"; ACC_t_PeriodFrom)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodFrom)
				If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
					ARRAY DATE:C224(ACC_ad_FinancialYearFrom; 1)
					ARRAY DATE:C224(ACC_ad_FinancialYearTo; 1)
					ARRAY LONGINT:C221(ACC_Al_FinancialYearID; 1)
					ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
					ACC_Al_FinancialYearID{1}:=ACC_l_YearID
					ACC_ad_FinancialYearFrom{1}:=[PERIODS:33]From_Date:3
					$_bo_EnterFirstYear:=True:C214
				End if 
				
			Else 
				If (Count parameters:C259=0)
					//give the alert and open the admin screen
					
				End if 
				
			End if 
			If (Count parameters:C259=0)
				
				$_l_SepPosition:=Position:C15("/"; <>YrPerF)
				$_l_Year:=Num:C11(Substring:C12(<>YrPerF; 1; $_l_SepPosition-1))
				If (Length:C16(String:C10($_l_Year))=2)
					ACC_t_PeriodFrom:=Substring:C12(String:C10(Num:C11(Substring:C12(<>YrPerF; 1; 2))+1); 1+Num:C11(<>YrPerF="99@"); 2)+Substring:C12(<>YrPerF; 3; 7)
				Else 
					
					$_l_NextYear:=$_l_Year+1
					ACC_t_PeriodFrom:=String:C10($_l_NextYear)+Substring:C12(<>YrPerF; $_l_SepPosition; Length:C16(<>YrPerF))
				End if 
			Else 
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$1)
				ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3)
				FIRST RECORD:C50([PERIODS:33])
				ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
			End if 
			//TRACE
			ACC_t_PeriodFrom:=Gen_Request("First Period for the new year:"; ACC_t_PeriodFrom)
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
			If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
				If ($_bo_EnterFirstYear)  //Added NG August 2004
					ACC_ad_FinancialYearTo{1}:=[PERIODS:33]From_Date:3-1
					//save it
					ACC_LoadFinancialYears
				End if 
				$_l_DatePosition:=Find in array:C230(ACC_ad_FinancialYearFrom; [PERIODS:33]From_Date:3)
				If ($_l_DatePosition<0)  // Added NG August 2004
					INSERT IN ARRAY:C227(ACC_ad_FinancialYearTo; Size of array:C274(ACC_ad_FinancialYearTo)+1; 1)
					INSERT IN ARRAY:C227(ACC_ad_FinancialYearFrom; Size of array:C274(ACC_ad_FinancialYearFrom)+1; 1)
					INSERT IN ARRAY:C227(ACC_Al_FinancialYearID; Size of array:C274(ACC_ad_FinancialYearFrom)+1; 1)
					ACC_l_YearID:=AA_GetNextID(->ACC_l_YearID)
					ACC_Al_FinancialYearID{Size of array:C274(ACC_ad_FinancialYearFrom)}:=ACC_l_YearID
					ACC_ad_FinancialYearFrom{Size of array:C274(ACC_ad_FinancialYearFrom)}:=[PERIODS:33]From_Date:3
				End if 
				If ($_l_DatePosition>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4=ACC_ad_FinancialYearTo{$_l_DatePosition})
					ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
				Else 
					$_l_SepPosition:=Position:C15("/"; <>YrPerT)
					$_l_Year:=Num:C11(Substring:C12(<>YrPerT; 1; $_l_SepPosition-1))
					If (Length:C16(String:C10($_l_Year))=2)
						ACC_t_PeriodTo:=Substring:C12(String:C10(Num:C11(Substring:C12(<>YrPerT; 1; 2))+1); 1+Num:C11(<>YrPerT="99@"); 2)+Substring:C12(<>YrPerT; 3; 7)
					Else 
						
						$_l_NextYear:=$_l_Year+1
						ACC_t_PeriodTo:=String:C10($_l_NextYear)+Substring:C12(<>YrPerT; $_l_SepPosition; Length:C16(<>YrPerT))
					End if 
				End if 
				
				
				ACC_t_PeriodTo:=Gen_Request("Last Period for the new year:"; ACC_t_PeriodTo)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
				If ((OK=1) & (Records in selection:C76([PERIODS:33])=1))
					ACC_ad_FinancialYearTo{Size of array:C274(ACC_ad_FinancialYearTo)}:=[PERIODS:33]To_Date:4
					//SaVE THE BLOB
					ACC_LoadFinancialYears
					
					//this section should be modified to automatically split the analyses/layers etc-NG August 2004
					READ WRITE:C146([TRANSACTIONS:29])
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerProfitACC; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Reconciled:14=False:C215; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12>=<>YrPerF; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=<>YrPerT)
					ARRAY TEXT:C222($_at_analysisCodes; 0)
					ARRAY TEXT:C222($_at_CurrencyCodes; 0)
					ARRAY TEXT:C222($_at_LayerCodes; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Analysis_Code:2; $_at_analysisCodes; [TRANSACTIONS:29]Currency_Code:22; $_at_CurrencyCodes; [TRANSACTIONS:29]Layer_Code:23; $_at_LayerCodes)
					ARRAY TEXT:C222($_at_UniqueCodes; Size of array:C274($_at_analysisCodes))
					ARRAY TEXT:C222($_at_AnalCodes2; Size of array:C274($_at_analysisCodes))
					ARRAY TEXT:C222($_at_CurrencyCodes2; Size of array:C274($_at_analysisCodes))
					ARRAY TEXT:C222($_at_LayerCodes2; Size of array:C274($_at_analysisCodes))
					$_l_element:=0
					For ($_l_Index; 1; Size of array:C274($_at_analysisCodes))
						$_t_uniqueID:=ACC_Buildunique(""; $_at_analysisCodes{$_l_Index}; ""; $_at_LayerCodes{$_l_Index}; $_at_CurrencyCodes{$_l_Index})
						$_l_DatePosition:=Find in array:C230($_at_UniqueCodes; $_t_uniqueID)
						If ($_l_DatePosition<0)
							$_l_element:=$_l_element+1
							$_at_UniqueCodes{$_l_element}:=$_t_uniqueID
							$_at_AnalCodes2{$_l_element}:=$_at_analysisCodes{$_l_Index}
							$_at_LayerCodes2{$_l_element}:=$_at_LayerCodes{$_l_Index}
							$_at_CurrencyCodes{$_l_element}:=$_at_CurrencyCodes{$_l_Index}
						End if 
					End for 
					ARRAY TEXT:C222($_at_UniqueCodes; $_l_element)
					ARRAY TEXT:C222($_at_AnalCodes2; $_l_element)
					ARRAY TEXT:C222($_at_CurrencyCodes2; $_l_element)
					ARRAY TEXT:C222($_at_LayerCodes2; $_l_element)
					vNo:=Records in selection:C76([TRANSACTIONS:29])
					If (vNo>0)
						CREATE SET:C116([TRANSACTIONS:29]; "ToPost")
						If (Size of array:C274($_at_UniqueCodes)>1)
							$_t_MessageString:=""
							For ($_l_Index; 1; Size of array:C274($_at_UniqueCodes))
								USE SET:C118("ToPost")
								QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_at_AnalCodes2{$_l_Index}; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_at_LayerCodes2{$_l_Index}; *)
								QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_at_CurrencyCodes2{$_l_Index})
								$_r_Sum:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
								If ($_at_AnalCodes2{$_l_Index}#"")
									$_t_MessageString:=$_t_MessageString+"There are "+String:C10(Records in selection:C76([TRANSACTIONS:29]))+" Profit/Loss postings to be transferred, with analysis"+$_at_AnalCodes2{$_l_Index}
								Else 
									$_t_MessageString:=$_t_MessageString+"There are "+String:C10(Records in selection:C76([TRANSACTIONS:29]))+" Profit/Loss postings to be transferred, "
								End if 
								If ($_at_LayerCodes2{$_l_Index}#"")
									$_t_MessageString:=$_t_MessageString+", Layer Code "+$_at_LayerCodes2{$_l_Index}
								End if 
								If ($_at_CurrencyCodes{$_l_Index}#"")
									$_t_MessageString:=$_t_MessageString+", Currency Code "+$_at_CurrencyCodes{$_l_Index}
								End if 
								
								$_t_MessageString:=$_t_MessageString+",  with a total value of "+String:C10($_r_Sum; "|Accounts")+Char:C90(13)
								
							End for 
							Gen_Confirm($_t_MessageString+"."+"Go ahead?"; "Yes"; "No")
							
						Else 
							$_r_Sum:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
							Gen_Confirm("There are "+String:C10(vNo)+" Profit/Loss postings to be transferred, with a total value of "+String:C10($_r_Sum; "|Accounts")+Char:C90(13)+"(not corrected for Currencies). Go ahead?"; "Yes"; "No")
						End if 
						If (OK=1)
							Are_You_Sure
							If (OK=1)
								//  START TRANSACTION
								StartTransaction  // 13/05/02 pb
								
								READ WRITE:C146([PERIODS:33])
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=<>YrPerF; *)
								QUERY:C277([PERIODS:33];  & ; [PERIODS:33]Period_Code:1<=<>YrPerT)
								If (Not:C34(In transaction:C397))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]SL_Closed:7:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]PL_Closed:8:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
									DB_lockFile(->[PERIODS:33])
									APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]NL_Closed:5:=True:C214)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
								Else 
									FIRST RECORD:C50([PERIODS:33])
									For ($_l_Index2; 1; Records in selection:C76([PERIODS:33]))
										[PERIODS:33]SL_Closed:7:=True:C214
										[PERIODS:33]PL_Closed:8:=True:C214
										[PERIODS:33]NL_Closed:5:=True:C214
										DB_SaveRecord(->[PERIODS:33])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
										NEXT RECORD:C51([PERIODS:33])
									End for 
								End if 
								
								QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
								[PERIODS:33]NL_Closed:5:=False:C215
								[PERIODS:33]SL_Closed:7:=False:C215
								[PERIODS:33]PL_Closed:8:=False:C215
								DB_SaveRecord(->[PERIODS:33])
								AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
								$_l_TransPostStatus:=0
								For ($_l_Index; 1; Size of array:C274($_at_UniqueCodes))
									USE SET:C118("ToPost")
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_at_AnalCodes2{$_l_Index}; *)
									QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$_at_LayerCodes2{$_l_Index}; *)
									QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$_at_CurrencyCodes{$_l_Index})
									$_r_Sum:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
									READ WRITE:C146([TRANSACTION_BATCHES:30])
									CREATE RECORD:C68([TRANSACTION_BATCHES:30])
									BatchNo
									[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
									[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
									[TRANSACTION_BATCHES:30]Batch_Amount:3:=$_r_Sum
									[TRANSACTION_BATCHES:30]Batch_Total:5:=$_r_Sum
									[TRANSACTION_BATCHES:30]Description:12:="Year_Close transfer of P&L YTD to P&L B'FWD"
									$_l_BatchItemID:=0
									$_l_BatchItemReference:=0
									$_l_RecordsInSelection:=Records in selection:C76([TRANSACTIONS:29])
									$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_RecordsInSelection))-$_l_RecordsInSelection
									$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_RecordsInSelection))-$_l_RecordsInSelection
									
									FIRST RECORD:C50([TRANSACTIONS:29])  //SHould not be needed but makes it clearer
									While (Not:C34(End selection:C36([TRANSACTIONS:29])))
										CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
										If ($_l_BatchItemID>0)
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
											$_l_BatchItemID:=$_l_BatchItemID+1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
										End if 
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="PLYC"
										[TRANSACTION_BATCH_ITEMS:155]Description:10:="Year End transfer of Batch "+String:C10([TRANSACTIONS:29]Batch_Number:7)
										[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerProfitACC
										[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerBroughtforwardACC
										[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[TRANSACTIONS:29]Period_Code:12
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
										[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((0-[TRANSACTIONS:29]Amount:6); 2; 2)
										[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Gen_Round((0-[TRANSACTIONS:29]Tax_Amount:16); 2; 2)
										[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round((0-[TRANSACTIONS:29]Total:17); 2; 2)
										[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
										[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
										[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
										[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
										[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTIONS:29]Analysis_Code:2
										[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[TRANSACTIONS:29]Currency_Code:22
										[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[TRANSACTIONS:29]Layer_Code:23
										
										If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
											If ($_l_BatchItemReference>0)
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
												$_l_BatchItemReference:=$_l_BatchItemReference+1
											Else 
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
											End if 
										End if 
										DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
										
										[TRANSACTIONS:29]Reconciled:14:=True:C214
										DB_SaveRecord(->[TRANSACTIONS:29])
										AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
										NEXT RECORD:C51([TRANSACTIONS:29])
									End while 
									DB_SaveRecord(->[TRANSACTION_BATCHES:30])
									vAdd:=0
									$_l_TransPostStatus:=TransactionBatch_Post
									If ($_l_TransPostStatus<0)
										$_l_Index:=Size of array:C274($_at_UniqueCodes)
									End if 
								End for 
								
								If (OK=1) & ($_l_TransPostStatus>=0)
									READ WRITE:C146([USER:15])
									ALL RECORDS:C47([USER:15])
									FIRST RECORD:C50([USER:15])
									[USER:15]Year PeriodF:22:=ACC_t_PeriodFrom
									<>YrPerF:=ACC_t_PeriodFrom
									[USER:15]Year PeriodT:23:=ACC_t_PeriodTo
									<>YrPerT:=ACC_t_PeriodTo
									DB_SaveRecord(->[USER:15])
								End if 
								
								If (OK=0) | ($_l_TransPostStatus<0)
									Gen_Alert("Year_Close aborted"; "")
									OK:=0
								End if 
								If ($_l_TransPostStatus>=0)
									Transact_End
								Else 
									Transact_End(False:C215)
									
								End if 
								
							Else 
								Gen_Alert("Year_Close aborted"; "")
							End if 
						Else 
							Gen_Alert("Year_Close aborted"; "")
						End if 
					Else 
						Gen_Alert("Year_Close aborted: no Profit/Loss figures need to be transferred"; "")
					End if 
				Else 
					Gen_Alert("Year_Close aborted: please first set up relevant Periods"; "")
				End if 
			Else 
				Gen_Alert("Year_Close aborted: please first set up relevant Periods"; "")
			End if 
		Else 
			Gen_Alert("Year_Close aborted"; "")
		End if 
	Else 
		Gen_Alert("Year_Close aborted"; "")
	End if 
Else 
	Gen_Alert("You do not have access to the General Ledger"; "")
End if 
If ($_bo_unload)
	UNLOAD RECORD:C212([USER:15])
End if 
UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNTS:32])
READ ONLY:C145([USER:15])
READ ONLY:C145([TRANSACTION_BATCHES:30])
READ ONLY:C145([TRANSACTIONS:29])
READ ONLY:C145([PERIODS:33])
Process_End
ERR_MethodTrackerReturn("Year_Close2"; $_t_oldMethodName)
