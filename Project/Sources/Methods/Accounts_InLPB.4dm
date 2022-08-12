//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 21:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vALLevels)
	//C_UNKNOWN(VBalance)
	//C_UNKNOWN(vButtDisACCBAL)
	//C_UNKNOWN(vPAccount)
	//C_UNKNOWN(vSAccount)
	//C_UNKNOWN(vTitle2)
	//ARRAY LONGINT(ACC al_DocIncludes;0)
	//ARRAY LONGINT(ACC_al_Levels;0)
	//ARRAY LONGINT(ACC_al_SubAreaTables;0)
	//ARRAY LONGINT(ACC_al_TabIds;0)
	//ARRAY LONGINT(ACC_al_TabIncludes;0;0)
	//ARRAY LONGINT(ACC_al_ViewTabletoTable;0)
	//ARRAY LONGINT(ACC_al_ViewTabSettings;0)
	//ARRAY LONGINT(ACC_al_ViewTabsState;0)
	//ARRAY POINTER(ACC_aptr_AccBalPointers;0)
	//ARRAY POINTER(ACC_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACC_at_SubAreaContext;0)
	//ARRAY TEXT(ACC_at_SubAreaContextUsage;0)
	//ARRAY TEXT(ACC_at_TabNames;0)
	//ARRAY TEXT(ACC_at_ViewTabsFormNames;0)
	//ARRAY TEXT(ACC_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(ACC_at_ViewTabsLabels;0)
	//ARRAY TEXT(Cur_at_AccountType;0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	//ARRAY TEXT(Cur_at_MultiCurrVal;0)
	C_BOOLEAN:C305($_bo_NewLevel; ACC_bo_ShowBalances; $_bo_LoadSetup; $_bo_NewLevel; ACC_bo_ShowBalances)
	C_LONGINT:C283($_l_Nul; $_l_ReuseLevel; $_l_SortFieldNumber; $_l_TableRow; ACC_l_ViewTabsLabelsOLD; vALLevels; $_l_Element; $_l_Nul; $_l_ReuseLevel; $_l_SortFieldNumber; $_l_TableRow)
	C_LONGINT:C283(ACC_l_ViewTabsLabelsOLD)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ACC_r_Balances; VBalance; $_r_Balance; ACC_r_Balances)
	C_TEXT:C284($_t_oldMethodName; ACC_t_OutputCurrency; CUR_t_AccountType; CUR_t_MultiCurrVal; vButtDisACCBAL; vPAccount; vSAccount; vTitle2; $_t_AreaHandlingOptions; $_t_oldMethodName; ACC_t_OutputCurrency)
	C_TEXT:C284(CUR_t_AccountType; CUR_t_MultiCurrVal)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_InLPB")
If ([ACCOUNTS:32]PB:4="")
	[ACCOUNTS:32]PB:4:=Get localized string:C991("ProfitAccountinitial")
End if 
If ([ACCOUNTS:32]IO:5="")
	[ACCOUNTS:32]IO:5:=Get localized string:C991("AccountsIONeitherInitial")
