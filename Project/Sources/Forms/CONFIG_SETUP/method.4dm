If (False:C215)
	//Project Form Method Name:      CONFIG_SETUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2012 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Module_Nominal Ledgers)
	//ARRAY BOOLEAN(USER_lb_ConfigItems;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_setUpSection;0)
	//ARRAY LONGINT(DB_l_SetupPageNumber;0)
	//ARRAY LONGINT(DM_al_TableNumber;0)
	//ARRAY LONGINT(USER_al_ConfigGroupID;0)
	//ARRAY LONGINT(USER_al_MenuTabTable;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	//ARRAY TEXT(DM_at_TableName;0)
	//ARRAY TEXT(USER_at_ConfigGroups;0)
	//ARRAY TEXT(USER_at_MenuTab;0)
	C_BOOLEAN:C305(DB_bo_AutorelationsTemp; DB_bo_DisplaySelections; DB_bo_LicenceOverRidesSave; DB_bo_NoLoad; DB_bo_RecordsinNewProcess; DB_bo_TableNamesSave)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_Event; $_l_FieldNumber; $_l_TableNumber; USER_l_BUT1; USER_l_But2; USER_l_BUT3; USER_l_BUT4; USER_l_BUT5; USER_l_BUT6; USER_l_BUT7)
	C_LONGINT:C283(USER_l_BUT8; USER_l_BUT9)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_CurrentContext; DB_t_FormUsage; DB_t_FormUsage2; DM_T_UserCountry; USER_t_COL1; USER_t_COL2; USER_t_COL3; USER_t_COL4; USER_t_COL5)
	C_TEXT:C284(USER_t_COL6; USER_t_COL7; USER_t_COL8; USER_t_COL9; USER_t_HED1; USER_t_HED2; USER_t_HED3; USER_t_HED4; USER_t_HED5; USER_t_HED6; USER_t_HED7)
	C_TEXT:C284(USER_t_HED8; USER_t_HED9; USR_t_DefaultaddressFormat; USR_t_DefaultBillingRoles; USR_t_DefaultContactRole; USR_t_DefaultContactStatus; USR_t_DefaultSalesPerson; USR_t_DefaultStatus; USR_t_GotoSettings)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM CONFIG_SETUP"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		ARRAY LONGINT:C221(DB_l_SetupPageNumber; 0)
		ARRAY LONGINT:C221(DB_al_setUpSection; 0)
		//these arrays are so i can shif things arround without reprogramming everything
		APPEND TO ARRAY:C911(DB_l_SetupPageNumber; 1)
		APPEND TO ARRAY:C911(DB_al_setUpSection; 1)  //owner name and address and log
		
		APPEND TO ARRAY:C911(DB_l_SetupPageNumber; 2)
		APPEND TO ARRAY:C911(DB_al_SetupSection; 2)  // Licence details
		
		APPEND TO ARRAY:C911(DB_l_SetupPageNumber; 3)
		APPEND TO ARRAY:C911(DB_al_setUpSection; 3)  // Data Setup
		
		If (DB_al_SetupSection=0)
			DB_al_SetupSection:=1
		End if 
		
		
		ARRAY LONGINT:C221(DM_al_TableNumber; 0)
		ARRAY TEXT:C222(DM_at_TableName; 0)
		DB_bo_RecordsinNewProcess:=True:C214
		DB_bo_DisplaySelections:=False:C215
		DB_t_CurrentContext:=""
		READ WRITE:C146(*)
		ARRAY LONGINT:C221(DB_al_ContextTableNumber; 0)
		ARRAY POINTER:C280(DB_aptr_ContextPointers; 0)
		ARRAY LONGINT:C221(DB_al_ContextTableNumber; 0)
		ARRAY TEXT:C222(DB_at_ContextNames; 0)
		ARRAY TEXT:C222(DB_at_ContextUsage; 0)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
		
		
		If (<>SYS_l_LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
		End if 
		
		WS_AutoscreenSize(2; 490; 730)
		USR_t_DefaultSalesPerson:=""
		USR_t_DefaultStatus:=""
		USR_t_DefaultContactStatus:=""
		USR_t_DefaultContactRole:=""
		USR_t_DefaultaddressFormat:=""
		//Keep out of here -macros-record states-lists-further fields
		//p10 P13 not included P15 at the moement P16 P20 P21 P22 P23 P27
		//(aareas)
		//General setup-company name and address from user
		//contact & Companies
		// Security `from user password management setup and P1r email setup( P15)
		//sales Credit Control
		//sales orders-P5 setup
		//purchase setup(p6)
		
		//ledgers include p7
		//product management include P19
		//stock management-include P4 setup
		//time management incude P17 and 18
		//job Costing  include p9
		//service control` include p8
		//data entry control(user)-default to batch etc -P2 -some not applicable now
		//default behaviours(p3)
		//print managerment-p11 and 12 P28 P29 P30
		//data admin-P25 p26
		//Desinger only-P24
		//licence -from user version number and licence additions
		Case of 
			: (DB_al_SetupSection=1)  //General configuration
				
				DB_LoadConfigurationPrefs
				User_vAT(DM_T_UserCountry)
				
				ARRAY TEXT:C222(USER_at_ConfigGroups; 0)
				ARRAY LONGINT:C221(USER_al_ConfigGroupID; 0)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_OwnerDetails"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 1)
				//
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; "Volumes Access")
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 2)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; "Data Setup")
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 3)
				OBJECT SET VISIBLE:C603(*; "oNavigator3"; False:C215)
				FORM GOTO PAGE:C247(1)
				
			Else 
				ARRAY TEXT:C222(USER_at_ConfigGroups; 0)
				ARRAY LONGINT:C221(USER_al_ConfigGroupID; 0)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_OwnerDetails"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 1)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_ContactsCompanies"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 2)
				If (DB_GetModuleSettingByNUM(Module_SalesOrders)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_SalesOrderManagement"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 3)
				End if 
				If (DB_GetModuleSettingByNUM(Module_SalesLedger)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_SalesCreditControl"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 4)
				End if 
				If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_PurchaseOrderManagement"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 5)
				End if 
				
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_ProductsManagement"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 6)
				If (DB_GetModuleSettingByNUM(Module_StockControl)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_STOCKMANAGEMENT"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 7)
				End if 
				If (DB_GetModuleSettingByNUM(Module_DiaryManager)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_TimeManagement"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 8)
				End if 
				If (DB_GetModuleSettingByNUM(Module_JobCosting)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_JobCostings"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 9)
				End if 
				If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>0)
					
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_ServiceControl"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 10)
				End if 
				If (DB_GetModuleSettingByNUM(Module_Nominal Ledgers)>0)
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_Ledgers"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 11)
				End if 
				
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_DataEntryPrefs"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 12)
				
				
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_PrintoutManagement"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 13)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_Datamanager"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 14)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("MenuItem_SECURITY"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 15)
				APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers1(Lowercase:C14(Get localized string:C991("MenuItem_UpdateLicence"))))
				APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 16)
				FORM GOTO PAGE:C247(1)
				ARRAY TEXT:C222(USER_at_MenuTab; 0)
				ARRAY LONGINT:C221(USER_al_MenuTabTable; 0)
				APPEND TO ARRAY:C911(USER_at_MenuTab; "Owner Information")
				APPEND TO ARRAY:C911(USER_al_MenuTabTable; Table:C252(->[USER:15]))
				
				
		End case 
		
		
		LB_SetupListbox(->USER_lb_ConfigItems; "USER_t"; "USER_L"; 1; ->USER_at_ConfigGroups; ->USER_al_ConfigGroupID)
		LB_SetColumnHeaders(->USER_lb_ConfigItems; "USER_L"; 1; "Setup")
		LB_SetEnterable(->USER_lb_ConfigItems; False:C215; 0)
		LB_SetColumnWidths(->USER_lb_ConfigItems; "USER_t"; 1; 147; 0)
		LB_SetScroll(->USER_lb_ConfigItems; -2; -2)
		LB_StyleSettings(->USER_lb_ConfigItems; "Black"; 9; "USER_t"; ->[ACCOUNTS:32])
		//This form is going to be treated very like the standard output form-it contains elements of that-
		OBJECT SET VISIBLE:C603(*; "oCRM@"; False:C215)
		Case of 
			: (USR_t_GotoSettings="CRM")
				FORM GOTO PAGE:C247(2)  //this is the wrong page now
				
		End case 
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		
		
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_TableNumber=Table:C252(->[USER:15]))
			
			Case of 
				: ($_t_VariableName="DB_l_PrefGeneral")
					DB_LoadConfigurationPrefs
					User_vAT(DM_T_UserCountry)
					
					ARRAY TEXT:C222(USER_at_ConfigGroups; 0)
					ARRAY LONGINT:C221(USER_al_ConfigGroupID; 0)
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; Uppers2(Lowercase:C14(Get localized string:C991("DM_OwnerDetails"))))
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 1)
					//
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; "Volumes Access")
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 2)
					APPEND TO ARRAY:C911(USER_at_ConfigGroups; "Data Setup")
					APPEND TO ARRAY:C911(USER_al_ConfigGroupID; 3)
					OBJECT SET VISIBLE:C603(*; "oNavigator3"; False:C215)
					FORM GOTO PAGE:C247(1)
				: ($_l_FieldNumber=Field:C253(->[USER:15]Access Type:195))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Actual Layer:146))
				: ($_l_FieldNumber=Field:C253(->[USER:15]AD 1:34))
				: ($_l_FieldNumber=Field:C253(->[USER:15]AD 2:35))
				: ($_l_FieldNumber=Field:C253(->[USER:15]AD 3:36))
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Add1:2)) | ($_t_VariableName="DM_T_UserAddress1")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Add2:3)) | ($_t_VariableName="DM_T_UserAddress2")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Address Format:127))  //Default Address Format
					
					Check_MinorNC(->[USER:15]Address Format:127; ""; ->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Name:2; "FORMAT")
					USR_t_DefaultaddressFormat:=""
					If ([USER:15]Address Format:127="")
						[USER:15]Address Format:127:=Old:C35([USER:15]Address Format:127)
					End if 
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
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Alloc Move:110))
				: ($_l_FieldNumber=Field:C253(->[USER:15]autoshowQualities:250))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Bank Details:159))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Bank ExCh Acc:187))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Bank From:15))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Bank To:16))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Base Country:125))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Base Currency:120))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Batch Entry:114))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BS Profit Adj:225))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BS Profit BFWD:29))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BS Profit YTD:26))
				: ($_l_FieldNumber=Field:C253(->[USER:15]ButtGrey:128))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BW:32))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BWB Acc No:165))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BWB Doc No F:166))
				: ($_l_FieldNumber=Field:C253(->[USER:15]BWB Doc No T:167))
				: ($_l_FieldNumber=Field:C253(->[USER:15]CalenderColor:242))
				: ($_l_FieldNumber=Field:C253(->[USER:15]CalenderStyle:243))
				: ($_l_FieldNumber=Field:C253(->[USER:15]CalenderWeekStartDay:244))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Capitalisation:67))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Capitalise Town:77))
					
					If ([USER:15]Capitalise Town:77)
						If (USR_t_DefaultaddressFormat#"")
							USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "Town/City"; "TOWN/CITY")
						End if 
					Else 
						If (USR_t_DefaultaddressFormat#"")
							USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "TOWN/CITY"; "Town/City")
						End if 
					End if 
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cash From:17))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cash To:18))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Check Credit:147))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cash From:17))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Client Status:85))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Co Code Chars:88))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Comp User Chk:124))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cont DedupComp:192))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cont Del MC:160))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Cont DupCheck:189))
				: ($_l_FieldNumber=Field:C253(->[USER:15]ContCl Status:86))
				: ($_l_FieldNumber=Field:C253(->[USER:15]ContEnq Status:197))
				: ($_l_FieldNumber=Field:C253(->[USER:15]CopyPrevKpDate:170))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Country:7)) | ($_t_VariableName="DM_T_UserCountry")
				: ($_l_FieldNumber=Field:C253(->[USER:15]County:5)) | ($_t_VariableName="DM_T_UserCounty")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Credit Note Sep:118))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Data Size:105))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Data_ChangeLOG:234))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Date FirstRun:214))
				: ($_l_FieldNumber=Field:C253(->[USER:15]DATI_AdministratorID:246))
				: ($_l_FieldNumber=Field:C253(->[USER:15]DATI_ErrorActionCode:247))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Decimal Price:206))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Deep ModBar:100))  //not displayed
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Callback:84))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Cont Status:191))
					USR_t_DefaultContactStatus:=""
					Check_MinorNC(->[USER:15]Def Cont Status:191; "Status_"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "1")
					
					If ([USER:15]Def Cont Status:191="")
						[USER:15]Def Cont Status:191:=Old:C35([USER:15]Def Cont Status:191)
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
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Cred Stage:90))
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Purch Tax:131))
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Sales:83))
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Salutation:89))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def Source:78))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def VAT Code:91))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def_AccountJobRole:248))
					USR_t_DefaultBillingRoles:=""
					Check_MinorNC(->[USER:15]Def_AccountJobRole:248; ""; ->[ROLES:87]; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2; "Role")
					
					If ([USER:15]Def_AccountJobRole:248="")
						[USER:15]Default Role:41:=Old:C35([USER:15]Def_AccountJobRole:248)
					End if 
					If ([USER:15]Def_AccountJobRole:248#"")
						If ([ROLES:87]Role_Code:1#[USER:15]Def_AccountJobRole:248)
							QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Def_AccountJobRole:248)
						End if 
						If ([ROLES:87]Role_Name:2#"")
							USR_t_DefaultBillingRoles:=[ROLES:87]Role_Name:2
						Else 
							USR_t_DefaultBillingRoles:="Unknown Role"
						End if 
					End if 
				: ($_l_FieldNumber=Field:C253(->[USER:15]DEF_Copy_to_email:237))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Def_EmailAction:239))
				: ($_l_FieldNumber=Field:C253(->[USER:15]DEF_SMTP_HOST:236))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Default Role:41))
					USR_t_DefaultContactRole:=""
					Check_MinorNC(->[USER:15]Default Role:41; ""; ->[ROLES:87]; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2; "Role")
					
					If ([USER:15]Default Role:41="")
						[USER:15]Default Role:41:=Old:C35([USER:15]Default Role:41)
					End if 
					If ([USER:15]Default Role:41#"")
						If ([ROLES:87]Role_Code:1#[USER:15]Default Role:41)
							QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Default Role:41)
						End if 
						USR_t_DefaultContactRole:=[ROLES:87]Role_Name:2
					End if 
				: ($_l_FieldNumber=Field:C253(->[USER:15]Default Status:40))
					USR_t_DefaultStatus:=""
					Check_MinorNC(->[USER:15]Default Status:40; "Status_"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status"; "2")
					
					If ([USER:15]Default Status:40="")
						[USER:15]Default Status:40:=Old:C35([USER:15]Default Status:40)
					End if 
					If ([USER:15]Default Status:40#"")
						If ([STATUS:4]Status_Code:1#[USER:15]Default Status:40)
							QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=[USER:15]Default Status:40)
						End if 
						If ([STATUS:4]Status_Name:2#"")
							USR_t_DefaultStatus:=[STATUS:4]Status_Name:2
						Else 
							USR_t_DefaultStatus:="Unknown Status"
						End if 
					End if 
				: ($_l_FieldNumber=Field:C253(->[USER:15]Default Terms:113))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Default User:76))
					USR_t_DefaultSalesPerson:=""
					
					Check_MinorNC(->[USER:15]Default User:76; "Sales"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
					If ([USER:15]Default User:76="")
						[USER:15]Default User:76:=Old:C35([USER:15]Default User:76)
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
				: ($_l_FieldNumber=Field:C253(->[USER:15]Default_mail_signature:238))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Deposit Rec:60))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Deposit Trans:59))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Dial Prefix:143))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Dial Synch:141))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Diary Priority:68))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Diary_TimeCheck:161))
				: ($_l_FieldNumber=Field:C253(->[USER:15]DOWNLOADS:94))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Email From:232))
				: ($_l_FieldNumber=Field:C253(->[USER:15]enableCompanydataonPrivate:249))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Enquirer Status:196))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Entry Defaults:106))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Exch Contr Acc:186))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax:9)) | ($_t_VariableName="DM_T_UserFAX")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Best:218))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Cover Page:224))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Mode:215))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Retries:216))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Retry Secs:217))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Server Addr:223))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Server Name:220))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Server Type:221))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Server Zone:222))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Fax Single User:219))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Find Defaults:107))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Find My Data:155))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Force CredCheck:73))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Form 4DW:135))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Form Method:134))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Form Path:175))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Form Picture:119))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Form with Title:136))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Func Palette:162))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Gen Co Price Gr:157))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Invoice Trans:21))
				: ($_l_FieldNumber=Field:C253(->[USER:15]InvoiceP Trans:24))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Invoices Cancel:72))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Invoices NoPrin:132))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Invoices PayAft:133))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Invoices Unproc:71))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Last Version:92))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Layers AccSrc:151))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Letter Action:33))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Limit Date:58))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Mail Salutation:176))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Mailsort Serv:173))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Mailsort Size:171))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Mailsort UD:172))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Main or Remote:115))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Margin CP:177))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Message Action:174))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Module Icons:79))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Multi Co Cont:87))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Name:38)) | ($_t_VariableName="DM_T_AdminName")
					//TRACE
				: ($_l_FieldNumber=Field:C253(->[USER:15]NL LedgerBat:190))
				: ($_l_FieldNumber=Field:C253(->[USER:15]NL Rec Jour:163))
				: ($_l_FieldNumber=Field:C253(->[USER:15]NL Unproc:188))
				: ($_l_FieldNumber=Field:C253(->[USER:15]No Cont Titles:121))
				: ($_l_FieldNumber=Field:C253(->[USER:15]No Job Title:126))
				: ($_l_FieldNumber=Field:C253(->[USER:15]No Play:97))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Office Code:13))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Opening Balance:49))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Order Req:69))
				: ($_l_FieldNumber=Field:C253(->[USER:15]OrderI Part:229))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Orders DiscTran:204))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Orders QtyAlloc:156))
				: ($_l_FieldNumber=Field:C253(->[USER:15]OrdFormDelAdd:168))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Organisation:1))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Palette Delay:80))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Path Name:12))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PayRec Batch:213))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PayRec ByCo:205))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Physical Stock:109))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PL Analysis:227))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PO ShowDisc:207))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PO Their Code:152))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Postcode:6)) | ($_t_VariableName="DM_T_UserPostCode")
				: ($_l_FieldNumber=Field:C253(->[USER:15]PrePay Rec:62))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PrePay Trans:61))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Printing Font:102))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Prod Func Ord:122))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Prod FurtherSrc:226))
				: ($_l_FieldNumber=Field:C253(->[USER:15]ProdGroupBrand:140))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Purch PayCheq:149))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Purch PayRem:148))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Purch Price2:153))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Purch Trans:27))
				: ($_l_FieldNumber=Field:C253(->[USER:15]PurchP Trans:28))
				: ($_l_FieldNumber=Field:C253(->[USER:15]QA Abbrev:183))
				: ($_l_FieldNumber=Field:C253(->[USER:15]QA Commas:182))
				: ($_l_FieldNumber=Field:C253(->[USER:15]QA Optional:184))
				: ($_l_FieldNumber=Field:C253(->[USER:15]QA Path Name:181))
				: ($_l_FieldNumber=Field:C253(->[USER:15]QA Uppers:185))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Qtn Action:39))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Rem AllComp:108))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote Begin:96))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote Launch:95))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote NewMod:112))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote NotProd:116))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote Over:81))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Remote ShowData:111))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Repeat Delay:74))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Response Hrs:45))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Sales Alloc:42))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Sales HdrDesPr:178))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Sales ItemDesPr:179))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Sales Ordering:82))
				: ($_l_FieldNumber=Field:C253(->[USER:15]ScreenSaverMin:210))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Sel_Or:93))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Service ShowCon:144))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Show ModBar:99))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Show Pics:30))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SinglePWsystem:235))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SL New Date:154))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SM_SetNames:240))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SMS_Active:241))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SMTP Address:233))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SScreen_Name:31))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Stand Marg Act:130))
				: ($_l_FieldNumber=Field:C253(->[USER:15]State Anal:98))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Stock Alloc:43))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Stock Analysis:193))
				: ($_l_FieldNumber=Field:C253(->[USER:15]StockOrderCo:37))
				: ($_l_FieldNumber=Field:C253(->[USER:15]StockPostAuto:158))
				: ($_l_FieldNumber=Field:C253(->[USER:15]StockPostInv:137))
				: ($_l_FieldNumber=Field:C253(->[USER:15]StockPostItem:139))
				: ($_l_FieldNumber=Field:C253(->[USER:15]StockPostOrd:138))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Super Report:142))
				: ($_l_FieldNumber=Field:C253(->[USER:15]SuperDiaryActive:245))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tech Code:46))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tech LabAct:48))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tech LabProd:47))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tech Order:44))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tel IPActual:209))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tel PCPath:208))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Telephone:8)) | ($_t_VariableName="DM_T_UserTelephone")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Telex:10))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Term Code:129))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Text Size:104))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Time Action:66))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Time Day:198))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Time Day Start:199))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Time Unit:64))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Time Year:65))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitAdd:53))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitAuth:57))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitDepCo:50))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitDepCoP:51))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitDepCoS:52))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Title LRC:117))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Title Size:103))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitPay:54))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitPayB:55))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TitReg:56))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Top ModBar:101))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Town:4)) | ($_t_VariableName="DM_T_UserTown")
				: ($_l_FieldNumber=Field:C253(->[USER:15]TransIn Calc:145))
				: ($_l_FieldNumber=Field:C253(->[USER:15]TScreen_Title:25)) | ($_t_VariableName="DM_t_UserScreenTitle")
				: ($_l_FieldNumber=Field:C253(->[USER:15]Tutorial Data:228))
				: ($_l_FieldNumber=Field:C253(->[USER:15]User Additions:164))
				: ($_l_FieldNumber=Field:C253(->[USER:15]User_Processes:63))
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT Cash:212))
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT CashAcc:211))
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT EC Creditor:75))
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT Input:19))
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT Output:20))
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT Prefix:70)) | ($_t_VariableName="DM_T_UservatPrefix")
					
				: ($_l_FieldNumber=Field:C253(->[USER:15]VAT Reg No:11)) | ($_t_VariableName="DM_T_Uservat")
				: ($_l_FieldNumber=Field:C253(->[USER:15]View Lists:150))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Waiting Proc:194))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Wild Card:123))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Window x:230))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Window y:231))
				: ($_l_FieldNumber=Field:C253(->[USER:15]WIP CI Trans:201))
				: ($_l_FieldNumber=Field:C253(->[USER:15]WIP CIWO Trans:203))
				: ($_l_FieldNumber=Field:C253(->[USER:15]WIP TR Trans:200))
				: ($_l_FieldNumber=Field:C253(->[USER:15]WIP TRWO Trans:202))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Word Processor:14))
				: ($_l_FieldNumber=Field:C253(->[USER:15]XdataOwnerID:251))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Year PeriodF:22))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Year PeriodT:23))
				: ($_l_FieldNumber=Field:C253(->[USER:15]Zero Invoices:169))
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("FM CONFIG_SETUP"; $_t_oldMethodName)
