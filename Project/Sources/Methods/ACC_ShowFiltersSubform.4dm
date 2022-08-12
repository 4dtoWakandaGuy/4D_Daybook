//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_ShowFiltersSubform
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
	C_BOOLEAN:C305($_bo_AnalysisSetup; $_bo_DisplayFIlters; $_bo_LayersSetup; DB_bo_DisplayFilters; DB_bo_AnalysisSetupOLD; DB_bo_DisplayFIltersOLD; DB_bo_LayersSetupOLD; LAY_bo_AnalSetup; LAY_bo_CurrenciesSetup; LAY_bo_LayerSetup; Lay_bo_UpdateFilters)
	C_BOOLEAN:C305(LAY_bo_CurrenciesSetupOLD)
	C_LONGINT:C283($_l_CurrentDisplayedForm; DB_l_CurrentDisplayedForm; DB_l_CurrentDisplayedFormOLD)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_ShowFiltersSubform")
DB_l_CurrentDisplayedFormOLD:=DB_l_CurrentDisplayedForm
DB_bo_DisplayFIltersOLD:=DB_bo_DisplayFilters
DB_bo_DisplayFilters:=True:C214
DB_l_CurrentDisplayedForm:=Table:C252(->[ACCOUNT_BALANCES:34])
DB_bo_LayersSetupOLD:=LAY_bo_LayerSetup
DB_bo_AnalysisSetupOLD:=LAY_bo_AnalSetup
LAY_bo_CurrenciesSetupOLD:=LAY_bo_CurrenciesSetup
LAY_bo_AnalSetup:=False:C215
LAY_bo_LayerSetup:=False:C215
LAY_bo_CurrenciesSetup:=False:C215
//DB_SetOutPutFilters (True;-1;-1;460;20;355;355;455)
DB_SetOutputFiltersTrial(True:C214; -1; -1; 460; 20; 355; 355; 455)
ERR_MethodTrackerReturn("ACC_ShowFiltersSubform"; $_t_oldMethodName)