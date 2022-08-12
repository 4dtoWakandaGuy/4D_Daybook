If (False:C215)
	//object Method Name: Object Name:      [WORKFLOW_CONTROL].Workflow_Control_In.oButtonAddWF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/11/2012 01:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_WorkflowManagerListbox;0)
	//ARRAY LONGINT(SD2_al_SelectableTables;0)
	//ARRAY LONGINT(WFM_al_WorkflowTables;0)
	//ARRAY TEXT(SD2_at_MacroCodes;0)
	//ARRAY TEXT(SD2_at_MacroName;0)
	//ARRAY TEXT(SD2_at_pop;0)
	//ARRAY TEXT(SD2_at_pop2;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	//ARRAY TEXT(WFM_at_ScriptCodes;0)
	//ARRAY TEXT(WFM_at_ScriptNames;0)
	//ARRAY TEXT(WFM_at_WorkflowTables;0)
	C_LONGINT:C283($_l_CurrentElement; $_l_event; $_l_MaxCodeLength; $_l_ScriptsIndex; $_l_TableRow; $_l_WorkFlowScripts; SD2_but_AddWF; SD2_but_ButWFClear; SD2_l_SelectedRow; SD2_l_WFAddMode)
	C_TEXT:C284($_t_FixedLengthCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oButtonAddWF"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD2_l_WFAddMode=0)  //mode is nothing button says add so we are adding
				OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; True:C214)
				OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
				SD2_l_WFAddMode:=1
				OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Save")
				LISTBOX INSERT ROWS:C913(SD2_lb_WorkflowManagerListbox; 1)
				
				ARRAY LONGINT:C221(SD2_al_SelectableTables; 0)
				ARRAY TEXT:C222(SD2_at_SelectableTables; 0)
				ARRAY LONGINT:C221(SD2_al_SelectableTables; 99)
				ARRAY TEXT:C222(SD2_at_SelectableTables; 99)
				$_l_CurrentElement:=0
				$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[COMPANIES:2]))
				If ($_l_TableRow<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[COMPANIES:2])
					SD2_at_SelectableTables{$_l_CurrentElement}:="Companies"
				End if 
				$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[CONTACTS:1]))
				If ($_l_TableRow<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CONTACTS:1])
					SD2_at_SelectableTables{$_l_CurrentElement}:="Contacts"
				End if 
				
				If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  //General Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ACCOUNTS:32]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ACCOUNTS:32])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Accounts"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[TRANSACTION_BATCHES:30]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[TRANSACTION_BATCHES:30])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Transaction Batches"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[TRANSACTIONS:29]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[TRANSACTIONS:29])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Transactions"
					End if 
				End if 
				
				// or
				
				If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  //Sales Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[INVOICES:39]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[INVOICES:39])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Sales Invoices"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  //Purchase Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PURCHASE_INVOICES:37]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PURCHASE_INVOICES:37])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Purchase Invoices"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales Orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ORDERS:24]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Sales Orders"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ORDER_ITEMS:25]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ORDER_ITEMS:25])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Order Items"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)  //Subscriptions
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[SUBSCRIPTIONS:93]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[SUBSCRIPTIONS:93])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Subscriptions"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  //Purchase orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PURCHASE_ORDERS:57]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PURCHASE_ORDERS:57])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Purchase Orders"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(39))>1)  //Purchase orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PRODUCTS:9]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PRODUCTS:9])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Products"
					End if 
				End if 
				
				
				If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)  // Project Manger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PROJECTS:89]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PROJECTS:89])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Projects"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOBS:26]))
					If ($_l_TableRow<0)
						$_l_TableRow:=Find in array:C230(SD2_at_SelectableTables; "Jobs")
						If ($_l_TableRow<0)
							$_l_CurrentElement:=$_l_CurrentElement+1
							SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOBS:26])
							SD2_at_SelectableTables{$_l_CurrentElement}:="Jobs"
						End if 
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOB_STAGES:47]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOB_STAGES:47])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Job Stages"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOB PERSONNEL:48]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOB PERSONNEL:48])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Job Pesonnel"
					End if 
					
				End if 
				
				If ((DB_GetModuleSettingByNUM(1))>1)  // CRM
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[COMPANIES:2]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[COMPANIES:2])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Companies"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Centre"
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[CONTRACTS:17]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CONTRACTS:17])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Contracts"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[SERVICE_CALLS:20]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[SERVICE_CALLS:20])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Service Calls"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)  // Service Centre
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[STOCK_MOVEMENTS:40]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[STOCK_MOVEMENTS:40])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Stock Movements"
					End if 
					If (False:C215)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CURRENT_STOCK:62])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Current Stock"
					End if 
				End if 
				ARRAY LONGINT:C221(SD2_al_SelectableTables; $_l_CurrentElement)
				ARRAY TEXT:C222(SD2_at_SelectableTables; $_l_CurrentElement)
				//```
				ARRAY TEXT:C222(SD2_at_pop; 0)
				ARRAY TEXT:C222(SD2_at_pop2; 0)
				ARRAY TEXT:C222(SD2_at_MacroName; 0)
				ARRAY TEXT:C222(SD2_at_MacroCodes; 0)
				
				COPY ARRAY:C226(SD2_at_SelectableTables; SD2_at_pop)
				
				$_l_WorkFlowScripts:=WF Macros
				
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_WorkFlowScripts)
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; SD2_at_MacroCodes; [SCRIPTS:80]Script_Name:2; SD2_at_MacroName)
				$_l_MaxCodeLength:=0
				For ($_l_ScriptsIndex; 1; Size of array:C274(SD2_at_MacroName))
					If (Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex})>$_l_MaxCodeLength)
						$_l_MaxCodeLength:=Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex})
					End if 
				End for 
				For ($_l_ScriptsIndex; 1; Size of array:C274(SD2_at_MacroName))
					$_t_FixedLengthCode:=" "*($_l_MaxCodeLength-Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex}))+SD2_at_MacroCodes{$_l_ScriptsIndex}
					SD2_at_MacroName{$_l_ScriptsIndex}:=$_t_FixedLengthCode+","+SD2_at_MacroName{$_l_ScriptsIndex}
				End for 
				
				//APPEND TO ARRAY(SD2_at_MacroName;"-")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Use Standardised Settings")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Select Another Macro")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Create Macro")
				//APPEND TO ARRAY(SD2_at_MacroCodes;"-1")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-2")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-3")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-4")
				
				COPY ARRAY:C226(SD2_at_MacroName; SD2_at_pop2)
				LB_SetChoiceList("lbMulti"; ->SD2_at_pop; ->WFM_at_WorkflowTables)
				LB_SetChoiceList("lbMulti2"; ->SD2_at_pop2; ->WFM_at_ScriptNames)
				
				
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; True:C214; 1; "")
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; True:C214; 2; "")
				LISTBOX SELECT ROW:C912(SD2_lb_WorkflowManagerListbox; 1)
			: (SD2_l_WFAddMode=1)  //Save
				If (WFM_al_WorkflowTables{1}>0)
					If (WFM_at_ScriptCodes{1}#"")
						OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
						OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
						SD2_l_WFAddMode:=0
						OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
						LB_SetChoiceList(""; ->SD2_at_pop; ->WFM_at_WorkflowTables)
						LB_SetChoiceList(""; ->SD2_at_pop2; ->WFM_at_ScriptNames)
						LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 1; "")
						LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 2; "")
					Else 
						Gen_Alert("You  may not save a setting here without a Macro Selected or Standard Settings")
					End if 
				Else 
					Gen_Alert("You  may not save a setting here without a Macro Selected or Standard Settings")
				End if 
				
			: (SD2_l_WFAddMode=2)  //Edit
				SD2_l_WFAddMode:=3  //Save
				OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; True:C214)
				OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
				SD2_l_WFAddMode:=3
				OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Save")
				
				
				ARRAY LONGINT:C221(SD2_al_SelectableTables; 0)
				ARRAY TEXT:C222(SD2_at_SelectableTables; 0)
				ARRAY LONGINT:C221(SD2_al_SelectableTables; 99)
				ARRAY TEXT:C222(SD2_at_SelectableTables; 99)
				$_l_CurrentElement:=0
				$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[COMPANIES:2]))
				If ($_l_TableRow<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[COMPANIES:2])
					SD2_at_SelectableTables{$_l_CurrentElement}:="Companies"
				End if 
				$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[CONTACTS:1]))
				If ($_l_TableRow<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CONTACTS:1])
					SD2_at_SelectableTables{$_l_CurrentElement}:="Contacts"
				End if 
				
				If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  //General Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ACCOUNTS:32]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ACCOUNTS:32])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Accounts"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[TRANSACTION_BATCHES:30]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[TRANSACTION_BATCHES:30])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Transaction Batches"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[TRANSACTIONS:29]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[TRANSACTIONS:29])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Transactions"
					End if 
				End if 
				
				// or
				
				If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  //Sales Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[INVOICES:39]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[INVOICES:39])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Sales Invoices"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  //Purchase Ledger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PURCHASE_INVOICES:37]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PURCHASE_INVOICES:37])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Purchase Invoices"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales Orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ORDERS:24]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ORDERS:24])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Sales Orders"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[ORDER_ITEMS:25]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[ORDER_ITEMS:25])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Order Items"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)  //Subscriptions
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[SUBSCRIPTIONS:93]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[SUBSCRIPTIONS:93])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Subscriptions"
					End if 
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  //Purchase orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PURCHASE_ORDERS:57]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PURCHASE_ORDERS:57])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Purchase Orders"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(39))>1)  //Purchase orders
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PRODUCTS:9]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PRODUCTS:9])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Products"
					End if 
				End if 
				
				
				If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)  // Project Manger
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[PROJECTS:89]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[PROJECTS:89])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Projects"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOBS:26]))
					If ($_l_TableRow<0)
						$_l_TableRow:=Find in array:C230(SD2_at_SelectableTables; "Jobs")
						If ($_l_TableRow<0)
							$_l_CurrentElement:=$_l_CurrentElement+1
							SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOBS:26])
							SD2_at_SelectableTables{$_l_CurrentElement}:="Jobs"
						End if 
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOB_STAGES:47]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOB_STAGES:47])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Job Stages"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[JOB PERSONNEL:48]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[JOB PERSONNEL:48])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Job Pesonnel"
					End if 
					
				End if 
				
				If ((DB_GetModuleSettingByNUM(1))>1)  // CRM
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[COMPANIES:2]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[COMPANIES:2])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Companies"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Centre
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[CONTRACTS:17]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CONTRACTS:17])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Contracts"
					End if 
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[SERVICE_CALLS:20]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[SERVICE_CALLS:20])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Service Calls"
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)  // Service Centre
					$_l_TableRow:=Find in array:C230(WFM_al_WorkflowTables; Table:C252(->[STOCK_MOVEMENTS:40]))
					If ($_l_TableRow<0)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[STOCK_MOVEMENTS:40])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Stock Movements"
					End if 
					If (False:C215)
						$_l_CurrentElement:=$_l_CurrentElement+1
						SD2_al_SelectableTables{$_l_CurrentElement}:=Table:C252(->[CURRENT_STOCK:62])
						SD2_at_SelectableTables{$_l_CurrentElement}:="Current Stock"
					End if 
				End if 
				ARRAY LONGINT:C221(SD2_al_SelectableTables; $_l_CurrentElement)
				ARRAY TEXT:C222(SD2_at_SelectableTables; $_l_CurrentElement)
				//```
				ARRAY TEXT:C222(SD2_at_pop; 0)
				ARRAY TEXT:C222(SD2_at_pop2; 0)
				ARRAY TEXT:C222(SD2_at_MacroName; 0)
				ARRAY TEXT:C222(SD2_at_MacroCodes; 0)
				
				COPY ARRAY:C226(SD2_at_SelectableTables; SD2_at_pop)
				
				$_l_WorkFlowScripts:=WF Macros
				
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_WorkFlowScripts)
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; SD2_at_MacroCodes; [SCRIPTS:80]Script_Name:2; SD2_at_MacroName)
				$_l_MaxCodeLength:=0
				For ($_l_ScriptsIndex; 1; Size of array:C274(SD2_at_MacroName))
					If (Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex})>$_l_MaxCodeLength)
						$_l_MaxCodeLength:=Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex})
					End if 
				End for 
				For ($_l_ScriptsIndex; 1; Size of array:C274(SD2_at_MacroName))
					$_t_FixedLengthCode:=" "*($_l_MaxCodeLength-Length:C16(SD2_at_MacroCodes{$_l_ScriptsIndex}))+SD2_at_MacroCodes{$_l_ScriptsIndex}
					SD2_at_MacroName{$_l_ScriptsIndex}:=$_t_FixedLengthCode+","+SD2_at_MacroName{$_l_ScriptsIndex}
				End for 
				
				//APPEND TO ARRAY(SD2_at_MacroName;"-")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Use Standardised Settings")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Select Another Macro")
				APPEND TO ARRAY:C911(SD2_at_MacroName; "Create Macro")
				//APPEND TO ARRAY(SD2_at_MacroCodes;"-1")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-2")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-3")
				APPEND TO ARRAY:C911(SD2_at_MacroCodes; "-4")
				
				COPY ARRAY:C226(SD2_at_MacroName; SD2_at_pop2)
				LB_SetChoiceList("lbMulti"; ->SD2_at_pop; ->WFM_at_WorkflowTables)
				LB_SetChoiceList("lbMulti2"; ->SD2_at_pop2; ->WFM_at_ScriptNames)
				
				
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; True:C214; 1; "")
				LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; True:C214; 2; "")
				LISTBOX SELECT ROW:C912(SD2_lb_WorkflowManagerListbox; SD2_l_SelectedRow)
			: (SD2_l_WFAddMode=1) | (SD2_l_WFAddMode=3)  //Save
				If (WFM_al_WorkflowTables{SD2_l_SelectedRow}>0)
					If (WFM_at_ScriptCodes{SD2_l_SelectedRow}#"")
						OBJECT SET VISIBLE:C603(*; "oButtonClearWF"; False:C215)
						OBJECT SET TITLE:C194(*; "oButtonClearWF"; "Cancel")
						SD2_l_WFAddMode:=0
						OBJECT SET TITLE:C194(*; "oButtonAddWF"; "Add Table")
						LB_SetChoiceList(""; ->SD2_at_pop; ->WFM_at_WorkflowTables)
						LB_SetChoiceList(""; ->SD2_at_pop2; ->WFM_at_ScriptNames)
						LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 1; "")
						LB_SetEnterable(->SD2_lb_WorkflowManagerListbox; False:C215; 2; "")
						SD2_l_SelectedRow:=0
					Else 
						Gen_Alert("You  may nat save a setting here without a Macro Selected or Standard Settings")
					End if 
				Else 
					Gen_Alert("You  may nat save a setting here without a Macro Selected or Standard Settings")
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oButtonAddWF"; $_t_oldMethodName)
