//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateRecordsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/05/2010 18:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305($_bo_FiltersAvailable; $_bo_StatsAvailable; DB_bo_DisplayFilters; DB_bo_FiltersAvailable; DB_Bo_GraphsAvailabe; DB_bo_MenusInited; DB_bo_ModuleArrayInited; DB_bo_RecordsinNewProcess; DB_bo_SetOpeninNewWindow; DB_bo_StatsAvailabe)
	C_LONGINT:C283($_l_AddedCount; $_l_CountRecordsMenuItemShortCut; $_l_DefaultFilterID; $_l_DeleteRecord2MenuItemShortCu; $_l_DeleteRecordMenuItemShortCut; $_l_DisplayRecordsTable; $_l_InsertCount; $_l_MenuShortCut; $_l_NewRecord2MenuItemShortCut; $_l_NewRecordMenuItemShortCut; $_l_SearchRecordsMenuItemShortCu)
	C_LONGINT:C283($_l_SelectRecordsMenuItemShortCu; $_l_ShortCut; $_l_ShortCutPosition; $_l_SortRecordsMenuItemShortCut; $_l_ViewAsGraphMenuItemShortCut; $_l_ViewAsListMenuitemShortCut; $_l_ViewAsStatsMenuitemShortCut; $_l_ViewRecords2MenuItemShortCut; $_l_ViewRecordsMenuItemShortCut)
	C_OBJECT:C1216($_obj_WindowPrefs)
	C_REAL:C285($1)
	C_TEXT:C284($_t_CountRecordsMenuItem; $_t_CountRecordsMenuMethod; $_t_DeleteRecord2MenuItem; $_t_DeleteRecord2MenuMethod; $_t_DeleteRecordMenuItem; $_t_DeleteRecordMenuMethod; $_t_FiltersLabel; $_t_MenuReference; $_t_MethodName; $_t_NewRecord2MenuItem; $_t_NewRecord2MenuMethod)
	C_TEXT:C284($_t_NewRecordMenuMethod; $_t_NewRecordMenuName; $_t_NewRecordParameter2; $_t_NewWindowOption; $_t_oldMethodName; $_t_OrderStateType; $_t_ProcessName; $_t_RelatedRecords; $_t_SearchRecordsMenuItem; $_t_SearchRecordsMenuMethod; $_t_SelectRecordsMenuItem)
	C_TEXT:C284($_t_SelectRecordsMenuMethod; $_t_ShortCutChar; $_t_SortRecordsMenuItem; $_t_SortRecordsMenuMethod; $_t_ViewAsGraphMenuItem; $_t_ViewAsGraphMenuMethod; $_t_ViewAsListMenuItem; $_t_ViewAsListMenuMethod; $_t_ViewAsStatsMenuitem; $_t_ViewAsStatsMenuMethod; $_t_ViewRecord2MenuItem)
	C_TEXT:C284($_t_ViewRecord2MenuMethod; $_t_ViewRecordsMenuItem; $_t_ViewRecordsMenuMethod; $0; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateRecordsMenu")

//all records
//select records
//total records
//show hide filters
//Stats view on


//diary







//Letters(docs)






If (Not:C34(DB_bo_ModuleArrayInited))
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	DB_bo_ModuleArrayInited:=True:C214
	DB_bo_MenusInited:=False:C215
End if 



If (Count parameters:C259>=2)
	$_l_AddedCount:=0
	
	$_t_NewRecordMenuName:=""
	$_t_NewRecordMenuMethod:=""
	$_l_NewRecordMenuItemShortCut:=0
	
	
	$_t_ViewRecordsMenuItem:=""
	$_t_ViewRecordsMenuMethod:=""
	$_l_ViewRecordsMenuItemShortCut:=0
	
	$_t_DeleteRecordMenuItem:=""
	$_t_DeleteRecordMenuMethod:=""
	$_l_DeleteRecordMenuItemShortCut:=0
	
	//`
	$_t_NewRecord2MenuItem:=""
	$_t_NewRecord2MenuMethod:=""
	$_l_NewRecord2MenuItemShortCut:=0
	$_t_NewRecordParameter2:=""
	
	
	
	$_t_ViewRecord2MenuItem:=""
	$_t_ViewRecord2MenuMethod:=""
	$_l_ViewRecords2MenuItemShortCut:=0
	
	$_t_DeleteRecord2MenuItem:=""
	$_t_DeleteRecord2MenuMethod:=""
	$_l_DeleteRecord2MenuItemShortCu:=0
	//`
	
	$_t_SelectRecordsMenuItem:=""
	$_t_SelectRecordsMenuMethod:=""  //note this is a new method
	$_l_SelectRecordsMenuItemShortCu:=0
	
	$_t_SortRecordsMenuItem:=""
	$_t_SortRecordsMenuMethod:="DB_SortrecordsFromSelection"  //note this is a new method
	$_l_SortRecordsMenuItemShortCut:=Character code:C91("T")
	
	$_t_CountRecordsMenuItem:=""
	$_t_CountRecordsMenuMethod:="DB_CountrecordsFromSelection"  //note this is a new method
	$_l_CountRecordsMenuItemShortCut:=0
	
	$_t_SearchRecordsMenuItem:=""
	$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"  //note this is a new method
	$_l_SearchRecordsMenuItemShortCu:=Character code:C91("S")
	
	$_t_ViewAsListMenuItem:=""
	$_t_ViewAsListMenuMethod:="DB_SetListView"  //note this is a new method
	$_l_ViewAsListMenuitemShortCut:=0
	
	$_t_ViewAsStatsMenuitem:=""
	$_t_ViewAsStatsMenuMethod:="DB_SetStatiscsView"  //note this is a new method
	$_l_ViewAsStatsMenuitemShortCut:=0
	
	$_t_ViewAsGraphMenuItem:=""
	$_t_ViewAsGraphMenuMethod:="DB_SetGraphView"  //note this is a new method
	$_l_ViewAsGraphMenuItemShortCut:=0
	$_obj_WindowPrefs:=DB_GetWindowPrefs
	If ($_obj_WindowPrefs.SetOpenInNewWindow=Null:C1517)
		$_obj_WindowPrefs.SetOpenInNewWindow:=False:C215
	End if 
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			
			//new company
			If (DB_GetModuleSettingByNUM(Module_Companies)>=2) & (DB_GetModuleSettingByNUM(Module_Companies)#3)
				If ($2#"Renumber") | ($2#"Deduplicate")
					$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_EnterCompanies")
					$_t_NewRecordMenuMethod:="DB_EnterNewRecord"
					$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
				End if 
			End if 
			//open company remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Company")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection] company remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_Companies)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Company")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			//select records
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Companies")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			//sort reocrds
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Companies")
			//totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_Sum")
			
			//search-alwaysmore choices this one
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"  //note this is a new method
			
			
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_Statistics")
				
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_Graph")
			End if   //`
			//show(hide) Filters
			
			
		: ($1=Table:C252(->[CONTACTS:1]))
			//new Contact
			
			If (DB_GetModuleSettingByNUM(Module_Companies)>=2) & (DB_GetModuleSettingByNUM(Module_Companies)#3)
				If ($2#"Renumber") | ($2#"Deduplicate")
					$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_EnterContacts")
					$_t_NewRecordMenuMethod:="DB_EnterNewRecord"
					$_l_NewRecordMenuItemShortCut:=Character code:C91("\\")
				End if 
			End if 
			//open contact remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Contacts")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("/")
			
			If (DB_GetModuleSettingByNUM(Module_Companies)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Contacts")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if   //
			
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Contacts")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method<-this is generic
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			//sort reocrds
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Contacts")
			//totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			//search-always more choices this one
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"  //CON_SearchMoreChoices"  `note this is a new method
			
			
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_Graph")
			End if   //`
			//`
			//show(hide) Filters
			
			
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			
			
			
			//open ACCOUNT remember to disable if no records selected
			
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_AccBalances")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//an update to the acc bal form is needed to show the transaction that go to make up the balance.
			
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_AccBalances")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			//make sure if we are in any other view that we swith
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccBalances")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccBalances")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccBalances")+" "+Get localized string:C991("MenuItem_Graph")
			End if   //`
			
			
			//`
			
			
		: ($1=Table:C252(->[ACCOUNTS:32]))
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Account")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			//open company remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Account")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection] company remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Account")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecord2MenuItem:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Heading")
				$_t_NewRecord2MenuMethod:="DB_EnterNewRecord"  //
				//$_l_NewRecord2MenuItemShortCut:=Character code("[")
				$_t_NewRecordParameter2:="Headings"
			End if 
			//open company remember to disable if no records selected
			$_t_ViewRecord2MenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Heading")
			$_t_ViewRecord2MenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			//$_l_ViewRecords2MenuItemShortCut:=Character code("]")
			//delete [selection] company remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecord2MenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Heading")
				$_t_DeleteRecord2MenuMethod:="DB_DeleteFromSelection"
				//$_l_DeleteRecord2MenuItemShortCut:=Character code("D")
			End if 
			
			//select records
			If (False:C215)
				$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Account")
				$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
				$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
				
				$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Account")
			End if   //totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Account")+" "+Get localized string:C991("MenuItem_Sum")
			
			//search-alwaysmore choices this one
			
			
			//`
			
		: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))  //not shown
		: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))  //not shown
			
		: ($1=Table:C252(->[ACTIONS:13]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Actions")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			//open  remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Actions")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection] company remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Actions")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			//select records
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Actions")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			//sort reocrds
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Actions")
			
			//Totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Actions")+" "+Get localized string:C991("MenuItem_Sum")
			
			//`
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Actions")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"  //CON_SearchMoreChoices"  `note this is a new method
			
			
		: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AddressFormats")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_AddressFormats")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection]  remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_AddressFormats")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			//select records
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_AddressFormats")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			//sort reocrds
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_AddressFormats")
			//totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_AddressFormats")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			
		: ($1=Table:C252(->[AddressRecords:125]))  //Not displayed
		: ($1=Table:C252(->[ANALYSES:36]))
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Analyses")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			//open  remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Analyses")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection]  remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Analyses")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			//`
			//select records
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Analyses")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			//sort reocrds
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Analyses")
			
			//totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Analyses")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Analyses")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
			
			
		: ($1=Table:C252(->[AREAS:3]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Area")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Area")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Area")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Areas")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Areas")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Areas")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Areas")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Brand")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Brand")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Brand")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Brands")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Brands")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Brands")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[CATALOGUE:108]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Collection")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Collection")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Collection")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Collections")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Collections")
			
		: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Category")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Category")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Category")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Categories")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Categories")
			
			
		: ($1=Table:C252(->[CONTRACT_TYPES:19]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_ContractType")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_ContractType")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_ContractTypes")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_ContractTypes")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_ContractTypes")
			
			
			
		: ($1=Table:C252(->[CONTRACTS:17]))
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Contract")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Contract")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Contract")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Contracts")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Contracts")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Contracts")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Contracts")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contracts")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contracts")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contracts")+" "+Get localized string:C991("MenuItem_Graph")
			End if   //`
			
			
		: ($1=Table:C252(->[COUNTRIES:73]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Country")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Country")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Country")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Countries")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Countries")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Countries")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Countries")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
		: ($1=Table:C252(->[CREDIT_STAGES:54]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_CreditStage")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_CreditStage")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_CreditStage")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_CreditStages")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_CreditStages")
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_CreditStages")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
		: ($1=Table:C252(->[CURRENCIES:71]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Currency")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Currency")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Currencies")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Currencies")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Currencies")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			
		: ($1=Table:C252(->[CURRENCY_RATES:72]))
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_CurrencyRates")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_CurrencyRates")
			
			
			
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			//you cannot create current stock
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_CurrentStock")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_CurrentStock")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_CurrentStock")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_CurrentStock")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_CurrentStock")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CurrentStock")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CurrentStock")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CurrentStock")+" "+Get localized string:C991("MenuItem_Graph")
			End if   //`
			
		: ($1=Table:C252(->[DATA_AUDITS:102]))
		: ($1=Table:C252(->[DIARY:12]))
			//Context is important here-probably a drop  down of enter types
			
		: ($1=Table:C252(->[DOCUMENTS:7]))
			//Context is important here-probably a drop  down of enter types
			Case of 
				: ($2="Reports")
					If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+" Report Template"
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Edit")+" "+" Report Template"
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
						$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+" Report Template"
						$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
						$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
						
					End if 
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+"  Report Templates"
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
				: ($2="Letters")
					If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+" Template Document"
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Edit")+" "+" Template Document"
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
						$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+" Template Document"
						$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
						$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
						
						
						
					End if 
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+"  Documents"
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_`documenttemplates")
					
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
				: ($2="Emails")
					If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+" Template Document"
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Edit")+" "+" Template Document"
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
						$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+" Template Document"
						$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
						$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
						
						
						
					End if 
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+"  Documents"
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_`documenttemplates")
					
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
				Else 
			End case 
			
		: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))  //These can only be entered from the personnel record
			
		: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))  //not displayed in this window??
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_FurtherFields")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_FurtherFields")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_FurtherFields")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_FurtherFields")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_FurtherFields")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_FurtherFields")+" "+Get localized string:C991("MenuItem_Sum")
			
		: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))  //this has a special form
			
		: ($1=Table:C252(->[IDENTIFIERS:16]))  //not displayed
			
		: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))  // not dispayed
		: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))  //not displayed
			
		: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_FurtherFields")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_FurtherFields")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_FurtherFields")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_FurtherFields")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_FurtherFields")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_FurtherFields")+" "+Get localized string:C991("MenuItem_Sum")
			
			
		: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  // further analysis
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_FurtherAnalyses")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))  //Product groups
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Groups")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Group")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Group")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Groups")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Groups")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Groups")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
		: ($1=Table:C252(->[HEADINGS:84]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AccountsHeading")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_AccountsHeading")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_AccountsHeading")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_AccountsHeadings")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_AccountsHeadings")
			
		: ($1=Table:C252(->[INFORMATION:55]))  //not displayed
		: ($1=Table:C252(->[INVOICES:39]))
			
			Case of 
				: ($2="View Receipts") | ($2="ViewReceipts")
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Receipt")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Receipts")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Receipts")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Receipts")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Receipts")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Receipts")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Receipts")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Receipts")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if 
					
				: ($2="View Deposits") | ($2="ViewDeposits")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Deposit")
						$_t_NewRecordMenuName:=Term_SLPLWT($_t_NewRecordMenuName)
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Deposit")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Deposits")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Deposits")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if 
				: ($2="Refund Deposit")
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Deposit")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Deposits")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Deposits")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposits")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if 
				: ($2="Invoice Receipt") | ($2="Undo Receipt")
					
					
					
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_SalesInvoice")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_SalesInvoices")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_SalesInvoices")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if   //`
					
				: ($2="ViewCreditnotes") | ($2="View Credit notes")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_CreditNote")
						$_t_NewRecordMenuName:=Term_SLPLWT($_t_NewRecordMenuName)
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_CreditNote")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_CreditNotes")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_CreditNotes")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_CreditNotes")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_CreditNotes")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CreditNotes")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CreditNotes")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CreditNotes")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if 
				: ($2="ViewProformas") | ($2="View Proformas")
					
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Proforma")
						$_t_NewRecordMenuName:=Term_SLPLWT($_t_NewRecordMenuName)
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Proforma")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Proformas")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Proformas")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Proformas")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Proformas")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Proformas")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Proformas")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Proformas")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if 
				Else 
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_SalesInvoice")
						$_t_NewRecordMenuName:=Term_SLPLWT($_t_NewRecordMenuName)
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_SalesInvoice")
					$_t_ViewRecordsMenuItem:=Term_SLPLWT($_t_ViewRecordsMenuItem)
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_SalesInvoices")
					$_t_SelectRecordsMenuItem:=Term_SLPLWT($_t_SelectRecordsMenuItem)
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_SalesInvoices")
					$_t_SortRecordsMenuItem:=Term_SLPLWT($_t_SortRecordsMenuItem)
					$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Sum")
					$_t_CountRecordsMenuItem:=Term_SLPLWT($_t_CountRecordsMenuItem)
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuItem:=Term_SLPLWT($_t_SearchRecordsMenuItem)
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_List")
					$_t_ViewAsListMenuItem:=Term_SLPLWT($_t_ViewAsListMenuItem)
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Statistics")
						$_t_ViewAsStatsMenuitem:=Term_SLPLWT($_t_ViewAsStatsMenuitem)
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesInvoices")+" "+Get localized string:C991("MenuItem_Graph")
						$_t_ViewAsGraphMenuItem:=Term_SLPLWT($_t_ViewAsGraphMenuItem)
					End if   //`
			End case 
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_InvoiceItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_InvoiceItems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_InvoiceItems")
			
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_InvoiceItems")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_InvoiceItems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[JOB PERSONNEL:48]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_JobPersonnel")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_JobPersonnel")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_JobPersonnel")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_JobPersonnel")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_JobPersonnel")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_JobPersonnel")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_JobPersonnel")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobPersonnel")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobPersonnel")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobPersonnel")+" "+Get localized string:C991("MenuItem_Graph")
			End if 
			
		: ($1=Table:C252(->[JOB_STAGES:47]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				//$_t_NewRecordMenuName:=Get localized string("MenuItem_Enter")+" "+Get localized string("MenuItem_JobStages")
				//$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  `
				//$_l_NewRecordMenuItemShortCut:=Character code("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_JobStages")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				//$_t_DeleteRecordMenuItem:=Get localized string("MenuItem_Delete")+" "+Get localized string("MenuItem_JobStages")
				//$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				//$_l_DeleteRecordMenuItemShortCut:=Character code("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_JobStages")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_JobStages")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_Graph")
			End if 
			
		: ($1=Table:C252(->[JOB_TYPES:65]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_JobType")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_JobType")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_JobType")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_JobTypes")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_JobTypes")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_JobTypes")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
		: ($1=Table:C252(->[JOBS:26]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Job")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Job")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Job")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Jobs")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Jobs")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Jobs")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Jobs")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[LAYERS:76]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Layer")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Layer")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Layer")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Layers")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Layers")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Layers")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[LIST_LAYOUTS:96]))  //not edited here
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("Menuitem_DisplayColumn")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("Menuitem_DisplayColumn")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("Menuitem_DisplayColumn")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("Menuitem_DisplayColumns")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			
		: ($1=Table:C252(->[LOCATIONS:61]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Locations")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Locations")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Locations")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Locations")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Locations")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Locations")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[SCRIPTS:80]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Macros")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Macros")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Macros")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Macros")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Macros")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Macros")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_MovementTypes")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_MovementType")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_MovementType")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_MovementTypes")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_MovementTypes")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_MovementTypes")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
			
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			//Cant enter order items
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_OrderItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_SalesOrders)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_OrderItem")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_OrderItems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_OrderItems")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_OrderItems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_OrderItems")+" "+Get localized string:C991("MenuItem_List")
			If (DB_bo_StatsAvailabe)
				$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_OrderItems")+" "+Get localized string:C991("MenuItem_Statistics")
			End if 
			If (DB_Bo_GraphsAvailabe)
				$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_OrderItems")+" "+Get localized string:C991("MenuItem_Graph")
			End if 
			
			
		: ($1=Table:C252(->[ORDERS:24]))
			//Context may come into play here for entering enquiries and quotations
			Case of 
				: ($2#"")
					$_t_OrderStateType:=Replace string:C233($2; Get localized string:C991("MenuItem_View")+" "; "")
					$_l_ShortCutPosition:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_OrderStateType)
					Case of 
						: ($_l_ShortCutPosition>0)
							Case of 
								: ($_l_ShortCutPosition=1)
									If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#3)
										$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Enquiry")
										$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
										$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
									End if 
									$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Enquiry")
									$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
									$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
									If (DB_GetModuleSettingByNUM(Module_SalesOrders)=2)
										$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Enquiry")
										$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
										$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
									End if 
									$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Enquiries")
									$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
									$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
									
									$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Enquiries")
									
									$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Enquiries")+" "+Get localized string:C991("MenuItem_advancedSearch")
									$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
									
									$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Enquiries")+" "+Get localized string:C991("MenuItem_List")
									If (DB_bo_StatsAvailabe)
										$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Enquiries")+" "+Get localized string:C991("MenuItem_Statistics")
									End if 
									If (DB_Bo_GraphsAvailabe)
										$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Enquiries")+" "+Get localized string:C991("MenuItem_Graph")
									End if 
								: ($_l_ShortCutPosition=2)
									If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#3)
										$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Quotation")
										$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
										$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
									End if 
									$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Quotation")
									$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
									$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
									If (DB_GetModuleSettingByNUM(Module_SalesOrders)=2)
										$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Quotation")
										$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
										$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
									End if 
									$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Quotations")
									$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
									$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
									
									$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Quotations")
									
									$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Quotations")+" "+Get localized string:C991("MenuItem_advancedSearch")
									$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
									
									$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Quotations")+" "+Get localized string:C991("MenuItem_List")
									If (DB_bo_StatsAvailabe)
										$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Quotations")+" "+Get localized string:C991("MenuItem_Statistics")
									End if 
									If (DB_Bo_GraphsAvailabe)
										$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Quotations")+" "+Get localized string:C991("MenuItem_Graph")
									End if 
							End case 
						Else 
					End case 
				Else 
					
					If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#3)
						$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_SalesOrders")
						$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
						$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
					End if 
					$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_SalesOrder")
					$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
					$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
					If (DB_GetModuleSettingByNUM(Module_SalesOrders)=2)
						$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_SalesOrder")
						$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
						$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
					End if 
					$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_SalesOrders")
					$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
					$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
					
					$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_SalesOrders")
					
					$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_SalesOrders")+" "+Get localized string:C991("MenuItem_advancedSearch")
					$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
					
					$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesOrders")+" "+Get localized string:C991("MenuItem_List")
					If (DB_bo_StatsAvailabe)
						$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesOrders")+" "+Get localized string:C991("MenuItem_Statistics")
					End if 
					If (DB_Bo_GraphsAvailabe)
						$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_SalesOrders")+" "+Get localized string:C991("MenuItem_Graph")
					End if 
			End case 
		: ($1=Table:C252(->[PERIODS:33]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_AccountingPeriods")+" "+Get localized string:C991("MenuItem_Sum")
			
			
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_PersonnelGroups")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[PERSONNEL:11]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Personnel")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Personnel")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Personnel")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Personnel")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Personnel")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Personnel")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Personnel")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[PICTURES:85]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Pictures")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Pictures")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Pictures")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Pictures")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Pictures")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Pictures")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Pictures")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[POSTAL_CODES:50]))  //not displayes
			
		: ($1=Table:C252(->[PRICE_GROUPS:18]))
			If (DB_GetModuleSettingByNUM(Module_PriceTable)>=2) & (DB_GetModuleSettingByNUM(Module_PriceTable)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PriceGroups")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PriceGroups")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_PriceGroups")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PriceGroups")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PriceGroups")
			
			
			
		: ($1=Table:C252(->[PRICE_TABLE:28]))
			If (DB_GetModuleSettingByNUM(Module_PriceTable)>=2) & (DB_GetModuleSettingByNUM(Module_PriceTable)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PriceTable")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PriceTable")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_PriceTable")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PriceTable")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PriceTable")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_Graph")
			
		: ($1=Table:C252(->[PROBLEMS:22]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Problems")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Problems")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Problems")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Problems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Problems")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Problems")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Problems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[PRODUCTS:9]))
			If (DB_GetModuleSettingByNUM(Module_Products)>=2) & (DB_GetModuleSettingByNUM(Module_Products)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Product")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Product")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Product")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Products")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Products")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Products")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Products")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Products")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Products")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Products")+" "+Get localized string:C991("MenuItem_Graph")
			
		: ($1=Table:C252(->[PROJECTS:89]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Project")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Project")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Project")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Projects")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Projects")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Projects")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Projects")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Projects")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Projects")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Projects")+" "+Get localized string:C991("MenuItem_Graph")
			
			
			
		: ($1=Table:C252(->[PUBLICATIONS:52]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Publication")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Publication")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Publication")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Publications")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Publications")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Publications")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Publications")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
			If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>=2) & (DB_GetModuleSettingByNUM(Module_PurchaseOrders)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PurchaseOrders")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PurchaseOrders")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseOrders")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseOrders")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseOrders")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseOrders")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseOrders")+" "+Get localized string:C991("MenuItem_Graph")
			
			
		: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PurchaseOrderItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_PurchaseOrderItem")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PurchaseOrderItems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PurchaseOrderItems")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseOrderItems")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseOrderItems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
			If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseInvoices")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseInvoices")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")+" "+Get localized string:C991("MenuItem_Graph")
			
			
		: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_PurchaseInvoiceItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_PurchaseInvoiceItems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_PurchaseInvoiceItems")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseInvoiceItems")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_PurchaseInvoiceItems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_RecurJournals")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_RecurJournals")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_RecurJournals")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_RecurJournals")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_RecurJournals")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_RecurJournals")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[RESULTS:14]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Result")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Result")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Result")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Results")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Results")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Results")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[ROLES:87]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Role")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Role")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Role")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Roles")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Roles")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Roles")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[SALES_PROJECTION:113]))
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_ServiceCall")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_ServiceCall")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_ServiceCentre)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_ServiceCall")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_ServiceCalls")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_ServiceCalls")
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_Graph")
			
			
		: ($1=Table:C252(->[SOLUTIONS:23]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Solution")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Solution")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Solution")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Solutions")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Solutions")
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Solutions")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Solutions")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[SOURCES:6]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Source")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Source")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Source")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Sources")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Sources")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Sources")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Sources")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[STAGES:45]))  //Job Stages
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_JobStage")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_JobStage")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_JobStage")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_JobStages")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_JobStages")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_JobStages")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[STATUS:4]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Status")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Status")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Status")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Status")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Status")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Status")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Status")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //Cant enter a stock movement item
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_StockItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_StockItem")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_StockItems")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_StockItems")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_StockItems")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_StockItems")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[STOCK_LEVELS:58]))  //cant enter a stock level
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_StockLevel")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_StockLevels")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_StockLevels")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_StockLevels")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_StockLevels")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockLevels")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockLevels")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockLevels")+" "+Get localized string:C991("MenuItem_Graph")
			
			
			
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
			If (DB_GetModuleSettingByNUM(Module_StockControl)>=2) & (DB_GetModuleSettingByNUM(Module_StockControl)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockMovement")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_StockMovement")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_StockControl)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_StockMovement")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_StockMovements")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_StockMovements")
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_StockMovements")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_StockMovements")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockMovements")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockMovements")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_StockMovements")+" "+Get localized string:C991("MenuItem_Graph")
			
			
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockTypes")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_StockTypes")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_StockTypes")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_StockTypes")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_StockTypes")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_StockTypes")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_StockTypes")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
			If (DB_GetModuleSettingByNUM(Module_Subscriptions)>=2) & (DB_GetModuleSettingByNUM(Module_Subscriptions)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Subscription")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Subscription")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_Subscriptions)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Subscription")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Subscriptions")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Subscriptions")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Subscriptions")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Subscriptions")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[TAX_CODES:35]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TaxCode")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_TaxCode")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_TaxCode")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_TaxCodes")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_TaxCodes")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_TaxCodes")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[TERMINOLOGY:75]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Terminology")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Terminology")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Terminology")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Terminology")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Terminology")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Terminology")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[TIME_BUDGETS:49]))
			If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) & (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TimeBudget")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_TimeBudget")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_JobCosting)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_TimeBudget")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_TimeBudget")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_TimeBudget")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_TimeBudget")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Terminology")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TransBatch")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_TransBatch")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_TransBatches")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_TransBatches")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_TransBatches")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_TransBatches")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TransBatches")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TransBatches")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_TransBatches")+" "+Get localized string:C991("MenuItem_Graph")
			
			
			
		: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))  // cannot enter a trans in sub item
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_TransBatchItem")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_TransBatchItem")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_TransBatchItem")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_TransBatchItem")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_TransBatchItem")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TransactionType")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_TransactionType")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_TransactionType")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_TransactionType")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_TransactionType")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_TransactionType")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_TransactionType")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
		: ($1=Table:C252(->[TRANSACTIONS:29]))  //cant enter a transaciton
			
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Transaction")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Transactions")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Transactions")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Transactions")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Transactions")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			$_t_ViewAsListMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Transactions")+" "+Get localized string:C991("MenuItem_List")
			$_t_ViewAsStatsMenuitem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Transactions")+" "+Get localized string:C991("MenuItem_Statistics")
			$_t_ViewAsGraphMenuItem:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Transactions")+" "+Get localized string:C991("MenuItem_Graph")
			
			
		: ($1=Table:C252(->[TYPES:5]))
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Type")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Type")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Type")
				$_t_DeleteRecordMenuMethod:="DB_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
			End if 
			
			$_t_SelectRecordsMenuItem:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Types")
			$_t_SelectRecordsMenuMethod:="DB_SelectrecordsFromSelection"
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Types")
			
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Types")+" "+Get localized string:C991("MenuItem_Sum")
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Types")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
		: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				$_t_NewRecordMenuName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Workflow")
				$_t_NewRecordMenuMethod:="DB_EnterNewRecord"  //
				$_l_NewRecordMenuItemShortCut:=Character code:C91("[")
			End if 
			//open company remember to disable if no records selected
			$_t_ViewRecordsMenuItem:=Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Workflow")
			$_t_ViewRecordsMenuMethod:="DB_OpenRecordFromSelection"  //note this is a new method
			$_l_ViewRecordsMenuItemShortCut:=Character code:C91("]")
			//delete [selection] company remember to disable if no records selected
			If (DB_GetModuleSettingByNUM(Module_DataManager)=2)
				$_t_DeleteRecordMenuItem:=Get localized string:C991("MenuItem_Delete")+" "+Get localized string:C991("MenuItem_Workflow")
				$_t_DeleteRecordMenuMethod:="AddFormat_DeleteFromSelection"
				$_l_DeleteRecordMenuItemShortCut:=Character code:C91("D")
				
			End if 
			//`  `select records
			//delete [selection] company remember to disable if no records selected
			$_t_SelectRecordsMenuMethod:=Get localized string:C991("MenuItem_Select")+" "+Get localized string:C991("MenuItem_Workflow")
			$_t_MethodName:="DB_SelectrecordsFromSelection"  //note this is a new method
			$_l_SelectRecordsMenuItemShortCu:=Character code:C91("H")
			//sort reocrds
			$_t_SortRecordsMenuItem:=Get localized string:C991("MenuItem_Sort")+" "+Get localized string:C991("MenuItem_Workflow")
			//totals
			$_t_CountRecordsMenuItem:=Get localized string:C991("MenuItem_Workflow")+" "+Get localized string:C991("MenuItem_Sum")
			
			
			$_t_SearchRecordsMenuItem:=Get localized string:C991("MenuItem_Workflow")+" "+Get localized string:C991("MenuItem_advancedSearch")
			$_t_SearchRecordsMenuMethod:="DB_SearchMoreChoices"
			
			
			
			
			
			
	End case 
	$_t_MenuReference:=Create menu:C408
	//```
	$_l_DisplayRecordsTable:=$1
	$_bo_StatsAvailable:=False:C215
	Case of 
		: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACTS:17]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[COMPANIES:2]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[CONTACTS:1]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDER_ITEMS:25]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTIONS:29]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_LEVELS:58]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[CURRENT_STOCK:62]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[INFORMATION:55]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PROJECTS:89]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCTS:9]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[DOCUMENTS:7]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOB_STAGES:47]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOBS:26]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[JOB PERSONNEL:48]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		Else 
			$_bo_StatsAvailable:=False:C215
	End case 
	$_bo_FiltersAvailable:=True:C214
	Case of 
		: ($1=Table:C252(->[ACTIONS:13]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[ANALYSES:36]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[ANALYSES:36]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[AREAS:3]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CATALOGUE:108]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CONTRACT_TYPES:19]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CONTRACT_TYPES:19]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CONTRACTS_CONTACTS:151]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[COUNTRIES:73]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CREDIT_STAGES:54]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CURRENCIES:71]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  //Further analysis
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[HEADINGS:84]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[JOB_TYPES:65]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[LAYERS:76]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[LOCATIONS:61]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[SCRIPTS:80]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PERIODS:33]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PERSONNEL:11]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PICTURES:85]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[POSTAL_CODES:50]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PRICE_GROUPS:18]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PRICE_TABLE:28]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PROBLEMS:22]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[PUBLICATIONS:52]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[RESULTS:14]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[ROLES:87]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[SOLUTIONS:23]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[SOURCES:6]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[STAGES:45]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[STATUS:4]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TAX_CODES:35]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TERMINOLOGY:75]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TRANSACTIONS:29])) & ($2="Reconcile Transactions")
			
			$_bo_FiltersAvailable:=False:C215
		: ($1=Table:C252(->[TYPES:5]))
			$_bo_FiltersAvailable:=False:C215
	End case 
	//```
	If (Not:C34(DB_bo_StatsAvailabe)) | (Not:C34($_bo_StatsAvailable))
		$_t_ViewAsStatsMenuitem:=""
	End if 
	If (Not:C34(DB_Bo_GraphsAvailabe))
		$_t_ViewAsGraphMenuItem:=""
	End if 
	$_l_InsertCount:=0
	If ($_t_NewRecordMenuName#"")
		$_l_InsertCount:=$_l_InsertCount+1
		$_l_MenuShortCut:=Character code:C91("[")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_NewRecordMenuName)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_NewRecordMenuMethod)
		If ($_l_NewRecordMenuItemShortCut#0)
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_NewRecordMenuItemShortCut)
			
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_NewRecordMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_NewRecordMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_NewRecordMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut)
			End if 
			
		Else 
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_MenuShortCut)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_MenuShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_MenuShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
			End if 
		End if 
	End if 
	If ($_t_ViewRecordsMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ViewRecordsMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_ViewRecordsMenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_ViewRecordsMenuItemShortCut)
		If ($_l_ViewRecordsMenuItemShortCut>0)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_ViewRecordsMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_ViewRecordsMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_ViewRecordsMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewRecordsMenuItemShortCut)
			End if 
		End if 
	End if 
	If ($_t_DeleteRecordMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_DeleteRecordMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_DeleteRecordMenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_DeleteRecordMenuItemShortCut)
		If ($_l_DeleteRecordMenuItemShortCut>0)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_DeleteRecordMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_DeleteRecordMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_DeleteRecordMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_DeleteRecordMenuItemShortCut)
			End if 
		End if 
	End if 
	If ($_t_NewRecord2MenuItem#"")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		$_l_InsertCount:=$_l_InsertCount+1
		
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_NewRecord2MenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_NewRecord2MenuMethod)
		If ($_l_NewRecord2MenuItemShortCut#0)
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_NewRecordMenuItemShortCut)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_NewRecordMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_NewRecordMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_NewRecordMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_NewRecordMenuItemShortCut)
			End if 
		Else 
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_MenuShortCut)
		End if 
		If ($_t_NewRecordParameter2#"")
			SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_NewRecordParameter2)
		End if 
	End if 
	If ($_t_ViewRecord2MenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ViewRecord2MenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_ViewRecord2MenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_ViewRecordsMenuItemShortCut)
	End if 
	If ($_t_DeleteRecord2MenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_DeleteRecord2MenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_DeleteRecord2MenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_DeleteRecordMenuItemShortCut)
	End if 
	
	If ($_l_InsertCount>0)
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		$_l_InsertCount:=0
	End if 
	If ($_t_SelectRecordsMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SelectRecordsMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_SelectRecordsMenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"H";2048)
		$_l_ShortCut:=Character code:C91("H")
		If ($_l_ShortCut>0)
			
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				If ($_l_ShortCutPosition<0)
					$_t_ShortCutChar:=Char:C90($_l_ShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				Else 
					//dont add the short cut
				End if 
				
			Else 
				$_t_ShortCutChar:=Char:C90($_l_ShortCut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
				
			End if 
			
		End if 
	End if 
	
	If ($_t_SortRecordsMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SortRecordsMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_SortRecordsMenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"T";2048)
		$_l_ShortCut:=Character code:C91("T")
		If ($_l_ShortCut>0)
			
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				If ($_l_ShortCutPosition<0)
					$_t_ShortCutChar:=Char:C90($_l_ShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				Else 
					//dont add the short cut
				End if 
				
			Else 
				$_t_ShortCutChar:=Char:C90($_l_ShortCut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
				
			End if 
			
		End if 
	End if 
	If ($_l_InsertCount>0)
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		$_l_InsertCount:=0
	End if 
	
	If ($_t_CountRecordsMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_CountRecordsMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_CountRecordsMenuMethod)
		If ($_l_CountRecordsMenuItemShortCut#0)
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_CountRecordsMenuItemShortCut)
			
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_CountRecordsMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_CountRecordsMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_CountRecordsMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_CountRecordsMenuItemShortCut)
			End if 
			
		End if 
	End if 
	
	If ($_t_SearchRecordsMenuItem#"")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SearchRecordsMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_SearchRecordsMenuMethod)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"S";2048)
		$_l_ShortCut:=Character code:C91("S")
		If ($_l_ShortCut>0)
			
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				If ($_l_ShortCutPosition<0)
					$_t_ShortCutChar:=Char:C90($_l_ShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				Else 
					//dont add the short cut
				End if 
				
			Else 
				$_t_ShortCutChar:=Char:C90($_l_ShortCut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
				
			End if 
			
		End if 
	End if 
	If ($_l_InsertCount>0)
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		$_l_InsertCount:=0
	End if 
	
	If ($_t_ViewAsListMenuItem#"") & (False:C215)  //Not required now as graph/stats etc incorporated
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ViewAsListMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_ViewAsListMenuMethod)
		If ($_l_ViewAsListMenuitemShortCut#0)
			SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_ViewAsListMenuitemShortCut)
		End if 
	End if 
	If ($_t_ViewAsStatsMenuitem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ViewAsStatsMenuitem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_ViewAsStatsMenuMethod)
		If ($_l_ViewAsStatsMenuitemShortCut#0)
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_ViewAsStatsMenuitemShortCut)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_ViewAsStatsMenuitemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_ViewAsStatsMenuitemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_ViewAsStatsMenuitemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsStatsMenuitemShortCut)
			End if 
		End if 
		If ($_bo_FiltersAvailable)
			$_l_InsertCount:=$_l_InsertCount+1
			$_l_DefaultFilterID:=DB_GetdefaultFilterID($_l_DisplayRecordsTable)
			If ($_l_DefaultFilterID#0)  //There is already a default
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Reset Default Filter")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_SetDefaultFilters")
				
			Else 
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Set Default Filter")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_SetDefaultFilters")
				
			End if 
		End if 
		
	Else 
		If ($_bo_FiltersAvailable)
			$_l_InsertCount:=$_l_InsertCount+1
			$_l_DefaultFilterID:=DB_GetdefaultFilterID($_l_DisplayRecordsTable)
			If ($_l_DefaultFilterID#0)  //There is already a default
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Reset Default Filter")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_SetDefaultFilters")
				
			Else 
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Set Default Filter")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_SetDefaultFilters")
				
			End if 
		End if 
	End if 
	
	If ($_t_ViewAsGraphMenuItem#"")
		$_l_InsertCount:=$_l_InsertCount+1
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_ViewAsGraphMenuItem)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_ViewAsGraphMenuMethod)
		If ($_l_ViewAsGraphMenuItemShortCut#0)
			//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_ViewAsGraphMenuItemShortCut)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut+2048)
				If ($_l_ShortCutPosition>0)
					$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut+2048+512)
					If ($_l_ShortCutPosition<0)
						$_t_ShortCutChar:=Char:C90($_l_ViewAsGraphMenuItemShortCut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_ShortCutChar:=Char:C90($_l_ViewAsGraphMenuItemShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut+2048)
					
				End if 
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_ViewAsGraphMenuItemShortCut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ViewAsGraphMenuItemShortCut)
			End if 
		End if 
	End if 
	If ($_l_InsertCount>0)
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
		$_l_InsertCount:=0
	End if 
	
	If (DB_bo_FiltersAvailable) & ($_bo_FiltersAvailable)
		If (DB_bo_DisplayFilters)
			$_t_FiltersLabel:=Get localized string:C991("MenuItem_HideFilters")
			
		Else 
			$_t_FiltersLabel:=Get localized string:C991("MenuItem_ShowFilters")
		End if 
		$_t_MethodName:="DB_SetFilters"  //note this is a new method
		$_l_MenuShortCut:=Character code:C91("F")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_FiltersLabel)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
		SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "F"; 2048+512)
		$_l_ShortCut:=Character code:C91("F")
		If ($_l_ShortCut>0) & (Not:C34(DB_bo_MenusInited))
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
			If ($_l_ShortCutPosition<0)
				$_t_ShortCutChar:=Char:C90($_l_ShortCut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
			Else 
				//dont add the short cut
			End if 
			
		End if 
	End if 
	//
	//Open records in new window(will open then in a new process)(tick /untik)
	//DB_bo_RecordsinNewProcess
	$_t_ProcessName:=Process_Name(Current process:C322)
	If ($_t_ProcessName#"Copy@")
		$_t_NewWindowOption:=Get localized string:C991("MenuItem_Recordsinprocess")
		$_t_MethodName:="DB_SetNewProcessOption"
		// Navigation to other tables gets related records
		$_t_RelatedRecords:=Get localized string:C991("MenuItem_RelatedRecords")
		//$_t_MethodName:="DB_SetRelationOption"
		//$_l_MenuShortCut:=Character code("W")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_NewWindowOption)
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
		//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"W";2048)
		$_l_ShortCut:=Character code:C91("W")
		If ($_l_ShortCut>0)
			$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
			If ($_l_ShortCutPosition>0) & (Not:C34(DB_bo_MenusInited))
				$_l_ShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				If ($_l_ShortCutPosition<0)
					$_t_ShortCutChar:=Char:C90($_l_ShortCut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048+512)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048+512)
				Else 
					//dont add the short cut
				End if 
				
			Else 
				$_t_ShortCutChar:=Char:C90($_l_ShortCut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutChar; 2048)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_ShortCut+2048)
				
			End if 
			
		End if 
		If ($_obj_WindowPrefs.SetOpenInNewWindow)
			DB_bo_RecordsinNewProcess:=False:C215
			DB_SetNewProcessOption("DB_bo_SetOpeninNewWindow")
		End if 
	Else 
		DB_bo_RecordsinNewProcess:=False:C215
		
	End if 
	$0:=$_t_MenuReference
	
	
	
	
End if 
//
ERR_MethodTrackerReturn("DB_MenuCreateRecordsMenu"; $_t_oldMethodName)
