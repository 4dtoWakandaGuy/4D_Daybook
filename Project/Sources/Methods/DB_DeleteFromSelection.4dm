//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DeleteFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     15/03/2011 23:58 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	ARRAY LONGINT:C221($_al_SelectedRows; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_GroupCodes; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_HeadingCodes; 0)
	C_BOOLEAN:C305($_bo_CheckedAccountCode; $_bo_OK; $_bo_OnScreenEdit; DB_bo_OnScreenEdit; PRD_bo_ShowNLA)
	C_LONGINT:C283($_l_Column; $_l_DeletionFlag; $_l_FieldNumber; $_l_index; $_l_ModuleAccess; $_l_ObjectB2Bottom; $_l_ObjectB2Left; $_l_ObjectB2Right; $_l_ObjectB2Top; $_l_Row; $_l_TableNumber)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; PAL_BUTTON_2; xnext)
	C_POINTER:C301($_Ptr_ColumnVariable)
	C_TEXT:C284($_t_AccountCode; $_t_GroupCode; $_t_JobCodeTable; $_t_JobTypeCode; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DeleteFromSelection")


$_bo_OnScreenEdit:=DB_bo_OnScreenEdit  // we can edit in the on screen

Case of 
	: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
		
		CREATE SET:C116([COMPANIES:2]; "$temp")
		USE SET:C118("ListboxSet0")
		FIRST RECORD:C50([COMPANIES:2])
		
		If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
			Co_Deleterecordfromselection
		Else 
			Gen_Alert("Sorry you do not have access to company records")
			
		End if 
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
		If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
			CON_DeleteRecordFromSelection
			
		End if 
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
		Gen_Alert("Account balances may not be deleted!")
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
		READ WRITE:C146([ACCOUNTS:32])
		CREATE SET:C116([ACCOUNTS:32]; "$temp")
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		//GET LISTBOX CELL POSITION(DB_lb_OutputArrays;$_l_Column;$_l_Row)
		ARRAY LONGINT:C221($_al_SelectedRows; 0)
		
		LB_GetSelect(->DB_lb_OutputArrays; ->$_al_SelectedRows)
		LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_bo_CheckedAccountCode:=False:C215
		$_t_AccountCode:=""
		$_t_GroupCode:=""
		
		//USE SET("ListboxSet0")
		If (Size of array:C274($_al_SelectedRows)>0)
			ARRAY TEXT:C222($_at_AccountCodes; 0)
			ARRAY TEXT:C222($_at_GroupCodes; 0)
			For ($_l_index; 1; Size of array:C274($_al_SelectedRows))
				$_l_Row:=$_al_SelectedRows{$_l_index}
				For ($_l_Index; Size of array:C274($_aptr_ColumnVariables); 1; -1)
					RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					If (Position:C15("Group"; $_t_VariableName)>0)
						If (Position:C15("Codes"; $_t_VariableName)>0)
							$_Ptr_ColumnVariable:=$_aptr_ColumnVariables{$_l_Index}
							If (Not:C34($_bo_CheckedAccountCode))
								$_t_AccountCode:=$_Ptr_ColumnVariable->{$_l_Row}
								$_bo_CheckedAccountCode:=True:C214
							Else 
								$_t_GroupCode:=$_Ptr_ColumnVariable->{$_l_Row}
							End if 
							If ($_t_AccountCode#"") | ($_t_GroupCode#"")
								If ($_t_AccountCode#"")
									APPEND TO ARRAY:C911($_at_AccountCodes; $_t_AccountCode)
								End if 
								If ($_t_GroupCode#"")
									APPEND TO ARRAY:C911($_at_GroupCodes; $_t_GroupCode)
								End if 
								$_l_Index:=1
							End if 
						End if 
					End if 
				End for 
			End for 
			//FIRST RECORD([ACCOUNTS])
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
				
				If (Size of array:C274($_at_AccountCodes)>0)
					QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_AccountCodes)
					//We could be opening an account or a heading.
					
					REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
					
					//QUERY([ACC BALANCES];[ACC BALANCES]Account Code="zzzz")
					FIRST RECORD:C50([ACCOUNTS:32])
					While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & (Records in selection:C76([ACCOUNT_BALANCES:34])=0))
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
						NEXT RECORD:C51([ACCOUNTS:32])
					End while 
					If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
						Gen_Alert("At least one selected Account has been used"; "Cancel")
					Else 
						Are_You_Sure
						If (OK=1)
							DELETE SELECTION:C66([ACCOUNTS:32])
						End if 
					End if 
					UNLOAD RECORD:C212([ACCOUNTS:32])
					READ ONLY:C145([ACCOUNTS:32])
					
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					//ZAccounts_Mod ($_t_AutosearchCode;"TRUE";->$_l_EditCompanyProcess)
				End if 
				
				If (Size of array:C274($_at_GroupCodes)>0)
				End if 
				//This then needs to reflow the form
				
			Else 
				Gen_Alert("Sorry you do not have access to accounts records")
				UNLOAD RECORD:C212([ACCOUNTS:32])
				READ ONLY:C145([ACCOUNTS:32])
				USE SET:C118("$Temp")
				
				DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				DB_SetFormMenuoptions
				DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
			End if 
		End if 
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ACTIONS:13]))
		READ WRITE:C146([ACTIONS:13])
		CREATE SET:C116([ACTIONS:13]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; "Actions")
				DELETE SELECTION:C66([ACTIONS:13])
			End if 
			UNLOAD RECORD:C212([ACTIONS:13])
			READ ONLY:C145([ACTIONS:13])
			
			USE SET:C118("$Temp")
			
			DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		End if 
		
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ADDRESS_FORMATS:74]))
		READ WRITE:C146([ADDRESS_FORMATS:74])
		CREATE SET:C116([ADDRESS_FORMATS:74]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; "Address Format")
				DELETE SELECTION:C66([ADDRESS_FORMATS:74])
			End if 
			OK:=1
		End if 
		UNLOAD RECORD:C212([ADDRESS_FORMATS:74])
		READ ONLY:C145([ADDRESS_FORMATS:74])
		
		USE SET:C118("$Temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ANALYSES:36]))
		READ WRITE:C146([ANALYSES:36])
		
		CREATE SET:C116([ANALYSES:36]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			
			Are_You_Sure
			If (OK=1)
				DELETE SELECTION:C66([ANALYSES:36])
				
			End if 
			OK:=1
			
		End if 
		UNLOAD RECORD:C212([ANALYSES:36])
		READ ONLY:C145([ANALYSES:36])
		
		USE SET:C118("$Temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[AREAS:3]))
		READ WRITE:C146([AREAS:3])
		
		CREATE SET:C116([AREAS:3]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[AREAS:3]; ->[AREAS:3]Area_Code:1; "Areas")
				DELETE SELECTION:C66([ACTIONS:13])
			End if   //``
			OK:=1
			
			
		End if 
		UNLOAD RECORD:C212([AREAS:3])
		READ ONLY:C145([AREAS:3])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_BRANDS:8]))
		READ WRITE:C146([PRODUCT_BRANDS:8])
		
		CREATE SET:C116([PRODUCT_BRANDS:8]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; "Brands")
				DELETE SELECTION:C66([PRODUCT_BRANDS:8])
			End if   //``
			OK:=1
			
			
			
		End if 
		
		UNLOAD RECORD:C212([PRODUCT_BRANDS:8])
		READ ONLY:C145([PRODUCT_BRANDS:8])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACT_TYPES:19]))
		READ WRITE:C146([CONTRACT_TYPES:19])
		
		CREATE SET:C116([CONTRACT_TYPES:19]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				
				DELETE SELECTION:C66([CONTRACT_TYPES:19])
			End if   //``
			OK:=1
			
			
			
		End if 
		UNLOAD RECORD:C212([CONTRACT_TYPES:19])
		READ ONLY:C145([CONTRACT_TYPES:19])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
		READ WRITE:C146([CONTRACTS:17])
		
		CREATE SET:C116([CONTRACTS:17]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				
				FIRST RECORD:C50([CONTRACTS:17])
				While (Not:C34(End selection:C36([CONTRACTS:17])))
					If ([CONTRACTS:17]Contract_Code:3#"")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=""; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Allocated:28=0)
						If (Records in selection:C76([ORDER_ITEMS:25])#Records in table:C83([ORDER_ITEMS:25]))
							DELETE SELECTION:C66([ORDER_ITEMS:25])
						End if 
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=[CONTRACTS:17]Contract_Code:3)
						DELETE SELECTION:C66([CONTRACT_RECORD_ANALYSIS:88])
						CustomFields_Delete(->[CONTRACTS:17])
					End if 
					NEXT RECORD:C51([CONTRACTS:17])
				End while 
				DELETE SELECTION:C66([CONTRACTS:17])
				
			End if 
			
			
			
		End if 
		UNLOAD RECORD:C212([CONTRACTS:17])
		READ ONLY:C145([CONTRACTS:17])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[COUNTRIES:73]))
		READ WRITE:C146([COUNTRIES:73])
		
		CREATE SET:C116([COUNTRIES:73]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; "Countries")
				DELETE SELECTION:C66([COUNTRIES:73])
			End if   //``
			OK:=1
			
			
			
			
			
			
		End if 
		UNLOAD RECORD:C212([COUNTRIES:73])
		READ ONLY:C145([COUNTRIES:73])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CREDIT_STAGES:54]))
		READ WRITE:C146([CREDIT_STAGES:54])
		
		CREATE SET:C116([CREDIT_STAGES:54]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; "Credit Stages")
				DELETE SELECTION:C66([CREDIT_STAGES:54])
			End if   //``
			OK:=1
			
			
			
		End if 
		
		UNLOAD RECORD:C212([CREDIT_STAGES:54])
		READ ONLY:C145([CREDIT_STAGES:54])
		
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENCIES:71]))
		READ WRITE:C146([CURRENCIES:71])
		
		CREATE SET:C116([CURRENCIES:71]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; "Currency Codes")
				DELETE SELECTION:C66([CREDIT_STAGES:54])
			End if   //``
			OK:=1
			
			
			
		End if 
		UNLOAD RECORD:C212([CURRENCIES:71])
		READ ONLY:C145([CURRENCIES:71])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CURRENT_STOCK:62]))
		READ WRITE:C146([CURRENT_STOCK:62])
		
		CREATE SET:C116([CURRENT_STOCK:62]; "$Temp")
		USE SET:C118("ListboxSet0")
		FIRST RECORD:C50([CURRENT_STOCK:62])
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				DELETE SELECTION:C66([CURRENT_STOCK:62])
			End if   //``
			OK:=1
			
			//``
			
			
		End if 
		
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		READ ONLY:C145([CURRENT_STOCK:62])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
		READ WRITE:C146([DIARY:12])
		
		CREATE SET:C116([DIARY:12]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DiaryManager))
		If ($_l_ModuleAccess>=2)
			
			
			
			
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary")
				DELETE SELECTION:C66([DIARY:12])
			End if   //``
			OK:=1
			
			
			
			
			
		End if 
		
		UNLOAD RECORD:C212([DIARY:12])
		READ ONLY:C145([DIARY:12])
		
		USE SET:C118("$temp")
		DB_SetFormMenuoptions
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
		READ WRITE:C146([DOCUMENTS:7])
		
		CREATE SET:C116([DOCUMENTS:7]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; "Documents")
				DELETE SELECTION:C66([DOCUMENTS:7])
			End if   //``
			OK:=1
			
		End if 
		
		UNLOAD RECORD:C212([DOCUMENTS:7])
		READ ONLY:C145([DOCUMENTS:7])
		USE SET:C118("$Temp")  //
		//`
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
		
		//Templates or reports
	: (DB_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		// No 'edit screen' here
		READ WRITE:C146([CUSTOM_FIELD_DEFINITiONS:99])
		LOAD RECORD:C52([CUSTOM_FIELD_DEFINITiONS:99])
		EDIT ITEM:C870([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1)
		CREATE SET:C116([CUSTOM_FIELD_DEFINITiONS:99]; "$Temp")
		USE SET:C118("ListboxSet0")
		
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[CUSTOM_FIELD_DEFINITiONS:99]; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; "Field Defs")
				DELETE SELECTION:C66([DIARY:12])
			End if   //``
			OK:=1
			
		End if 
		UNLOAD RECORD:C212([CUSTOM_FIELD_DEFINITiONS:99])
		READ ONLY:C145([CUSTOM_FIELD_DEFINITiONS:99])
		USE SET:C118("$Temp")  //``
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_GROUPS:10]))
		READ WRITE:C146([PRODUCT_GROUPS:10])
		CREATE SET:C116([PRODUCT_GROUPS:10]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				Minor_DelRecords(->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; "Group Codes")
				DELETE SELECTION:C66([PRODUCT_GROUPS:10])
			End if   //``
			OK:=1
			
			
			
		End if 
		UNLOAD RECORD:C212([PRODUCT_GROUPS:10])
		READ ONLY:C145([PRODUCT_GROUPS:10])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[HEADINGS:84]))
		READ WRITE:C146([HEADINGS:84])
		CREATE SET:C116([HEADINGS:84]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			Are_You_Sure
			If (OK=1)
				CREATE SET:C116([HEADINGS:84]; "$deleteHeadings")
				SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_HeadingCodes)
				COPY NAMED SELECTION:C331([ACCOUNTS:32]; "$TempAccounts")
				QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_HeadingCodes)
				If (Records in selection:C76([HEADINGS:84])>0)
					Gen_Alert("You may not delete headings that have subheadings attached! Please modify the parent heading or delete the subheadings first.")
				Else 
					QUERY WITH ARRAY:C644([ACCOUNTS:32]Report_Heading:1; $_at_HeadingCodes)
					If (Records in selection:C76([HEADINGS:84])>0)
						Gen_Alert("You may not delete headings that have subheadings attached! Please modify the parent heading or delete the subheadings first.")
					Else 
						USE SET:C118("$deleteHeadings")
						
						DELETE SELECTION:C66([HEADINGS:84])
					End if 
				End if   //`
			End if   //
			OK:=1
			
			
			
			
		End if 
		UNLOAD RECORD:C212([HEADINGS:84])
		READ ONLY:C145([HEADINGS:84])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
		READ WRITE:C146([INVOICES:39])
		CREATE SET:C116([INVOICES:39]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([INVOICES:39])>0)
				
				CREATE SET:C116([INVOICES:39]; "$Master")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0; *)
				QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=0; *)  //not posted
				QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-1)  //pro forma
				If (Records in set:C195("$Master")#Records in selection:C76([INVOICES:39]))
					Gen_Alert("Please select only Sales Ledger records with a Total Due of zero, or are not post"+"ed"; "Cancel")
					USE SET:C118("$Master")
					
				Else 
					Are_You_SureM(" that you want to Delete these Sales Ledger record(s) permanently")
					If (OK=1)
						DELETE SELECTION:C66([INVOICES:39])
						
					End if 
				End if 
				
			End if 
		End if 
		UNLOAD RECORD:C212([INVOICES:39])
		READ ONLY:C145([INVOICES:39])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_STAGES:47]))
		READ WRITE:C146([JOB_STAGES:47])
		CREATE SET:C116([JOB_STAGES:47]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		If ($_l_ModuleAccess>=2)
			
			Are_You_Sure
			If (OK=1)
				FIRST RECORD:C50([JOB_STAGES:47])
				While (Not:C34(End selection:C36([JOB_STAGES:47])))
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOB_STAGES:47]Job_Code:1; *)
					QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
					DELETE SELECTION:C66([JOB PERSONNEL:48])
					NEXT RECORD:C51([JOB_STAGES:47])
				End while 
				DELETE SELECTION:C66([JOB_STAGES:47])
			End if 
		End if 
		UNLOAD RECORD:C212([JOB_STAGES:47])
		READ ONLY:C145([JOB_STAGES:47])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[JOB_TYPES:65]))
		READ WRITE:C146([JOB_TYPES:65])
		CREATE SET:C116([JOB_TYPES:65]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([JOB_TYPES:65])>0)
				Are_You_Sure
				If (OK=1)
					
					READ WRITE:C146([CODE_USES:91])
					FIRST RECORD:C50([JOB_TYPES:65])
					While (Not:C34(End selection:C36([JOB_TYPES:65])))
						$_t_JobCodeTable:=String:C10(Table:C252(->[JOB_TYPES:65]))
						$_t_JobTypeCode:=[JOB_TYPES:65]Type_Code:1
						$_t_JobCodeTable:=("0"*(3-Length:C16($_t_JobCodeTable)))+$_t_JobCodeTable+$_t_JobTypeCode
						QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_JobCodeTable)
						If (Records in selection:C76([CODE_USES:91])>0)
							DELETE SELECTION:C66([CODE_USES:91])
						End if 
						NEXT RECORD:C51([JOB_TYPES:65])
					End while 
					READ ONLY:C145([CODE_USES:91])
					DELETE SELECTION:C66([JOB_TYPES:65])
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([JOB_TYPES:65])
		READ ONLY:C145([JOB_TYPES:65])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
		READ WRITE:C146([JOBS:26])
		CREATE SET:C116([JOBS:26]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([JOBS:26])>0)
				Are_You_Sure
				If (OK=1)
					
					FIRST RECORD:C50([JOBS:26])
					While (Not:C34(End selection:C36([JOBS:26])))
						If ([JOBS:26]Job_Code:1#"")
							RELATE MANY:C262([JOBS:26]Job_Code:1)
							DELETE SELECTION:C66([ORDER_ITEMS:25])
							DELETE SELECTION:C66([JOB_STAGES:47])
							DELETE SELECTION:C66([JOB PERSONNEL:48])
							CustomFields_Delete(->[JOBS:26])
						End if 
						NEXT RECORD:C51([JOBS:26])
					End while 
					DELETE SELECTION:C66([JOBS:26])
					
					
				End if 
			End if 
			
		End if 
		UNLOAD RECORD:C212([JOBS:26])
		READ ONLY:C145([JOBS:26])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[LAYERS:76]))
		READ WRITE:C146([LAYERS:76])
		CREATE SET:C116([LAYERS:76]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([LAYERS:76])>0)
				
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([LAYERS:76])
					
					
					
				End if 
			End if 
			UNLOAD RECORD:C212([LAYERS:76])
			READ ONLY:C145([LAYERS:76])
			USE SET:C118("$temp")
		End if 
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[LOCATIONS:61]))
		READ WRITE:C146([LOCATIONS:61])
		CREATE SET:C116([LOCATIONS:61]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([LOCATIONS:61])>0)
				
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([LOCATIONS:61])
					
					
					
				End if 
			End if 
			UNLOAD RECORD:C212([LOCATIONS:61])
			READ ONLY:C145([LOCATIONS:61])
			USE SET:C118("$temp")
		End if 
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[SCRIPTS:80]))
		READ WRITE:C146([SCRIPTS:80])
		CREATE SET:C116([SCRIPTS:80]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([SCRIPTS:80])>0)
				
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([SCRIPTS:80])
					
					
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([SCRIPTS:80])
		READ ONLY:C145([SCRIPTS:80])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[MOVEMENT_TYPES:60]))
		READ WRITE:C146([MOVEMENT_TYPES:60])
		CREATE SET:C116([MOVEMENT_TYPES:60]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
				
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([MOVEMENT_TYPES:60])
					
					
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
		READ ONLY:C145([MOVEMENT_TYPES:60])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
		READ WRITE:C146([ORDERS:24])
		CREATE SET:C116([ORDERS:24]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([ORDERS:24])>0)
				Gen_Alert("Sales Orders may not be deleted while stock is allocated to them.")
			Else 
				
				If (Gen_DeleteCheckState(->[ORDERS:24]State:15))
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28>0)
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
					Else 
						
						Are_You_Sure
						If (OK=1)
							READ WRITE:C146([ORDERS:24])
							READ WRITE:C146([ORDER_ITEMS:25])
							FIRST RECORD:C50([ORDERS:24])
							While (Not:C34(End selection:C36([ORDERS:24])))
								If ([ORDERS:24]Order_Code:3#"")
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
									If (Records in selection:C76([ORDER_ITEMS:25])#Records in table:C83([ORDER_ITEMS:25]))
										If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
											Orders_InDelSubscription
										End if 
										DELETE SELECTION:C66([ORDER_ITEMS:25])
									End if 
									CustomFields_Delete(->[ORDERS:24])
								End if 
								NEXT RECORD:C51([ORDERS:24])
							End while 
							Minor_DelRecords(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Orders")
							DELETE SELECTION:C66([ORDERS:24])
						End if 
					End if 
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([ORDERS:24])
		READ ONLY:C145([ORDERS:24])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
		CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
		USE SET:C118("ListboxSet0")
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([ORDER_ITEMS:25])>0)
				If (Gen_DeleteCheckState(->[ORDERS:24]State:15))
					Are_You_Sure
					If (OK=1)
						
						READ WRITE:C146([ORDER_ITEMS:25])
						FIRST RECORD:C50([ORDER_ITEMS:25])
						While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
							If ([ORDER_ITEMS:25]Item_Locked:16)
								//Gen_Alert ("You cannot delete Item Number";"Cancel")
							Else 
								If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
									If ([ORDER_ITEMS:25]Item_Number:27>0)
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
										DELETE SELECTION:C66([SUBSCRIPTIONS:93])
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End while 
						DELETE SELECTION:C66([ORDER_ITEMS:25])
					End if 
				End if 
				
			End if 
		End if 
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
		READ ONLY:C145([ORDER_ITEMS:25])
		
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL_GROUPS:92]))
		READ WRITE:C146([PERSONNEL_GROUPS:92])
		CREATE SET:C116([SCRIPTS:80]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
				
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([PERSONNEL_GROUPS:92])
					
					
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
		READ ONLY:C145([PERSONNEL_GROUPS:92])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
		READ WRITE:C146([PERSONNEL:11])
		CREATE SET:C116([PERSONNEL:11]; "$Temp")
		
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PERSONNEL:11])>0)
				
				Are_You_Sure
				If (OK=1)
					DB_lockFile(->[PERSONNEL:11])
					APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38:=1)
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PERSONNEL:11])
		READ ONLY:C145([PERSONNEL:11])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PICTURES:85]))
		READ WRITE:C146([PICTURES:85])
		CREATE SET:C116([PICTURES:85]; "$Temp")
		
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PICTURES:85])>0)
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([PICTURES:85])
					
					
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PICTURES:85])
		READ ONLY:C145([PICTURES:85])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[POSTAL_CODES:50]))
		READ WRITE:C146([POSTAL_CODES:50])
		CREATE SET:C116([POSTAL_CODES:50]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([POSTAL_CODES:50])>0)
				
				Are_You_Sure
				If (OK=1)
					Minor_DelRecords(->[POSTAL_CODES:50]; ->[POSTAL_CODES:50]Postal_Code_From:1; "Postcodes")
					DELETE SELECTION:C66([POSTAL_CODES:50])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([POSTAL_CODES:50])
		READ ONLY:C145([POSTAL_CODES:50])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))
		READ WRITE:C146([PRICE_GROUPS:18])
		CREATE SET:C116([PRICE_GROUPS:18]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PriceTable))
		If ($_l_ModuleAccess>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)>2)
			If (Records in selection:C76([PRICE_GROUPS:18])>0)
				Are_You_Sure
				If (OK=1)
					Minor_DelRecords(->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; "PriceG")
					DELETE SELECTION:C66([PRICE_GROUPS:18])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PRICE_GROUPS:18])
		READ ONLY:C145([PRICE_GROUPS:18])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
		READ WRITE:C146([PRICE_TABLE:28])
		CREATE SET:C116([PRICE_TABLE:28]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PriceTable))
		If ($_l_ModuleAccess>=2) & (DB_GetModuleSettingByNUM(Module_Products)>2)
			If (Records in selection:C76([PRICE_GROUPS:18])>0)
				Are_You_Sure
				If (OK=1)
					Minor_DelRecords(->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; "PriceG")
					DELETE SELECTION:C66([PRICE_GROUPS:18])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PRICE_GROUPS:18])
		READ ONLY:C145([PRICE_GROUPS:18])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PROBLEMS:22]))
		READ WRITE:C146([PROBLEMS:22])
		CREATE SET:C116([PROBLEMS:22]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PROBLEMS:22])>0)
				Are_You_Sure
				If (OK=1)
					
					
					DELETE SELECTION:C66([PROBLEMS:22])
					
					
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PROBLEMS:22])
		READ ONLY:C145([PROBLEMS:22])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
		
		READ WRITE:C146([PROJECTS:89])
		CREATE SET:C116([PROJECTS:89]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PROJECTS:89])>0)
				If (Gen_DeleteCheckState(->[PROJECTS:89]State:9))
					Are_You_Sure
					If (OK=1)
						DELETE SELECTION:C66([PROJECTS:89])
					End if 
				End if 
				
			End if 
		End if 
		UNLOAD RECORD:C212([PROJECTS:89])
		READ ONLY:C145([PROJECTS:89])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
		READ WRITE:C146([PRODUCTS:9])
		CREATE SET:C116([PRODUCTS:9]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Products))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PRODUCTS:9])>0)
				Gen_Confirm3("Do you wish to permanently delete these records or mark them as no longer available?"; "Unavailable"; "Delete"; "Cancel")
				$_bo_OK:=(OK=1)
				If (xnext=0)
					
					If ($_bo_OK)
						$_l_DeletionFlag:=-1
					Else 
						
						$_l_DeletionFlag:=-2
					End if 
				Else 
					$_l_DeletionFlag:=0
				End if 
				
				OK:=1
				If ($_l_DeletionFlag#0)
					FIRST RECORD:C50([PRODUCTS:9])
					While (Not:C34(End selection:C36([PRODUCTS:9])))
						If ([PRODUCTS:9]Product_Code:1#"")
							Products_Del2($_l_DeletionFlag)
						End if 
						NEXT RECORD:C51([PRODUCTS:9])
					End while 
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54:=$_l_DeletionFlag)
					USE NAMED SELECTION:C332("UnfilteredSelection")
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
					If (PRD_bo_ShowNLA)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>-2)  //include the -1 (-2 are never displayed)
					Else 
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54=0)
					End if 
					
				End if 
				
			End if 
		End if 
		UNLOAD RECORD:C212([PRODUCTS:9])
		READ ONLY:C145([PRODUCTS:9])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PUBLICATIONS:52]))
		READ WRITE:C146([PUBLICATIONS:52])
		CREATE SET:C116([PUBLICATIONS:52]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PUBLICATIONS:52])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([PUBLICATIONS:52])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PUBLICATIONS:52])
		READ ONLY:C145([PUBLICATIONS:52])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57]))
		READ WRITE:C146([PURCHASE_ORDERS:57])
		CREATE SET:C116([PURCHASE_ORDERS:57]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([PURCHASE_ORDERS:57])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
		READ ONLY:C145([PURCHASE_ORDERS:57])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
		CREATE SET:C116([PURCHASE_ORDERS_ITEMS:169]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
				Gen_Alert("You may only delete Purchase Order items from within a Purchase Order")
			End if 
		End if 
		UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
		READ ONLY:C145([PURCHASE_ORDERS_ITEMS:169])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
		
		READ WRITE:C146([PURCHASE_INVOICES:37])
		CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
				CREATE SET:C116([PURCHASE_INVOICES:37]; "$Master")
				QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9=0)
				If (Records in set:C195("$Master")#Records in selection:C76([PURCHASE_INVOICES:37]))
					Gen_Alert("Please select only Purchases with a Total Due of zero"; "Cancel")
					
				Else 
					Are_You_SureM(" that you want to Delete these Purchase Ledger record(s) permanently")
					If (OK=1)
						DELETE SELECTION:C66([PURCHASE_INVOICES:37])
					End if 
					
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
		READ ONLY:C145([PURCHASE_INVOICES:37])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))  //not current form for this
		READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
		CREATE SET:C116([PURCHASE_INVOICE_ITEMS:158]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
				Gen_Alert("You may only delete Purchase  Ledger items from within a Purchase Invoice")
			End if 
		End if 
		UNLOAD RECORD:C212([PURCHASE_INVOICE_ITEMS:158])
		READ ONLY:C145([PURCHASE_INVOICE_ITEMS:158])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[RECURRING_JOURNALS:38]))
		READ WRITE:C146([RECURRING_JOURNALS:38])
		CREATE SET:C116([RECURRING_JOURNALS:38]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([RECURRING_JOURNALS:38])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([RECURRING_JOURNALS:38])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([RECURRING_JOURNALS:38])
		READ ONLY:C145([RECURRING_JOURNALS:38])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[RESULTS:14]))
		READ WRITE:C146([RESULTS:14])
		CREATE SET:C116([RESULTS:14]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([RESULTS:14])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([RESULTS:14])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([RESULTS:14])
		READ ONLY:C145([RESULTS:14])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[ROLES:87]))
		READ WRITE:C146([ROLES:87])
		CREATE SET:C116([ROLES:87]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([ROLES:87])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([ROLES:87])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([ROLES:87])
		READ ONLY:C145([ROLES:87])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
		READ WRITE:C146([SERVICE_CALLS:20])
		CREATE SET:C116([SERVICE_CALLS:20]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([SERVICE_CALLS:20])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([SERVICE_CALLS:20])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([SERVICE_CALLS:20])
		READ ONLY:C145([SERVICE_CALLS:20])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[SOLUTIONS:23]))
		READ WRITE:C146([SOLUTIONS:23])
		CREATE SET:C116([SOLUTIONS:23]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([SOLUTIONS:23])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([SOLUTIONS:23])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([SOLUTIONS:23])
		READ ONLY:C145([SOLUTIONS:23])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
		READ WRITE:C146([SOURCES:6])
		CREATE SET:C116([SOURCES:6]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([SOURCES:6])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([SOURCES:6])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([SOURCES:6])
		READ ONLY:C145([SOURCES:6])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STAGES:45]))  //job stages)
		READ WRITE:C146([STAGES:45])
		CREATE SET:C116([STAGES:45]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STAGES:45])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([STAGES:45])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STAGES:45])
		READ ONLY:C145([STAGES:45])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STATUS:4]))  //job stages)
		READ WRITE:C146([STATUS:4])
		CREATE SET:C116([STATUS:4]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STATUS:4])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([STATUS:4])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STATUS:4])
		READ ONLY:C145([STATUS:4])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //job stages)
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))  //job stages)
		READ WRITE:C146([STOCK_MOVEMENTS:40])
		CREATE SET:C116([STOCK_MOVEMENTS:40]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
				Are_You_Sure
				If (OK=1)
					FIRST RECORD:C50([STOCK_MOVEMENTS:40])
					While (Not:C34(End selection:C36([STOCK_MOVEMENTS:40])))
						RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
						DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])
						NEXT RECORD:C51([STOCK_MOVEMENTS:40])
					End while 
					DELETE SELECTION:C66([STOCK_MOVEMENTS:40])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
		READ ONLY:C145([STOCK_MOVEMENTS:40])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))  //
		READ WRITE:C146([STOCK_LEVELS:58])
		CREATE SET:C116([STOCK_LEVELS:58]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STOCK_LEVELS:58])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([STOCK_LEVELS:58])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STOCK_LEVELS:58])
		READ ONLY:C145([STOCK_LEVELS:58])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_TYPES:59]))  //job stages)
		READ WRITE:C146([STOCK_TYPES:59])
		CREATE SET:C116([STOCK_TYPES:59]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([STOCK_TYPES:59])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([STOCK_TYPES:59])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([STOCK_TYPES:59])
		READ ONLY:C145([STOCK_TYPES:59])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TAX_CODES:35]))  //job stages)
		READ WRITE:C146([TAX_CODES:35])
		CREATE SET:C116([TAX_CODES:35]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TAX_CODES:35])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([TAX_CODES:35])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TAX_CODES:35])
		READ ONLY:C145([TAX_CODES:35])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TERMINOLOGY:75]))  //job stages)
		READ WRITE:C146([TERMINOLOGY:75])
		CREATE SET:C116([TERMINOLOGY:75]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TERMINOLOGY:75])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([TERMINOLOGY:75])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TERMINOLOGY:75])
		READ ONLY:C145([TERMINOLOGY:75])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))  //job stages)
		READ WRITE:C146([TRANSACTION_BATCHES:30])
		CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
				Are_You_Sure
				If (OK=1)
					DELETE SELECTION:C66([TRANSACTION_BATCHES:30])
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
		READ ONLY:C145([TRANSACTION_BATCHES:30])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))  //job stages)
		READ WRITE:C146([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				Are_You_Sure
				If (OK=1)
					Gen_Confirm("NB: Only delete to clear Transactions from previous years"; "Stop"; "Continue")
					If (OK=1)
						DELETE SELECTION:C66([TRANSACTIONS:29])
					End if 
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TRANSACTIONS:29])
		READ ONLY:C145([TRANSACTIONS:29])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_TYPES:31]))  //job stages)
		READ WRITE:C146([TRANSACTION_TYPES:31])
		CREATE SET:C116([TRANSACTION_TYPES:31]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TRANSACTION_TYPES:31])>0)
				Are_You_Sure
				If (OK=1)
					
					If (OK=1)
						DELETE SELECTION:C66([TRANSACTION_TYPES:31])
					End if 
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
		READ ONLY:C145([TRANSACTION_TYPES:31])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[TYPES:5]))  //company and contact tyypes )
		READ WRITE:C146([TYPES:5])
		CREATE SET:C116([TYPES:5]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TYPES:5])>0)
				Are_You_Sure
				If (OK=1)
					
					If (OK=1)
						DELETE SELECTION:C66([TYPES:5])
					End if 
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TYPES:5])
		READ ONLY:C145([TYPES:5])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		
	: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))  //job stages)
		READ WRITE:C146([TYPES:5])
		CREATE SET:C116([TYPES:5]; "$Temp")
		USE SET:C118("ListboxSet0")
		OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_ObjectB2Left; $_l_ObjectB2Top; $_l_ObjectB2Right; $_l_ObjectB2Bottom)
		$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
		If ($_l_ModuleAccess>=2)
			If (Records in selection:C76([TYPES:5])>0)
				Are_You_Sure
				If (OK=1)
					
					If (OK=1)
						DELETE SELECTION:C66([TYPES:5])
					End if 
				End if 
			End if 
		End if 
		UNLOAD RECORD:C212([TYPES:5])
		READ ONLY:C145([TYPES:5])
		USE SET:C118("$temp")
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
End case 
ERR_MethodTrackerReturn("DB_DeleteFromSelection"; $_t_oldMethodName)