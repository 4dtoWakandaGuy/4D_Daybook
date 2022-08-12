//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      CM_ReceiptsBalanceReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:             28/04/2011 14:51 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ch0)
	//C_UNKNOWN(CM_PreviousPeriodCOde)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vDate)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vNo2)
	//C_UNKNOWN(vTitle)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	//ARRAY REAL(CM_ar_AD60Day;0)
	//ARRAY REAL(CM_ar_AD90Day;0)
	//ARRAY REAL(CM_ar_ADThirtyDay;0)
	//ARRAY REAL(CM_ar_ADTotal;0)
	//ARRAY REAL(CM_ar_ADZeroDay;0)
	//ARRAY REAL(CM_ar_Balancing;0)
	//ARRAY REAL(CM_ar_CD60Day;0)
	//ARRAY REAL(CM_ar_CD90Day;0)
	//ARRAY REAL(CM_ar_CDThirtyDay;0)
	//ARRAY REAL(CM_ar_CDTotal;0)
	//ARRAY REAL(CM_ar_CDZeroDay;0)
	//ARRAY REAL(CM_ar_Invoices;0)
	//ARRAY REAL(CM_ar_Receipts;0)
	ARRAY TEXT:C222($_at_InvoiceNumber; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	//ARRAY TEXT(CM_at_AnalysisCodes;0)
	//ARRAY TEXT(CM_at_Analysisindex;0)
	//ARRAY TEXT(CM_at_CurrencyCodes;0)
	//ARRAY TEXT(CM_at_Titles;0;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_PdfOutputOK; $_bo_toPDF; $_bo_ToScreenPreview; $_bo_UseInvoiceDate; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DM_bo_CustomSort; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; $_bo_Continue)
	C_BOOLEAN:C305($_bo_NoScript; $_bo_PdfOutputOK; $_bo_toPDF; $_bo_ToScreenPreview; $_bo_UseInvoiceDate; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DM_bo_CustomSort; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_DATE:C307(CM_d_InvoicesPeriodDate; CM_d_PeriodFromDate; vDate; CM_d_InvoicesPeriodDate; CM_d_PeriodFromDate)
	C_LONGINT:C283($_l_AmountsIndex; $_l_CopiesIndex; $_l_CurrencyCodeIndex; $_l_CurrencyIndex; $_l_EmptyCurrencyCodeRow; $_l_Index; $_l_InvoiceNumber; $_l_InvoicesCount; $_l_NumberofCopies; $_l_OK; $_l_PrintDestination)
	C_LONGINT:C283($_l_PrintOptions; $_l_PrintResult; $_l_ReceiptsCount; $_l_ReceiptsIndex; $_l_ReportIndex; $_l_Row; $_l_SizeofArray; $_l_Undescoreposition; ch0; CUR_l_CurrencyPeriod; vNo)
	C_LONGINT:C283(vNo2; $_l_AmountsIndex; $_l_CopiesIndex; $_l_CurrencyCodeIndex; $_l_CurrencyIndex; $_l_EmptyCurrencyCodeRow; $_l_Index; $_l_InvoiceIndex; $_l_InvoiceNumber; $_l_InvoicesCount; $_l_NumberofCopies)
	C_LONGINT:C283($_l_OK; $_l_PrintDestination; $_l_PrintOptions; $_l_PrintResult; $_l_ReceiptsCount; $_l_ReceiptsIndex; $_l_ReportIndex; $_l_Row; $_l_SizeofArray; $_l_Undescoreposition; CUR_l_CurrencyPeriod)
	C_POINTER:C301($_ptr_ReportData; $_ptr_ReportField; $_ptr_ReportData; $_ptr_ReportField)
	C_REAL:C285($_r_AllocatedAmount; $_r_InvoiceAmount; $_r_ReceiptAmount; $_r_TotalConvertedValue; CM_r_0Day; CM_r_30Day; CM_r_60Day; CM_r_90Day; CM_r_Total; CM_r_TotalInvoiced; CM_r_TotalReceved)
	C_REAL:C285($_r_AllocatedAmount; $_r_ConversionRate; $_r_InvoiceAmount; $_r_ReceiptAmount; $_r_TotalConvertedValue; CM_r_0Day; CM_r_30Day; CM_r_60Day; CM_r_90Day; CM_r_Total; CM_r_TotalInvoiced)
	C_REAL:C285(CM_r_TotalReceved)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_AnalysisName; $_t_CurrencyCode; $_t_CurrentPrinter; $_t_DestinationFileName; $_t_ErrorHandlingMethod; $_t_oldMethodName; $_t_OutputCurrencyCode; $_t_PdfOutputFilePath; $_t_ReportDataXML)
	C_TEXT:C284(Acc_t_AccountCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; CM_PreviousPeriodCOde; CM_t_ReceiptsPeriod; DB_t_CurrentFormUsage; vCallCode; vTitle; <>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_AnalysisName)
	C_TEXT:C284($_t_CurrencyCode; $_t_CurrentPrinter; $_t_DestinationFileName; $_t_ErrorHandlingMethod; $_t_oldMethodName; $_t_OutputCurrencyCode; $_t_PdfOutputFilePath; $_t_ReportDataXML; Acc_t_AccountCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom)
	C_TEXT:C284(CM_t_ReceiptsPeriod; DB_t_CurrentFormUsage)
	C_TIME:C306($_ti_DocumentRef; $_ti_Time; $_ti_DocumentRef; $_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CM_ReceiptsBalanceReport")

ARRAY TEXT:C222(CM_at_Analysisindex; 0)
ARRAY TEXT:C222(CM_at_Titles; 0; 0)
ARRAY REAL:C219(CM_ar_ADZeroDay; 0)
ARRAY REAL:C219(CM_ar_ADThirtyDay; 0)  //Aged debt as at last period
ARRAY REAL:C219(CM_ar_AD60Day; 0)
ARRAY REAL:C219(CM_ar_AD90Day; 0)
ARRAY REAL:C219(CM_ar_ADTotal; 0)

ARRAY REAL:C219(CM_ar_CDZeroDay; 0)
ARRAY REAL:C219(CM_ar_CDThirtyDay; 0)  //Aged debt as end date('current') period
ARRAY REAL:C219(CM_ar_CD60Day; 0)
ARRAY REAL:C219(CM_ar_CD90Day; 0)
ARRAY REAL:C219(CM_ar_CDTotal; 0)
ARRAY REAL:C219(CM_ar_Receipts; 0)  //Receipts in the 'current' period
ARRAY REAL:C219(CM_ar_Invoices; 0)  //Invoices_In the 'current' period
ARRAY REAL:C219(CM_ar_Balancing; 0)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
If (CM_d_InvoicesPeriodDate=!00-00-00!)
	CM_d_InvoicesPeriodDate:=Gen_RequestDate("Enter the date this report should run to :"; Is date:K8:7; (Current date:C33); "Continue"; "Stop")
	If (OK=0)
		CM_d_InvoicesPeriodDate:=!00-00-00!
	End if 
End if 
If (CM_d_InvoicesPeriodDate#!00-00-00!)
	QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=CM_d_InvoicesPeriodDate; *)
	QUERY:C277([PERIODS:33];  & ; [PERIODS:33]From_Date:3<=CM_d_InvoicesPeriodDate)
	If (Records in selection:C76([PERIODS:33])>0)
		If ([PERIODS:33]To_Date:4>CM_d_InvoicesPeriodDate)
			Gen_Alert("Note that this report will run to the end of the accounting period "+[PERIODS:33]Period_Code:1+" Which is dated "+String:C10([PERIODS:33]To_Date:4))
			CM_d_InvoicesPeriodDate:=[PERIODS:33]To_Date:4
		End if 
		CM_t_ReceiptsPeriod:=[PERIODS:33]Period_Code:1
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=CM_d_InvoicesPeriodDate)
		DISTINCT VALUES:C339([INVOICES:39]Analysis_Code:17; CM_at_AnalysisCodes)
		
		//ARRAY TEXT(CM_at_AnalysisCodes;1)
		//CM_at_AnalysisCodes{1}:="EN"
		DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; CM_at_CurrencyCodes)
		$_l_EmptyCurrencyCodeRow:=Find in array:C230(CM_at_CurrencyCodes; "")
		If ($_l_EmptyCurrencyCodeRow>0)
			DELETE FROM ARRAY:C228(CM_at_CurrencyCodes; $_l_EmptyCurrencyCodeRow)
		End if 
		
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#1)
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)
		QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=3; *)
		QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
		COPY NAMED SELECTION:C331([INVOICES:39]; "ForAgedDebtors")
		
		//We will now run the aged debtors for each of these analysis codes for the PREIOUS PERIOD
		CM_d_PeriodFromDate:=[PERIODS:33]From_Date:3
		QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4<CM_d_PeriodFromDate)
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; <)
		FIRST RECORD:C50([PERIODS:33])
		CM_PreviousPeriodCOde:=[PERIODS:33]Period_Code:1
		vDate:=[PERIODS:33]To_Date:4  //This is the aged debtors as at date
		ACC_t_PeriodFrom:=""
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
		Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Debit_Account:4
		If (True:C214)
			For ($_l_ReportIndex; 1; Size of array:C274(CM_at_AnalysisCodes))
				For ($_l_CurrencyIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
					//These are not converted
					$_l_Row:=Find in array:C230(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					If ($_l_Row<0)
						APPEND TO ARRAY:C911(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
						$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
						If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
							//something is wrong
							//TRACE
						End if 
						$_l_SizeofArray:=$_l_SizeofArray+1
						INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
						INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
						
						INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
						INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
						
						INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
						INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
						INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
						//`````
						$_l_Row:=Size of array:C274(CM_ar_Balancing)
					End if 
					USE NAMED SELECTION:C332("ForAgedDebtors")
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
					If (CM_at_CurrencyCodes{$_l_CurrencyIndex}=<>SYS_t_BaseCurrency)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex}; *)
						QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
					Else 
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex})
					End if 
					CREATE SET:C116([INVOICES:39]; "$Temp")
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5#0)
					CREATE SET:C116([INVOICES:39]; "LocalQuery")
					USE SET:C118("$Temp")
					//QUERY([INVOICES];[INVOICES]Total Invoiced=0)
					//QUERY([ACCOUNTS];[ACCOUNTS]Account Code=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5=0)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0)
					CREATE SET:C116([INVOICES:39]; "LocalQuery2")
					UNION:C120("LocalQuery"; "LocalQuery2"; "LocalQuery")
					CLEAR SET:C117("LocalQuery2")
					QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
					QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
					CREATE SET:C116([INVOICES:39]; "ServerQuery")
					INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
					USE SET:C118("LocalQuery")
					CLEAR SET:C117("LocalQuery")
					CLEAR SET:C117("ServerQuery")
					
					If (Records in selection:C76([INVOICES:39])>0)
						ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 1)
						CUR_at_CurrencyToconvert{1}:=CM_at_CurrencyCodes{$_l_CurrencyIndex}
						CB_bo_ConvertAtOldRate:=True:C214
						CB_bo_ConvertAtOlderRate:=True:C214
						
						vNo:=Records in selection:C76([INVOICES:39])
						vNo2:=vNo
						DB_t_CurrentFormUsage:="Print"
						ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
						CREATE SET:C116([INVOICES:39]; "PrintSelection")
						$_t_OutputCurrencyCode:=CM_at_CurrencyCodes{$_l_CurrencyIndex}
						If (Records in selection:C76([INVOICES:39])>0)
							DB_t_CurrentFormUsage:="AA"
							vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Debtors Acc: ")+Acc_t_AccountCodeFrom
							If (OK=1)
								If ($_t_OutputCurrencyCode#<>SYS_t_BaseCurrency)
									vCallCode:=$_t_OutputCurrencyCode
								End if 
								ch0:=1
								ACC_t_CurrencyCode:=CUR_at_CurrencyToconvert{1}
								vTitle:=vTitle+Char:C90(13)+CurrConv_Title($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert)
								If ($_t_OutputCurrencyCode#"")
									DM_bo_CustomSort:=True:C214
									
									$_ti_Time:=?00:00:00?
									COPY NAMED SELECTION:C331([INVOICES:39]; "$Temp")
									Invoices_AD2($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate; False:C215; 1; $_ti_Time; ->CM_r_0Day; ->CM_r_30Day; ->CM_r_60Day; ->CM_r_90Day; ->CM_r_Total)
									CM_ar_ADZeroDay{$_l_Row}:=CM_r_0Day
									CM_ar_ADThirtyDay{$_l_Row}:=CM_r_30Day
									CM_ar_AD60Day{$_l_Row}:=CM_r_60Day
									CM_ar_AD90Day{$_l_Row}:=CM_r_90Day
									CM_ar_ADTotal{$_l_Row}:=CM_r_Total
									
									USE NAMED SELECTION:C332("$Temp")
									//Invoices_AD2 ($_t_OutputCurrencyCode;->CUR_at_CurrencyToconvert;CB_bo_ConvertAtOldRate)
									
								End if 
							End if 
						End if 
					Else 
						
					End if 
					
					
					
					
					
				End for 
				//here do combined currency report
				$_l_Row:=Find in array:C230(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				If ($_l_Row<0)
					APPEND TO ARRAY:C911(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
					If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
						//something is wrong
						//TRACE
					End if 
					$_l_SizeofArray:=$_l_SizeofArray+1
					INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
					INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
					INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
					//`````
					$_l_Row:=Size of array:C274(CM_ar_Balancing)
				End if 
				USE NAMED SELECTION:C332("ForAgedDebtors")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
				
				CREATE SET:C116([INVOICES:39]; "$Temp")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5#0)
				CREATE SET:C116([INVOICES:39]; "LocalQuery")
				USE SET:C118("$Temp")
				//QUERY([INVOICES];[INVOICES]Total Invoiced=0)
				//QUERY([ACCOUNTS];[ACCOUNTS]Account Code=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5=0)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0)
				CREATE SET:C116([INVOICES:39]; "LocalQuery2")
				UNION:C120("LocalQuery"; "LocalQuery2"; "LocalQuery")
				CLEAR SET:C117("LocalQuery2")
				QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
				QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
				CREATE SET:C116([INVOICES:39]; "ServerQuery")
				INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
				USE SET:C118("LocalQuery")
				CLEAR SET:C117("LocalQuery")
				CLEAR SET:C117("ServerQuery")
				If (Records in selection:C76([INVOICES:39])>0)
					ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 1)
					For ($_l_CurrencyCodeIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
						APPEND TO ARRAY:C911(CUR_at_CurrencyToconvert; CM_at_CurrencyCodes{$_l_CurrencyCodeIndex})
					End for 
					CB_bo_ConvertAtOldRate:=False:C215
					CB_bo_ConvertAtOlderRate:=True:C214
					
					vNo:=Records in selection:C76([INVOICES:39])
					vNo2:=vNo
					DB_t_CurrentFormUsage:="Print"
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					CREATE SET:C116([INVOICES:39]; "PrintSelection")
					$_t_OutputCurrencyCode:="R"
					If (Records in selection:C76([INVOICES:39])>0)
						DB_t_CurrentFormUsage:="AA"
						vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Debtors Acc: ")+Acc_t_AccountCodeFrom
						If (OK=1)
							If ($_t_OutputCurrencyCode#<>SYS_t_BaseCurrency)
								vCallCode:=$_t_OutputCurrencyCode
							End if 
							ch0:=1
							ACC_t_CurrencyCode:=""
							vTitle:=vTitle+Char:C90(13)+CurrConv_Title($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert)
							If ($_t_OutputCurrencyCode#"")
								DM_bo_CustomSort:=True:C214
								$_ti_Time:=?00:00:00?
								COPY NAMED SELECTION:C331([INVOICES:39]; "$Temp")
								Invoices_AD2($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate; False:C215; 1; $_ti_Time; ->CM_r_0Day; ->CM_r_30Day; ->CM_r_60Day; ->CM_r_90Day; ->CM_r_Total)
								CM_ar_ADZeroDay{$_l_Row}:=CM_r_0Day
								CM_ar_ADThirtyDay{$_l_Row}:=CM_r_30Day
								CM_ar_AD60Day{$_l_Row}:=CM_r_60Day
								CM_ar_AD90Day{$_l_Row}:=CM_r_90Day
								CM_ar_ADTotal{$_l_Row}:=CM_r_Total
								USE NAMED SELECTION:C332("$Temp")
								//Invoices_AD2 ($_t_OutputCurrencyCode;->CUR_at_CurrencyToconvert;CB_bo_ConvertAtOldRate)
								
							End if 
						End if 
					End if 
					
				Else 
					
				End if 
				
				
			End for 
			//`` now repeat the same for the current mornth
			vDate:=CM_d_InvoicesPeriodDate  //This is the aged debtors as at date
			ACC_t_PeriodFrom:=""
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
			Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Debit_Account:4
			For ($_l_ReportIndex; 1; Size of array:C274(CM_at_AnalysisCodes))
				For ($_l_CurrencyIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
					$_l_Row:=Find in array:C230(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					If ($_l_Row<0)
						APPEND TO ARRAY:C911(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
						$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
						If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
							//something is wrong
							//TRACE
						End if 
						$_l_SizeofArray:=$_l_SizeofArray+1
						INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
						INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
						
						INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
						INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
						
						INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
						INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
						INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
						//`````
						$_l_Row:=Size of array:C274(CM_ar_Balancing)
					End if 
					USE NAMED SELECTION:C332("ForAgedDebtors")
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
					If (CM_at_CurrencyCodes{$_l_CurrencyIndex}=<>SYS_t_BaseCurrency)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex}; *)
						QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
					Else 
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex})
					End if 
					CREATE SET:C116([INVOICES:39]; "$Temp")
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5#0)
					CREATE SET:C116([INVOICES:39]; "LocalQuery")
					USE SET:C118("$Temp")
					//QUERY([INVOICES];[INVOICES]Total Invoiced=0)
					//QUERY([ACCOUNTS];[ACCOUNTS]Account Code=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5=0)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0)
					CREATE SET:C116([INVOICES:39]; "LocalQuery2")
					UNION:C120("LocalQuery"; "LocalQuery2"; "LocalQuery")
					CLEAR SET:C117("LocalQuery2")
					QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
					QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
					CREATE SET:C116([INVOICES:39]; "ServerQuery")
					INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
					USE SET:C118("LocalQuery")
					CLEAR SET:C117("LocalQuery")
					CLEAR SET:C117("ServerQuery")
					
					If (Records in selection:C76([INVOICES:39])>0)
						ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 1)
						CUR_at_CurrencyToconvert{1}:=CM_at_CurrencyCodes{$_l_CurrencyIndex}
						CB_bo_ConvertAtOldRate:=True:C214
						CB_bo_ConvertAtOlderRate:=True:C214
						
						vNo:=Records in selection:C76([INVOICES:39])
						vNo2:=vNo
						DB_t_CurrentFormUsage:="Print"
						ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
						CREATE SET:C116([INVOICES:39]; "PrintSelection")
						$_t_OutputCurrencyCode:=CM_at_CurrencyCodes{$_l_CurrencyIndex}
						If (Records in selection:C76([INVOICES:39])>0)
							DB_t_CurrentFormUsage:="AA"
							vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Debtors Acc: ")+Acc_t_AccountCodeFrom
							If (OK=1)
								If ($_t_OutputCurrencyCode#<>SYS_t_BaseCurrency)
									vCallCode:=$_t_OutputCurrencyCode
								End if 
								ch0:=1
								ACC_t_CurrencyCode:=CUR_at_CurrencyToconvert{1}
								vTitle:=vTitle+Char:C90(13)+CurrConv_Title($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert)
								If ($_t_OutputCurrencyCode#"")
									DM_bo_CustomSort:=True:C214
									
									$_ti_Time:=?00:00:00?
									Invoices_AD2($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate; False:C215; 1; $_ti_Time; ->CM_r_0Day; ->CM_r_30Day; ->CM_r_60Day; ->CM_r_90Day; ->CM_r_Total)
									CM_ar_CDZeroDay{$_l_Row}:=CM_r_0Day
									CM_ar_CDThirtyDay{$_l_Row}:=CM_r_30Day
									CM_ar_CD60Day{$_l_Row}:=CM_r_60Day
									CM_ar_CD90Day{$_l_Row}:=CM_r_90Day
									CM_ar_CDTotal{$_l_Row}:=CM_r_Total
									
								End if 
							End if 
						End if 
					Else 
						
					End if 
					
					
					
					
					
				End for 
				//here do combined currency report
				$_l_Row:=Find in array:C230(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				If ($_l_Row<0)
					APPEND TO ARRAY:C911(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
					If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
						//something is wrong
						//TRACE
					End if 
					$_l_SizeofArray:=$_l_SizeofArray+1
					INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
					INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
					INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
					//`````
					$_l_Row:=Size of array:C274(CM_ar_Balancing)
				End if 
				USE NAMED SELECTION:C332("ForAgedDebtors")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
				
				CREATE SET:C116([INVOICES:39]; "$Temp")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5#0)
				CREATE SET:C116([INVOICES:39]; "LocalQuery")
				USE SET:C118("$Temp")
				//QUERY([INVOICES];[INVOICES]Total Invoiced=0)
				//QUERY([ACCOUNTS];[ACCOUNTS]Account Code=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Vdate)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5=0)
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0)
				CREATE SET:C116([INVOICES:39]; "LocalQuery2")
				UNION:C120("LocalQuery"; "LocalQuery2"; "LocalQuery")
				CLEAR SET:C117("LocalQuery2")
				QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
				QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
				CREATE SET:C116([INVOICES:39]; "ServerQuery")
				INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
				USE SET:C118("LocalQuery")
				CLEAR SET:C117("LocalQuery")
				CLEAR SET:C117("ServerQuery")
				If (Records in selection:C76([INVOICES:39])>0)
					ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 1)
					For ($_l_CurrencyCodeIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
						APPEND TO ARRAY:C911(CUR_at_CurrencyToconvert; CM_at_CurrencyCodes{$_l_CurrencyCodeIndex})
					End for 
					CB_bo_ConvertAtOldRate:=False:C215
					CB_bo_ConvertAtOlderRate:=True:C214
					
					vNo:=Records in selection:C76([INVOICES:39])
					vNo2:=vNo
					DB_t_CurrentFormUsage:="Print"
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					CREATE SET:C116([INVOICES:39]; "PrintSelection")
					$_t_OutputCurrencyCode:="R"
					If (Records in selection:C76([INVOICES:39])>0)
						DB_t_CurrentFormUsage:="AA"
						vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Debtors Acc: ")+Acc_t_AccountCodeFrom
						If (OK=1)
							If ($_t_OutputCurrencyCode#<>SYS_t_BaseCurrency)
								vCallCode:=$_t_OutputCurrencyCode
							End if 
							ch0:=1
							ACC_t_CurrencyCode:=""
							vTitle:=vTitle+Char:C90(13)+CurrConv_Title($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert)
							If ($_t_OutputCurrencyCode#"")
								DM_bo_CustomSort:=True:C214
								
								$_ti_Time:=?00:00:00?
								Invoices_AD2($_t_OutputCurrencyCode; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate; False:C215; 1; $_ti_Time; ->CM_r_0Day; ->CM_r_30Day; ->CM_r_60Day; ->CM_r_90Day; ->CM_r_Total)
								CM_ar_CDZeroDay{$_l_Row}:=CM_r_0Day
								CM_ar_CDThirtyDay{$_l_Row}:=CM_r_30Day
								CM_ar_CD60Day{$_l_Row}:=CM_r_60Day
								CM_ar_CD90Day{$_l_Row}:=CM_r_90Day
								CM_ar_CDTotal{$_l_Row}:=CM_r_Total
								
							End if 
						End if 
					End if 
					
				Else 
					
				End if 
				
				
				
			End for 
		End if 
		//End if
		//Now Create the receipts report.-this is for receipts
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1="*R@"; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Period_Code:13=CM_t_ReceiptsPeriod)
		COPY NAMED SELECTION:C331([INVOICES:39]; "ReceiptsSelection")
		
		For ($_l_ReportIndex; 1; Size of array:C274(CM_at_AnalysisCodes))
			USE NAMED SELECTION:C332("ReceiptsSelection")
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
			COPY NAMED SELECTION:C331([INVOICES:39]; "ByAnal")
			//$_ti_DocumentRef:=Create document("";"TEXT")
			For ($_l_CurrencyIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
				USE NAMED SELECTION:C332("ByAnal")
				If (CM_at_CurrencyCodes{$_l_CurrencyIndex}=<>SYS_t_BaseCurrency)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex}; *)
					QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
				Else 
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex})
				End if 
				$_l_Row:=Find in array:C230(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				If ($_l_Row<0)
					APPEND TO ARRAY:C911(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
					If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
						//something is wrong
						//TRACE
					End if 
					$_l_SizeofArray:=$_l_SizeofArray+1
					INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
					INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
					INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
					//`````
					$_l_Row:=Size of array:C274(CM_ar_Balancing)
				End if 
				//This is simple just the sum of the values
				//CM_ar_Receipts{$_l_Row}:=Sum([INVOICES]Total Paid)
				SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
				QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumbers)
				SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationAmounts; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_InvoiceNumbers)
				$_r_AllocatedAmount:=0
				For ($_l_InvoiceNumber; 1; Size of array:C274($_ar_AllocationAmounts))
					If ($_at_InvoiceNumbers{$_l_InvoiceNumber}#"*D@")
						$_r_AllocatedAmount:=$_r_AllocatedAmount+$_ar_AllocationAmounts{$_l_InvoiceNumber}
					End if 
				End for 
				CM_ar_Receipts{$_l_Row}:=$_r_AllocatedAmount
			End for 
			//and a combined one-more complex as have to convert the amounts to R
			USE NAMED SELECTION:C332("ByAnal")
			$_l_Row:=Find in array:C230(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
			If ($_l_Row<0)
				APPEND TO ARRAY:C911(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
				If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
					//something is wrong
					//TRACE
				End if 
				$_l_SizeofArray:=$_l_SizeofArray+1
				INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
				INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
				
				INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
				INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
				
				INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
				INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
				INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
				$_l_Row:=Size of array:C274(CM_ar_Balancing)
			End if 
			CM_r_TotalReceved:=0
			$_l_ReceiptsCount:=Records in selection:C76([INVOICES:39])
			For ($_l_ReceiptsIndex; 1; $_l_ReceiptsCount)
				USE NAMED SELECTION:C332("ByAnal")
				GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_ReceiptsIndex)
				If ([INVOICES:39]Currency_Code:27="") | ([INVOICES:39]Currency_Code:27="R")
					//CM_r_TotalReceved:=CM_r_TotalReceved+[INVOICES]Total Paid
					//SEND PACKET($_ti_DocumentRef;[INVOICES]Invoice No+Char(9)+[INVOICES]Company Code+Char(9)+String([INVOICES]Total Paid)+Char(13))
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationAmounts; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_InvoiceNumbers)
					$_r_AllocatedAmount:=0
					For ($_l_AmountsIndex; 1; Size of array:C274($_ar_AllocationAmounts))
						If ($_at_InvoiceNumbers{$_l_AmountsIndex}#"*D@")
							$_r_AllocatedAmount:=$_r_AllocatedAmount+$_ar_AllocationAmounts{$_l_AmountsIndex}
						End if 
					End for 
					CM_r_TotalReceved:=CM_r_TotalReceved+$_r_AllocatedAmount
				Else 
					$_r_ReceiptAmount:=[INVOICES:39]Total_Paid:6
					$_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationAmounts; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_InvoiceNumbers)
					//ARRAY REAL($rConvertedAmounts;
					$_r_ConversionRate:=1
					$_bo_UseInvoiceDate:=False:C215
					$_r_TotalConvertedValue:=0
					For ($_l_InvoiceIndex; 1; Size of array:C274($_ar_AllocationAmounts))
						If ($_at_InvoiceNumbers{$_l_InvoiceIndex}#"*D@")
							QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=$_at_InvoiceNumbers{$_l_InvoiceIndex}; *)
							QUERY:C277([INVOICES_ITEMS:161];  & ; [INVOICES_ITEMS:161]Item_Number:12#0)
							If (Records in selection:C76([INVOICES_ITEMS:161])>0)
								//We will only use the first one
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[INVOICES_ITEMS:161]Item_Number:12; *)
								QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=$_at_InvoiceNumbers{$_l_InvoiceIndex})
								If (Records in selection:C76([ORDER_ITEMS:25])>0)
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									If (Records in selection:C76([ORDERS:24])>0)
										$_r_ConversionRate:=Num:C11(FurthFld_Get("ORDER ITEMS"; "Dollar Rate"))
										If ($_r_ConversionRate=0)
											CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([ORDERS:24]Order_Date:4); Year of:C25([ORDERS:24]Order_Date:4)))
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="R"; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2="US$"; *)
											QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
											QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=[ORDERS:24]Order_Date:4)
											ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
											$_r_ConversionRate:=[CURRENCY_RATES:72]Rate:3
										End if 
										
									Else 
										$_bo_UseInvoiceDate:=True:C214
									End if 
								Else 
									$_bo_UseInvoiceDate:=True:C214
								End if 
							Else 
								$_bo_UseInvoiceDate:=True:C214
							End if 
							If ($_bo_UseInvoiceDate=True:C214)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_InvoiceIndex})
								
								CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([INVOICES:39]Invoice_Date:4); Year of:C25([INVOICES:39]Invoice_Date:4)))
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="R"; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2="US$"; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=[INVOICES:39]Invoice_Date:4)
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
								$_r_ConversionRate:=[CURRENCY_RATES:72]Rate:3
								
							End if 
							$_r_TotalConvertedValue:=$_r_TotalConvertedValue+Gen_Round((($_ar_AllocationAmounts{$_l_InvoiceIndex}/$_r_ConversionRate)); 0)
						End if 
					End for 
					CM_r_TotalReceved:=CM_r_TotalReceved+$_r_TotalConvertedValue
				End if 
			End for 
			//Close DocUMENT($_ti_DocumentRef)
			
			CM_ar_Receipts{$_l_Row}:=CM_r_TotalReceved
		End for 
		//Now Create the invoices Report
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1#"*R@"; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*D@"; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Period_Code:13=CM_t_ReceiptsPeriod)
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#1)
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)
		QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=3; *)
		QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
		
		COPY NAMED SELECTION:C331([INVOICES:39]; "InvoicesSelection")
		
		For ($_l_ReportIndex; 1; Size of array:C274(CM_at_AnalysisCodes))
			USE NAMED SELECTION:C332("InvoicesSelection")
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Analysis_Code:17=CM_at_AnalysisCodes{$_l_ReportIndex})
			COPY NAMED SELECTION:C331([INVOICES:39]; "ByAnal")
			
			For ($_l_CurrencyIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
				USE NAMED SELECTION:C332("ByAnal")
				If (CM_at_CurrencyCodes{$_l_CurrencyIndex}=<>SYS_t_BaseCurrency)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex}; *)
					QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
				Else 
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=CM_at_CurrencyCodes{$_l_CurrencyIndex})
				End if 
				$_l_Row:=Find in array:C230(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				If ($_l_Row<0)
					APPEND TO ARRAY:C911(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
					If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
						//something is wrong
						//TRACE
					End if 
					$_l_SizeofArray:=$_l_SizeofArray+1
					INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
					INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
					INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
					//`````
					$_l_Row:=Size of array:C274(CM_ar_Balancing)
				End if 
				//This is simple just the sum of the values
				CM_ar_Invoices{$_l_Row}:=Sum:C1([INVOICES:39]Total_Invoiced:5)
			End for 
			//and a combined one-more complex as have to convert the amounts to R
			USE NAMED SELECTION:C332("ByAnal")
			$_l_Row:=Find in array:C230(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
			If ($_l_Row<0)
				APPEND TO ARRAY:C911(CM_at_Analysisindex; "All Currencies"+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
				If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
					//something is wrong
					//TRACE
				End if 
				$_l_SizeofArray:=$_l_SizeofArray+1
				INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
				INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
				
				INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
				INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
				
				INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
				INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
				INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
				//`````
				$_l_Row:=Size of array:C274(CM_ar_Balancing)
			End if 
			CM_r_TotalInvoiced:=0
			$_l_InvoicesCount:=Records in selection:C76([INVOICES:39])
			For ($_l_InvoiceIndex; 1; $_l_InvoicesCount)
				USE NAMED SELECTION:C332("ByAnal")
				GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_InvoiceIndex)
				If ([INVOICES:39]Currency_Code:27="") | ([INVOICES:39]Currency_Code:27="R")
					CM_r_TotalInvoiced:=CM_r_TotalInvoiced+[INVOICES:39]Total_Invoiced:5
				Else 
					$_r_InvoiceAmount:=[INVOICES:39]Total_Invoiced:5
					$_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
					$_r_ConversionRate:=1
					$_bo_UseInvoiceDate:=False:C215
					$_r_TotalConvertedValue:=0
					//````
					//QUERY([ORDER ITEMS];[ORDER ITEMS]Item Number=[INVOICES_ITEMS]Item Number;*)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
					
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
						If (Records in selection:C76([ORDERS:24])>0)
							$_r_ConversionRate:=Num:C11(FurthFld_Get("ORDER ITEMS"; "Dollar Rate"))
							If ($_r_ConversionRate=0)
								CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([ORDERS:24]Order_Date:4); Year of:C25([ORDERS:24]Order_Date:4)))
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="R"; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2="US$"; *)
								QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
								QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=[ORDERS:24]Order_Date:4)
								ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
								$_r_ConversionRate:=[CURRENCY_RATES:72]Rate:3
							End if 
							
						Else 
							$_bo_UseInvoiceDate:=True:C214
						End if 
					Else 
						$_bo_UseInvoiceDate:=True:C214
					End if 
					If ($_bo_UseInvoiceDate=True:C214)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_InvoiceIndex})
						CUR_l_CurrencyPeriod:=Check_Period(Date_FromNums(1; Month of:C24([INVOICES:39]Invoice_Date:4); Year of:C25([INVOICES:39]Invoice_Date:4)))
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="R"; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2="US$"; *)
						QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]x_PeriodID:7=CUR_l_CurrencyPeriod)
						QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4<=[INVOICES:39]Invoice_Date:4)
						ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
						$_r_ConversionRate:=[CURRENCY_RATES:72]Rate:3
						
					End if 
					$_r_TotalConvertedValue:=Gen_Round((($_r_InvoiceAmount*$_r_ConversionRate)); 0)
					CM_r_TotalInvoiced:=CM_r_TotalInvoiced+$_r_TotalConvertedValue
				End if 
			End for 
			CM_ar_Invoices{$_l_Row}:=CM_r_TotalInvoiced
		End for 
		
		For ($_l_ReportIndex; 1; Size of array:C274(CM_at_AnalysisCodes))
			For ($_l_CurrencyIndex; 1; Size of array:C274(CM_at_CurrencyCodes))
				//These are not converted
				$_l_Row:=Find in array:C230(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
				If ($_l_Row<0)
					APPEND TO ARRAY:C911(CM_at_Analysisindex; CM_at_CurrencyCodes{$_l_CurrencyIndex}+"_"+CM_at_AnalysisCodes{$_l_ReportIndex})
					$_l_SizeofArray:=Size of array:C274(CM_ar_ADThirtyDay)
					If ($_l_SizeofArray+1#Size of array:C274(CM_at_Analysisindex))
						//something is wrong
						//TRACE
					End if 
					$_l_SizeofArray:=$_l_SizeofArray+1
					INSERT IN ARRAY:C227(CM_ar_ADZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_at_Titles; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADThirtyDay; $_l_SizeofArray; 1)  //Aged debt as at last period
					INSERT IN ARRAY:C227(CM_ar_AD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_AD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_ADTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_CDZeroDay; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDThirtyDay; $_l_SizeofArray; 1)  //Aged debt as end date('current') period
					INSERT IN ARRAY:C227(CM_ar_CD60Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CD90Day; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CM_ar_CDTotal; $_l_SizeofArray; 1)
					
					INSERT IN ARRAY:C227(CM_ar_Receipts; $_l_SizeofArray; 1)  //Receipts in the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Invoices; $_l_SizeofArray; 1)  //Invoices_In the 'current' period
					INSERT IN ARRAY:C227(CM_ar_Balancing; $_l_SizeofArray; 1)  //aged debt last period-receipts+invoices(Should equal aged aged debt in the 'current' period
					//`````
					$_l_Row:=Size of array:C274(CM_ar_Balancing)
				End if 
				
				CM_ar_Balancing{$_l_Row}:=CM_ar_CDTotal{$_l_Row}-((CM_ar_ADTotal{$_l_Row}+CM_ar_Invoices{$_l_Row})-CM_ar_Receipts{$_l_Row})  //This Figure SHould be 0!!
				
			End for 
		End for 
		
		
		If (False:C215)
			$_ti_DocumentRef:=Create document:C266(""; "TEXT")
			
			
			
			For ($_l_Index; 1; Size of array:C274(CM_at_Analysisindex))
				$_l_Undescoreposition:=Position:C15("_"; CM_at_Analysisindex{$_l_Index})
				If ($_l_Undescoreposition>0)
					If ($_l_Undescoreposition<Length:C16(CM_at_Analysisindex{$_l_Index}))
						$_t_AnalysisCode:=Substring:C12(CM_at_Analysisindex{$_l_Index}; $_l_Undescoreposition+1)
					Else 
						$_t_AnalysisCode:=""
					End if 
					If ($_l_Undescoreposition>1)
						$_t_CurrencyCode:=Substring:C12(CM_at_Analysisindex{$_l_Index}; 1; $_l_Undescoreposition-1)
					Else 
						$_t_CurrencyCode:=""
					End if 
					If ($_t_AnalysisCode#"")
						QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_t_AnalysisCode)
						$_t_AnalysisName:=[ANALYSES:36]Analysis_Name:2
					End if 
					If ($_t_CurrencyCode#"") & ($_t_CurrencyCode#"All Currencies")
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_t_CurrencyCode)
						$_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
					End if 
					If ($_t_CurrencyCode="All Currencies")
						$_t_CurrencyCode:="All Currencies"+" "+"Converted to Rand"
					End if 
					CM_at_Analysisindex{CM_at_Analysisindex}:=$_t_CurrencyCode+" "+$_t_AnalysisName
					
				Else 
					$_t_AnalysisCode:=""
					$_t_CurrencyCode:=""
				End if 
				
				
				
				SEND PACKET:C103($_ti_DocumentRef; CM_at_Analysisindex{$_l_Index}+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; "Previous Period Aged Debtors"+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10(CM_ar_ADZeroDay{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_ADThirtyDay{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_AD60Day{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_AD90Day{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_ADTotal{$_l_Index}; "|accounts")+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; "Invoice Value Current Period"+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10(CM_ar_Invoices{$_l_Index}; "|accounts")+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; "Receipts Value Current Period"+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10(CM_ar_Receipts{$_l_Index}; "|accounts")+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; CM_at_Analysisindex{$_l_Index}+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; "Current Period Aged Debtors"+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10(CM_ar_CDZeroDay{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_CDThirtyDay{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_CD60Day{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_CD90Day{$_l_Index}; "|accounts")+Char:C90(9)+String:C10(CM_ar_CDTotal{$_l_Index}; "|accounts")+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; "Inconsistencies"+Char:C90(13))
				SEND PACKET:C103($_ti_DocumentRef; String:C10(CM_ar_Balancing{$_l_Index}; "|accounts")+Char:C90(13))
				
				
				
			End for 
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			
		End if 
		For ($_l_Index; 1; Size of array:C274(CM_at_Analysisindex))
			$_l_Undescoreposition:=Position:C15("_"; CM_at_Analysisindex{$_l_Index})
			If ($_l_Undescoreposition>0)
				If ($_l_Undescoreposition<Length:C16(CM_at_Analysisindex{$_l_Index}))
					$_t_AnalysisCode:=Substring:C12(CM_at_Analysisindex{$_l_Index}; $_l_Undescoreposition+1)
				Else 
					$_t_AnalysisCode:=""
				End if 
				If ($_l_Undescoreposition>1)
					$_t_CurrencyCode:=Substring:C12(CM_at_Analysisindex{$_l_Index}; 1; $_l_Undescoreposition-1)
				Else 
					$_t_CurrencyCode:=""
				End if 
				If ($_t_AnalysisCode#"")
					QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_t_AnalysisCode)
					$_t_AnalysisName:=[ANALYSES:36]Analysis_Name:2
				Else 
					$_t_AnalysisName:="No Analysis"
					
				End if 
				If ($_t_CurrencyCode#"") & ($_t_CurrencyCode#"All Currencies")
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_t_CurrencyCode)
					$_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
				End if 
				If ($_t_CurrencyCode="All Currencies")
					$_t_CurrencyCode:="All Currencies"+" "+"Converted to Rand"
				End if 
				CM_at_Analysisindex{$_l_Index}:=$_t_CurrencyCode+" "+$_t_AnalysisName
				
			Else 
				$_t_AnalysisCode:=""
				$_t_CurrencyCode:=""
			End if 
			
			
			
		End for 
		//TRACE
		//investigate
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="Sr Mc/47344")
		
		$_ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
		$_t_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
		$_ptr_ReportData:=->$_t_ReportDataXML
		$_t_ErrorHandlingMethod:=Method called on error:C704
		ON ERR CALL:C155("")
		$_t_CurrentPrinter:=""
		$_bo_NoScript:=True:C214
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="PS"+[DOCUMENTS:7]Document_Code:1)
		If (Records in selection:C76([SCRIPTS:80])>0)
			$_t_CurrentPrinter:=Get current printer:C788
			Macro("PS"+[DOCUMENTS:7]Document_Code:1)
			$_bo_NoScript:=False:C215
		Else 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="PSall")
			If (Records in selection:C76([SCRIPTS:80])>0)
				$_t_CurrentPrinter:=Get current printer:C788
				Macro("PSall")
				
				$_bo_NoScript:=False:C215
			End if 
		End if 
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
		If ($_l_OK>=0)
			If (SR_bo_PageSetupFound=False:C215)
				If (Not:C34(SR_bo_PageSetupDisplayed))
					PRINT SETTINGS:C106
					$_bo_Continue:=(OK=1)
				End if 
				If (OK=1)
					$_l_NumberofCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
					If ($_l_NumberofCopies=0)
						$_l_NumberofCopies:=1
					End if 
					If (Is macOS:C1572) | (True:C214)
						
						GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFileName)
						Case of 
							: ($_l_PrintDestination=5)
								$_bo_ToScreenPreview:=True:C214
								$_bo_toPDF:=False:C215
							: ($_l_PrintDestination=3)
								$_bo_ToScreenPreview:=False:C215
								$_bo_toPDF:=True:C214
								
							Else 
								$_bo_ToScreenPreview:=False:C215
								$_bo_toPDF:=False:C215
								$_l_PrintOptions:=SRP_Print_4DPageSetup
						End case 
						OK:=1
					Else 
						$_bo_toPDF:=False:C215
						$_bo_ToScreenPreview:=False:C215
						$_l_PrintOptions:=SRP_Print_4DPageSetup
					End if 
					If ($_bo_toPDF) | ($_bo_ToScreenPreview)
						$_t_PdfOutputFilePath:=""
						If ($_bo_toPDF)
							$_t_PdfOutputFilePath:=$_t_DestinationFileName
						End if 
						If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
							For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
								$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
							End for 
							If ($_bo_PdfOutputOK)
								$_l_PrintResult:=0
							End if 
						Else 
							$_l_PrintResult:=-1
						End if 
					Else 
						For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
							//$_l_PrintResult:=SR Print Report ($_ptr_ReportData->;$_l_PrintOptions;65535)
							$_l_PrintResult:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PrintOptions; ""; 0; "")
							
						End for 
						PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
					End if 
					
					
					
					
					
				End if 
			Else 
				
				If (Not:C34(SR_bo_PageSetupDisplayed))
					PRINT SETTINGS:C106
				End if 
				If (OK=1)
					$_l_NumberofCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
					If ($_l_NumberofCopies=0)
						$_l_NumberofCopies:=1
					End if 
					If ($_bo_NoScript)
						
						If (Is macOS:C1572) | (True:C214)
							
							GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFileName)
							Case of 
								: ($_l_PrintDestination=5)
									$_bo_ToScreenPreview:=True:C214
									$_bo_toPDF:=False:C215
								: ($_l_PrintDestination=3)
									$_bo_ToScreenPreview:=False:C215
									$_bo_toPDF:=True:C214
									
								Else 
									$_l_PrintOptions:=SRP_Print_4DPageSetup
									$_bo_ToScreenPreview:=False:C215
									$_bo_toPDF:=False:C215
							End case 
							OK:=1
						Else 
							$_bo_ToScreenPreview:=False:C215
							$_bo_toPDF:=False:C215
							$_l_PrintOptions:=SRP_Print_4DPageSetup
						End if 
						$_l_OK:=1
						
					Else 
						$_l_OK:=1
						$_bo_ToScreenPreview:=False:C215
						$_bo_toPDF:=False:C215
						$_l_PrintOptions:=SRP_Print_4DPageSetup
					End if 
				Else 
					$_l_NumberofCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
					If ($_l_NumberofCopies=0)
						$_l_NumberofCopies:=1
					End if 
					$_l_OK:=0
					$_bo_ToScreenPreview:=False:C215
					$_bo_toPDF:=False:C215
				End if 
				If ($_l_OK=1)
					If ($_bo_toPDF) | ($_bo_ToScreenPreview)
						$_t_PdfOutputFilePath:=""
						If ($_bo_toPDF)
							$_t_PdfOutputFilePath:=$_t_DestinationFileName
						End if 
						If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
							For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
								$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
							End for 
							If ($_bo_PdfOutputOK)
								$_l_PrintResult:=0
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							End if 
						Else 
							$_l_PrintResult:=-1
						End if 
					Else 
						For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
							//$_l_PrintResult:=SR Print Report ($_ptr_ReportData->;$_l_PrintOptions;65535)
							$_l_PrintResult:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PrintOptions; ""; 0; "")
							
						End for 
						PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
					End if 
				End if 
				
			End if 
			If ($_t_CurrentPrinter#"")
				SET CURRENT PRINTER:C787($_t_CurrentPrinter)
			End if 
			ON ERR CALL:C155($_t_ErrorHandlingMethod)
		End if 
		
		
		
		
		
	Else 
		Gen_Alert("No Accounting period for that date exists!")
	End if 
End if 
ERR_MethodTrackerReturn("CM_ReceiptsBalanceReport"; $_t_oldMethodName)
