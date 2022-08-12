//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_SUBITEMSETDISPLAY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_Relations;0)
	//ARRAY TEXT(ACC_at_AllAnalyses;0)
	//ARRAY TEXT(ACC_at_allAnalysesNames;0)
	//ARRAY TEXT(ACC_at_AllLayerNames;0)
	//ARRAY TEXT(ACC_at_AllLayers;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesCode;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesname;0)
	//ARRAY TEXT(ACC_at_CreditAcc;0)
	//ARRAY TEXT(ACC_at_DC;0)
	//ARRAY TEXT(ACC_at_DebitAcc;0)
	//ARRAY TEXT(ACC_at_IOValues;0)
	//ARRAY TEXT(ACC_at_IOValuesCred;0)
	//ARRAY TEXT(ACC_at_Relations;0)
	//ARRAY TEXT(ACC_at_RelationsCode;0)
	//ARRAY TEXT(ACC_at_RelationsName;0)
	//ARRAY TEXT(ACC_at_TAnalysisCode;0)
	//ARRAY TEXT(ACC_at_TCurrencyCode;0)
	//ARRAY TEXT(ACC_at_TLayerCode;0)
	//ARRAY TEXT(ACC_at_TTaxCode;0)
	C_BOOLEAN:C305($_bo_ShowCurrencies; $_bo_ShowLayers; ACC_bo_SubItemInited; ACC_bo_SuppressDateCheck; DB_bo_FontsInited)
	C_DATE:C307(ACC_D_BatchDate; ACC_D_TransDate)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_CurrentRow; $_l_RowReference; $_l_SizeNormal; ACC_l_BUT1; ACC_l_BUT2; ACC_l_BUT3; ACC_l_ButtonNextItem; ACC_l_ButtonPreviousItem; ACC_l_DisplayedItemNumber)
	C_LONGINT:C283(ACC_l_ItemViewContext; ACC_l_MaxItemNumber; ACC_l_Relations; BAddRelation; BClearRelation; BtranClear; BtranSave; BtranSaveClose; MOD_l_CurrentModuleAccess)
	C_OBJECT:C1216($_obj_Companies; $_obj_Company; $_obj_Job; $_obj_Jobs)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransAmountCredit; ACC_R_TransAmountCreditOLD; ACC_R_TransAmountDebit; ACC_R_TRANSAMOUNTDEBITOLD; ACC_R_TRANSAMOUNTOLD; ACC_R_TransTaxAmt; ACC_R_TransTaxAmtCredit; ACC_R_TransTaxAmtDebit; ACC_R_TransTaxAmtDebitOLD; ACC_R_TransTotal)
	C_REAL:C285(ACC_R_TransTotalCredit; ACC_R_TransTotalDebit)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_FontBold; $_t_FontPlain; $_t_oldMethodName; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCodeOLD; ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc)
	C_TEXT:C284(ACC_t_TransCreditAccOLD; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeCred; ACC_t_TransCurrencyCodeOLD; ACC_t_TransDebitAcc; ACC_t_TransDebitAccOLD; ACC_t_TransDebitIO; ACC_t_TransDebitIOOLD; ACC_t_TransEventCode; ACC_t_TransInvoiceNo)
	C_TEXT:C284(ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TranslayerCodeOLD; ACC_t_TransPeriodCode; ACC_t_TransPeriodCodeOLD; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred; ACC_t_TransTaxCodeOLD; ACC_t_TransTransCode)
	C_TEXT:C284(ACC_t_TransTransCodeOLD; ACC_t_UKEC; ACC_t_UKECCred; ACC_t_UKECOLD; oACC_COL1; oACC_COL2; oACC_COL3; oACC_HED1; oACC_HED2; oACC_HED3)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("ACC_SUBITEMSETDISPLAY")
ARRAY TEXT:C222(ACC_at_Relations; 0)
ARRAY TEXT:C222(ACC_at_RelationsCode; 0)
ARRAY TEXT:C222(ACC_at_RelationsName; 0)
//ARRAY TEXT(ACC_at_Relations;19)
//ARRAY TEXT(ACC_at_RelationsCode;19)
//ARRAY TEXT(ACC_at_RelationsName;19)

