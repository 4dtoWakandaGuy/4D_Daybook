
If (False:C215)
	//Object Name:      Balance_Filters.oButtonAccept
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	C_BOOLEAN:C305($_bo_AnalysisSetup; $_bo_DisplayFIlters; $_bo_LayersSetup; DB_bo_AnalysisSetupOLD; DB_bo_DisplayFilters; DB_bo_DisplayFIltersOLD; DB_bo_LayersSetupOLD; LAY_bo_AnalSetup; LAY_bo_CurrenciesSetup; LAY_bo_CurrenciesSetupOLD; Lay_bo_HideFilters)
	C_BOOLEAN:C305(LAY_bo_LayerSetup; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_CurrentDisplayedForm; $_l_FormEvent; DB_l_CurrentDisplayedForm; DB_l_CurrentDisplayedFormOLD)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/Balance_Filters/oButtonAccept"; Form event code:C388)
$_l_FormEvent:=Form event code:C388

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
		
		If (Lay_bo_UpdateFilters)
			$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
			SRCH_Applyfilterstoselection($_ptr_Table)
		End if 
		DB_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedFormOLD
		DB_bo_DisplayFilters:=DB_bo_DisplayFIltersOLD
		LAY_bo_LayerSetup:=DB_bo_LayersSetupOLD
		LAY_bo_CurrenciesSetup:=LAY_bo_CurrenciesSetupOLD
		LAY_bo_AnalSetup:=DB_bo_AnalysisSetupOLD
		Lay_bo_UpdateFilters:=False:C215
		Lay_bo_HideFilters:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/Balance_Filters/oButtonAccept"; $_t_oldMethodName)
