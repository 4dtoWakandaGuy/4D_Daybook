//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchAddSubItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 07:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchItemCreditID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDebitID;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY TEXT(ACC_at_AnalysisNames;0)
	//ARRAY TEXT(ACC_at_aTransCoCode;0)
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
	C_BOOLEAN:C305($_bo_ProcessVisible; $1)
	C_DATE:C307(ACC_D_TransDate)
	C_LONGINT:C283($_l_ArraySize; $_l_BatchItemPosition; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRIght; $_l_ObjectTop; $_l_Process; $_l_ProcessOrigin; $_l_ProcessState; $_l_ProcessTime; $_l_ProcessUID)
	C_LONGINT:C283($_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; $i; ACC_l_ItemEntryProcess; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; DS_l_BATCHITEMRef; MOD_l_CurrentModuleAccess)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ProcessName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO)
	C_TEXT:C284(ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode)
	C_TEXT:C284(ACC_t_TransTransCode; ACC_t_UKEC; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchAddSubItem")
//This new method is for adding items to a trans in
//NOTE it only adds them to the arrays NOT to the subrecords.

//The subrecords will be saved when this record is saved (Posted)
//Insert at the beginning
$_l_ArraySize:=1

If (Count parameters:C259>0)
	If (ACC_l_TransBatchItemID#0)
		$_l_BatchItemPosition:=Find in array:C230(ACC_al_BatchItemID; ACC_l_TransBatchItemID)
		If (ACC_al_BatchItemID{$_l_BatchItemPosition}>0)
			ACC_al_BatchItemID{$_l_BatchItemPosition}:=-(ACC_al_BatchItemID{$_l_BatchItemPosition})  //this is then used to save this
		End if 
		
	Else 
		$_l_BatchItemPosition:=1
		INSERT IN ARRAY:C227(ACC_ar_BatchItemAmounts; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemAnalysisCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_al_BatchItemID; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemChequeNo; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemCoCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemCreditAcc; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemCreditIO; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_al_BatchItemCreditID; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemCurrencyCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemDebitAcc; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemDebitIO; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_al_BatchItemDebitID; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemDescription; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemInvoiceNo; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemJobCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemlayerCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemPeriodCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemPurchinvno; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemPurchCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_ar_BatchItemSecondAmt; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_ar_BatchItemTaxAmt; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemTaxCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_ar_BatchItemTotal; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemTransTypeCode; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_ad_BatchItemTransDate; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_BatchItemTaxUKEC; $_l_ArraySize)
		
		INSERT IN ARRAY:C227(ACC_at_CURRENCYNAME; $_l_ArraySize)
		INSERT IN ARRAY:C227(ACC_at_DebitAccountNames; $_l_ArraySize)  //²
		INSERT IN ARRAY:C227(ACC_at_CreditAccountNames; $_l_ArraySize)  //²
		INSERT IN ARRAY:C227(ACC_at_CompanyNames; $_l_ArraySize)  //²
		INSERT IN ARRAY:C227(ACC_at_AnalysisNames; $_l_ArraySize)  //²
		INSERT IN ARRAY:C227(ACC_at_LayerNames; $_l_ArraySize)  //)²
		INSERT IN ARRAY:C227(ACC_al_BatchItemID; $_l_ArraySize)
		
		//THIS ARRAY IS CHANGED TO A NEGATIVE TO TRACK CHANGED ITEMS
		ACC_al_BatchItemID{1}:=-(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef))
	End if 
	ACC_ar_BatchItemAmounts{$_l_BatchItemPosition}:=ACC_R_TransAmount
	ACC_at_BatchItemAnalysisCode{$_l_BatchItemPosition}:=ACC_t_BatchItemAnalysisCode
	//ACC_al_BatchItemID{$_l_BatchItemPosition}:=ACC_al_BatchItemID`we do not modify this
	ACC_at_BatchItemChequeNo{$_l_BatchItemPosition}:=ACC_t_TransChequeNo
	ACC_at_BatchItemCoCode{$_l_BatchItemPosition}:=ACC_t_TransCoCode
	ACC_at_BatchItemCreditAcc{$_l_BatchItemPosition}:=ACC_t_TransCreditAcc
	ACC_at_BatchItemCreditIO{$_l_BatchItemPosition}:=ACC_t_TransCreditIO
	ACC_al_BatchItemCreditID{$_l_BatchItemPosition}:=ACC_l_TransCreditID
	ACC_at_BatchItemCurrencyCode{$_l_BatchItemPosition}:=ACC_t_TransCurrencyCode
	ACC_at_BatchItemDebitAcc{$_l_BatchItemPosition}:=ACC_t_TransDebitAcc
	ACC_at_BatchItemDebitIO{$_l_BatchItemPosition}:=ACC_t_TransDebitIO
	ACC_al_BatchItemDebitID{$_l_BatchItemPosition}:=ACC_l_TransDebitID
	ACC_at_BatchItemDescription{$_l_BatchItemPosition}:=ACC_T_TransDescription
	ACC_at_BatchItemInvoiceNo{$_l_BatchItemPosition}:=ACC_t_TransInvoiceNo
	ACC_at_BatchItemJobCode{$_l_BatchItemPosition}:=ACC_t_TransJobCode
	ACC_at_BatchItemlayerCode{$_l_BatchItemPosition}:=ACC_t_TransLayerCode
	ACC_at_BatchItemPeriodCode{$_l_BatchItemPosition}:=ACC_t_TransPeriodCode
	ACC_at_BatchItemPurchinvno{$_l_BatchItemPosition}:=ACC_t_TransPurchinvno
	ACC_at_BatchItemPurchCode{$_l_BatchItemPosition}:=ACC_t_TransPurchCode
	ACC_ar_BatchItemSecondAmt{$_l_BatchItemPosition}:=ACC_R_TransSecondAmt
	ACC_ar_BatchItemTaxAmt{$_l_BatchItemPosition}:=ACC_R_TransTaxAmt
	ACC_at_BatchItemTaxCode{$_l_BatchItemPosition}:=ACC_t_TransTaxCode
	ACC_ar_BatchItemTotal{$_l_BatchItemPosition}:=ACC_R_TransTotal
	ACC_at_BatchItemTransTypeCode{$_l_BatchItemPosition}:=ACC_t_TransTransCode
	ACC_ad_BatchItemTransDate{$_l_BatchItemPosition}:=ACC_D_TransDate
	ACC_at_BatchItemTaxUKEC{$_l_BatchItemPosition}:=ACC_t_UKEC
	
	If (ACC_at_BatchItemCurrencyCode{$_l_BatchItemPosition}#"")
		If ([CURRENCIES:71]Currency_Code:1#ACC_at_BatchItemCurrencyCode{$_l_BatchItemPosition})
			READ ONLY:C145([CURRENCIES:71])
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_at_BatchItemCurrencyCode{$_l_BatchItemPosition})
		End if 
		ACC_at_CURRENCYNAME{$_l_BatchItemPosition}:=[CURRENCIES:71]Currency_Name:2
		If (ACC_at_CURRENCYNAME{$_l_BatchItemPosition}="")
			If (ACC_at_BatchItemCurrencyCode{$_l_BatchItemPosition}=<>SYS_t_BaseCurrency)
				ACC_at_CURRENCYNAME{$_l_BatchItemPosition}:="Base"
			Else 
				ACC_at_CURRENCYNAME{$_l_BatchItemPosition}:=ACC_at_BatchItemCurrencyCode{$i}
			End if 
			
		End if 
	End if 
	ACC_at_DebitAccountNames{$_l_BatchItemPosition}:=""
	If (ACC_at_BatchItemDebitAcc{$_l_BatchItemPosition}#"")
		If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemDebitAcc{$_l_BatchItemPosition})
			READ ONLY:C145([ACCOUNTS:32])
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemDebitAcc{$_l_BatchItemPosition})
		End if 
		ACC_at_DebitAccountNames{$_l_BatchItemPosition}:=[ACCOUNTS:32]Account_Name:3
	End if 
	ACC_at_CreditAccountNames{$_l_BatchItemPosition}:=""
	If (ACC_at_BatchItemCreditAcc{$_l_BatchItemPosition}#"")
		If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemCreditAcc{$_l_BatchItemPosition})
			READ ONLY:C145([ACCOUNTS:32])
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemCreditAcc{$_l_BatchItemPosition})
		End if 
		ACC_at_CreditAccountNames{$_l_BatchItemPosition}:=[ACCOUNTS:32]Account_Name:3
	End if 
	
	ACC_at_CompanyNames{$_l_BatchItemPosition}:=ACC_t_CompanyName  //²
	ACC_at_AnalysisNames{$_l_BatchItemPosition}:=ACC_t_AnalysisNames  //²
	ACC_at_LayerNames{$_l_BatchItemPosition}:=ACC_t_LayerName
	ACC_TransSetDisplay("Trans_SetDisplay"; $_l_ArraySize)
