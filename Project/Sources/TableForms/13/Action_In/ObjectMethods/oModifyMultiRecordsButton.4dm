If (False:C215)
	//object Name: [ACTIONS]Action_In.oModifyMultiRecordsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 23:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(BMrClear)
	//C_UNKNOWN(BmrModify)
	//ARRAY BOOLEAN(SD2_LB_Autos;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationType;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY LONGINT(SD2_al_SelectableTables;0)
	//ARRAY TEXT(SD2_at_pop;0)
	//ARRAY TEXT(SD2_at_POP2;0)
	//ARRAY TEXT(SD2_at_RelationRest;0)
	//ARRAY TEXT(SD2_at_RelationTablesS;0)
	//ARRAY TEXT(SD2_at_RelationTypes;0)
	//ARRAY TEXT(SD2_at_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	C_LONGINT:C283($_l_RelationTypeRow; $_l_SelectedRow; $_l_TableRow; BMrClear; BmrModify; SD2_l_MultiModify; SD2_l_SelectedMulti; SD2_l_SelectedStatic; SD2_l_StaticModify; $_l_Number; $_l_RelationTypeRow)
	C_LONGINT:C283($_l_SelectedRow; $_l_TableRow; SD_l_TableNumber; SD2_l_MultiModify; SD2_l_SelectedMulti; SD2_l_StaticModify)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_Formula; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable5"; Form event code:C388)
