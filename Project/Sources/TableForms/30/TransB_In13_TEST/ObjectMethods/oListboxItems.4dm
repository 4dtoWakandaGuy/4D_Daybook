If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].TransB_In13_TEST.oListboxItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchitemCompanion;0)
	//ARRAY LONGINT(ACC_al_BatchItemCreditID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDebitID;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY TEXT(ACC_at_AnalysisNames;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditIO;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitIO;0)
	//ARRAY TEXT(ACC_at_BatchItemDescription;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode;0)
	//ARRAY TEXT(ACC_at_BatchItemlayerCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchinvno;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxCode;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxUKEC;0)
	//ARRAY TEXT(ACC_at_BatchItemTransTypeCode;0)
	//ARRAY TEXT(ACC_at_CompanyNames;0)
	//ARRAY TEXT(ACC_at_CreditAccountNames;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME;0)
	//ARRAY TEXT(ACC_at_DebitAccountNames;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_BOOLEAN:C305(<>ItementryOpen; $_bo_ProcessVisible; $_bo_Refresh; BAT_bo_UseAreaList)
	C_DATE:C307($_d_TransDate; ACC_D_TransDate)
	C_LONGINT:C283($_l_BatchItemID; $_l_ColumnIndex; $_l_event; $_l_FirstRealLine; $_l_InsertAt; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Process; $_l_ProcessOrigin)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_SelectedRow; $_l_SizeofArray; $_l_TransBatchItemID; $_l_TransCreditID; $_l_TransDebitID; $_l_UniqueProcessID; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WindowTop; $CurrentRealLine; ACC_l_BatchItemID; ACC_l_DisplayedItemNumber; ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; ACC_l_MaxItemNumber; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; DS_l_BATCHITEMRef; MOD_l_CurrentModuleAccess)
	C_REAL:C285($_r_TransAmount; $_r_TransSecondAmt; $_r_TransTaxAmt; $_r_TransTotal; ACC_R_TransAmount; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisNames; $_t_BatchItemAnalysisCode; $_t_CompanyName; $_t_CreditAccountName; $_t_CurrencyName; $_t_DebitAccountName; $_t_LayerName; $_t_oldMethodName; $_t_processName; $_t_TransChequeNo)
	C_TEXT:C284($_t_TransCoCode; $_t_TransCreditAcc; $_t_TransCreditIO; $_t_TransCurrencyCode; $_t_TransDebitAcc; $_t_TransDebitIO; $_t_TransDescription; $_t_TransInvoiceNo; $_t_TransJobCode; $_t_TransLayerCode; $_t_TransPeriodCode)
	C_TEXT:C284($_t_TransPurchCode; $_t_TransPurchinvno; $_t_TransTaxCode; $_t_TransTransCode; $_t_UKEC; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName)
	C_TEXT:C284(ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo)
	C_TEXT:C284(ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTransCode; ACC_t_UKEC; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oListboxItems"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Double Clicked:K2:5)
		//$_l_SelectedRow:=AL_GetLine (ACC_l_SubItems)
		$_l_SelectedRow:=Self:C308->
		If (Size of array:C274(ACC_al_BatchitemCompanion{$_l_SelectedRow})>=1)
			//it should be
			For ($_l_ColumnIndex; 1; Size of array:C274(ACC_al_BatchitemCompanion{$_l_SelectedRow}))
				If (ACC_al_BatchitemCompanion{$_l_SelectedRow}{$_l_ColumnIndex}#0)
					$_l_FirstRealLine:=ACC_al_BatchitemCompanion{$_l_SelectedRow}{$_l_ColumnIndex}
					$_l_ColumnIndex:=Size of array:C274(ACC_al_BatchitemCompanion{$_l_SelectedRow})+1
				End if 
			End for 
			
			//now load the variables and pass them to the sub process
			ACC_R_TransAmount:=ACC_ar_BatchItemAmounts{$_l_FirstRealLine}
			ACC_t_BatchItemAnalysisCode:=ACC_at_BatchItemAnalysisCode{$_l_FirstRealLine}
			ACC_l_TransBatchItemID:=ACC_al_BatchItemID{$_l_FirstRealLine}  //note this is set from this array
			ACC_t_TransChequeNo:=ACC_at_BatchItemChequeNo{$_l_FirstRealLine}
			ACC_t_TransCoCode:=ACC_at_BatchItemCoCode{$_l_FirstRealLine}
			ACC_t_TransCreditAcc:=ACC_at_BatchItemCreditAcc{$_l_FirstRealLine}
			ACC_t_TransCreditIO:=ACC_at_BatchItemCreditIO{$_l_FirstRealLine}
			ACC_l_TransCreditID:=ACC_al_BatchItemCreditID{$_l_FirstRealLine}
			ACC_t_TransCurrencyCode:=ACC_at_BatchItemCurrencyCode{$_l_FirstRealLine}
			ACC_t_TransDebitAcc:=ACC_at_BatchItemDebitAcc{$_l_FirstRealLine}
			ACC_t_TransDebitIO:=ACC_at_BatchItemDebitIO{$_l_FirstRealLine}
			ACC_l_TransDebitID:=ACC_al_BatchItemDebitID{$_l_FirstRealLine}
			ACC_T_TransDescription:=ACC_at_BatchItemDescription{$_l_FirstRealLine}
			ACC_t_TransInvoiceNo:=ACC_at_BatchItemInvoiceNo{$_l_FirstRealLine}
			ACC_t_TransJobCode:=ACC_at_BatchItemJobCode{$_l_FirstRealLine}
			ACC_t_TransLayerCode:=ACC_at_BatchItemlayerCode{$_l_FirstRealLine}
			ACC_t_TransPeriodCode:=ACC_at_BatchItemPeriodCode{$_l_FirstRealLine}
			ACC_t_TransPurchinvno:=ACC_at_BatchItemPurchinvno{$_l_FirstRealLine}
			ACC_t_TransPurchCode:=ACC_at_BatchItemPurchCode{$_l_FirstRealLine}
			ACC_R_TransSecondAmt:=ACC_ar_BatchItemSecondAmt{$_l_FirstRealLine}
			ACC_R_TransTaxAmt:=ACC_ar_BatchItemTaxAmt{$_l_FirstRealLine}
			ACC_t_TransTaxCode:=ACC_at_BatchItemTaxCode{$_l_FirstRealLine}
			ACC_R_TransTotal:=ACC_ar_BatchItemTotal{$_l_FirstRealLine}
			ACC_t_TransTransCode:=ACC_at_BatchItemTransTypeCode{$_l_FirstRealLine}
			ACC_D_TransDate:=ACC_ad_BatchItemTransDate{$_l_FirstRealLine}
			ACC_t_UKEC:=ACC_at_BatchItemTaxUKEC{$_l_FirstRealLine}
			ACC_t_CompanyName:=ACC_at_CompanyNames{$_l_FirstRealLine}  //²
			ACC_t_AnalysisNames:=ACC_at_AnalysisNames{$_l_FirstRealLine}  //²
			ACC_t_LayerName:=ACC_at_LayerNames{$_l_FirstRealLine}
			If (ACC_l_ItemEntryProcess>0)
				PROCESS PROPERTIES:C336(ACC_l_ItemEntryProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
				If ($_l_ProcessState<0) | ($_t_processName#("ItemEntry"+(String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))))
					ACC_l_ItemEntryProcess:=0
				End if 
			End if 
			If (ACC_l_ItemEntryProcess>0)
				$_l_Retries:=0
				While (Semaphore:C143("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)))
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				End while 
				GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; ACC_l_ItemViewContext)
				$_bo_Refresh:=False:C215
				Case of 
					: (ACC_l_ItemViewContext=1)  //Add
						GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransAmount; $_r_TransAmount)
						GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; $_t_TransCreditAcc)
						GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; $_t_TransDebitAcc)
						GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; $_t_TransPeriodCode)
						If (($_t_TransDebitAcc#"") | ($_t_TransCreditAcc#"")) & ($_r_TransAmount>0) & ($_t_TransPeriodCode#"")
							Gen_Confirm("Save Entered batch item?")
							If (OK=1)
								$_bo_Refresh:=True:C214
								$_l_InsertAt:=1
								INSERT IN ARRAY:C227(ACC_ar_BatchItemAmounts; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemAnalysisCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_al_BatchItemID; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemChequeNo; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemCoCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemCreditAcc; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemCreditIO; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_al_BatchItemCreditID; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemCurrencyCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemDebitAcc; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemDebitIO; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_al_BatchItemDebitID; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemDescription; $_l_InsertAt)
								
								INSERT IN ARRAY:C227(ACC_at_BatchItemInvoiceNo; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemJobCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemlayerCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemPeriodCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemPurchinvno; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemPurchCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_ar_BatchItemSecondAmt; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_ar_BatchItemTaxAmt; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemTaxCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_ar_BatchItemTotal; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemTransTypeCode; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_ad_BatchItemTransDate; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_BatchItemTaxUKEC; $_l_InsertAt)
								
								INSERT IN ARRAY:C227(ACC_at_CURRENCYNAME; $_l_InsertAt)
								INSERT IN ARRAY:C227(ACC_at_DebitAccountNames; $_l_InsertAt)  //²
								INSERT IN ARRAY:C227(ACC_at_CreditAccountNames; $_l_InsertAt)  //²
								INSERT IN ARRAY:C227(ACC_at_CompanyNames; $_l_InsertAt)  //²
								INSERT IN ARRAY:C227(ACC_at_AnalysisNames; $_l_InsertAt)  //²
								INSERT IN ARRAY:C227(ACC_at_LayerNames; $_l_InsertAt)  //)²
								INSERT IN ARRAY:C227(ACC_al_BatchItemID; $_l_InsertAt)
								
								//THIS ARRAY IS CHANGED TO A NEGATIVE TO TRACK CHANGED ITEMS
								ACC_al_BatchItemID{1}:=-(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef))
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransAmount; $_r_TransAmount)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_BatchItemAnalysisCode; $_t_BatchItemAnalysisCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; $_l_TransBatchItemID)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransChequeNo; $_t_TransChequeNo)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCoCode; $_t_TransCoCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; $_t_TransCreditAcc)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCreditIO; $_t_TransCreditIO)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransCreditID; $_l_TransCreditID)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCurrencyCode; $_t_TransCurrencyCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; $_t_TransDebitAcc)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransDebitIO; $_t_TransDebitIO)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransDebitID; $_l_TransDebitID)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_T_TransDescription; $_t_TransDescription)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransInvoiceNo; $_t_TransInvoiceNo)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransJobCode; $_t_TransJobCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransLayerCode; $_t_TransLayerCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; $_t_TransPeriodCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPurchinvno; $_t_TransPurchinvno)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPurchCode; $_t_TransPurchCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransSecondAmt; $_r_TransSecondAmt)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransTaxAmt; $_r_TransTaxAmt)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransTaxCode; $_t_TransTaxCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransTotal; $_r_TransTotal)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransTransCode; $_t_TransTransCode)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_D_TransDate; $_d_TransDate)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_UKEC; $_t_UKEC)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CURRENCYNAME; $_t_CURRENCYNAME)
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_DebitAccountName; $_t_DebitAccountName)  //²
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CreditAccountName; $_t_CreditAccountName)  //²
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CompanyName; $_t_CompanyName)  //²
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_AnalysisNames; $_t_AnalysisNames)  //²
								GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_LayerName; $_t_LayerName)  //)²
								ACC_ar_BatchItemAmounts{$_l_InsertAt}:=ACC_R_TransAmount
								ACC_at_BatchItemAnalysisCode{$_l_InsertAt}:=$_t_BatchItemAnalysisCode
								ACC_at_BatchItemChequeNo{$_l_InsertAt}:=$_t_TransChequeNo
								ACC_at_BatchItemCoCode{$_l_InsertAt}:=$_t_TransCoCode
								ACC_at_BatchItemCreditAcc{$_l_InsertAt}:=$_t_TransCreditAcc
								ACC_at_BatchItemCreditIO{$_l_InsertAt}:=$_t_TransCreditIO
								ACC_al_BatchItemCreditID{$_l_InsertAt}:=$_l_TransCreditID
								ACC_at_BatchItemCurrencyCode{$_l_InsertAt}:=$_t_TransCurrencyCode
								ACC_at_BatchItemDebitAcc{$_l_InsertAt}:=$_t_TransDebitAcc
								ACC_at_BatchItemDebitIO{$_l_InsertAt}:=$_t_TransDebitIO
								ACC_al_BatchItemDebitID{$_l_InsertAt}:=$_l_TransDebitID
								ACC_at_BatchItemDescription{$_l_InsertAt}:=$_t_TransDescription
								ACC_at_BatchItemInvoiceNo{$_l_InsertAt}:=$_t_TransInvoiceNo
								ACC_at_BatchItemJobCode{$_l_InsertAt}:=$_t_TransJobCode
								ACC_at_BatchItemlayerCode{$_l_InsertAt}:=$_t_TransLayerCode
								ACC_at_BatchItemPeriodCode{$_l_InsertAt}:=$_t_TransPeriodCode
								ACC_at_BatchItemPurchinvno{$_l_InsertAt}:=$_t_TransPurchinvno
								ACC_at_BatchItemPurchCode{$_l_InsertAt}:=$_t_TransPurchCode
								ACC_ar_BatchItemSecondAmt{$_l_InsertAt}:=$_r_TransSecondAmt
								ACC_ar_BatchItemTaxAmt{$_l_InsertAt}:=$_r_TransTaxAmt
								ACC_at_BatchItemTaxCode{$_l_InsertAt}:=$_t_TransTaxCode
								ACC_ar_BatchItemTotal{$_l_InsertAt}:=$_r_TransTotal
								ACC_at_BatchItemTransTypeCode{$_l_InsertAt}:=$_t_TransTransCode
								ACC_ad_BatchItemTransDate{$_l_InsertAt}:=$_d_TransDate
								ACC_at_BatchItemTaxUKEC{$_l_InsertAt}:=$_t_UKEC
								If (ACC_at_BatchItemCurrencyCode{$_l_InsertAt}#"")
									If ([CURRENCIES:71]Currency_Code:1#ACC_at_BatchItemCurrencyCode{$_l_InsertAt})
										READ ONLY:C145([CURRENCIES:71])
										QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_at_BatchItemCurrencyCode{$_l_InsertAt})
									End if 
									ACC_at_CURRENCYNAME{$_l_InsertAt}:=[CURRENCIES:71]Currency_Name:2
									If (ACC_at_CURRENCYNAME{$_l_InsertAt}="")
										If (ACC_at_BatchItemCurrencyCode{$_l_InsertAt}=<>SYS_t_BaseCurrency)
											ACC_at_CURRENCYNAME{$_l_InsertAt}:="Base"
										Else 
											ACC_at_CURRENCYNAME{$_l_InsertAt}:=$_t_TransCurrencyCode
										End if 
										
									End if 
								End if 
								ACC_at_DebitAccountNames{$_l_InsertAt}:=""
								If (ACC_at_BatchItemDebitAcc{$_l_InsertAt}#"")
									If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemDebitAcc{$_l_InsertAt})
										READ ONLY:C145([ACCOUNTS:32])
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemDebitAcc{$_l_InsertAt})
									End if 
									ACC_at_DebitAccountNames{$_l_InsertAt}:=[ACCOUNTS:32]Account_Name:3
								End if 
								ACC_at_CreditAccountNames{$_l_InsertAt}:=""
								If (ACC_at_BatchItemCreditAcc{$_l_InsertAt}#"")
									If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemCreditAcc{$_l_InsertAt})
										READ ONLY:C145([ACCOUNTS:32])
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemCreditAcc{$_l_InsertAt})
									End if 
									ACC_at_CreditAccountNames{$_l_InsertAt}:=[ACCOUNTS:32]Account_Name:3
								End if 
								
								ACC_at_CompanyNames{$_l_InsertAt}:=$_t_CompanyName  //²
								ACC_at_AnalysisNames{$_l_InsertAt}:=$_t_AnalysisNames  //²
								ACC_at_LayerNames{$_l_InsertAt}:=$_t_LayerName
								
							End if 
						End if 
						
					: (ACC_l_ItemViewContext=3)  // edit
						GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_DisplayedItemNumber; $CurrentRealLine)
						If ($CurrentRealLine#$_l_FirstRealLine)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransAmount; $_r_TransAmount)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_BatchItemAnalysisCode; $_t_BatchItemAnalysisCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; $_l_TransBatchItemID)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransChequeNo; $_t_TransChequeNo)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCoCode; $_t_TransCoCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; $_t_TransCreditAcc)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCreditIO; $_t_TransCreditIO)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransCreditID; $_l_TransCreditID)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransCurrencyCode; $_t_TransCurrencyCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; $_t_TransDebitAcc)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransDebitIO; $_t_TransDebitIO)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_l_TransDebitID; $_l_TransDebitID)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_T_TransDescription; $_t_TransDescription)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransInvoiceNo; $_t_TransInvoiceNo)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransJobCode; $_t_TransJobCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransLayerCode; $_t_TransLayerCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; $_t_TransPeriodCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPurchinvno; $_t_TransPurchinvno)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransPurchCode; $_t_TransPurchCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransSecondAmt; $_r_TransSecondAmt)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransTaxAmt; $_r_TransTaxAmt)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransTaxCode; $_t_TransTaxCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_R_TransTotal; $_r_TransTotal)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_TransTransCode; $_t_TransTransCode)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_D_TransDate; $_d_TransDate)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_UKEC; $_t_UKEC)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CURRENCYNAME; $_t_CURRENCYNAME)
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_DebitAccountName; $_t_DebitAccountName)  //²
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CreditAccountName; $_t_CreditAccountName)  //²
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_CompanyName; $_t_CompanyName)  //²
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_AnalysisNames; $_t_AnalysisNames)  //²
							GET PROCESS VARIABLE:C371(ACC_l_ItemEntryProcess; ACC_t_LayerName; $_t_LayerName)  //)²
							$_l_InsertAt:=Find in array:C230(ACC_al_BatchItemID; ACC_l_TransBatchItemID)
							
							If ($_l_InsertAt>0)  //it should be as we are editing!
								
								If (ACC_at_BatchItemTaxUKEC{$_l_InsertAt}#$_t_UKEC) | ($_d_TransDate#ACC_ad_BatchItemTransDate{$_l_InsertAt}) & ($_t_TransTransCode#ACC_at_BatchItemTransTypeCode{$_l_InsertAt}) | ($_r_TransTotal#ACC_ar_BatchItemTotal{$_l_InsertAt}) | ($_t_TransTaxCode#ACC_at_BatchItemTaxCode{$_l_InsertAt}) | ($_r_TransTaxAmt#ACC_ar_BatchItemTaxAmt{$_l_InsertAt}) | ($_t_TransPurchCode#ACC_at_BatchItemPurchCode{$_l_InsertAt}) | (ACC_at_BatchItemPurchinvno{$_l_InsertAt}#$_t_TransPurchinvno) | ($_t_TransPeriodCode#ACC_at_BatchItemPeriodCode{$_l_InsertAt}) | ($_t_TransLayerCode#ACC_at_BatchItemlayerCode{$_l_InsertAt}) | (ACC_at_BatchItemJobCode{$_l_InsertAt}#$_t_TransJobCode) | ($_t_TransInvoiceNo#ACC_at_BatchItemInvoiceNo{$_l_InsertAt}) | (ACC_at_BatchItemDescription{$_l_InsertAt}#$_t_TransDescription) | ($_t_TransDebitIO#ACC_at_BatchItemDebitIO{$_l_InsertAt}) | ($_t_TransDebitAcc#ACC_at_BatchItemDebitAcc{$_l_InsertAt}) | ($_t_TransCurrencyCode#ACC_at_BatchItemCurrencyCode{$_l_InsertAt}) | (ACC_at_BatchItemCreditIO{$_l_InsertAt}#$_t_TransCreditIO) | ($_t_TransCreditAcc#ACC_at_BatchItemCreditAcc{$_l_InsertAt}) | ($_t_TransCoCode#ACC_at_BatchItemCoCode{$_l_InsertAt}) | ($_t_TransChequeNo#ACC_at_BatchItemChequeNo{$_l_InsertAt}) | ($_t_BatchItemAnalysisCode#ACC_at_BatchItemAnalysisCode{$_l_InsertAt}) | ($_r_TransAmount#ACC_ar_BatchItemAmounts{$_l_InsertAt})
									Gen_Confirm("Save Edited batch item?")
									If (OK=1)
										$_bo_Refresh:=True:C214
										If (ACC_al_BatchItemID{$_l_InsertAt}>0)
											ACC_al_BatchItemID{$_l_InsertAt}:=-(ACC_al_BatchItemID{$_l_InsertAt})  //this is then used to save this
										End if 
										ACC_ar_BatchItemAmounts{$_l_InsertAt}:=$_r_TransAmount
										ACC_at_BatchItemAnalysisCode{$_l_InsertAt}:=$_t_BatchItemAnalysisCode
										ACC_at_BatchItemChequeNo{$_l_InsertAt}:=$_t_TransChequeNo
										ACC_at_BatchItemCoCode{$_l_InsertAt}:=$_t_TransCoCode
										ACC_at_BatchItemCreditAcc{$_l_InsertAt}:=$_t_TransCreditAcc
										ACC_at_BatchItemCreditIO{$_l_InsertAt}:=$_t_TransCreditIO
										ACC_al_BatchItemCreditID{$_l_InsertAt}:=$_l_TransCreditID
										ACC_at_BatchItemCurrencyCode{$_l_InsertAt}:=$_t_TransCurrencyCode
										ACC_at_BatchItemDebitAcc{$_l_InsertAt}:=$_t_TransDebitAcc
										ACC_at_BatchItemDebitIO{$_l_InsertAt}:=$_t_TransDebitIO
										ACC_al_BatchItemDebitID{$_l_InsertAt}:=$_l_TransDebitID
										ACC_at_BatchItemDescription{$_l_InsertAt}:=$_t_TransDescription
										ACC_at_BatchItemInvoiceNo{$_l_InsertAt}:=$_t_TransInvoiceNo
										ACC_at_BatchItemJobCode{$_l_InsertAt}:=$_t_TransJobCode
										ACC_at_BatchItemlayerCode{$_l_InsertAt}:=$_t_TransLayerCode
										ACC_at_BatchItemPeriodCode{$_l_InsertAt}:=$_t_TransPeriodCode
										ACC_at_BatchItemPurchinvno{$_l_InsertAt}:=$_t_TransPurchinvno
										ACC_at_BatchItemPurchCode{$_l_InsertAt}:=$_t_TransPurchCode
										ACC_ar_BatchItemSecondAmt{$_l_InsertAt}:=$_r_TransSecondAmt
										ACC_ar_BatchItemTaxAmt{$_l_InsertAt}:=$_r_TransTaxAmt
										ACC_at_BatchItemTaxCode{$_l_InsertAt}:=$_t_TransTaxCode
										ACC_ar_BatchItemTotal{$_l_InsertAt}:=$_r_TransTotal
										ACC_at_BatchItemTransTypeCode{$_l_InsertAt}:=$_t_TransTransCode
										ACC_ad_BatchItemTransDate{$_l_InsertAt}:=$_d_TransDate
										ACC_at_BatchItemTaxUKEC{$_l_InsertAt}:=$_t_UKEC
										If (ACC_at_BatchItemCurrencyCode{$_l_InsertAt}#"")
											If ([CURRENCIES:71]Currency_Code:1#ACC_at_BatchItemCurrencyCode{$_l_InsertAt})
												READ ONLY:C145([CURRENCIES:71])
												QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_at_BatchItemCurrencyCode{$_l_InsertAt})
											End if 
											ACC_at_CURRENCYNAME{$_l_InsertAt}:=[CURRENCIES:71]Currency_Name:2
											If (ACC_at_CURRENCYNAME{$_l_InsertAt}="")
												If (ACC_at_BatchItemCurrencyCode{$_l_InsertAt}=<>SYS_t_BaseCurrency)
													ACC_at_CURRENCYNAME{$_l_InsertAt}:="Base"
												Else 
													ACC_at_CURRENCYNAME{$_l_InsertAt}:=$_t_TransCurrencyCode
												End if 
												
											End if 
										End if 
										ACC_at_DebitAccountNames{$_l_InsertAt}:=""
										If (ACC_at_BatchItemDebitAcc{$_l_InsertAt}#"")
											If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemDebitAcc{$_l_InsertAt})
												READ ONLY:C145([ACCOUNTS:32])
												QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemDebitAcc{$_l_InsertAt})
											End if 
											ACC_at_DebitAccountNames{$_l_InsertAt}:=[ACCOUNTS:32]Account_Name:3
										End if 
										ACC_at_CreditAccountNames{$_l_InsertAt}:=""
										If (ACC_at_BatchItemCreditAcc{$_l_InsertAt}#"")
											If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemCreditAcc{$_l_InsertAt})
												READ ONLY:C145([ACCOUNTS:32])
												QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemCreditAcc{$_l_InsertAt})
											End if 
											ACC_at_CreditAccountNames{$_l_InsertAt}:=[ACCOUNTS:32]Account_Name:3
										End if 
										
										ACC_at_CompanyNames{$_l_InsertAt}:=$_t_CompanyName  //²
										ACC_at_AnalysisNames{$_l_InsertAt}:=$_t_AnalysisNames  //²
										ACC_at_LayerNames{$_l_InsertAt}:=$_t_LayerName
									End if 
								End if 
								
							End if 
						Else 
							//they have clicked on the same line so just reload without saving
						End if 
						
				End case 
				If ($_bo_Refresh)
					$_l_SizeofArray:=Size of array:C274(ACC_at_LayerNames)
					ACC_TransSetDisplay("Trans_SetDisplay"; $_l_SizeofArray)
					TransB_InLPTot(BAT_bo_UseAreaList)
					
					If (DB_GetLedgerRecalcSingleSide)
						TransB_InCalc(BAT_bo_UseAreaList)
					End if 
				End if 
				
				If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 3)
				Else 
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 2)
				End if 
				
				
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransAmount; ACC_R_TransAmount)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; ACC_l_TransBatchItemID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransChequeNo; ACC_t_TransChequeNo)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCoCode; ACC_t_TransCoCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; ACC_t_TransCreditAcc)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditIO; ACC_t_TransCreditIO)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransCreditID; ACC_l_TransCreditID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; ACC_t_TransDebitAcc)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitIO; ACC_t_TransDebitIO)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransDebitID; ACC_l_TransDebitID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_T_TransDescription; ACC_T_TransDescription)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransEventCode; ACC_t_TransEventCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransInvoiceNo; ACC_t_TransInvoiceNo)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransJobCode; ACC_t_TransJobCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransLayerCode; ACC_t_TransLayerCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; ACC_t_TransPeriodCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchinvno; ACC_t_TransPurchinvno)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchCode; ACC_t_TransPurchCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransSecondAmt; ACC_R_TransSecondAmt)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTaxAmt; ACC_R_TransTaxAmt)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTaxCode; ACC_t_TransTaxCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTotal; ACC_R_TransTotal)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTransCode; ACC_t_TransTransCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_D_TransDate; ACC_D_TransDate)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_UKEC; ACC_t_UKEC)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CURRENCYNAME; ACC_t_CURRENCYNAME)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_DebitAccountName; ACC_t_DebitAccountName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CreditAccountName; ACC_t_CreditAccountName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CompanyName; ACC_t_CompanyName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_AnalysisNames; ACC_t_AnalysisNames)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_LayerName; ACC_t_LayerName)  //)²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_BatchItemID; ACC_l_BatchItemID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_DisplayedItemNumber; $_l_FirstRealLine)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_MaxItemNumber; Size of array:C274(ACC_ar_BatchItemAmounts))
				
				
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("GetNextBatchItem"))
				POST OUTSIDE CALL:C329(ACC_l_ItemEntryProcess)
				
				CLEAR SEMAPHORE:C144("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
			Else 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(ACC_LB_SubItems; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObjectTop:=$_l_ObjectTop+50
				<>ItementryOpen:=False:C215
				ACC_l_ItemEntryProcess:=New process:C317("ACC_BatchItemEntry"; 64000; "ItemEntry"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10); Current process:C322; [TRANSACTION_BATCHES:30]Batch_Number:10; 1; [TRANSACTION_BATCHES:30]State:15; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; MOD_l_CurrentModuleAccess; [TRANSACTION_BATCHES:30]Batch_Date:1; SYS_t_AccessType; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectTop; True:C214)
				$_l_Retries:=0
				Repeat 
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				Until (<>ItementryOpen)
				$_l_Retries:=0
				While (Semaphore:C143("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)))
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				End while 
				If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 3)
				Else 
					SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; 2)
				End if 
				
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransAmount; ACC_R_TransAmount)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; ACC_l_TransBatchItemID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransChequeNo; ACC_t_TransChequeNo)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCoCode; ACC_t_TransCoCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditAcc; ACC_t_TransCreditAcc)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCreditIO; ACC_t_TransCreditIO)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransCreditID; ACC_l_TransCreditID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitAcc; ACC_t_TransDebitAcc)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransDebitIO; ACC_t_TransDebitIO)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_TransDebitID; ACC_l_TransDebitID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_T_TransDescription; ACC_T_TransDescription)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransEventCode; ACC_t_TransEventCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransInvoiceNo; ACC_t_TransInvoiceNo)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransJobCode; ACC_t_TransJobCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransLayerCode; ACC_t_TransLayerCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPeriodCode; ACC_t_TransPeriodCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchinvno; ACC_t_TransPurchinvno)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransPurchCode; ACC_t_TransPurchCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransSecondAmt; ACC_R_TransSecondAmt)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTaxAmt; ACC_R_TransTaxAmt)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTaxCode; ACC_t_TransTaxCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_R_TransTotal; ACC_R_TransTotal)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_TransTransCode; ACC_t_TransTransCode)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_D_TransDate; ACC_D_TransDate)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_UKEC; ACC_t_UKEC)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CURRENCYNAME; ACC_t_CURRENCYNAME)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_DebitAccountName; ACC_t_DebitAccountName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CreditAccountName; ACC_t_CreditAccountName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_CompanyName; ACC_t_CompanyName)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_AnalysisNames; ACC_t_AnalysisNames)  //²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_t_LayerName; ACC_t_LayerName)  //)²
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_BatchItemID; ACC_l_BatchItemID)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_DisplayedItemNumber; $_l_FirstRealLine)
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; ACC_l_MaxItemNumber; Size of array:C274(ACC_ar_BatchItemAmounts))
				
				SET PROCESS VARIABLE:C370(ACC_l_ItemEntryProcess; DB_l_ButtonClickedFunction; 801)
				POST OUTSIDE CALL:C329(ACC_l_ItemEntryProcess)
				
				CLEAR SEMAPHORE:C144("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
			End if 
		End if 
		
		//: (ALProEvt=1)  `single-click
		//: (ALProEvt=-1)  `sort button
		//Got to set the sort here
		//AL_GetSort (ACC_l_SubItems;$_l_Column)
		//Case of
		//:    ($_l_Column=1)
		//SORT ARRAY(ACC_at_BatchItemAnalysisCode;ACC_at_BatchItemlayerCode;ACC_ar_BatchItemAmounts;ACC_al_BatchItemID;ACC_al_BatchItemID;ACC_S21_aTransChequeNo;ACC_at_BatchItemCoCode;ACC_at_BatchItemCreditAcc;ACC_at_BatchItemCreditIO;ACC_al_BatchItemCreditID;ACC_at_BatchItemCurrencyCode;ACC_at_BatchItemDebitAcc;ACC_at_BatchItemDebitIO;ACC_al_BatchItemDebitID;ACC_at_BatchItemDescription;ACC_S11_aTransEventCode;ACC_at_BatchItemInvoiceNo;ACC_at_BatchItemJobCode;ACC_at_BatchItemPeriodCode;ACC_at_BatchItemPurchinvno;ACC_at_BatchItemPurchCode;ACC_ar_BatchItemSecondAmt;ACC_ar_BatchItemTaxAmt;ACC_at_BatchItemTaxCode;ACC_ar_BatchItemTotal;ACC_at_BatchItemTransTypeCode;ACC_ad_BatchItemTransDate;ACC_at_BatchItemTaxUKEC;ACC_at_CURRENCYNAME;ACC_at_DebitAccountNames;ACC_at_CreditAccountNames;ACC_at_CompanyNames;ACC_at_AnalysisNames;ACC_at_LayerNames;>)
		
		//End case
		
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oListboxItems"; $_t_oldMethodName)