$_l_CurrentRow:=0
If (ACC_D_TransDate=!00-00-00!)
	ACC_D_TransDate:=ACC_D_BatchDate
End if 
//ACC_t_TransPeriodCode
If (Not:C34(ACC_bo_SuppressDateCheck))
	If (ACC_t_TransPeriodCode="")
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; ->ACC_D_TransDate)
		
	End if 
End if 
ACC_bo_SuppressDateCheck:=False:C215
If (ACC_t_TransCoCode#"")
	//A company
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Company")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_RowReference
		ACC_at_Relations{$_l_CurrentRow}:="Company"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransCoCode
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Company")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransCoCode)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
		$_l_CurrentRow:=Size of array:C274(ACC_at_Relations)
	End if 
	$_obj_Companies:=ds:C1482.COMPANIES.query("Company_Code =:1"; ACC_t_TransCoCode)
	If ($_obj_Companies.length>0)
		$_obj_Company:=$_obj_Companies[0]
		ACC_at_RelationsName{$_l_CurrentRow}:=$_obj_Company.Company_Name
	End if 
	//READ ONLY([COMPANIES])
	//QUERY([COMPANIES];[COMPANIES]Company_Code=ACC_t_TransCoCode)
	//ACC_at_RelationsName{$_l_CurrentRow}:=[COMPANIES]Company_Name
End if 
If (ACC_t_TransInvoiceNo#"")
	//AN INVOICE NUMBER
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Sales Invoice")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ACC_at_Relations{$_l_CurrentRow}:="Sales Invoice"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransInvoiceNo
		ACC_at_RelationsName{$_l_CurrentRow}:=""
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Sales Invoice")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransInvoiceNo)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
	End if 
	
End if 
If (ACC_t_TransPurchinvno#"")
	//A PURCHASE INVOICE NUMBER
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Purchase Invoice")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ACC_at_Relations{$_l_CurrentRow}:="Purchase Invoice"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransPurchinvno
		ACC_at_RelationsName{$_l_CurrentRow}:=""
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Purchase Invoice")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransPurchinvno)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
	End if 
	
	
End if 
If (ACC_t_TransPurchCode#"")
	//A PURCHASE Code(purchase order)
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Purchase Order")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ACC_at_Relations{$_l_CurrentRow}:="Purchase Order"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransPurchCode
		ACC_at_RelationsName{$_l_CurrentRow}:=""
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Purchase Order")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransPurchCode)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
	End if 
	
	//$_l_CurrentRow:=$_l_CurrentRow+1
	//ACC_at_Relations{$_l_CurrentRow}:="Purchase Order"
	//Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransPurchCode
	//ACC_at_RelationsName{$_l_CurrentRow}:=""
End if 
If (ACC_t_TransChequeNo#"")
	//A cheque
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Cheque")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ACC_at_Relations{$_l_CurrentRow}:="Cheque"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransChequeNo
		ACC_at_RelationsName{$_l_CurrentRow}:=""
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Cheque")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransChequeNo)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
	End if 
	
	//$_l_CurrentRow:=$_l_CurrentRow+1
	//ACC_at_Relations{$_l_CurrentRow}:="Cheque"
	//Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransChequeNo
	//ACC_at_RelationsName{$_l_CurrentRow}:=""
End if 
If (ACC_t_TransJobCode#"")
	//A JOB
	
	$_l_RowReference:=Find in array:C230(ACC_at_Relations; "Job")
	If ($_l_RowReference>0)
		$_l_CurrentRow:=$_l_CurrentRow+1
		ACC_at_Relations{$_l_CurrentRow}:="Job"
		Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransJobCode
		ACC_at_RelationsName{$_l_CurrentRow}:=""
	Else 
		APPEND TO ARRAY:C911(ACC_at_Relations; "Job")
		APPEND TO ARRAY:C911(Acc_at_RelationsCode; ACC_t_TransJobCode)
		APPEND TO ARRAY:C911(ACC_at_RelationsName; "")
		$_l_CurrentRow:=Size of array:C274(ACC_at_RelationsName)
	End if 
	$_obj_Jobs:=ds:C1482.JOBS.query("Job_Code =:1"; ACC_t_TransJobCode)
	If ($_obj_Jobs.length>0)
		$_obj_Job:=$_obj_Jobs[0]
		ACC_at_RelationsName{$_l_CurrentRow}:=$_obj_Job.Job_Name
	End if 
	//$_l_CurrentRow:=$_l_CurrentRow+1
	//ACC_at_Relations{$_l_CurrentRow}:="Job"
	//Acc_at_RelationsCode{$_l_CurrentRow}:=ACC_t_TransJobCode
	//READ ONLY([JOBS])
	//QUERY([JOBS];[JOBS]Job_Code=ACC_t_TransJobCode)
	//ACC_at_RelationsName{$_l_CurrentRow}:=[JOBS]Job_Name
End if 


//ARRAY TEXT(ACC_at_Relations;$_l_CurrentRow)
//ARRAY TEXT(ACC_at_RelationsCode;$_l_CurrentRow)
//ARRAY TEXT(ACC_at_RelationsName;$_l_CurrentRow)

OBJECT SET VISIBLE:C603(ACC_l_Relations; False:C215)
//Setup area list
// these are the variables for the column names, headers, and buttons
LB_SetupListbox(->ACC_LB_Relations; "oACC"; "ACC_L"; 1; ->ACC_at_Relations; ->ACC_at_RelationsCode; ->ACC_at_RelationsName)
LB_StyleSettings(->ACC_LB_Relations; "Black"; 9; "ACC"; ->[PREFERENCES:116])
LB_SetColumnHeaders(->ACC_LB_Relations; "ACC_L"; 1; "Related table.."; "Code"; "Name")
LB_SetColumnWidths(->ACC_LB_Relations; "oACC"; 1; 130; 100; 100)  // dont need to worry about the invisible ones
LB_SetScroll(->ACC_LB_Relations; -3; -2)
$_t_FontBold:="Geneva"
$_t_FontPlain:="Geneva"
$_l_SizeNormal:=9
// body
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 

LB_SETFONT(->ACC_LB_Relations; "ACC"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)  // body
LB_SETFONT(->ACC_LB_Relations; "ACC"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)  // HEADER

LB_SetEnterable(->ACC_LB_Relations; False:C215; 0; "")  // make all columns enterable

ARRAY TEXT:C222(ACC_at_IOValues; 3)
ARRAY TEXT:C222(ACC_at_IOValuesCred; 3)
ACC_at_IOValues{1}:="I"
ACC_at_IOValues{2}:="O"
ACC_at_IOValues{3}:="N"
COPY ARRAY:C226(ACC_at_IOValues; ACC_at_IOValuesCred)
READ ONLY:C145([TRANSACTION_TYPES:31])
QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]No_NL_Postings:23=False:C215)
If (MOD_l_CurrentModuleAccess#2)
	QUERY SELECTION:C341([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Full_Access:15=False:C215)
End if 
If (Not:C34(ACC_bo_SubItemInited))
	ARRAY TEXT:C222(ACC_at_BatchTransTypesCode; 0)
	ARRAY TEXT:C222(ACC_at_BatchTransTypesname; 0)
	ARRAY TEXT:C222(ACC_at_DC; 0)
	ARRAY TEXT:C222(ACC_at_DebitAcc; 0)
	ARRAY TEXT:C222(ACC_at_CreditAcc; 0)
	ARRAY TEXT:C222(ACC_at_TAnalysisCode; 0)
	SELECTION TO ARRAY:C260([TRANSACTION_TYPES:31]Transaction_Type_Code:1; ACC_at_BatchTransTypesCode; [TRANSACTION_TYPES:31]Transaction_Type_Name:2; ACC_at_BatchTransTypesname; [TRANSACTION_TYPES:31]DC:3; ACC_at_DC; [TRANSACTION_TYPES:31]Debit_Account:4; ACC_at_DebitAcc; [TRANSACTION_TYPES:31]Credit_Account:5; ACC_at_CreditAcc; [TRANSACTION_TYPES:31]Analysis_Code:7; ACC_at_TAnalysisCode)
	SELECTION TO ARRAY:C260([TRANSACTION_TYPES:31]Tax_Code:6; ACC_at_TTaxCode; [TRANSACTION_TYPES:31]Layer_Code:16; ACC_at_TLayerCode; [TRANSACTION_TYPES:31]Currency_Code:17; ACC_at_TCurrencyCode)
	SORT ARRAY:C229(ACC_at_BatchTransTypesname; ACC_at_BatchTransTypesCode; ACC_at_DC; ACC_at_DebitAcc; ACC_at_CreditAcc; ACC_at_TAnalysisCode; ACC_at_TTaxCode; ACC_at_TLayerCode; ACC_at_TCurrencyCode)
	ACC_bo_SubItemInited:=True:C214
End if 
If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="")
	OBJECT SET VISIBLE:C603(*; "oTransTypeDropDown"; True:C214)
	OBJECT SET ENTERABLE:C238(*; "oTransTypeCodeName"; True:C214)
	
	
Else 
	//$_l_Ref:=Find in array(ACC_at_BatchTransTypesCode;[TRANSACTION_BATCH_ITEMS]Transaction_Type_Code)
	//if($_l_Ref>0)
	//ACC_t_TransTransCode:=ACC_at_BatchTransTypesCode{$_l_Ref}
	
	OBJECT SET VISIBLE:C603(*; "oTransTypeDropDown"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oTransTypeCodeName"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oTransItemTypeDescription"; False:C215)
	//ACC_t_TransTransCode:=ACC_at_BatchTransTypesCode{ACC_at_BatchTransTypesname}
End if 

ALL RECORDS:C47([ANALYSES:36])
SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; ACC_at_AllAnalyses; [ANALYSES:36]Analysis_Name:2; ACC_at_allAnalysesNames)
SORT ARRAY:C229(ACC_at_allAnalysesNames; ACC_at_AllAnalyses)
ARRAY TEXT:C222(ACC_at_AllLayers; 0)
ARRAY TEXT:C222(ACC_at_AllLayerNames; 0)
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)
	$_bo_ShowLayers:=True:C214
	ALL RECORDS:C47([LAYERS:76])
	SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; ACC_at_AllLayers; [LAYERS:76]Layer_Name:2; ACC_at_AllLayerNames)
	SORT ARRAY:C229(ACC_at_AllLayerNames; ACC_at_AllLayers)
Else 
	$_bo_ShowLayers:=False:C215
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)
	$_bo_ShowCurrencies:=True:C214
Else 
	$_bo_ShowCurrencies:=False:C215
End if 

Case of 
	: (ACC_l_ItemViewContext=1) | (ACC_l_ItemViewContext=3)  //Add or edit
		
		//SET ENTERABLE(ACC_t_DebitAccountName;True)
		LB_SetEnterable(->ACC_LB_Relations; True:C214; 0; "ACC_t_DebitAccountName")
		OBJECT SET VISIBLE:C603(ACC_at_allAnalysesNames; True:C214)
		OBJECT SET VISIBLE:C603(ACC_at_AllLayerNames; True:C214)
		SET WINDOW TITLE:C213("Edit Batch Item")
		OBJECT SET VISIBLE:C603(ACC_at_AllAnalyses; True:C214)
		OBJECT SET VISIBLE:C603(ACC_at_BatchTransTypesCode; True:C214)
		OBJECT SET VISIBLE:C603(BAddRelation; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_TransDebitIO; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_TransCreditIO; True:C214)
		OBJECT SET ENTERABLE:C238(*; "OItemEnterable@"; True:C214)
		If (ACC_D_TransDate=!00-00-00!)
			ACC_D_TransDate:=Current date:C33(*)
		End if 
		
		If (ACC_l_ItemViewContext=1)
			//add
			ACC_l_DisplayedItemNumber:=0
			ACC_l_MaxItemNumber:=0
			SET WINDOW TITLE:C213("Enter Batch Item")
			GOTO OBJECT:C206(ACC_t_TransTransCode)
			OBJECT SET VISIBLE:C603(*; "oSelect@"; False:C215)
			OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; False:C215)
			OBJECT SET ENABLED:C1123(ACC_l_ButtonPreviousItem; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(BtranClear; False:C215)
			OBJECT SET VISIBLE:C603(BtranSaveClose; False:C215)
			OBJECT SET TITLE:C194(BtranSave; "Close")
			
			OBJECT SET VISIBLE:C603(*; "oSelect@"; True:C214)
			OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; True:C214)
			OBJECT SET ENABLED:C1123(ACC_l_ButtonPreviousItem; True:C214)
		End if 
		OBJECT SET TITLE:C194(BtranSave; "Save")
	: (ACC_l_ItemViewContext=2)
		//View item-no modification?
		SET WINDOW TITLE:C213("View Batch Item")
		OBJECT SET VISIBLE:C603(ACC_at_AllAnalyses; False:C215)
		OBJECT SET VISIBLE:C603(ACC_at_BatchTransTypesCode; False:C215)
		OBJECT SET VISIBLE:C603(BAddRelation; False:C215)
		OBJECT SET VISIBLE:C603(ACC_at_IOValues; False:C215)
		OBJECT SET VISIBLE:C603(ACC_at_IOValuesCred; False:C215)
		OBJECT SET ENTERABLE:C238(*; "OItemEnterable@"; False:C215)
		OBJECT SET VISIBLE:C603(BtranClear; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSelect@"; False:C215)
		OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; True:C214)
		OBJECT SET ENABLED:C1123(ACC_l_ButtonPreviousItem; True:C214)
		OBJECT SET TITLE:C194(BtranSave; "Close")
		//SET ENTERABLE(ACC_t_DebitAccountName;False)
		LB_SetEnterable(->ACC_LB_Relations; False:C215; 0; "ACC_t_DebitAccountName")
		OBJECT SET VISIBLE:C603(ACC_at_allAnalysesNames; False:C215)
		OBJECT SET VISIBLE:C603(ACC_at_AllLayerNames; False:C215)
		OBJECT SET VISIBLE:C603(BtranSaveClose; False:C215)
		OBJECT SET TITLE:C194(BtranSave; "Close")
		OBJECT SET VISIBLE:C603(BClearRelation; False:C215)
		
