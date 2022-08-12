If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.oListBoxBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_SubAreaTables;0)
	//ARRAY LONGINT(ACC_al_ViewTabletoTable;0)
	//ARRAY POINTER(ACC_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACC_at_ModeAccounts;0)
	//ARRAY TEXT(ACC_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_TableRow; LB_l_CurrentSortColumn; LB_l_LastRow)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ACC_R_Balances)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.oListBoxBalances"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Header Click:K2:40)
		
		$_l_TableRow:=Find in array:C230(ACC_al_SubAreaTables; Table:C252(->[ACCOUNT_BALANCES:34]))
		
		If ($_l_TableRow>0)
			$_ptr_ListBoxSetup:=ACC_aptr_SubAreaPointers{$_l_TableRow}
			LB_l_LastRow:=0
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			$_l_Row:=Self:C308->
			$_l_CurrentSortColumn:=LB_GetColumn(->ACC_R_Balances; ""; $_t_VariableName)
			LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
			LBi_AreaScript($_ptr_ListBoxSetup; 0; [ACCOUNTS:32]Account_Code:2; ->ACC_at_ModeAccounts; $_l_Row; $_t_VariableName; "ACC_LBI_Items"; $_l_CurrentSortColumn)
		End if 
		//***********ends**********************************
		//``
	: ($_l_event=On Drag Over:K2:13)
	Else 
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		LISTBOX GET CELL POSITION:C971(ACC_R_Balances; $_l_Column; $_l_Row)
		//$_l_Row:=Self->
		
		
		$_l_TableRow:=Find in array:C230(ACC_al_SubAreaTables; Table:C252(->[ACCOUNT_BALANCES:34]))
		
		If ($_l_TableRow>0)
			$_ptr_ListBoxSetup:=ACC_aptr_SubAreaPointers{$_l_TableRow}
			Case of 
				: (ACC_al_ViewTabletoTable{ACC_at_ViewTabsLabels}=Table:C252(->[ACCOUNT_BALANCES:34]))
					LBi_AreaScript($_ptr_ListBoxSetup; 0; [ACCOUNT_BALANCES:34]Account_Code:2; ->ACC_at_ModeAccounts; $_l_Row; $_t_VariableName; "ACC_LBI_Items")
				Else 
					//Open diary items, Invoices_In a seperate process
					LBi_AreaScript($_ptr_ListBoxSetup; 1; [ORDERS:24]Order_Code:3; ->ACC_at_ModeAccounts; $_l_Row; $_t_VariableName; "ACC_LBI_Items")
			End case 
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.oListBoxBalances"; $_t_oldMethodName)
