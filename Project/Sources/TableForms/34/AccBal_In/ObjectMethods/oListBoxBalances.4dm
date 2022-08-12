If (False:C215)
	//object Method Name: Object Name:      [ACCOUNT_BALANCES].AccBal_in.oListBoxBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2011 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACB_al_SubAreaTables;0)
	//ARRAY LONGINT(ACB_al_ViewTableToTable;0)
	//ARRAY POINTER(ACB_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACB_at_ModeAccounts;0)
	//ARRAY TEXT(ACB_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_AccountbalancesRow; $_l_CurrentSortColumn; $_l_Event; $_l_FieldNumber; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber; LB_l_CurrentSortColumn; LB_l_LastRow)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ACB_R_TRANSACTIONS)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].AccBal_in.oListBoxBalances"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Header Click:K2:40)
		
		
		$_l_AccountbalancesRow:=Find in array:C230(ACB_al_SubAreaTables; Table:C252(->[ACCOUNT_BALANCES:34]))
		
		If ($_l_AccountbalancesRow>0)
			$_ptr_ListBoxSetup:=ACB_aptr_SubAreaPointers{$_l_AccountbalancesRow}
			LB_l_LastRow:=0
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			$_l_SelectedRow:=Self:C308->
			$_l_CurrentSortColumn:=LB_GetColumn(->ACB_R_TRANSACTIONS; ""; $_t_VariableName)
			LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
			LBi_AreaScript($_ptr_ListBoxSetup; 0; [ACCOUNTS:32]Account_Code:2; ->ACB_at_ModeAccounts; $_l_SelectedRow; $_t_VariableName; "ACB_LBI_Items"; $_l_CurrentSortColumn)
		End if 
		//***********ends**********************************
		//``
	: ($_l_Event=On Drag Over:K2:13)
		
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		LISTBOX GET CELL POSITION:C971(ACB_R_TRANSACTIONS; $_l_SelectedColumn; $_l_SelectedRow)
		//$_l_SelectedRow:=Self->
		
		
		$_l_AccountbalancesRow:=Find in array:C230(ACB_al_SubAreaTables; Table:C252(->[TRANSACTIONS:29]))
		
		If ($_l_AccountbalancesRow>0)
			$_ptr_ListBoxSetup:=ACB_aptr_SubAreaPointers{$_l_AccountbalancesRow}
			Case of 
				: (ACB_al_ViewTableToTable{ACB_at_ViewTabsLabels}=Table:C252(->[TRANSACTIONS:29]))
					LBi_AreaScript($_ptr_ListBoxSetup; 0; [ACCOUNT_BALANCES:34]Account_Code:2; ->ACB_at_ModeAccounts; $_l_SelectedRow; $_t_VariableName; "ACB_LBI_Items")
				Else 
					//Open diary items, Invoices_In a seperate process
					LBi_AreaScript($_ptr_ListBoxSetup; 1; [ACCOUNT_BALANCES:34]Account_Code:2; ->ACB_at_ModeAccounts; $_l_SelectedRow; $_t_VariableName; "ACB_LBI_Items")
			End case 
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].AccBal_in.oListBoxBalances"; $_t_oldMethodName)
