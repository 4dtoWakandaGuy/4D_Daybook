If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oclearFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FiltersActive; DB_bo_DisplayFilters; DB_bo_FiltersActivated; DB_bo_FiltersTouched; SI_bo_FilterZeros)
	C_LONGINT:C283($_l_event; $_l_TableNumber; ACC_l_BalanceSheet; ACC_l_Both; ACC_l_ContextualFilterFrom; ACC_l_ContextualFilterTo; ACC_l_ProfitSheet; DB_l_CurrentDisplayedForm; INV_l_Both; INV_l_Closed; INV_l_Open)
	C_TEXT:C284($_t_oldMethodName; DB_T_CurrentFilterName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oclearFilters"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		
		
		Gen_Confirm("Are you sure you want to clear the current active filters"; "Yes"; "No")
		If (OK=1)
			If (DB_bo_FiltersActivated)
				DB_bo_FiltersActivated:=False:C215
				DB_T_CurrentFilterName:=""
				
				SEL_CurrentRecordSelection
				
				$_l_TableNumber:=DB_l_CurrentDisplayedForm
				$_bo_FiltersActive:=False:C215
				If (DB_bo_DisplayFilters)
					ACC_l_ContextualFilterFrom:=0
					ACC_l_ContextualFilterTo:=0
					SI_bo_FilterZeros:=False:C215
					INV_l_Closed:=0
					INV_l_Open:=0
					INV_l_Both:=0
					ACC_l_BalanceSheet:=0
					ACC_l_ProfitSheet:=0
					ACC_l_Both:=0
					DB_SetFilters
				End if 
				
				//If ($_bo_FiltersActive)
				OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oFiltersMessage"; False:C215)
				OBJECT SET ENABLED:C1123(*; "oclearFilters"; False:C215)
				DB_bo_FiltersTouched:=False:C215
				//End if
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oclearFilters"; $_t_oldMethodName)
