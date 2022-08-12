//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_PrintAgedDebtorsAsAt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:        30/03/2011 13:50 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToconvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoSelection; ACC_bo_ADShowDepositDate; ACC_bo_ADShowExport; ACC_bo_ExportToDisk; ACC_bo_ShowDate; CB_bo_ConvertAtOldRate)
	C_DATE:C307(<>DB_d_CurrentDate; Acc_D_CutOffDate; vDate)
	C_LONGINT:C283($_l_CurrencyRow; $_l_CurrencyRow2; $_l_CurrentWinRefOLD; $_l_Index; $_l_PeriodID; $_l_Process; $_l_RecordCount; ch0; DB_l_CurrentDisplayedForm; vIn; vNo)
	C_LONGINT:C283(vNo2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(Acc_R_Cutoffamount; Vtotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrentFormUsage; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OutputCurrency; $1; Acc_t_AccountCodeFrom; ACC_t_CurrencyCode; ACC_t_Message; ACC_t_PeriodFrom; DB_t_CurrentContext)
	C_TEXT:C284(DB_t_CurrentFormUsage; vCallCode; VSELPREV; vTitle)
	C_TIME:C306($_ti_document)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_PrintAgedDebtorsAsAt")
$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_t_CurrentFormUsage:=""
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	Gen_Confirm("Print Aged Debtors For on Screen Selection?"; "Yes"; "No")
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_t_CurrentFormUsage:="AA"
	CREATE SET:C116([INVOICES:39]; "$tempBefore")
	If (OK=1)
		If (Records in set:C195("ListboxSet0")>0)
			USE SET:C118("ListboxSet0")
		End if 
		vIn:=1
		$_bo_NoSelection:=True:C214
	Else 
		REDUCE SELECTION:C351([INVOICES:39]; 0)
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AA"
		Invoices_Sel
		$_bo_NoSelection:=False:C215
	End if 
	$_bo_Continue:=True:C214
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		$_l_Process:=New process:C317("INV_PrintAgedDebtorsasat"; 128000; "Aged Debtors At"; "NoCurrentSelection2")
		$_bo_Continue:=False:C215
	Else 
		
		StartTransaction
		Start_Process
		If (DB_l_CurrentDisplayedForm>0)
			COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$TempSel")
		End if 
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AA"
		REDUCE SELECTION:C351([INVOICES:39]; 0)
		Invoices_Sel
		$_bo_NoSelection:=False:C215
		$_bo_Continue:=True:C214
	End if 
End if 
If ($_bo_Continue)
	
	If (vIn=1)
		If (Records in selection:C76([INVOICES:39])>0)
			vDate:=<>DB_d_CurrentDate
			$_l_PeriodID:=Check_Period
			vDate:=[PERIODS:33]From_Date:3-1
			
			ACC_t_PeriodFrom:=""
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
			Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Debit_Account:4
			ACC_bo_ShowDate:=True:C214
			ACC_t_Message:="Aged Debtors as at Date"
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1984; "Report Options")
			ACC_bo_ADShowExport:=True:C214
			ACC_bo_ADShowDepositDate:=True:C214
			DIALOG:C40([USER:15]; "Aged_Debtors")
			ACC_bo_ADShowExport:=False:C215
			ACC_bo_ADShowDepositDate:=False:C215
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If ((OK=1) & (vDate>!00-00-00!))
				If (OK=1)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=Acc_t_AccountCodeFrom)
					If ((OK=1) & (Records in selection:C76([ACCOUNTS:32])>0))
						CREATE SET:C116([INVOICES:39]; "$Temp")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#-1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#1)
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
						//QUERY SELECTION([INVOICES];[INVOICES]Total Due#0)
						CREATE SET:C116([INVOICES:39]; "LocalQuery2")
						UNION:C120("LocalQuery"; "LocalQuery2"; "LocalQuery")
						CLEAR SET:C117("LocalQuery2")
						
						QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
						QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
						//*D07/1474
						CREATE SET:C116([INVOICES:39]; "ServerQuery")
						INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
						USE SET:C118("LocalQuery")
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
						QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7=0)
						If (Records in selection:C76([INVOICES:39])>0)
							READ WRITE:C146([INVOICES:39])
							
							If (Not:C34(In transaction:C397))
								DB_lockFile(->[INVOICES:39])
								APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate)
								
								
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
							Else 
								$_l_RecordCount:=0
								FIRST RECORD:C50([INVOICES:39])
								For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
									[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
									DB_SaveRecord(->[INVOICES:39])
									$_l_RecordCount:=$_l_RecordCount+1
									NEXT RECORD:C51([INVOICES:39])
								End for 
							End if 
							QUERY:C277([INVOICES:39]; [INVOICES:39]X_invoiceClearedDate:43=!00-00-00!; *)
							QUERY:C277([INVOICES:39];  | ; [INVOICES:39]X_invoiceClearedDate:43>Vdate)
							CREATE SET:C116([INVOICES:39]; "ServerQuery")
						Else 
						End if 
						INTERSECTION:C121("LocalQuery"; "ServerQuery"; "LocalQuery")
						
						If (Acc_D_CutOffDate#!00-00-00!)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=Acc_D_CutOffDate)
							CREATE SET:C116([INVOICES:39]; "Prior")
							DIFFERENCE:C122("LocalQuery"; "Prior"; "LocalQuery")
						End if 
						
						
						If (Acc_R_Cutoffamount>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7>Acc_R_Cutoffamount)
							CREATE SET:C116([INVOICES:39]; "POSITIVES")
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7<-Acc_R_Cutoffamount)
							CREATE SET:C116([INVOICES:39]; "NEGATIVES")
							UNION:C120("POSITIVES"; "NEGATIVES"; "POSITIVES")
							//NOW TAKE THAT SELECTION AND WORK OUT IF THE AMOUNT DUE AS AT DATE IS GREATER THAN Acc_R_Cutoffamount
							CREATE EMPTY SET:C140([INVOICES:39]; "LocalQuery")
							FIRST RECORD:C50([INVOICES:39])
							For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
								Vtotal:=0
								Invoices_ADTot
								If (Vtotal>Acc_R_Cutoffamount)
									ADD TO SET:C119([INVOICES:39]; "LocalQuery")
									
								End if 
								
								NEXT RECORD:C51([INVOICES:39])
							End for 
							
						End if 
						USE SET:C118("LocalQuery")
						CLEAR SET:C117("LocalQuery")
						CLEAR SET:C117("ServerQuery")
						//$ADBLOBISREADY:=False
						//Query S
						If (Records in selection:C76([INVOICES:39])>0)
							vNo:=Records in selection:C76([INVOICES:39])
							vNo2:=vNo
							DB_t_CurrentFormUsage:="Print"
							ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
							CREATE SET:C116([INVOICES:39]; "PrintSelection")
							ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
							ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
							//ARRAY STRING(20;$_at_CurrencyToconvert;Records in selection([INVOICES]))
							DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; $_at_CurrencyToconvert)
							
							$_l_CurrencyRow:=Find in array:C230($_at_CurrencyToconvert; "")
							If ($_l_CurrencyRow>0)
								$_l_CurrencyRow2:=Find in array:C230($_at_CurrencyToconvert; <>SYS_t_BaseCurrency)
								If ($_l_CurrencyRow2<0)
									$_at_CurrencyToconvert{$_l_CurrencyRow}:=<>SYS_t_BaseCurrency
								Else 
									DELETE FROM ARRAY:C228($_at_CurrencyToconvert; $_l_CurrencyRow)
								End if 
							End if 
							
							Case of 
								: (Size of array:C274($_at_CurrencyToconvert)=1)
									If ($_at_CurrencyToconvert{1}="")
										$_at_CurrencyToconvert{1}:=<>SYS_t_BaseCurrency
									End if 
									ACC_t_CurrencyCode:=$_at_CurrencyToconvert{1}
								Else 
									ACC_t_CurrencyCode:=""
							End case 
							
							$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->$_at_CurrencyToconvert; Table:C252(->[INVOICES:39]); "PrintSelection")
							USE SET:C118("PrintSelection")
							//TRACE
							If (Not:C34($_bo_NoSelection)) & (Records in selection:C76([INVOICES:39])>1)
								DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
							End if 
							If (Records in selection:C76([INVOICES:39])>0)
								DB_t_CurrentFormUsage:="AA"
								
								//If (ACC_t_PeriodFrom="")
								vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Debtors Acc: ")+Acc_t_AccountCodeFrom
								//   Else
								//   vTitle:="As at: "+ACC_t_PeriodFrom+"   Debtors Acc: "+Acc_t_AccountCodeFrom
								// End if
								If (OK=1)
									//ACC_t_CurrencyCode:=""
									If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
										vCallCode:=$_t_OutputCurrency
									End if 
									//CurrConv_Ask (39)
									ch0:=1
									
									vTitle:=vTitle+Char:C90(13)+CurrConv_Title($_t_OutputCurrency; ->$_at_CurrencyToconvert)
									If ($_t_OutputCurrency#"")
										If (Not:C34(SR_ReportOK("SLAgedAA")))
											If (ACC_bo_ExportToDisk)
												Gen_Alert("Create a document to send the Aged Debtors")
												$_ti_document:=Create document:C266(""; "TEXT")
												If ($_ti_document#?00:00:00?)
													Invoices_AD2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate; True:C214; 1; $_ti_document)
													CLOSE DOCUMENT:C267($_ti_document)
													
												Else 
													Invoices_AD2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate)
												End if 
												
												
											Else 
												Invoices_AD2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert; CB_bo_ConvertAtOldRate)
											End if 
										End if 
									End if 
								End if 
							End if 
						Else 
							Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
						End if 
					End if 
				End if 
			End if 
			vIn:=0
		Else 
			Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
		End if 
	End if 
End if 

DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	USE SET:C118("$tempBefore")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection2")
		Transact_End
		If (DB_l_CurrentDisplayedForm>0)
			USE NAMED SELECTION:C332("$TempSel")
		Else 
			Menu_Sales
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("INV_PrintAgedDebtorsAsAt"; $_t_oldMethodName)
