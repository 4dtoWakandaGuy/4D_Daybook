If (False:C215)
	//object Method Name: Object Name:      Balance_Filters.oButtonCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 09:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_AnalysisSetupOLD; DB_bo_DisplayFilters; DB_bo_DisplayFIltersOLD; DB_bo_LayersSetupOLD; LAY_bo_AnalSetup; LAY_bo_CurrenciesSetup; LAY_bo_CurrenciesSetupOLD; Lay_bo_HideFilters; LAY_bo_LayerSetup; Lay_bo_UpdateFilters; LB_bo_UpdateFilters)
	C_LONGINT:C283($_l_FormEvent; DB_l_CurrentDisplayedForm; DB_l_CurrentDisplayedFormOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ BUTTONS_SUBFORM.oButtonCancel")
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		
		OBJECT SET VISIBLE:C603(*; "oSubFormContainer"; False:C215)
		DB_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedFormOLD
		DB_bo_DisplayFilters:=DB_bo_DisplayFIltersOLD
		LAY_bo_LayerSetup:=DB_bo_LayersSetupOLD
		LAY_bo_CurrenciesSetup:=LAY_bo_CurrenciesSetupOLD
		LAY_bo_AnalSetup:=DB_bo_AnalysisSetupOLD
		LB_bo_UpdateFilters:=False:C215
		Lay_bo_HideFilters:=True:C214
		
End case 
ERR_MethodTrackerReturn("OBJ BUTTONS_SUBFORM.oButtonCancel"; $_t_oldMethodName)