Else 
	
	If (ACC_l_ItemEntryProcess>0)
		PROCESS PROPERTIES:C336(ACC_l_ItemEntryProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_ProcessUID; $_l_ProcessOrigin)
		If ($_l_ProcessState<0) | ($_t_ProcessName#("ItemEntry"+(String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))))
			ACC_l_ItemEntryProcess:=0
		End if 
	End if 
	If (ACC_l_ItemEntryProcess>0)
		While (Semaphore:C143("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)))
			DelayTicks
		End while 
		
		CLEAR SEMAPHORE:C144("$"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
	Else 
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		OBJECT GET COORDINATES:C663(ACC_LB_SubItems; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
		$_l_ObjectTop:=$_l_ObjectTop+50
		ACC_l_ItemEntryProcess:=New process:C317("ACC_BatchItemEntry"; 64000; "ItemEntry"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10); Current process:C322; [TRANSACTION_BATCHES:30]Batch_Number:10; 1; [TRANSACTION_BATCHES:30]State:15; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; MOD_l_CurrentModuleAccess; [TRANSACTION_BATCHES:30]Batch_Date:1; SYS_t_AccessType; $_l_WIndowLeft+$_l_ObjectLeft; $_l_WIndowTop+$_l_ObjectTop)
	End if 
End if 
ERR_MethodTrackerReturn("ACC_BatchAddSubItem"; $_t_oldMethodName)
