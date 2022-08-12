//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalInLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACB_al_Levels;0)
	//ARRAY LONGINT(ACB_al_SubAreaTables;0)
	//ARRAY LONGINT(ACB_al_TabIds;0)
	//ARRAY LONGINT(ACB_al_TabIncludes;0;0)
	//ARRAY LONGINT(ACB_al_ViewTableToTable;0)
	//ARRAY LONGINT(ACB_al_ViewTabsStates;0)
	//ARRAY LONGINT(ACB_l_ViewTabsSettings;0)
	//ARRAY LONGINT(ACC al_DocIncludes;0)
	//ARRAY POINTER(ACB_aptr_AccBalPointers;0)
	//ARRAY POINTER(ACB_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACB_at_SubAreaContext;0)
	//ARRAY TEXT(ACB_at_SubAreaContextUsage;0)
	//ARRAY TEXT(ACB_at_TabNames;0)
	//ARRAY TEXT(ACB_at_ViewTabsFormNames;0)
	//ARRAY TEXT(ACB_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(ACB_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_LoadSetup; $_Bo_NewLevel; $_bo_unique; ACB_bo_ShowBalances)
	C_LONGINT:C283($_l_Null; $_l_ReUseLevel; $_l_SortFieldNumber; $_l_TableRow; ACB_l_ViewTabsLabelsOLD; vALLevels)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ACB_R_Transactions; ACC_r_TransactionsTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CashVat; $_t_HandlerCharacter1; $_t_oldMethodName; $_t_Reference; $_t_TaxQuery; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAccount)
	C_TEXT:C284(vAnalysis; vButtDisAccBal; vLayer; vPeriod; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalInLPB")
RELATE ONE:C42([ACCOUNT_BALANCES:34]Analysis_Code:1)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
RELATE ONE:C42([ACCOUNT_BALANCES:34]Account_Code:2)
vAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([ACCOUNT_BALANCES:34]Period_Code:4)
vPeriod:=[PERIODS:33]Period_Name:2
RELATE ONE:C42([ACCOUNT_BALANCES:34]Layer_Code:5)
vLayer:=[LAYERS:76]Layer_Name:2
If (([ACCOUNT_BALANCES:34]Currency_Code:6="") & ([ACCOUNT_BALANCES:34]Account_Code:2=""))
	[ACCOUNT_BALANCES:34]Currency_Code:6:=<>SYS_t_BaseCurrency
End if 
RELATE ONE:C42([ACCOUNT_BALANCES:34]Currency_Code:6)
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
If ((DB_t_CurrentFormUsage="Budget") & ([ACCOUNT_BALANCES:34]Account_Code:2=""))
	[ACCOUNT_BALANCES:34]Layer_Code:5:="B"
End if 


vTitle:=Uppercase:C13(vLayer+" "+Get localized string:C991("FieldLabels_balance"))
If ([ACCOUNT_BALANCES:34]Layer_Code:5#DB_GetLedgerActualLayer)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Analysis_Code:1; True:C214)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Account_Code:2; True:C214)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Period_Code:4; True:C214)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Balance:3; True:C214)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Layer_Code:5; True:C214)
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
		
		OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Currency_Code:6; True:C214)
	End if 
Else 
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Analysis_Code:1; False:C215)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Account_Code:2; False:C215)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Period_Code:4; False:C215)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Balance:3; False:C215)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Layer_Code:5; False:C215)
	OBJECT SET ENTERABLE:C238([ACCOUNT_BALANCES:34]Currency_Code:6; False:C215)
