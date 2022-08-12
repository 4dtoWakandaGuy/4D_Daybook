
If (False:C215)
	//Database Method Name:      Balance_Filters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(LAY_abo_Exclude;0)
	//ARRAY BOOLEAN(LAY_abo_Include;0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(ANAL_at_AnalName;0)
	//ARRAY TEXT(CUR_at_curcode;0)
	//ARRAY TEXT(CUR_at_CurName;0)
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_layName;0)
	C_BOOLEAN:C305(LAY_bo_LayerSetup)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/Balance_Filters/{formMethod}"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
If (False:C215)
	DB_SetOutFilterPeriods(->[ACCOUNT_BALANCES:34])
	
	If (Records in table:C83([ANALYSES:36])>0)
		DB_SetOutFiltersAnalysis(->[ACCOUNT_BALANCES:34])
	Else 
		ARRAY TEXT:C222(ANAL_at_analcode; 0)
		ARRAY TEXT:C222(ANAL_at_AnalName; 0)
		ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
		ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
	End if 
	If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //multi currency
		
		
		DB_SetoutFilterLayers(->[ACCOUNTS_LAYERS:156])
		
		
	Else 
		ARRAY TEXT:C222(LAY_at_laycode; 0)
		ARRAY TEXT:C222(LAY_at_layName; 0)
		
		ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
		ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
	End if 
	If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
		
		DB_SetoutFilterCurrencies(->[ACCOUNT_BALANCES:34])
	Else 
		ARRAY TEXT:C222(CUR_at_curcode; 0)
		ARRAY TEXT:C222(CUR_at_CurName; 0)
		ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
		ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
	End if 
End if 
ERR_MethodTrackerReturn("FM [projectForm]/Balance_Filters/{formMethod}"; $_t_oldMethodName)
