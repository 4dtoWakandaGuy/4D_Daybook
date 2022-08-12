//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ModifyTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_ai_SelectedTables;0)
	//ARRAY LONGINT(SD2_al_SelectableTables;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_TableIndex; $_l_TableRow; SD_l_Changes; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ModifyTables")
DB_t_Methodname:=Current method name:C684
//$1 is pointer to an array of already selected restrictions
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		ARRAY LONGINT:C221(SD2_al_SelectableTables; 0)
		ARRAY TEXT:C222(SD2_at_SelectableTables; 0)
		ARRAY LONGINT:C221(SD2_al_SelectableTables; 99)
		ARRAY TEXT:C222(SD2_at_SelectableTables; 99)
		$_l_CurrentRow:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
		SD2_at_SelectableTables{$_l_CurrentRow}:="Companies"
		
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
		SD2_at_SelectableTables{$_l_CurrentRow}:="Contacts"
		
		If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  //General Ledger"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[ACCOUNTS:32])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Accounts"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[TRANSACTION_BATCHES:30])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Transaction Batches"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[TRANSACTIONS:29])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Transactions"
		End if 
		
		// or
		
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  //Sales Ledger
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[INVOICES:39])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Sales Invoices"
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  //Purchase Ledger"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Purchase Invoices"
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales Orders"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[ORDERS:24])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Sales Orders"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Order Items"
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)  //Subscriptions"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[SUBSCRIPTIONS:93])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Subscriptions"
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  //Purchase orders"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Purchase Orders"
			
		End if 
		If ((DB_GetModuleSettingByNUM(39))>1)  //Purchase orders
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[PRODUCTS:9])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Products"
			
		End if 
		
		
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)  // Project Manger"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[PROJECTS:89])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Projects"
			$_l_TableRow:=Find in array:C230(SD2_at_SelectableTables; "Jobs")
			If ($_l_TableRow<0)
				$_l_CurrentRow:=$_l_CurrentRow+1
				SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[JOBS:26])
				SD2_at_SelectableTables{$_l_CurrentRow}:="Jobs"
			End if 
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[JOB_STAGES:47])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Job Stages"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[JOB PERSONNEL:48])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Job Pesonnel"
			
		End if 
		
		If ((DB_GetModuleSettingByNUM(1))>1)  // CRM
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Companies"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Centre"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[CONTRACTS:17])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Companies"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[SERVICE_CALLS:20])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Contacts"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)  // Service Centre"
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENTS:40])
			SD2_at_SelectableTables{$_l_CurrentRow}:="Stock Movements"
			If (False:C215)
				$_l_CurrentRow:=$_l_CurrentRow+1
				SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[CURRENT_STOCK:62])
				SD2_at_SelectableTables{$_l_CurrentRow}:="Current Stock"
			End if 
		End if 
		// Documents
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_al_SelectableTables{$_l_CurrentRow}:=Table:C252(->[DOCUMENTS:7])
		SD2_at_SelectableTables{$_l_CurrentRow}:="Documents"
		
		//Accounts²
		
		//Attendees²
		
		//Companies²
		//Contacts²
		//Contracts²
		//(Currrent Stock)
		//Documents
		//Events²
		//Invoices²
		//Job Stages²
		//Jobs(Agency²)
		//Orders²
		//Order Items²
		//Stock Movements²
		//Products²
		//Projects²
		//Purchase Orders²
		//Purchases²
		//Service Calls²
		//Subscriptions²
		//Trans iN(batches²
		//Transactions²
		ARRAY INTEGER:C220(SD2_ai_SelectedTables; 0)
		ARRAY LONGINT:C221(SD2_al_SelectableTables; $_l_CurrentRow)
		ARRAY TEXT:C222(SD2_at_SelectableTables; $_l_CurrentRow)
		ARRAY INTEGER:C220(SD2_ai_SelectedTables; $_l_CurrentRow)
		For ($_l_TableIndex; 1; Size of array:C274($1->))
			$_l_TableRow:=Find in array:C230(SD2_al_SelectableTables; $1->{$_l_TableIndex})
			If ($_l_TableRow>0)  //it should be
				SD2_ai_SelectedTables{$_l_TableRow}:=1
			End if 
		End for 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1984; "Select Data Types")
		DIALOG:C40([USER:15]; "SD2_TableSelector")
		
		If (SD_l_Changes>0)
			For ($_l_TableIndex; Size of array:C274($1->); 1; -1)
				$_l_TableRow:=Find in array:C230(SD2_al_SelectableTables; $1->{$_l_TableIndex})
				If ($_l_TableRow>0)  //it should be
					If (SD2_ai_SelectedTables{$_l_TableRow}=0)
						SD2_ai_SelectedTables{$_l_TableRow}:=0
						DELETE FROM ARRAY:C228($1->; $_l_TableIndex)
					End if 
				End if 
			End for 
			For ($_l_TableIndex; 1; Size of array:C274(SD2_ai_SelectedTables))
				If (SD2_ai_SelectedTables{$_l_TableIndex}=1)
					$_l_TableRow:=Find in array:C230($1->; SD2_al_SelectableTables{$_l_TableIndex})
					If ($_l_TableRow<0)
						INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
						$1->{Size of array:C274($1->)}:=SD2_al_SelectableTables{$_l_TableIndex}
					End if 
					
				End if 
				
			End for 
			
		End if 
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
End if 
ERR_MethodTrackerReturn("SD2_ModifyTables"; $_t_oldMethodName)
