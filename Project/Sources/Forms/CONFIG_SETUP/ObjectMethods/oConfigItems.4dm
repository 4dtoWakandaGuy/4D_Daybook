If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oConfigItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 01:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DM_abo_DisableModule;0)
	//ARRAY BOOLEAN(DM_abo_ModuleDisabled;0)
	//ARRAY BOOLEAN(DM_LB_DataSetup;0)
	//ARRAY BOOLEAN(DM_LB_Volumes;0)
	//ARRAY INTEGER(<>Mod_l_MaxModules;0)
	//ARRAY INTEGER(DB_aI_aMod;0)
	ARRAY LONGINT:C221($_al_includeTableNum; 0)
	//ARRAY LONGINT(DB_al_TableNums;0)
	//ARRAY LONGINT(DM_al_MaxUsers;0)
	//ARRAY LONGINT(DM_al_ModuleNUM;0)
	//ARRAY LONGINT(DM_al_ModuleNumbers;0)
	//ARRAY LONGINT(DM_al_TableNumber;0)
	//ARRAY LONGINT(USER_al_ConfigGroupID;0)
	//ARRAY LONGINT(USER_al_FormPage;0)
	//ARRAY LONGINT(USER_al_MenuTabTable;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(DB_at_RecordCount;0)
	//ARRAY TEXT(DB_at_TableGroups;0)
	//ARRAY TEXT(DB_at_TableNames;0)
	//ARRAY TEXT(DB_at_UserTableNames;0)
	//ARRAY TEXT(DM_at_ModuleNames;0)
	//ARRAY TEXT(DM_at_TableName;0)
	//ARRAY TEXT(USER_at_MenuTab;0)
	C_BOOLEAN:C305($_bo_All; $_bo_Continue; $_bo_Include; $_bo_Invisible)
	C_DATE:C307(DM_d_LicenceExpiryDate)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Index; $_l_Index2; $_l_LastTableNum; $_l_ModulePosition; $_l_Option; $_l_Row; $_l_TableNumPosition; DM_l_MaxUsers; DM_l_MaxWPUsers)
	C_LONGINT:C283(LIC_l_BUT1; LIC_l_But2; LIC_l_BUT3; LIC_l_BUT4; LIC_l_BUT5; LIC_l_BUT6; LIC_l_BUT7; LIC_l_BUT8; LIC_l_BUT9; UTB_l_BUT1; UTB_l_But2)
	C_LONGINT:C283(UTB_l_BUT3; UTB_l_BUT4; UTB_l_BUT5; UTB_l_BUT6; UTB_l_BUT7; UTB_l_BUT8; UTB_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; $_t_VolumeName; DM_T_UserAddress1; DM_T_UserName; DM_T_UserTown; DM_t_VersionMAJ; LIC_t_COL1; LIC_t_COL2; LIC_t_COL3; LIC_t_COL4; LIC_t_COL5)
	C_TEXT:C284(LIC_t_COL6; LIC_t_COL7; LIC_t_COL8; LIC_t_COL9; LIC_t_HED1; LIC_t_HED2; LIC_t_HED3; LIC_t_HED4; LIC_t_HED5; LIC_t_HED6; LIC_t_HED7)
	C_TEXT:C284(LIC_t_HED8; LIC_t_HED9; USR_t_DefaultaddressFormat; USR_t_DefaultBillingRoles; USR_t_DefaultContactRole; USR_t_DefaultContactStatus; USR_t_DefaultSalesPerson; USR_t_DefaultStatus; UTB_t_COL1; UTB_t_COL2; UTB_t_COL3)
	C_TEXT:C284(UTB_t_COL4; UTB_t_COL5; UTB_t_COL6; UTB_t_COL7; UTB_t_COL8; UTB_t_COL9; UTB_t_HED1; UTB_t_HED2; UTB_t_HED3; UTB_t_HED4; UTB_t_HED5)
	C_TEXT:C284(UTB_t_HED6; UTB_t_HED7; UTB_t_HED8; UTB_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oConfigItems"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(*; "oConfigItems"; $_l_Column; $_l_Row)
		$_l_Option:=USER_al_ConfigGroupID{$_l_Row}
		Case of 
			: ($_l_Option=1)
				FORM GOTO PAGE:C247(1)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				
			: ($_l_Option=2)
				If (DM_T_UserName#"") & (DM_T_UserAddress1#"") & (DM_T_UserTown#"")
					
					FORM GOTO PAGE:C247(2)
					OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oNavigator3"; False:C215)
					DM_t_VersionMAJ:=VER_GetVersion
					LR_Custom
					DM_d_LicenceExpiryDate:=DB_GetLicenceExpiryDate
					DM_l_MaxUsers:=DB_GetLicenceMaxUsers
					DM_l_MaxWPUsers:=DB_GetLicenceMaxUsers("WP")
					DB_LoadLicenceOverridesPrefs
					ARRAY INTEGER:C220(DB_aI_aMod; <>Mod_l_MaxModules)
					ARRAY LONGINT:C221(MOD_aI_ModuleShowIcon; <>Mod_l_MaxModules)
					ARRAY LONGINT:C221(DB_al_ModuleShowText; <>Mod_l_MaxModules)
					ARRAY LONGINT:C221(DB_aI_ModuleExecuteStartup; <>Mod_l_MaxModules)
					DB_GetLicencedModuleSettings(->DB_aI_aMod)
					//DM_t_VersionMIN:=VER_GetVersion
					Modules_Array
					ARRAY TEXT:C222(DM_at_ModuleNames; 0)
					ARRAY LONGINT:C221(DM_al_ModuleNUM; 0)
					ARRAY BOOLEAN:C223(DM_abo_ModuleDisabled; 0)
					ARRAY LONGINT:C221(DM_al_MaxUsers; 0)
					For ($_l_Index; 1; Size of array:C274(<>Mod_at_ModuleName))
						If (<>Mod_at_ModuleName{$_l_Index}#"Macintosh@") & (<>Mod_at_ModuleName{$_l_Index}#"Windows@") & (<>Mod_at_ModuleName{$_l_Index}#"International@")
							
							If (DB_aI_aMod{$_l_Index}>0)
								APPEND TO ARRAY:C911(DM_at_ModuleNames; <>Mod_at_ModuleName{$_l_Index})
								APPEND TO ARRAY:C911(DM_al_ModuleNUM; $_l_Index)
								APPEND TO ARRAY:C911(DM_abo_ModuleDisabled; False:C215)
								If (<>Mod_at_ModuleName{$_l_Index}#"Word@")
									APPEND TO ARRAY:C911(DM_al_MaxUsers; DM_l_MaxUsers)
								Else 
									APPEND TO ARRAY:C911(DM_al_MaxUsers; DM_l_MaxWPUsers)
								End if 
								$_l_ModulePosition:=Find in array:C230(DM_al_ModuleNumbers; $_l_Index)
								If ($_l_ModulePosition>0)
									DM_abo_ModuleDisabled{Size of array:C274(DM_abo_ModuleDisabled)}:=DM_abo_DisableModule{$_l_ModulePosition}
								End if 
								
							End if 
						End if 
					End for 
					
					
					LB_SetupListbox(->DM_LB_Volumes; "LIC_t"; "LIC_L"; 1; ->DM_abo_ModuleDisabled; ->DM_at_ModuleNames; ->DM_al_MaxUsers; ->DM_al_ModuleNUM)
					
					LB_SetColumnHeaders(->DM_LB_Volumes; "LIC_L"; 1; "Disabled"; "Volume Name"; "Max Users"; "")
					LB_SetEnterable(->DM_LB_Volumes; False:C215; 0)
					LB_SetEnterable(->DM_LB_Volumes; True:C214; 1)
					LB_SetColumnWidths(->DM_LB_Volumes; "LIC_t"; 1; 47; 147; 47; 0)
					LB_SetScroll(->DM_LB_Volumes; -2; -2)
					LB_StyleSettings(->DM_LB_Volumes; "Black"; 9; "LIC_t"; ->[ACCOUNTS:32])
				Else 
					Gen_Alert("To view Licencing you must set a company name and address")
					LISTBOX SELECT ROW:C912(*; "oConfigItems"; 1)
					
				End if 
				
			: ($_l_Option=3)
				FORM GOTO PAGE:C247(3)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oNavigator3"; False:C215)
				DB_LoadUserTableNames
				ARRAY INTEGER:C220(DB_aI_aMod; 0)
				DB_GetLicencedModuleSettings(->DB_aI_aMod)
				
				Modules_Array
				$_l_LastTableNum:=Get last table number:C254
				ARRAY TEXT:C222(DB_at_TableGroups; 0)
				
				ARRAY TEXT:C222(DB_at_TableNames; 0)
				ARRAY TEXT:C222(DB_at_UserTableNames; 0)
				ARRAY LONGINT:C221(DB_al_TableNums; 0)
				ARRAY TEXT:C222(DB_at_RecordCount; 0)  // Note text
				For ($_l_Index2; 1; (Size of array:C274(DB_aI_aMod)))
					If ($_l_Index2<Size of array:C274(DB_aI_aMod))
						$_bo_Continue:=(DB_aI_aMod{$_l_Index2}>0)
					Else 
						$_bo_Continue:=True:C214
					End if 
					If ($_bo_Continue)
						If ($_l_Index2<Size of array:C274(DB_aI_aMod))
							$_t_VolumeName:=<>Mod_at_ModuleName{$_l_Index2}
						Else 
							$_t_VolumeName:="Others..."
						End if 
						$_bo_All:=False:C215
						ARRAY LONGINT:C221($_al_includeTableNum; 0)
						Case of 
							: ($_t_VolumeName="Diary Manager")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[DIARY:12]))
							: ($_t_VolumeName="Word Processing")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[DOCUMENTS:7]))
							: ($_t_VolumeName="Sales Ledger")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[INVOICES:39]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[INVOICES_ITEMS:161]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[INVOICES_ALLOCATIONS:162]))
							: ($_t_VolumeName="Purchase Ledger")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PURCHASE_INVOICES:37]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PURCHASE_INVOICES:37]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
							: ($_t_VolumeName="General Ledger")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TRANSACTION_BATCHES:30]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TRANSACTIONS:29]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ACCOUNTS:32]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PERIODS:33]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ACCOUNT_BALANCES:34]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TRANSACTION_TYPES:31]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[RECURRING_JOURNALS:38]))
							: ($_t_VolumeName="Stock Control")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[STOCK_MOVEMENTS:40]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CURRENT_STOCK:62]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[STOCK_LEVELS:58]))
								
							: ($_t_VolumeName="Service Centre")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[SERVICE_CALLS:20]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CONTRACTS:17]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CONTRACT_TYPES:19]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PROBLEMS:22]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[SOLUTIONS:23]))
							: ($_t_VolumeName="Job Costing")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[JOBS:26]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PROJECTS:89]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[STAGES:45]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[JOB_STAGES:47]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[JOB PERSONNEL:48]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TIME_BUDGETS:49]))
							: ($_t_VolumeName="Fax Manager")
							: ($_t_VolumeName="Enquiries") | ($_t_VolumeName="Sales Manager") | ($_t_VolumeName="Sales Orders")
								$_t_VolumeName:="Sales Orders"
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ORDERS:24]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ORDER_ITEMS:25]))
								
							: ($_t_VolumeName="Campaign Manager")
								
							: ($_t_VolumeName="Assemblies")
								
								
							: ($_t_VolumeName="Purchase Orders")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PURCHASE_ORDERS:57]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
								
							: ($_t_VolumeName="Ad Booking")
							: ($_t_VolumeName="Multi-Currency")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CURRENCY_RATES:72]))
								
								
							: ($_t_VolumeName="Sequences")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[WORKFLOW_CONTROL:51]))
								
							: ($_t_VolumeName="Price Table")
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PRICE_TABLE:28]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PRICE_GROUPS:18]))
							: ($_t_VolumeName="Serial Nos")
								
							: ($_t_VolumeName="Cheque Writer")
								
								
							: ($_t_VolumeName="Multi-Layer")
							: ($_t_VolumeName="Macros") | ($_t_VolumeName="Data Manager")
								$_t_VolumeName:="Data Manager"
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TAX_CODES:35]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[AREAS:3]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[STATUS:4]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TYPES:5]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[SOURCES:6]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PRODUCT_BRANDS:8]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PRODUCT_GROUPS:10]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PERSONNEL:11]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ACTIONS:13]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[RESULTS:14]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[IDENTIFIERS:16]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ANALYSES:36]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[TIME_BILLING_CATEGORIES:46]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[POSTAL_CODES:50]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[PUBLICATIONS:52]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CREDIT_STAGES:54]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
								APPEND TO ARRAY:C911($_al_includeTableNum; Table:C252(->[CUSTOM_FIELDS:98]))
							: ($_t_VolumeName="Subscriptions")
							Else 
								If ($_l_Index2=(Size of array:C274(DB_aI_aMod)+1))
									$_bo_All:=True:C214
								End if 
						End case 
						If (Size of array:C274($_al_includeTableNum)>0)
							If ($_bo_All)
								APPEND TO ARRAY:C911(DB_at_TableGroups; "Remainders")
								APPEND TO ARRAY:C911(DB_at_TableNames; "")
								APPEND TO ARRAY:C911(DB_at_UserTableNames; "")
								APPEND TO ARRAY:C911(DB_al_TableNums; -1)
								APPEND TO ARRAY:C911(DB_at_RecordCount; 0)
								//DB_al_RecordCount:
							Else 
								APPEND TO ARRAY:C911(DB_at_TableGroups; $_t_VolumeName)
								APPEND TO ARRAY:C911(DB_at_TableNames; "")
								APPEND TO ARRAY:C911(DB_at_UserTableNames; "")
								APPEND TO ARRAY:C911(DB_al_TableNums; -1)
								APPEND TO ARRAY:C911(DB_at_RecordCount; "")
							End if 
							For ($_l_Index; 1; $_l_LastTableNum)
								If (Not:C34($_bo_All))
									$_bo_Include:=(Find in array:C230($_al_includeTableNum; $_l_Index)>0)
								Else 
									$_bo_Include:=True:C214
								End if 
								If ($_bo_Include)
									If (Is table number valid:C999($_l_Index))
										GET TABLE PROPERTIES:C687($_l_Index; $_bo_Invisible)
										If (Table name:C256($_l_Index)#"x@") & (Not:C34($_bo_Invisible))
											
											$_l_TableNumPosition:=Find in array:C230(DB_al_TableNums; $_l_Index)
											If ($_l_TableNumPosition<0)
												APPEND TO ARRAY:C911(DB_at_TableGroups; "")
												APPEND TO ARRAY:C911(DB_at_TableNames; Table name:C256($_l_Index))
												APPEND TO ARRAY:C911(DB_at_UserTableNames; Table name:C256($_l_Index))
												$_l_TableNumPosition:=Find in array:C230(DM_al_TableNumber; $_l_Index)
												If ($_l_TableNumPosition>0)
													DB_at_UserTableNames{Size of array:C274(DB_at_UserTableNames)}:=DM_at_TableName{$_l_TableNumPosition}
												End if 
												APPEND TO ARRAY:C911(DB_al_TableNums; $_l_Index)
												APPEND TO ARRAY:C911(DB_at_RecordCount; String:C10(Records in table:C83(Table:C252($_l_Index)->)))
												
											End if 
										End if 
									End if 
								End if 
							End for 
						End if 
					End if 
				End for 
				
				
				LB_SetupListbox(->DM_LB_DataSetup; "UTB_t"; "UTB_L"; 1; ->DB_at_TableGroups; ->DB_at_TableNames; ->DB_at_UserTableNames; ->DB_at_RecordCount; ->DB_al_TableNums)
				
				
				LB_SetColumnHeaders(->DM_LB_DataSetup; "UTB_L"; 1; "Volume"; "Table Name"; "Displayed as"; "Records in Table"; "Table Number")
				LB_SetEnterable(->DM_LB_DataSetup; False:C215; 0)
				LB_SetEnterable(->DM_LB_DataSetup; True:C214; 3)
				LB_SetColumnWidths(->DM_LB_DataSetup; "UTB_t"; 1; 147; 147; 147; 47; 47)
				LB_SetScroll(->DM_LB_DataSetup; -2; -2)
				LB_StyleSettings(->DM_LB_DataSetup; "Black"; 9; "UTB_t"; ->[ACCOUNTS:32])
				
				
			: ($_l_Option=99)  //Contacts and companies setup
				//add in CRM Reports-company printout etc
				ARRAY TEXT:C222(USER_at_MenuTab; 0)
				ARRAY LONGINT:C221(USER_al_MenuTabTable; 0)
				ARRAY LONGINT:C221(USER_al_FormPage; 0)
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Areas"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[AREAS:3]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 2)
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Postcodes"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[POSTAL_CODES:50]))
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Countries"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[COUNTRIES:73]))
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_AddressFormats"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[ADDRESS_FORMATS:74]))
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Status"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[STATUS:4]))
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Types"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[TYPES:5]))
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Sources"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[SOURCES:6]))
				
				If ((DB_GetModuleSettingByNUM(14)<2) & (DB_GetModuleSettingByNUM(Module_SalesManager)<2))
				Else 
					APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Publications"))
					APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[PUBLICATIONS:52]))
				End if 
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Roles"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[ROLES:87]))
				APPEND TO ARRAY:C911(USER_at_MenuTab; "CRM Reports Setup")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[DOCUMENTS:7]))
				APPEND TO ARRAY:C911(USER_at_MenuTab; "CRM Data Preferences")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[USER:15]))
				USER_at_MenuTab:=Size of array:C274(USER_at_MenuTab)
				If ([USER:15]Address Format:127#"")
					If ([ADDRESS_FORMATS:74]Format_Code:1#[USER:15]Address Format:127)
						QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=[USER:15]Address Format:127)
					End if 
					USR_t_DefaultaddressFormat:=[ADDRESS_FORMATS:74]Address_Text:9
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "1"; "Address line 1")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "2"; "Address line 2")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "3"; "Town/City")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "5"; "Zip/Postal")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "4"; "State/Region/County")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "6"; "Country")
					If ([USER:15]Capitalise Town:77)
						USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "Town/City"; "TOWN/CITY")
					Else 
						USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "TOWN/CITY"; "Town/City")
					End if 
					
				End if 
				If ([USER:15]Def Cont Status:191#"")
					If ([STATUS:4]Status_Code:1#[USER:15]Def Cont Status:191)
						QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=[USER:15]Def Cont Status:191)
					End if 
					If ([STATUS:4]Status_Name:2#"")
						
						USR_t_DefaultContactStatus:=[STATUS:4]Status_Name:2
					Else 
						USR_t_DefaultContactStatus:="Unknown Status"
					End if 
				End if 
				If ([USER:15]Default User:76#"")
					If ([PERSONNEL:11]Initials:1#[USER:15]Default User:76)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[USER:15]Default User:76)
					End if 
					If ([PERSONNEL:11]Name:2#"")
						USR_t_DefaultSalesPerson:=[PERSONNEL:11]Name:2
					Else 
						USR_t_DefaultSalesPerson:="Unknown Person"
					End if 
				End if 
				If ([USER:15]Default Status:40#"")
					If ([STATUS:4]Status_Code:1#[USER:15]Default Status:40)
						QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=[USER:15]Default Status:40)
					End if 
					If ([STATUS:4]Status_Name:2#"")
						USR_t_DefaultStatus:=[STATUS:4]Status_Name:2
					Else 
						USR_t_DefaultStatus:="Unknown status name"
					End if 
				End if 
				If ([USER:15]Default Role:41#"")
					If ([ROLES:87]Role_Code:1#[USER:15]Default Role:41)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Default Role:41)
					End if 
					If ([ROLES:87]Role_Name:2#"")
						USR_t_DefaultContactRole:=[ROLES:87]Role_Name:2
					Else 
						USR_t_DefaultContactRole:="Unknown role name"
					End if 
				End if 
				If ([USER:15]Def_AccountJobRole:248#"")
					If ([ROLES:87]Role_Code:1#[USER:15]Def_AccountJobRole:248)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Def_AccountJobRole:248)
					End if 
					If ([ROLES:87]Role_Name:2#"")
						USR_t_DefaultBillingRoles:=[ROLES:87]Role_Name:2
					Else 
						USR_t_DefaultBillingRoles:="Unknown role name"
					End if 
				End if 
				
				//OBJECT SET VISIBLE(LB_RecordsSelection;False)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCRM@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "OSOM@"; False:C215)
				FORM GOTO PAGE:C247(2)
				
			: ($_l_Option=3)  //Sales order management
				//price groups
				// sales payement terms
				// credit stages
				//`sales reports
				//status
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; Get localized string:C991("MenuItem_Areas"))
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[AREAS:3]))
				
				
				
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				FORM GOTO PAGE:C247(3)
				ARRAY TEXT:C222(USER_at_MenuTab; 0)
				ARRAY LONGINT:C221(USER_al_MenuTabTable; 0)
				ARRAY LONGINT:C221(USER_al_FormPage; 0)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Product Collections")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[CATALOGUE:108]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 3)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Price Matrix")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[PRICE_TABLE:28]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 3)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Price Matrix Groups")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[PRICE_GROUPS:18]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 3)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Currencies")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[CURRENCIES:71]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 3)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Order Entry Settings")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[USER:15]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 4)
				
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Product and Invoice Management")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[USER:15]))
				APPEND TO ARRAY:C911(USER_al_FormPage; 3)
				USER_at_MenuTab:=Size of array:C274(USER_at_MenuTab)
			: ($_l_Option=4)  //Purchase order managemen...more
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				
				FORM GOTO PAGE:C247(5)
				OBJECT SET VISIBLE:C603(*; "OSOM@"; True:C214)
			: ($_l_Option=5)
				
			Else 
				FORM GOTO PAGE:C247(2)
				OBJECT SET VISIBLE:C603(*; "oCRM@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OSOM@"; False:C215)
		End case 
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oConfigItems"; $_t_oldMethodName)
