//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_TransLoadTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_TransItems;0)
	//ARRAY DATE(ACC_ad_aTTransDate;0)
	//ARRAY REAL(ACC_ar_TransactionAmount;0)
	//ARRAY REAL(ACC_ar_TransactionTaxAmt;0)
	//ARRAY REAL(ACC_ar_TransactionTotal;0)
	//ARRAY TEXT(ACC_at_TAccountNames;0)
	//ARRAY TEXT(ACC_at_TAnalysisNames;0)
	//ARRAY TEXT(ACC_at_TaxUKEC;0)
	//ARRAY TEXT(ACC_at_TCURRENCYNAME;0)
	//ARRAY TEXT(ACC_at_TLayerNames;0)
	//ARRAY TEXT(ACC_at_TransactionAccCode;0)
	//ARRAY TEXT(ACC_at_TransactionAnalysisCode;0)
	//ARRAY TEXT(ACC_at_TransactionChequeNo;0)
	//ARRAY TEXT(ACC_at_TransactionCoCode;0)
	//ARRAY TEXT(ACC_at_TransactionCurrencyCode;0)
	//ARRAY TEXT(ACC_at_TransactionDescription;0)
	//ARRAY TEXT(ACC_at_TransactionIO;0)
	//ARRAY TEXT(ACC_at_TransactionJobCode;0)
	//ARRAY TEXT(ACC_at_TransactionLayerCode;0)
	//ARRAY TEXT(ACC_at_TransactionPeriodCode;0)
	//ARRAY TEXT(ACC_at_TransactionPurchCode;0)
	//ARRAY TEXT(ACC_at_TransactionPurchinvno;0)
	//ARRAY TEXT(ACC_at_TransactionTaxCode;0)
	//ARRAY TEXT(ACC_at_TransactionTransCode;0)
	//ARRAY TEXT(ACC_at_TransationInvoiceNo;0)
	//ARRAY TEXT(ACC_at_TranscactionCoNames;0)
	C_LONGINT:C283($_l_ArraySIze; $_l_ColumnOffset; $_l_Index; TRANS2_l_BUT1; TRANS2_l_BUT10; TRANS2_l_BUT11; TRANS2_l_BUT12; TRANS2_l_BUT13; TRANS2_l_BUT14; TRANS2_l_BUT15; TRANS2_l_BUT16)
	C_LONGINT:C283(TRANS2_l_BUT17; TRANS2_l_BUT18; TRANS2_l_BUT19; TRANS2_l_BUT2; TRANS2_l_BUT20; TRANS2_l_BUT21; TRANS2_l_BUT22; TRANS2_l_BUT23; TRANS2_l_BUT24; TRANS2_l_BUT25; TRANS2_l_BUT26)
	C_LONGINT:C283(TRANS2_l_BUT3; TRANS2_l_BUT4; TRANS2_l_BUT5; TRANS2_l_BUT6; TRANS2_l_BUT7; TRANS2_l_BUT8; TRANS2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; oTRANS2_COL1; oTRANS2_COL10; oTRANS2_COL11; oTRANS2_COL12; oTRANS2_COL13; oTRANS2_COL14; oTRANS2_COL15; oTRANS2_COL16; oTRANS2_COL17; oTRANS2_COL18)
	C_TEXT:C284(oTRANS2_COL19; oTRANS2_COL2; oTRANS2_COL20; oTRANS2_COL21; oTRANS2_COL22; oTRANS2_COL23; oTRANS2_COL24; oTRANS2_COL25; oTRANS2_COL26; oTRANS2_COL3; oTRANS2_COL4)
	C_TEXT:C284(oTRANS2_COL5; oTRANS2_COL6; oTRANS2_COL7; oTRANS2_COL8; oTRANS2_COL9; oTRANS2_HED1; oTRANS2_HED10; oTRANS2_HED11; oTRANS2_HED12; oTRANS2_HED13; oTRANS2_HED14)
	C_TEXT:C284(oTRANS2_HED15; oTRANS2_HED16; oTRANS2_HED17; oTRANS2_HED18; oTRANS2_HED19; oTRANS2_HED2; oTRANS2_HED20; oTRANS2_HED21; oTRANS2_HED22; oTRANS2_HED23; oTRANS2_HED24)
	C_TEXT:C284(oTRANS2_HED25; oTRANS2_HED26; oTRANS2_HED3; oTRANS2_HED4; oTRANS2_HED5; oTRANS2_HED6; oTRANS2_HED7; oTRANS2_HED8; oTRANS2_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransLoadTransactions")
QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30; >)
ARRAY TEXT:C222(ACC_at_TransactionTransCode; 0)