End if 
ARRAY TEXT:C222(ACB_at_ViewTabsLabels; 0)
ARRAY LONGINT:C221(ACB_l_ViewTabsSettings; 0)
ARRAY LONGINT:C221(ACB_al_ViewTabsStates; 0)
ARRAY TEXT:C222(ACB_at_ViewTabsFormNames; 0)
ARRAY TEXT:C222(ACB_at_ViewTabsFormSettings; 0)
ARRAY LONGINT:C221(ACB_al_ViewTableToTable; 0)
ARRAY TEXT:C222(ACB_at_TabNames; 0)
ARRAY LONGINT:C221(ACB_al_TabIds; 0)
ARRAY LONGINT:C221(ACB_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(ACC al_DocIncludes; 0)


APPEND TO ARRAY:C911(ACB_at_ViewTabsLabels; "TRANSACTIONS")

APPEND TO ARRAY:C911(ACB_l_ViewTabsSettings; 0)  //edit on screen
APPEND TO ARRAY:C911(ACB_al_ViewTabsStates; 2)
APPEND TO ARRAY:C911(ACB_at_ViewTabsFormNames; "Trans_in")
APPEND TO ARRAY:C911(ACB_at_ViewTabsFormSettings; "1")  //+(3+Num(SYS_t_AccessType="Q")+(2*(Num((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@")))))
APPEND TO ARRAY:C911(ACB_al_ViewTableToTable; Table:C252(->[TRANSACTIONS:29]))

ACB_at_ViewTabsLabels:=1
$_t_Reference:="311111000"
ARRAY LONGINT:C221(ACB_al_Levels; 1)
$_l_ReUseLevel:=0
$_l_TableRow:=Find in array:C230(ACB_al_SubAreaTables; ACB_al_ViewTableToTable{ACB_at_ViewTabsLabels})
If ($_l_TableRow>0)
	$_ptr_ListBoxSetup:=ACB_aptr_SubAreaPointers{$_l_TableRow}
	
	If (Size of array:C274($_ptr_ListBoxSetup->)=0) & (vALLevels>0)
		If (ACB_al_Levels{1}=0)
			$_Bo_NewLevel:=True:C214
			
		Else 
			$_Bo_NewLevel:=False:C215
			$_l_ReUseLevel:=ACB_al_Levels{1}
		End if 
	Else 
		$_Bo_NewLevel:=False:C215
	End if 
End if 
$_l_Null:=0
$_ptr_ListBoxSetup:=->$_l_Null

Case of 
	: (ACB_al_ViewTableToTable{ACB_at_ViewTabsLabels}=Table:C252(->[TRANSACTIONS:29]))
		OBJECT SET VISIBLE:C603(ACB_R_Transactions; True:C214)
		//SET VISIBLE(ORD_lb_ArraySelection;False)
		
		LISTBOX SET TABLE SOURCE:C1013(ACB_R_Transactions; ACB_al_ViewTableToTable{ACB_at_ViewTabsLabels})
		
		$_l_TableRow:=Find in array:C230(ACB_al_SubAreaTables; ACB_al_ViewTableToTable{ACB_at_ViewTabsLabels})
		If ($_l_TableRow<0)
			ARRAY POINTER:C280(ACB_aptr_AccBalPointers; 0)
			APPEND TO ARRAY:C911(ACB_aptr_SubAreaPointers; ->ACB_aptr_AccBalPointers)
			APPEND TO ARRAY:C911(ACB_al_SubAreaTables; Table:C252(->[TRANSACTIONS:29]))
			APPEND TO ARRAY:C911(ACB_at_SubAreaContext; "")
			APPEND TO ARRAY:C911(ACB_at_SubAreaContextUsage; "")
			$_l_TableRow:=Size of array:C274(ACB_aptr_SubAreaPointers)
			$_Bo_NewLevel:=True:C214
			$_l_ReUseLevel:=0
		Else 
			$_Bo_NewLevel:=False:C215
			$_l_ReUseLevel:=0
		End if 
		$_ptr_ListBoxSetup:=ACB_aptr_SubAreaPointers{$_l_TableRow}
		$_bo_LoadSetup:=True:C214
		
		READ ONLY:C145([TRANSACTIONS:29])
		Case of 
			: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
				
				$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"OS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				ACC_r_TransactionsTotal:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				$_t_TaxQuery:=ACC_Buildunique(DB_GetLedgerVatInputACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"OS")
				
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				ACC_r_TransactionsTotal:=Gen_Round((ACC_r_TransactionsTotal+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				
			: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC) & (DB_GetLedgerCashvatACC#"")
				$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC")
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="IC")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				UNION:C120("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				UNION:C120("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				ACC_r_TransactionsTotal:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
				QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				ACC_r_TransactionsTotal:=Gen_Round((ACC_r_TransactionsTotal+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				$_t_CashVat:=ACC_Buildunique(DB_GetLedgerCashvatACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_CashVat)
				ACC_r_TransactionsTotal:=Gen_Round((ACC_r_TransactionsTotal+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				
			Else 
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6)
				ACC_r_TransactionsTotal:=Sum:C1([TRANSACTIONS:29]Amount:6)
		End case 
		
		
		If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ACB_l_ViewTabsLabelsOLD#ACB_at_ViewTabsLabels)
			ACB_l_ViewTabsLabelsOLD:=ACB_at_ViewTabsLabels
			//see also Contacts_InLPß
			//NG April 2004 Removed ◊Screen
			If ($_Bo_NewLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->ACB_R_Transactions; ->[TRANSACTIONS:29]Transaction_ID:31; ->[ACCOUNT_BALANCES:34]Account_Code:2; $_t_Reference; ACB_at_ViewTabsFormNames{ACB_at_ViewTabsLabels}; Num:C11(ACB_at_ViewTabsFormSettings{ACB_at_ViewTabsLabels}); "Transactions"; "Transactions"; ""; $_Bo_NewLevel; $_l_ReUseLevel; "ACB_SelectedRelated")
			End if 
			//ACC_r_TransactionsTotal:=Sum([TRANSACTIONS]Amount)
			//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
			//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
			
			
		Else 
			
			OK:=1
			
			
			$_l_SortFieldNumber:=0
			LBi_Prefs11(->ACB_aptr_AccBalPointers)
			
			
			
		End if 
		$_t_HandlerCharacter1:="p"
		LBi_LoadSetup(->ACB_aptr_AccBalPointers; $_t_HandlerCharacter1; 3)
End case 

vButtDisAccBal:="I DPMO  FSSSRCADT"
Input_Buttons(->[ACCOUNT_BALANCES:34]; ->vButtDisAccBal)
Macro_AccType("Load "+String:C10(Table:C252(->[ACCOUNT_BALANCES:34])))
ERR_MethodTrackerReturn("ACC_BalInLPB"; $_t_oldMethodName)
