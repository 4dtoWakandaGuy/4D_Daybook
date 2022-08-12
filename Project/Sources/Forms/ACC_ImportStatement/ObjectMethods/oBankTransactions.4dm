If (False:C215)
	//object Method Name: Object Name:      ACC_ImportStatement.oBankTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2013 17:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_Transactions;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_aptr_BankStatements;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_ProcessVisible; $_bo_RelationFound; DB_bo_AutorelationsTemp)
	C_LONGINT:C283($_l_ColumnNumber; $_l_CurrentDisplayedForm; $_l_CurrentSortColumn; $_l_CurrentSortSetting; $_l_Event; $_l_FieldIndex; $_l_FieldNumber; $_l_FormSettingRow; $_l_FSSortDirection; $_l_LBSortDirection; $_l_OneField)
	C_LONGINT:C283($_l_OneTable; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_SelectedColumn; $_l_SelectedRow; $_l_SortFieldNumber; $_l_TableNumber; FS_l_SortDirection)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayReferences; $_Ptr_ColumnHeaderVar; $_ptr_Field)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_processName; $_t_VariableName; ACC_t_DBAccountCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.oBankTransactions"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Header Click:K2:40)
		$_l_CurrentDisplayedForm:=Table:C252(->[ACC_Bank_Statements:198])
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->ACC_lb_Transactions; ""; $_t_VariableName)
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		LISTBOX GET ARRAYS:C832(*; "oBankTransactions"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		If (Not:C34(<>FS_bo_FSettingsLoaded))
			FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
		End if 
		PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
		$_ptr_ArrayReferences:=DB_aptr_BankStatements{9}
		$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
		
		If (Length:C16($_t_CurrentDefinitionsName)>55)
			$_t_CurrentDefinitionsName:=Substring:C12($_t_CurrentDefinitionsName; 1; 55)
		End if 
		$_l_Retries:=0
		$_ptr_ArrayFieldPointers:=DB_aptr_BankStatements{2}
		$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
		$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
		
		While (Semaphore:C143("$WriteFormsortPref"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks($_l_Retries*2)
		End while 
		$_l_FormSettingRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
		$_Ptr_ColumnHeaderVar:=$_aptr_HeaderVariables{$_l_CurrentSortColumn}
		$_l_CurrentSortSetting:=$_Ptr_ColumnHeaderVar->
		$_l_FSSortDirection:=FS_l_SortDirection
		$_l_ColumnNumber:=$_l_CurrentSortColumn
		Case of 
				
			: ($_l_CurrentSortSetting>=2)
				
				$_l_FSSortDirection:=1
				
			: ($_l_CurrentSortSetting<2)
				
				$_l_FSSortDirection:=2
				
		End case 
		$_l_LBSortDirection:=0
		
		If ($_l_FormSettingRow>0)
			
			$_l_LBSortDirection:=$_l_FSSortDirection
			
			If ($_l_SortFieldNumber=<>FS_al_FormSortFieldNum{$_l_FormSettingRow}) | ((-Abs:C99($_l_ColumnNumber))=<>FS_al_FormSortFieldNum{$_l_FormSettingRow})
				
				$_l_LBSortDirection:=$_l_FSSortDirection
				
			Else 
				$_l_LBSortDirection:=$_l_FSSortDirection
			End if 
		Else 
			$_l_LBSortDirection:=1
		End if 
		
		CLEAR SEMAPHORE:C144("$WriteFormsortPref")
		//Need to test if this is the current sort field
		//remember the sort field for the area?
		If ($_l_TableNumber#$_l_CurrentDisplayedForm)
			DB_bo_AutorelationsTemp:=True:C214
			$_bo_RelationFound:=False:C215
			For ($_l_FieldIndex; 1; Get last field number:C255($_l_CurrentDisplayedForm))
				If (Is field number valid:C1000($_l_CurrentDisplayedForm; $_l_FieldIndex))
					GET RELATION PROPERTIES:C686($_l_CurrentDisplayedForm; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
					If ($_l_OneTable=$_l_TableNumber)
						
						$_ptr_Field:=Field:C253($_l_CurrentDisplayedForm; $_l_FieldIndex)
						SET FIELD RELATION:C919($_ptr_Field->; Automatic:K51:4; Manual:K51:3)
						$_bo_RelationFound:=True:C214
						$_l_FieldIndex:=99999
					End if 
				End if 
			End for 
			If (Not:C34($_bo_RelationFound))
				SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
			End if 
		End if 
		
		If ($_l_SortFieldNumber>0) & ($_l_TableNumber>0)
			If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#7) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#3) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#30)
				FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_LBSortDirection; $_l_SortFieldNumber; $_l_TableNumber; ""; "")
			Else 
				If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)=7)
					FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_LBSortDirection; -Abs:C99($_l_ColumnNumber); $_l_TableNumber; ""; "")
				End if 
				
			End if 
		End if 
		SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		
		
	: ($_l_Event=On Double Clicked:K2:5)
		LISTBOX GET CELL POSITION:C971(*; "oBankTransactions"; $_l_SelectedColumn; $_l_SelectedRow)
		If ($_l_SelectedRow>0)
			GOTO SELECTED RECORD:C245([ACC_Bank_Statements:198]; $_l_SelectedRow)
			LOAD RECORD:C52([ACC_Bank_Statements:198])
			Case of 
				: ([ACC_Bank_Statements:198]Bank_CreditAmount:9#0)
					COPY NAMED SELECTION:C331([ACC_Bank_Statements:198]; "$temp")
					//If ([ACC_Bank_Statements]ACC_r_ReconciledAmount<[ACC_Bank_Statements]ACC_CreditAmount)
					//This record is not fully reconcilled.
					ACC_ReconcileTransaction([ACC_Bank_Statements:198]x_ID:1; [ACC_Bank_Statements:198]Bank_Account_Number:2; [ACC_Bank_Statements:198]Bank_CreditAmount:9; [ACC_Bank_Statements:198]Bank_ReconciledAmount:11; "C"; ACC_t_DBAccountCode)
					REDUCE SELECTION:C351([ACC_Bank_Statements:198]; 0)
					USE NAMED SELECTION:C332("$temp")
					DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
					
					//Else
					//End if
				: ([ACC_Bank_Statements:198]Bank_DebitAmount:8#0)
					COPY NAMED SELECTION:C331([ACC_Bank_Statements:198]; "$temp")
					
					//If ([ACC_Bank_Statements]ACC_r_ReconciledAmount<[ACC_Bank_Statements]ACC_DebitAmount)
					ACC_ReconcileTransaction([ACC_Bank_Statements:198]x_ID:1; [ACC_Bank_Statements:198]Bank_Account_Number:2; [ACC_Bank_Statements:198]Bank_DebitAmount:8; [ACC_Bank_Statements:198]Bank_ReconciledAmount:11; "D"; ACC_t_DBAccountCode)
					REDUCE SELECTION:C351([ACC_Bank_Statements:198]; 0)
					USE NAMED SELECTION:C332("$temp")
					DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
					
					//Else
					//End if
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oBankTransactions"; $_t_oldMethodName)