ARRAY TEXT:C222(ACC_at_TransactionDescription; 0)
ARRAY TEXT:C222(ACC_at_TransactionAccCode; 0)
ARRAY TEXT:C222(ACC_at_TransactionIO; 0)
ARRAY DATE:C224(ACC_ad_aTTransDate; 0)
ARRAY TEXT:C222(ACC_at_TransactionPeriodCode; 0)
ARRAY REAL:C219(ACC_ar_TransactionAmount; 0)
ARRAY TEXT:C222(ACC_at_TransactionTaxCode; 0)
ARRAY TEXT:C222(ACC_at_TaxUKEC; 0)
ARRAY REAL:C219(ACC_ar_TransactionTaxAmt; 0)
ARRAY REAL:C219(ACC_ar_TransactionTotal; 0)
ARRAY TEXT:C222(ACC_at_TransactionCurrencyCode; 0)
ARRAY TEXT:C222(ACC_at_TransactionCoCode; 0)
ARRAY TEXT:C222(ACC_at_TransationInvoiceNo; 0)
ARRAY TEXT:C222(ACC_at_TransactionJobCode; 0)
ARRAY TEXT:C222(ACC_at_TransactionPurchinvno; 0)
ARRAY TEXT:C222(ACC_at_TransactionPurchCode; 0)
ARRAY TEXT:C222(ACC_at_TransactionChequeNo; 0)
ARRAY TEXT:C222(ACC_at_TransactionAnalysisCode; 0)
ARRAY TEXT:C222(ACC_at_TransactionLayerCode; 0)
ARRAY TEXT:C222(ACC_at_TAccountNames; 0)
ARRAY TEXT:C222(ACC_at_TCURRENCYNAME; 0)
ARRAY TEXT:C222(ACC_at_TranscactionCoNames; 0)
ARRAY TEXT:C222(ACC_at_TAnalysisNames; 0)
ARRAY TEXT:C222(ACC_at_TLayerNames; 0)

