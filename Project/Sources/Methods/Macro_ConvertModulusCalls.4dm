//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ConvertModulusCalls
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptText; $0; $1; $_t_oldMethodName; $_t_ScriptText; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_ConvertModulusCalls")
//Macro_ConvertModulusCalls
//if you change the calls to code work add them here
//BE CAREFULL!!!!!!!


If (Count parameters:C259>=1)
	$_t_ScriptText:=$1
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "String(MoveTypesNo )"; "MovementTypes_No")
	//ZCurrRates Mod
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZCurrRates Mod"; "ZCurrRates_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccBal List"; "ZAccBal_List")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccBal Report"; "ZAccBal_Report")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccBal TB"; "ZAccBal_TB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccBal PL B"; "ZAccBal_PL_B")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccBal PL"; "ZAccBal_PL")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Check QM"; "Check_QM")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Check_Period"; "Check_Period")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Trans_SubLPPer"; "Trans_SubLPPer")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Check_Analysis"; "Check_Analysis")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Trans_SubLPLayC"; "Trans_SubLPLayerCode")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Trans_SubLPLay"; "Trans_SubLPLayer")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Trans_SubLPIOx"; "Trans_SubLPIOx")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen AlertAcc"; "Gen_AlertAcc")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen Alert2Col"; "Gen_Alert2Col")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen AlertCurr"; "Gen_AlertCurr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen_Round"; "Gen_Round")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen_Alert"; "Gen_Round")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Letters_InLPA"; "Letters_InLPA")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Letters_InLPB"; "Letters_InLPB")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Letters_InLP"; "Letters_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Letters write"; "Documents_4DWriteAccessType")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CTypes_InLP"; "CTypes_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CTypes_InLPB"; "CTypes_InLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen_Message"; "Gen_Message")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "User Version"; "User_Version")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Date Format"; "Date_format")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen_Confirm"; "Gen_Confirm")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen Request"; "Gen_Request")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "DB Save Record"; "DB_SaveRecord")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cont NameJT"; "CON_BuildContactNameandJobTitle")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cont Name"; "Con_BuildContactName")
	//Letters_InLP
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Check Locked"; "Check_Locked")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Close Proc"; "Close_Process")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ACCBal Abort"; "ACC_BalAbort")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal ACLSrc"; "ACC_BalACLSrc")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal BalBlank"; "ACC_BalPrintBlank")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal BalCalc"; "ACC_CalculateBalance")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal BalHdr"; "ACC_BalPrintHeader")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Bal"; "ACC_DisplayBalances")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal vatTrSrc"; "ACC_BalGetVatTransactions")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Contacts_InLPM"; "Contacts_inLPM")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Macro_AccTypePt"; "Macro_AccTypePt")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Macro AccTypeFF"; "Macro_AccTypeFF")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Macro AccTypeDEF"; "Macro_AccTypeDEF")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Minor_ModName"; "Minor_ModName")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Minor Mod"; "Minor_Mod")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Macro AccType"; "Macro_AccType")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cont Check"; "Cont_Check")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Process Name"; "Process_Name")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cont Code"; "Contact_Code")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Move CodeT"; "Movement_CodeT")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Move CodeUp"; "Movement_CodeUp")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Move Code"; "Movement_Code")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "MoveTypes No"; "MovementTypes_No")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "States CUArr"; "States_CUArr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Term_VATWT"; "Term_VATWT")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Term StoWT"; "Term_StoWT")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "in Buttons"; "Input_Buttons")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Menu Record"; "Menu_Record")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal BudCrea2"; "Acc_BalBudCrea2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "TransactionBatch_PostCH"; "TransactionBatch_postCH")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "TransactionBatch_PostPH"; "TransactionBatch_postPH")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "TransactionBatch_Post"; "TransactionBatch_post")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_SIString"; "Sel_SIString")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_SCurr"; "Sel_SCurr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_SLayer"; "Sel_SLayer")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_Beginning2"; "Sel_Beginning2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_Beginning3"; "Sel_Beginning3")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_Beginning"; "Sel_Beginning")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Date FromNums"; "Date_FromNums")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Date Divider"; "Date_Divider")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period_Find2I"; "Period_Find2I")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period_FindI"; "Period_FindI")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period_Find2P"; "Period_Find2P")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period_FindP"; "Period_FindP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period_Find2"; "Period_Find2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Period Find"; "Period_Find")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_SSNum"; "Sel_SSNum")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_SIS"; "Sel_SIS")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Big One"; "BIg_One")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel Ending"; "Sel_Ending")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "SelPvs AnalCode"; "SelPvs_AnalysesCode")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel_LPmi"; "Sel_LPmi")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Sel CrossFile"; "Sel_CrossTable")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "StatsView_ArFiS"; "StatsView_ArFiS")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "StatsView_ArF1S"; "StatsView_ArF1S")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Project SelABTr"; "Project_SelABTr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Project SelFast"; "Project_SelFast")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "StatsView CFEnd"; "StatsView CFEnd")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Dry Code"; "DiarySetCode")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Calc BalArr"; "Calc_BalArr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Periods Mod"; "Periods_Mod")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen None"; "Gen_None")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen Option"; "Gen_Option")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "SR ReportOK"; "SR_ReportOK")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PL12"; "ACC_BalPL12")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PL2Per"; "Acc_BalPL2Per")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PL2"; "ACC_BalPL2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PL"; "ACC_BalPL")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PL B"; "ACC_BalPLBudget")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Acc BalPLHdg12"; "Acc_BalPLHdg12")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal PLHdg"; "Acc_BalPLHdg")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Acc BalPLHdg12"; "Acc_BalPLHdg12")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Acc BalBSHdg"; "Acc_BalBSHdg")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Acc BalPLBHdg"; "Acc_BalPLBHdg")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Page12"; "Acc_BalPage12")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Page"; "Acc_BalPage")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal RepTit"; "Acc_BalRepTit")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal RepPS"; "Acc_BalRepPS")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal RepPS"; "Acc_BalRepPS")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cur_ConvAsk"; "Cur ConvAsk")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts_LaySrc"; "Accounts LaySrc")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts ZeroSr"; "Accounts_ZeroSr")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Cal Bal2"; "Cal_Bal2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Close ProWin"; "Close_ProWin")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Calc Percent"; "Calc_Percent")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Open Pro Window"; "Open_Pro_Window")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Date Time"; "Date_Time")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen PoundsPence"; "Gen_PoundsPence")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Gen_Int"; "Gen_integer")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal BudCreat"; "Acc_BalBudgetCreate")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Bud"; "Acc_BalBudget")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Adrress Contact"; "Adrress_Contact")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Address Lines"; "Address_Lines")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Address Horiz"; "Address_Horizontal")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Address ContNam"; "Address ContactName")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Address Details"; "Address_Details")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Address DetProc"; "Address_DetailsConstruct")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZActions Mod"; "ZActions_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Actions Mod"; "Actions_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Actions InLP"; "Actions_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts ZeroS2"; "Accounts_ZeroS2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts OutDel"; "Accounts_OutDelete")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts OutCou"; "Accounts_OutCount")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZAccounts Mod"; "ZAccounts_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts Mod"; "Accounts_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts InDel"; "Accounts_InDelete")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts InLPB"; "Accounts_InLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts InLPA"; "Accounts_InLPA")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts InLP"; "Accounts_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts Clear"; "Accounts_Clear")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts ChPref"; "Accounts_CheckPref")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Accounts Amal"; "Accounts_Amalgamate")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Report"; "Acc_BalReport")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal OutCount"; "AccBal_OutCount")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal OutBudDe"; "Acc_BalOutBudDelete")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal List"; "Acc_BalList")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ACCBal InLPB"; "Acc_BalInLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal InLP"; "Acc_BalInLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal InBud"; "ACC_BalInBudget")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AccBal Check"; "ACC_BalCheck")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Ask PersonSel"; "Ask_PersonSel")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Ask PersonOK"; "Ask_PersonOK")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Ask PersFunc"; "Ask_PersonFunctions")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Array LCx"; "Array_LCx")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Array LCStart"; "Array LCStart")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Array CopyFiles"; "Array CopyFiles")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Areas Mod"; "Areas_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Analyses Mod"; "Analyses_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Analyses InLPB"; "Analyses_InLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Analyses InLPA"; "Analyses_InLPA")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Analyses InLP"; "Analyses_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AddTypes Mod"; "AddTypes_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AddTypes_InLPB"; "AddTypes_InLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "AddTypes_InLP"; "AddTypes_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Brands Mod"; "Brands_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates SelP"; "CurrRates_SelP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates Sel"; "CurrRates_Sel")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates Mod"; "CurrRates_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates InLPB"; "CurrRates_InLPB")
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates In"; "CurrRates_In")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRates File"; "CurrRates_File")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRate MostRe"; "CurrRate_MostRecent")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrRate Conv"; "CurrRate_Convert")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrItem Conv2"; "CurrItem_Convert2")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrItem Conv"; "CurrItem_Convert")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Currency InDDef"; "Currency_InDDefault")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Currency File"; "Currency_File")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Currencies InLP"; "Currencies_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrConv Conv"; "CurrConv_Convert")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "CurrConv Title"; "CurrConv_Title")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Create Doc"; "Create_Doc")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Country File"; "Country_File")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ZCountries Mod"; "ZCountries_Mod")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Countries InLPB"; "Countries_InLPB")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "Countries InLP"; "Countries_InLP")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "ContTypes Mod"; "ContactTypes_Mod")
End if 
$0:=$_t_ScriptText
ERR_MethodTrackerReturn("Macro_ConvertModulusCalls"; $_t_oldMethodName)