End if 
If ([ACCOUNTS:32]Account_Code:2#"")
	GOTO OBJECT:C206([ACCOUNTS:32]Account_Name:3)
End if 
OBJECT SET VISIBLE:C603(*; "oSubFormContainer"; False:C215)

OBJECT SET VISIBLE:C603(Cur_at_MultiCurrVal; False:C215)  //Assume user has set Multi Curr Valuation before and don't let them change
OBJECT SET VISIBLE:C603(*; "pAccMultCurrValPopup"; False:C215)

ARRAY TEXT:C222(Cur_at_AccountType; 2)
Cur_at_AccountType{1}:=Get localized string:C991("ProfitAccountinitial")
Cur_at_AccountType{2}:=Get localized string:C991("BalanceSheetAccountinitial")
If ([ACCOUNTS:32]PB:4=Get localized string:C991("BalanceSheetAccountinitial"))
	
	
	Cur_at_AccountType:=2
Else 
	Cur_at_AccountType:=1
End if 
CUR_t_AccountType:=Cur_at_AccountType{Cur_at_AccountType}

If ([ACCOUNTS:32]Multicurrency_Valuation:10=0)
	OBJECT SET VISIBLE:C603(*; "oConversionRuleDropDown"; True:C214)  //Multi Curr Valuation not set yet so allow them to set
	OBJECT SET VISIBLE:C603(*; "oConversionRule"; False:C215)
	ARRAY TEXT:C222(Cur_at_MultiCurrVal; 0)
	Cur_LoadMultiCurrValCodes(->Cur_at_MultiCurrVal)
	If ([ACCOUNTS:32]Multicurrency_Valuation:10=1)
		Cur_at_MultiCurrVal:=2
	Else 
		Cur_at_MultiCurrVal:=1
	End if 
	CUR_t_MultiCurrVal:=Cur_at_MultiCurrVal{Cur_at_MultiCurrVal}
Else 
	OBJECT SET VISIBLE:C603(*; "oConversionRuleDropDown"; False:C215)  //Multi Curr Valuation not set yet so allow them to set
	OBJECT SET VISIBLE:C603(*; "oConversionRule"; True:C214)
	If ([ACCOUNTS:32]Multicurrency_Valuation:10=1)
		OBJECT SET VALUE:C1742("oConversionRule"; Get localized string:C991("CurrentConversionRate"))
		
		//CUR_t_MultiCurrVal:=Get localized string("CurrentConversionRate")
	Else 
		OBJECT SET VALUE:C1742("oConversionRule"; Get localized string:C991("CurrentConversionRate"))
		
		//CUR_t_MultiCurrVal:=Get localized string("HistorialConversionRate")
	End if 
	
End if 
ARRAY TEXT:C222(ACC_at_ViewTabsLabels; 0)
ARRAY LONGINT:C221(ACC_al_ViewTabSettings; 0)
ARRAY LONGINT:C221(ACC_al_ViewTabsState; 0)
ARRAY TEXT:C222(ACC_at_ViewTabsFormNames; 0)
ARRAY TEXT:C222(ACC_at_ViewTabsFormSettings; 0)
ARRAY LONGINT:C221(ACC_al_ViewTabletoTable; 0)
ARRAY TEXT:C222(ACC_at_TabNames; 0)
ARRAY LONGINT:C221(ACC_al_TabIds; 0)
ARRAY LONGINT:C221(ACC_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(ACC al_DocIncludes; 0)

$_l_Element:=1
APPEND TO ARRAY:C911(ACC_at_ViewTabsLabels; "Account Balances")

APPEND TO ARRAY:C911(ACC_al_ViewTabSettings; 0)  //edit on screen
APPEND TO ARRAY:C911(ACC_al_ViewTabsState; 2)
APPEND TO ARRAY:C911(ACC_at_ViewTabsFormNames; "AccBal_in")
APPEND TO ARRAY:C911(ACC_at_ViewTabsFormSettings; "1")  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
APPEND TO ARRAY:C911(ACC_al_ViewTabletoTable; Table:C252(->[ACCOUNT_BALANCES:34]))

If (ACC_bo_ShowBalances)
	If ([ACCOUNTS:32]Account_Code:2#"")
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
		//CREATE SET([ACCOUNT_BALANCES];"Extra")
		//INTERSECTION("Extra2";"Extra";"Extra3")
		//USE SET("Extra3")
		//  USE SET("Extra2")
		// SEARCH SELECTION([ACC BALANCES];[ACC BALANCES]Account Code=[ACCOUNTS]Account Co
		If ([ACCOUNT_BALANCES:34]Currency_Code:6=ACC_t_OutputCurrency) | (ACC_t_OutputCurrency="")
			Calc_BalArr
		Else 
			$_r_Balance:=CUR_CalcBalConv(->CUR_at_CurrencyToconvert; ACC_t_OutputCurrency)
			VBalance:=$_r_Balance
			// Calc_BalConv
		End if 
	Else 
		REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
		VBalance:=0
	End if 
	
Else 
	OBJECT SET VISIBLE:C603(*; "oAccBalanceLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAccBalance"; False:C215)
	
	
End if 
ACC_at_ViewTabsLabels:=1
$_t_AreaHandlingOptions:="311111000"
ARRAY LONGINT:C221(ACC_al_Levels; 1)
$_l_ReuseLevel:=0
$_l_TableRow:=Find in array:C230(ACC_al_SubAreaTables; ACC_al_ViewTabletoTable{ACC_at_ViewTabsLabels})
If ($_l_TableRow>0)
	$_ptr_ListBoxSetup:=ACC_aptr_SubAreaPointers{$_l_TableRow}
	
	If (Size of array:C274($_ptr_ListBoxSetup->)=0) & (vALLevels>0)
		If (ACC_al_Levels{1}=0)
			$_bo_NewLevel:=True:C214
			
		Else 
			$_bo_NewLevel:=False:C215
			$_l_ReuseLevel:=ACC_al_Levels{1}
		End if 
	Else 
		$_bo_NewLevel:=False:C215
	End if 
End if 
$_l_Nul:=0
$_ptr_ListBoxSetup:=->$_l_Nul

Case of 
	: (ACC_al_ViewTabletoTable{ACC_at_ViewTabsLabels}=Table:C252(->[ACCOUNT_BALANCES:34]))
		OBJECT SET VISIBLE:C603(ACC_r_Balances; True:C214)
		//SET VISIBLE(ORD_lb_ArraySelection;False)
		
		LISTBOX SET TABLE SOURCE:C1013(ACC_r_Balances; ACC_al_ViewTabletoTable{ACC_at_ViewTabsLabels})
		
		$_l_TableRow:=Find in array:C230(ACC_al_SubAreaTables; ACC_al_ViewTabletoTable{ACC_at_ViewTabsLabels})
		If ($_l_TableRow<0)
			ARRAY POINTER:C280(ACC_aptr_AccBalPointers; 0)
			APPEND TO ARRAY:C911(ACC_aptr_SubAreaPointers; ->ACC_aptr_AccBalPointers)
			APPEND TO ARRAY:C911(ACC_al_SubAreaTables; Table:C252(->[ACCOUNT_BALANCES:34]))
			APPEND TO ARRAY:C911(ACC_at_SubAreaContext; "")
			APPEND TO ARRAY:C911(ACC_at_SubAreaContextUsage; "")
			$_l_TableRow:=Size of array:C274(ACC_aptr_SubAreaPointers)
			$_bo_NewLevel:=True:C214
			$_l_ReuseLevel:=0
		Else 
			$_bo_NewLevel:=False:C215
			$_l_ReuseLevel:=0
		End if 
		$_ptr_ListBoxSetup:=ACC_aptr_SubAreaPointers{$_l_TableRow}
		$_bo_LoadSetup:=True:C214
		
		READ ONLY:C145([ACCOUNT_BALANCES:34])
		
		
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
		
		
		If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ACC_l_ViewTabsLabelsOLD#ACC_at_ViewTabsLabels)
			ACC_l_ViewTabsLabelsOLD:=ACC_at_ViewTabsLabels
			//see also Contacts_InLPß
			//NG April 2004 Removed ◊Screen
			If ($_bo_NewLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->ACC_r_Balances; ->[ACCOUNT_BALANCES:34]x_ID:7; ->[ACCOUNTS:32]Account_Code:2; $_t_AreaHandlingOptions; ACC_at_ViewTabsFormNames{ACC_at_ViewTabsLabels}; Num:C11(ACC_at_ViewTabsFormSettings{ACC_at_ViewTabsLabels}); "Acc Balances"; "Account Balance"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ACC_SelectedRelated")
			End if 
			//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
			//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
			
			
		Else 
			
			OK:=1
			
			
			$_l_SortFieldNumber:=0
			LBi_Prefs11(->ACC_aptr_AccBalPointers)
			
			
			
		End if 
		LBi_LoadSetup(->ACC_aptr_AccBalPointers; "B"; 3)
		
End case 

ACC_LoadAccountAnalyses
ACC_LoadAccountLayers

RELATE ONE:C42([ACCOUNTS:32]Group_Heading:6)
vSAccount:=[HEADINGS:84]Heading_Name:2
RELATE ONE:C42([ACCOUNTS:32]Report_Heading:1)
vPAccount:=[HEADINGS:84]Heading_Name:2
vTitle2:=Term_VATWT("Input/Output/Neither")
vButtDisACCBAL:="I       FSSSRCADT"
Input_Buttons(->[ACCOUNTS:32]; ->vButtDisACCBAL)
Macro_AccType("Load "+String:C10(Table:C252(->[ACCOUNTS:32])))
ERR_MethodTrackerReturn("Accounts_InLPB"; $_t_oldMethodName)