If (Records in selection:C76([TRANSACTIONS:29])>0)
	
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_Type_Code:1; ACC_at_TransactionTransCode; [TRANSACTIONS:29]Description:8; ACC_at_TransactionDescription; [TRANSACTIONS:29]Account_Code:3; ACC_at_TransactionAccCode; [TRANSACTIONS:29]IO:18; ACC_at_TransactionIO)
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Trans_Date:5; ACC_ad_aTTransDate; [TRANSACTIONS:29]Period_Code:12; ACC_at_TransactionPeriodCode; [TRANSACTIONS:29]Amount:6; ACC_ar_TransactionAmount; [TRANSACTIONS:29]Tax_Code:20; ACC_at_TransactionTaxCode)
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]UK_EC:21; ACC_at_TaxUKEC; [TRANSACTIONS:29]Tax_Amount:16; ACC_ar_TransactionTaxAmt; [TRANSACTIONS:29]Total:17; ACC_ar_TransactionTotal; [TRANSACTIONS:29]Currency_Code:22; ACC_at_TransactionCurrencyCode)
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Company_Code:9; ACC_at_TransactionCoCode; [TRANSACTIONS:29]Invoice_Number:4; ACC_at_TransationInvoiceNo; [TRANSACTIONS:29]Job_Code:25; ACC_at_TransactionJobCode)
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Purchase_invoice_number:19; ACC_at_TransactionPurchinvno; [TRANSACTIONS:29]Purchase_Code:24; ACC_at_TransactionPurchCode; [TRANSACTIONS:29]Cheque_Number:13; ACC_at_TransactionChequeNo; [TRANSACTIONS:29]Analysis_Code:2; ACC_at_TransactionAnalysisCode)
	SELECTION TO ARRAY:C260([TRANSACTIONS:29]Layer_Code:23; ACC_at_TransactionLayerCode)
	$_l_ArraySIze:=Size of array:C274(ACC_at_TransactionLayerCode)
	ARRAY TEXT:C222(ACC_at_TAccountNames; $_l_ArraySIze)
	ARRAY TEXT:C222(ACC_at_TCURRENCYNAME; $_l_ArraySIze)
	ARRAY TEXT:C222(ACC_at_TranscactionCoNames; $_l_ArraySIze)
	ARRAY TEXT:C222(ACC_at_TAnalysisNames; $_l_ArraySIze)
	ARRAY TEXT:C222(ACC_at_TLayerNames; $_l_ArraySIze)
	
	For ($_l_Index; 1; Size of array:C274(ACC_at_TAccountNames))
		If ([ACCOUNTS:32]Account_Code:2#ACC_at_TransactionAccCode{$_l_Index})
			READ ONLY:C145([ACCOUNTS:32])
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_TransactionAccCode{$_l_Index})
		End if 
		ACC_at_TAccountNames{$_l_Index}:=[ACCOUNTS:32]Account_Name:3
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)
			If (ACC_at_TransactionCurrencyCode{$_l_Index}#"")
				If ([CURRENCIES:71]Currency_Code:1#ACC_at_TransactionCurrencyCode{$_l_Index})
					READ ONLY:C145([CURRENCIES:71])
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_at_TransactionCurrencyCode{$_l_Index})
				End if 
				ACC_at_TCURRENCYNAME{$_l_Index}:=[CURRENCIES:71]Currency_Name:2
			End if 
		End if 
		If (ACC_at_TransactionCoCode{$_l_Index}#"")
			If ([COMPANIES:2]Company_Code:1#ACC_at_TransactionCoCode{$_l_Index})
				READ ONLY:C145([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_at_TransactionCoCode{$_l_Index})
			End if 
			ACC_at_TranscactionCoNames{$_l_Index}:=[COMPANIES:2]Company_Name:2
		End if 
		If (ACC_at_TransactionAnalysisCode{$_l_Index}#"")
			If ([ANALYSES:36]Analysis_Code:1#ACC_at_TransactionAnalysisCode{$_l_Index})
				READ ONLY:C145([ANALYSES:36])
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=ACC_at_TransactionAnalysisCode{$_l_Index})
			End if 
			ACC_at_TAnalysisNames{$_l_Index}:=[ANALYSES:36]Analysis_Name:2
		End if 
		If (ACC_at_TransactionLayerCode{$_l_Index}#"")
			If ([LAYERS:76]Layer_Code:1#ACC_at_TransactionLayerCode{$_l_Index})
				READ ONLY:C145([LAYERS:76])
				QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=ACC_at_TransactionLayerCode{$_l_Index})
			End if 
			ACC_at_TLayerNames{$_l_Index}:=[LAYERS:76]Layer_Name:2
		End if 
		
	End for 
	
	SORT ARRAY:C229(ACC_at_TransactionAccCode; ACC_at_TransactionCurrencyCode; ACC_at_TransactionCoCode; ACC_at_TransactionLayerCode; ACC_at_TransactionAnalysisCode; ACC_ar_TransactionAmount; ACC_at_TransactionChequeNo; ACC_at_TransactionIO; ACC_at_TransactionDescription; ACC_at_TransationInvoiceNo; ACC_at_TransactionJobCode; ACC_at_TransactionPeriodCode; ACC_at_TransactionPurchinvno; ACC_at_TransactionPurchCode; ACC_ar_TransactionTaxAmt; ACC_at_TransactionTaxCode; ACC_ar_TransactionTotal; ACC_at_TransactionTransCode; ACC_ad_aTTransDate; ACC_at_TaxUKEC; ACC_at_TCURRENCYNAME; ACC_at_TAccountNames; ACC_at_TranscactionCoNames; ACC_at_TAnalysisNames; ACC_at_TLayerNames; >)
End if 

OBJECT SET VISIBLE:C603(ACC_LB_TransItems; False:C215)
LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; 1; ->ACC_at_TransactionTransCode; ->ACC_at_TransactionDescription; ->ACC_at_TransactionAccCode; ->ACC_at_TAccountNames; ->ACC_at_TransactionIO)
//AL_SetHeaders (ACC_l_TransItems;1;5;"Trans";"Desc";"Account";"Name";"IO")
LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; 1; "Trans"; "Desc"; "Account"; "Name"; "IO")
//AL_SetWidths (ACC_l_TransItems;1;5;50;100;50;80;15)
LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; 1; 50; 100; 50; 80; 15)  // dont need to worry about the invisible ones

LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; 6; ->ACC_ad_aTTransDate; ->ACC_at_TransactionPeriodCode; ->ACC_ar_TransactionAmount; ->ACC_at_TransactionTaxCode; ->ACC_at_TaxUKEC; ->ACC_ar_TransactionTaxAmt; ->ACC_ar_TransactionTotal)
//AL_SetHeaders (ACC_l_TransItems;6;7;"Date";"Period";"Amount";"Tax Code";"UKEC";"Tax Amt";"Total Amount")
LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; 6; "Date"; "Period"; "Amount"; "Tax Code"; "UKEC"; "Tax Amt"; "Total Amount")
//AL_SetWidths (ACC_l_TransItems;6;7;35;40;50;30;30;50;60)
LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; 6; 35; 40; 50; 30; 30; 50; 60)  // dont need to worry about the invisible ones
$_l_ColumnOffset:=13
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionCurrencyCode; ->ACC_at_TCURRENCYNAME)
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;2;"Currency Code";"Name")
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Currency Code"; "Name")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;2;30;60)
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 30; 60)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+2
Else 
	