End case 
If ($_bo_ShowLayers=False:C215)
	OBJECT SET VISIBLE:C603(*; "oLabelLayers"; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_TransLayerCode; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_LayerName; False:C215)
	OBJECT SET VISIBLE:C603(ACC_at_AllLayerNames; False:C215)
End if 
//zTo keep track
OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCode; $_bo_ShowCurrencies)

ACC_TransSubitemLoad

ACC_R_TransTaxAmtDebit:=0
ACC_R_TransAmountDebit:=0
ACC_R_TransTotalDebit:=0
ACC_R_TransTaxAmtCredit:=0
ACC_R_TransAmountCredit:=0
ACC_R_TransTotalCredit:=0
Case of 
	: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
		If (ACC_t_TransDebitAcc#"")
			ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
			ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
			ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
		End if 
		If (ACC_t_TransCreditAcc#"")
			ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
			ACC_R_TransTaxAmtCredit:=0
			ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
		End if 
		
	: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
		If (ACC_t_TransCreditAcc#"")
			ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
			ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
			ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
		End if 
		
		If (ACC_t_TransDebitAcc#"")
			ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
			ACC_R_TransTaxAmtDebit:=0
			ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
		End if 
		
	Else 
		If (ACC_t_TransCreditAcc#"")
			ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
			ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
			ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
		End if 
		
		If (ACC_t_TransDebitAcc#"")
			ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
			ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
			ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
		End if 
		
End case 


//````
ACC_t_TransCurrencyCodeCred:=ACC_t_TransCurrencyCode
ACC_t_TransTaxCodeCred:=ACC_t_TransTaxCode
ACC_t_UKECCred:=ACC_t_UKEC
//```
ACC_t_TransCurrencyCodeOLD:=ACC_t_TransCurrencyCode
ACC_t_TransPeriodCodeOLD:=ACC_t_TransPeriodCode
ACC_t_UKECOLD:=ACC_t_UKEC
ACC_t_TransTaxCodeOLD:=ACC_t_TransTaxCode
ACC_t_TransTransCodeOLD:=ACC_t_TransTransCode
ACC_t_BatchItemAnalysisCodeOLD:=ACC_t_BatchItemAnalysisCode
ACC_t_TranslayerCodeOLD:=ACC_t_TransLayerCode
ACC_t_TransDebitAccOLD:=ACC_t_TransDebitAcc
ACC_t_TransDebitIOOLD:=ACC_t_TransDebitIO
ACC_R_TransAmountDebitOLD:=ACC_R_TransAmountDebit
ACC_R_TransTaxAmtDebitOLD:=ACC_R_TransTaxAmtDebit
ACC_t_TransCreditAccOLD:=ACC_t_TransCreditAcc
ACC_R_TransAmountCreditOLD:=ACC_R_TransAmountCredit
If (ACC_t_TransCreditAcc="")
	OBJECT SET VISIBLE:C603(ACC_t_TransCreditIO; False:C215)
	OBJECT SET VISIBLE:C603(ACC_at_IOValuesCred; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCodeCred; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_UKECCred; False:C215)
	OBJECT SET VISIBLE:C603(ACC_R_TransAmountCredit; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_TransTaxCodeCred; False:C215)
	OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtCredit; False:C215)
	
	OBJECT SET VISIBLE:C603(ACC_R_TransTotalCredit; False:C215)
Else 
	OBJECT SET VISIBLE:C603(ACC_t_TransCreditIO; True:C214)
	OBJECT SET VISIBLE:C603(ACC_at_IOValuesCred; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCodeCred; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_UKECCred; True:C214)
	OBJECT SET VISIBLE:C603(ACC_R_TransAmountCredit; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_TransTaxCodeCred; True:C214)
	OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtCredit; True:C214)
	OBJECT SET VISIBLE:C603(ACC_R_TransTotalCredit; True:C214)
End if 
If (ACC_t_TransDebitAcc="")
	OBJECT SET VISIBLE:C603(ACC_t_TransDebitIO; False:C215)
	OBJECT SET VISIBLE:C603(ACC_at_IOValues; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCode; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_UKEC; False:C215)
	OBJECT SET VISIBLE:C603(ACC_R_TransAmountDebit; False:C215)
	OBJECT SET VISIBLE:C603(ACC_t_TransTaxCode; False:C215)
	OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtDebit; False:C215)
	
	OBJECT SET VISIBLE:C603(ACC_R_TransTotalDebit; False:C215)
Else 
	OBJECT SET VISIBLE:C603(ACC_t_TransDebitIO; True:C214)
	OBJECT SET VISIBLE:C603(ACC_at_IOValues; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCode; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_UKEC; True:C214)
	OBJECT SET VISIBLE:C603(ACC_R_TransAmountDebit; True:C214)
	OBJECT SET VISIBLE:C603(ACC_t_TransTaxCode; True:C214)
	OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtDebit; True:C214)
	
	OBJECT SET VISIBLE:C603(ACC_R_TransTotalDebit; True:C214)
End if 
If (ACC_l_DisplayedItemNumber=1)
	OBJECT SET ENABLED:C1123(ACC_l_ButtonPreviousItem; False:C215)
	If (ACC_l_DisplayedItemNumber=ACC_l_MaxItemNumber)
		OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; False:C215)
		
	End if 
Else 
	If (ACC_l_DisplayedItemNumber=ACC_l_MaxItemNumber)
		OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; False:C215)
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_SUBITEMSETDISPLAY"; $_t_oldMethodName)