Case of 
	: (SD2_l_MultiModify=0)  //Button is modify
		LISTBOX INSERT ROWS:C913(SD2_LB_Autos; 1)
		//INSERT IN ARRAY(SD2_al_RelationTypesS;1;1)
		//INSERT IN ARRAY(SD2_at_RelationTypesS;1;1)
		//INSERT IN ARRAY(SD2_al_RelationTablesS;1;1)
		//INSERT IN ARRAY(SD2_at_RelationTablesS;1;1)
		//INSERT IN ARRAY(SD2_al_RelationRestS;1;1)
		//INSERT IN ARRAY(SD2_at_RelationRest;1;1)
		//ARRAY STRING(55;SD2_a55_Multipop;0)
		//```
		ARRAY LONGINT:C221(SD2_al_SelectableTables; 0)
		ARRAY TEXT:C222(SD2_at_SelectableTables; 0)
		
		
		
		APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[COMPANIES:2]))
		APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
		
		
		
		APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CONTACTS:1]))
		APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CONTACTS:1]))
		
		If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  //General Ledger"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ACCOUNTS:32]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ACCOUNTS:32]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[TRANSACTION_BATCHES:30]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[TRANSACTION_BATCHES:30]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[TRANSACTIONS:29]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[TRANSACTIONS:29]))
		End if 
		
		// or
		
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  //Sales Ledger]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[INVOICES:39]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[INVOICES:39]))
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  //Purchase Ledger]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PURCHASE_INVOICES:37]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PURCHASE_INVOICES:37]))
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales Orders]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ORDERS:24]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ORDERS:24]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ORDER_ITEMS:25]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ORDER_ITEMS:25]))
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)  //Subscriptions"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[SUBSCRIPTIONS:93]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[SUBSCRIPTIONS:93]))
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  //Purchase orders"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PURCHASE_ORDERS:57]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PURCHASE_ORDERS:57]))
			
		End if 
		If ((DB_GetModuleSettingByNUM(39))>1)  //Purchase orders
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PRODUCTS:9]))
			
		End if 
		
		
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)  // Project Manger"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PROJECTS:89]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PROJECTS:89]))
			$_l_TableRow:=Find in array:C230(SD2_at_SelectableTables; "Jobs")
			If ($_l_TableRow<0)
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOBS:26]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOBS:26]))
			End if 
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOB_STAGES:47]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOB_STAGES:47]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOB PERSONNEL:48]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOB PERSONNEL:48]))
			
		End if 
		
		If ((DB_GetModuleSettingByNUM(1))>1)  // CRM
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Centre"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CONTRACTS:17]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[SERVICE_CALLS:20]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CONTACTS:1]))
		End if 
		If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)  // Service Centre"
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[STOCK_MOVEMENTS:40]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[STOCK_MOVEMENTS:40]))
			If (False:C215)
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CURRENT_STOCK:62]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CURRENT_STOCK:62]))
			End if 
		End if 
		//```
		COPY ARRAY:C226(SD2_at_SelectableTables; SD2_at_pop)
		COPY ARRAY:C226(SD2_at_RelationTypes; SD2_at_POP2)
		
		LB_SetChoiceList("lbMulti"; ->SD2_at_pop; ->SD2_at_RelationTablesS)
		
		LB_SetChoiceList("lbMulti2"; ->SD2_at_POP2; ->SD2_at_RelationTypesS)
		SD2_at_RelationRest{1}:="Unlimited"
		
		LB_SetEnterable(->SD2_LB_Autos; True:C214; 1; "")
		LB_SetEnterable(->SD2_LB_Autos; True:C214; 2; "")
		LB_SetEnterable(->SD2_LB_Autos; True:C214; 3; "")
		
		OBJECT SET TITLE:C194(BmrModify; "Save")
		OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; True:C214)
		SD2_l_MultiModify:=1
		
	: (SD2_l_MultiModify=1)  //Button is save
		If (SD2_at_RelationTablesS{1}#"") & (SD2_at_RelationTypesS{1}#"")
			$_t_Formula:="SD_l_TableNumber:=table(->["+SD2_at_RelationTablesS{1}+"])"
			EXECUTE FORMULA:C63($_t_Formula)
			SD2_al_RelationTablesS{1}:=SD_l_TableNumber
			$_l_RelationTypeRow:=Find in array:C230(SD2_at_RelationTypes; SD2_at_RelationTypesS{1})
			If ($_l_RelationTypeRow>0)
				SD2_al_RelationTypesS{1}:=SD2_al_RelationType{$_l_RelationTypeRow}
			End if 
			$_l_Number:=Num:C11(SD2_at_RelationRest{1})
			SD2_al_RelationRestS{1}:=$_l_Number
			If (SD2_al_RelationRestS{1}>0)
				SD2_at_RelationRest{1}:=String:C10(SD2_al_RelationRestS{1})
			Else 
				SD2_at_RelationRest{1}:="Unlimited"
			End if 
			OBJECT SET TITLE:C194(BmrModify; "Modify")
			OBJECT SET TITLE:C194(BMrClear; "Clear")
			OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; False:C215)
			SD2_l_MultiModify:=0
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 1; "")
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 2; "")
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 3; "")
		Else 
			Gen_Alert("You must select a field and code, or clear")
		End if 
		
	: (SD2_l_MultiModify=-1)  //Button is save(existing item)
		If (SD2_l_SelectedMulti>0)
			$_ptr_Table:=Get pointer:C304("["+SD2_at_RelationTablesS{SD2_l_SelectedMulti}+"]")
			SD2_al_RelationTablesS{SD2_l_SelectedMulti}:=Table:C252($_ptr_Table)
			$_l_RelationTypeRow:=Find in array:C230(SD2_at_RelationTypes; SD2_at_RelationTypesS{SD2_l_SelectedMulti})
			If ($_l_RelationTypeRow>0)
				SD2_al_RelationTypesS{SD2_l_SelectedMulti}:=SD2_al_RelationType{$_l_RelationTypeRow}
			End if 
			$_l_Number:=Num:C11(SD2_at_RelationRest{SD2_l_SelectedMulti})
			SD2_al_RelationRestS{SD2_l_SelectedMulti}:=$_l_Number
			If (SD2_al_RelationRestS{SD2_l_SelectedMulti}>0)
				SD2_at_RelationRest{SD2_l_SelectedMulti}:=String:C10(SD2_al_RelationRestS{SD2_l_SelectedMulti})
			Else 
				SD2_at_RelationRest{SD2_l_SelectedMulti}:="Unlimited"
			End if 
			$_l_Number:=Num:C11(SD2_at_RelationRest{SD2_l_SelectedMulti})
			SD2_al_RelationRestS{SD2_l_SelectedMulti}:=$_l_Number
			If (SD2_al_RelationRestS{SD2_l_SelectedMulti}>0)
				SD2_at_RelationRest{SD2_l_SelectedMulti}:=String:C10(SD2_al_RelationRestS{SD2_l_SelectedMulti})
			Else 
				SD2_at_RelationRest{SD2_l_SelectedMulti}:="Unlimited"
			End if 
			OBJECT SET TITLE:C194(BmrModify; "Modify")
			OBJECT SET TITLE:C194(BMrClear; "Clear")
			OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; False:C215)
			SD2_l_MultiModify:=0
			SD2_l_SelectedMulti:=0
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 1; "")
			
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 2; "")
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 3; "")
			
			
		Else 
			
		End if 
	: (SD2_l_StaticModify=-2)
		//Ready to edit
		//$_l_SelectedRow:=AL_GetLine (SD2_l_Statics)  `SelectedElement
		$_l_SelectedRow:=Self:C308->
		SD2_l_SelectedMulti:=$_l_SelectedRow
		If (SD2_l_SelectedMulti>0)
			ARRAY LONGINT:C221(SD2_al_SelectableTables; 0)
			ARRAY TEXT:C222(SD2_at_SelectableTables; 0)
			ARRAY LONGINT:C221(SD2_al_SelectableTables; 99)
			ARRAY TEXT:C222(SD2_at_SelectableTables; 99)
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[COMPANIES:2]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
			
			
			APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CONTACTS:1]))
			APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CONTACTS:1]))
			
			If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  //General Ledger"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ACCOUNTS:32]))
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[TRANSACTION_BATCHES:30]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[TRANSACTION_BATCHES:30]))
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[TRANSACTIONS:29]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[TRANSACTIONS:29]))
			End if 
			
			// or
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  //Sales Ledger"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[INVOICES:39]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[INVOICES:39]))
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  //Purchase Ledger"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PURCHASE_INVOICES:37]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PURCHASE_INVOICES:37]))
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales Orders"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ORDERS:24]))
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[ORDER_ITEMS:25]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[ORDER_ITEMS:25]))
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)  //Subscriptions"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[SUBSCRIPTIONS:93]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[SUBSCRIPTIONS:93]))
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  //Purchase orders"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PURCHASE_ORDERS:57]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PURCHASE_ORDERS:57]))
				
			End if 
			If ((DB_GetModuleSettingByNUM(39))>1)  //Purchase orders
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PRODUCTS:9]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PRODUCTS:9]))
				
			End if 
			
			
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))>1)  // Project Manger"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[PROJECTS:89]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[PROJECTS:89]))
				$_l_TableRow:=Find in array:C230(SD2_at_SelectableTables; "Jobs")
				If ($_l_TableRow<0)
					
					APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOBS:26]))
					APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOBS:26]))
				End if 
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOB_STAGES:47]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOB_STAGES:47]))
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[JOB PERSONNEL:48]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[JOB PERSONNEL:48]))
				
			End if 
			
			If ((DB_GetModuleSettingByNUM(1))>1)  // CRM
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[COMPANIES:2]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
			End if 
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Centre"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CONTRACTS:17]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[COMPANIES:2]))
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[SERVICE_CALLS:20]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CONTACTS:1]))
			End if 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))>1)  // Service Centre"
				
				APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[STOCK_MOVEMENTS:40]))
				APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[STOCK_MOVEMENTS:40]))
				If (False:C215)
					
					APPEND TO ARRAY:C911(SD2_al_SelectableTables; Table:C252(->[CURRENT_STOCK:62]))
					APPEND TO ARRAY:C911(SD2_at_SelectableTables; Table name:C256(->[CURRENT_STOCK:62]))
				End if 
			End if 
			//```
			COPY ARRAY:C226(SD2_at_SelectableTables; SD2_at_pop)
			COPY ARRAY:C226(SD2_at_RelationTypes; SD2_at_POP2)
			
			LB_SetChoiceList("lbMulti"; ->SD2_at_pop; ->SD2_at_RelationTablesS)
			
			LB_SetChoiceList("lbMulti2"; ->SD2_at_POP2; ->SD2_at_RelationTypesS)
			LB_SetEnterable(->SD2_LB_Autos; True:C214; 1; "")
			LB_SetEnterable(->SD2_LB_Autos; True:C214; 2; "")
			LB_SetEnterable(->SD2_LB_Autos; True:C214; 3; "")
			
			SD2_l_MultiModify:=-1
			
			OBJECT SET TITLE:C194(BmrModify; "Save")
			OBJECT SET TITLE:C194(BMrClear; "Delete")
			OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable5"; $_t_oldMethodName)