End if 

LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionCoCode; ->ACC_at_TranscactionCoNames)
//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;2;"Company";"Name")
LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Company"; "Name")
//AL_SetWidths (ACC_l_TransItems;18;2;50;128)
LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 50; 128)  // dont need to worry about the invisible ones
$_l_ColumnOffset:=$_l_ColumnOffset+2
If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)  //Sales ledger
	
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransationInvoiceNo)
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;1;"Sales Inv")
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Sales Inv")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;1;40)
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 40)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+1
Else 
	
End if 

If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionJobCode)
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;1;"Job Code")
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Job Code")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;1;40)
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 40)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+1
Else 
	
End if 


If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)  // Purchase invoice
	
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;1;"Purchse Inv")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;1;40)
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionPurchinvno)
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Purchse Inv")
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 40)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+1
	
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;1;"Purch_Code")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;1;40)
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionPurchCode)
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Purch_Code")
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 40)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+1
Else 
	
End if 

//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;1;"Cheque")
//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;160)
LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionChequeNo)
LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Cheque")
LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 160)  // dont need to worry about the invisible ones
$_l_ColumnOffset:=$_l_ColumnOffset+1
//```

//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;2;"Anal Code";"Name")
//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;2;35;40)
LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionAnalysisCode; ->ACC_at_TAnalysisNames)
LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Anal Code"; "Name")
LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 35; 40)  // dont need to worry about the invisible ones
$_l_ColumnOffset:=$_l_ColumnOffset+2
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //Multi Layer
	
	//AL_SetHeaders (ACC_l_TransItems;$_l_ColumnOffset;2;"Layer Code";"Name")
	//AL_SetWidths (ACC_l_TransItems;$_l_ColumnOffset;2;80;30)
	LB_SetupListbox(->ACC_LB_TransItems; "oTRANS2"; "TRANS2_L"; $_l_ColumnOffset; ->ACC_at_TransactionLayerCode; ->ACC_at_TLayerNames)
	LB_SetColumnHeaders(->ACC_LB_TransItems; "TRANS2_L"; $_l_ColumnOffset; "Layer Code"; "Name")
	LB_SetColumnWidths(->ACC_LB_TransItems; "oTRANS2"; $_l_ColumnOffset; 80; 30)  // dont need to worry about the invisible ones
	$_l_ColumnOffset:=$_l_ColumnOffset+2
Else 
	
End if 

LB_StyleSettings(->ACC_LB_TransItems; "Black"; 9; "TRANS2"; ->[TRANSACTION_BATCHES:30])
ERR_MethodTrackerReturn("ACC_TransLoadTransactions"; $_t_oldMethodName)
