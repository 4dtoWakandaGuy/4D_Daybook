//%attributes = {}

If (False:C215)
	//Project Method Name:      DBI_DisplayRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN(CUR_CompanyTypes)
	//C_UNKNOWN(vD)
	//C_UNKNOWN(vFromIn)
	//C_UNKNOWN(vJ)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoWindow; $_bo_OK; $_bo_RecallInNewProcess; COM_bo_TypesInited; DB_bo_hasScrollBars; DB_bo_InRecord; DB_bo_RefreshScreen; LBI_bo_RowDragged; vFromIn; $_bo_Continue)
	C_BOOLEAN:C305($_bo_InRecord; $_bo_NoWindow; $_bo_OK; $_bo_RecallInNewProcess; COM_bo_TypesInited; DB_bo_hasScrollBars; DB_bo_InRecord; DB_bo_RefreshScreen; LBI_bo_RowDragged)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DisplayRecordProcess; $_l_ModuleAccess; $_l_Process; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; $2; COM_l_Callback)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; MOD_l_CurrentModuleAccess; PER_l_Context; vD; vJ; <>PER_l_CurrentUserID; $_l_DisplayRecordProcess; $_l_ModuleAccess; $_l_Process; $_l_WindowBottomOLD; $_l_WindowLeftOLD)
	C_LONGINT:C283($_l_WindowRightOLD; $_l_WindowTopOLD; COM_l_Callback; DB_l_CurrentDisplayedForm; MOD_l_CurrentModuleAccess; PER_l_Context)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_CurrentInputForm; $_t_CurrentOutputForm; $_t_oldMethodName; $_t_ProcessName; $_t_TableName; $_t_WindowName; $_t_WindowReference; $_t_WindowTitle; $3; $4; $5)
	C_TEXT:C284(COM_t_COntext; CUR_CompanyTypes; PROD_t_FormName; PROD_t_FunctionName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; $_t_CurrentInputForm; $_t_CurrentOutputForm; $_t_oldMethodName; $_t_ProcessName; $_t_TableName)
	C_TEXT:C284($_t_WindowName; $_t_WindowReference; $_t_WindowTitle; COM_t_COntext; PROD_t_FormName; PROD_t_FunctionName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBI_DisplayRecord")

//Note that some functions to 'open a record' call DB_menuDisplayRecords which will cause the record to open in a list if that is the preference. A direct call to here will ALWAYS open the input form
$_t_oldMethodName:=ERR_MethodTracker("DBI_DisplayRecord")
$_bo_NoWindow:=False:C215
$_bo_RecallInNewProcess:=False:C215
$_l_Process:=Abs:C99($1)
If ($_l_Process#Current process:C322)
	Start_Process
Else 
	If (Count parameters:C259<4)
		If (DB_l_CurrentDisplayedForm>0) & ($1#0)
			//$_bo_RecallInNewProcess:=True
		End if 
	Else 
		If (DB_l_CurrentDisplayedForm>0) & ($1#0) & ($4#"")
			$_bo_RecallInNewProcess:=True:C214
		End if 
	End if 
	If ($1>0)
		$_bo_NoWindow:=True:C214
		GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
	End if 
End if 

$_t_CurrentInputForm:=WIN_t_CurrentInputForm
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
If ($_bo_RecallInNewProcess)
	
	$_t_TableName:=Table name:C256($2)
	$_t_ProcessName:="View "+$_t_TableName
	Case of 
		: (Count parameters:C259=2)
			
			$_l_DisplayRecordProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Company"; $1; $2)
		: (Count parameters:C259=3)
			$_l_DisplayRecordProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Company"; $1; $2; $3)
		: (Count parameters:C259=4)
			$_l_DisplayRecordProcess:=New process:C317("DBI_DisplayRecord"; 256000; "View Company"; $1; $2; $3; $4)
	End case 
Else 
	
	$_bo_Continue:=True:C214
	
	$_ptr_Table:=Table:C252($2)
	vFromIn:=False:C215
	Case of 
		: ($2=Table:C252(->[ACCOUNT_BALANCES:34]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([ACCOUNT_BALANCES:34]; "AccBal_in")
			WIN_t_CurrentInputForm:="AccBal_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the General Ledger Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ACCOUNT_BALANCES:34])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccountBalance")
			If (Count parameters:C259>=4)
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ACCOUNT_BALANCES:34]Account_Code:2
			
		: ($2=Table:C252(->[ACCOUNTS:32]))  //Accounts_Mod
			
			FORM SET INPUT:C55([ACCOUNTS:32]; "Accounts_in")
			WIN_t_CurrentInputForm:="Accounts_in"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ACCOUNTS:32])
				End if 
				
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Account")
			If (Count parameters:C259>=4)
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ACCOUNTS:32]Account_Code:2
		: ($2=Table:C252(->[ACTIONS:13]))  //based on AccBal Bal
			
			SD2_LoadTemplateActions
			ARRAY TEXT:C222(SD_at_actionAdd; 0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
			SD2_LoadResults
			
			FORM SET INPUT:C55([ACTIONS:13]; "Action_In")
			WIN_t_CurrentInputForm:="Action_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ACTIONS:13])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Action")
			If (Count parameters:C259>=4)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ACTIONS:13]Action_Name:2
		: ($2=Table:C252(->[ADDRESS_FORMATS:74]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([ADDRESS_FORMATS:74]; "Types_In")
			WIN_t_CurrentInputForm:="Types_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ADDRESS_FORMATS:74])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AddressFormat")
			If (Count parameters:C259>=4)
				QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ADDRESS_FORMATS:74]Format_Name:2
		: ($2=Table:C252(->[ANALYSES:36]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([ANALYSES:36]; "Analysis_In")
			WIN_t_CurrentInputForm:="Analysis_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ANALYSES:36])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_ViewAnalyses")+" "+Get localized string:C991("MenuItem_Analyses")
			If (Count parameters:C259>=4)
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ANALYSES:36]Analysis_Name:2
			
			
		: ($2=Table:C252(->[AREAS:3]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([AREAS:3]; "Area_in")
			WIN_t_CurrentInputForm:="Area_in"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([AREAS:3])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Area")+" "+[AREAS:3]Area_Name:2
			
		: ($2=Table:C252(->[PRODUCT_BRANDS:8]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PRODUCT_BRANDS:8]; "Brands_In")
			WIN_t_CurrentInputForm:="Brands_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PRODUCT_BRANDS:8])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=$4)
			End if 
			
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Brand")+" "+[PRODUCT_BRANDS:8]Brand_Name:2
			
		: ($2=Table:C252(->[CATALOGUE:108]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([CATALOGUE:108]; "Catalogue_Input")
			WIN_t_CurrentInputForm:="Catalogue_Input"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CATALOGUE:108])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				If ([CATALOGUE:108]x_ID:1#Num:C11($4))
					QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=String:C10($4))
				End if 
			End if 
			
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Catalogue")+" "+[CATALOGUE:108]Catalogue_Name:2
		: ($2=Table:C252(->[COUNTRIES:73]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([COUNTRIES:73]; "Country_In")
			WIN_t_CurrentInputForm:="Country_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([COUNTRIES:73])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				If ($4#"")
					If ([COUNTRIES:73]COUNTRY_CODE:1#$4)
						QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$4)
					Else 
						LOAD RECORD:C52([COUNTRIES:73])
					End if 
				End if 
			End if 
			
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Country")+" "+[COUNTRIES:73]COUNTRY_CODE:1
			
		: ($2=Table:C252(->[CONTRACT_TYPES:19]))
			
			FORM SET INPUT:C55([CONTRACT_TYPES:19]; "ContractType_In")
			WIN_t_CurrentInputForm:="ContractType_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CONTRACT_TYPES:19])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_ContractTypes")+" "+[CONTRACT_TYPES:19]Contract_Type_Name:2
			
		: ($2=Table:C252(->[CONTRACTS:17]))
			
			FORM SET INPUT:C55([CONTRACTS:17]; "Contract_in")
			WIN_t_CurrentInputForm:="Contract_in"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Service Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CONTRACTS:17])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contract")+" "+[CONTRACTS:17]Contract_Code:3
			
			
		: ($2=Table:C252(->[CREDIT_STAGES:54]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([CREDIT_STAGES:54]; "CreditStage_In")
			WIN_t_CurrentInputForm:="CreditStage_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CREDIT_STAGES:54])
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([CREDIT_STAGES:54]; [CREDIT_STAGES:54]Stage_Code:1=$4)
			End if 
			
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CreditStage")+" "+[CREDIT_STAGES:54]Stage_Name:2
			
		: ($2=Table:C252(->[CURRENCIES:71]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([CURRENCIES:71]; "Currency_In")
			WIN_t_CurrentInputForm:="Currency_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CURRENCIES:71])
				End if 
			End if 
			If ($3="")
				$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Currency")
				$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)+" "+[CURRENCIES:71]Currency_Code:1
				
			Else 
				$_t_WindowTitle:=$3
			End if 
			If (Count parameters:C259>=4)
				If ($4#"")
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$4)
				End if 
			End if 
			
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Currency")+" "+[CURRENCIES:71]Currency_Name:2
			
			
			
		: ($2=Table:C252(->[CURRENT_STOCK:62]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([CURRENT_STOCK:62]; "CurrentStock_In")
			WIN_t_CurrentInputForm:="CurrentStock_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Stock_Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([CURRENT_STOCK:62])
				End if 
			End if 
			If (Count parameters:C259>=4)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=Num:C11($4))
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_CurrentStock")+" "+[CURRENT_STOCK:62]Product_Code:1
			
			
		: ($2=Table:C252(->[COMPANIES:2]))
			FORM SET INPUT:C55([COMPANIES:2]; "Company_In")
			WIN_t_CurrentInputForm:="Company_In"
			ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
			ARRAY POINTER:C280(COM_aPtr_CoFurthers; 0)
			ARRAY POINTER:C280(QUAL_aptr_Information; 0)
			If (Count parameters:C259>=3)
				If ($3#"")
					COM_t_COntext:=$3
					COM_l_Callback:=$1
				End if 
			End if 
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
			
			
			If (MOD_l_CurrentModuleAccess#3)
				READ WRITE:C146([COMPANIES:2])
				READ WRITE:C146([COMPANIES_RECORD_ANALYSIS:146])
				READ WRITE:C146([CONTACTS:1])
				READ WRITE:C146([CONTACTS_COMPANIES:145])
				READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
				READ WRITE:C146([INFORMATION:55])
			End if 
			If (MOD_l_CurrentModuleAccess<2)
				$_bo_Continue:=False:C215
			End if 
			If (Not:C34(COM_bo_TypesInited))
				ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
				COM_at_CompanyTypes{1}:="Show Companies only"
				COM_at_CompanyTypes{2}:="Show Private Individuals only"
				COM_at_CompanyTypes{3}:="-"
				COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
				COM_at_CompanyTypes:=4
				CUR_CompanyTypes:="Companies and Private Individuals"
				COM_bo_TypesInited:=True:C214
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Company")
			If (Count parameters:C259>=4)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[COMPANIES:2]Company_Name:2
		: ($2=Table:C252(->[CONTACTS:1]))
			FORM SET INPUT:C55([CONTACTS:1]; "Contact_In")  //
			
			WIN_t_CurrentInputForm:="Contact_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
			
			If (MOD_l_CurrentModuleAccess#3)
				READ WRITE:C146([CONTACTS:1])
				READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
				READ WRITE:C146([CONTACTS_COMPANIES:145])
			End if 
			If (Count parameters:C259>=4)
				If ([CONTACTS:1]Contact_Code:2#$4)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$4)
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contact")+" "+[CONTACTS:1]Contact_Name:31
		: ($2=Table:C252(->[DIARY:12]))  //based on
			
			Case of 
				: ($3="Letter") | ($3="Letters")  //show a lteer
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					
					FORM SET INPUT:C55([DIARY:12]; "Diary_inLW")
					If ($_l_ModuleAccess#3)
						READ WRITE:C146([DIARY:12])
						READ WRITE:C146([DOCUMENTS:7])
						
					End if 
					If (Count parameters:C259>=4)
						If ([DIARY:12]Diary_Code:3#$4)
							
							QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$4)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
						End if 
					End if 
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Letter")+" "+[DIARY:12]Document_Code:15
				: ($3="Email")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
					
					
					FORM SET INPUT:C55([DIARY:12]; "Diary_InEmail")
					If ($_l_ModuleAccess#3)
						READ WRITE:C146([DIARY:12])
						READ WRITE:C146([DOCUMENTS:7])
						
					End if 
					If (Count parameters:C259>=4)
						If ([DIARY:12]Diary_Code:3#$4)
							
							QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$4)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
						End if 
					End if 
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Email")+" "+[DIARY:12]Document_Code:15
					
					
				Else 
					//TRACE
					$_bo_Continue:=False:C215
					If (Count parameters:C259>=4)
						If (Count parameters:C259>=5)
							SD2_EditDiaryRecord($4; $3; Abs:C99($1); $5)
						Else 
							
							SD2_EditDiaryRecord($4; $3; Abs:C99($1))
							
							
						End if 
					End if 
					
			End case 
		: ($2=Table:C252(->[DOCUMENTS:7]))
			Case of 
				: ($3="Reports")
					FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
					$_t_CurrentInputForm:="Report_in"
					MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
					
					$_t_WindowName:=Get localized string:C991("MenuItem_Edit")
				: ($3="Letters")
					FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_inW")
					$_t_CurrentInputForm:="Letters_inW"
					MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+"Template"
				: ($3="emails")
					FORM SET INPUT:C55([DOCUMENTS:7]; "eMail_in")
					$_t_CurrentInputForm:="eMail_in"
					MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					
					$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+"Template"
			End case 
			If (MOD_l_CurrentModuleAccess#3)
				READ WRITE:C146([DOCUMENTS:7])
				
			End if 
			If (Count parameters:C259>=4)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowName+" "+[DOCUMENTS:7]Heading:2
			
		: ($2=Table:C252(->[PRODUCTS:9]))
			CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
			FORM SET INPUT:C55([PRODUCTS:9]; "Products_IN2009")
			WIN_t_CurrentInputForm:="Products_IN2009"
			PROD_t_FormName:=PROD_GetFunctionPref(False:C215; PROD_t_FunctionName)
			ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
			
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
			
			If (MOD_l_CurrentModuleAccess#3)
				READ WRITE:C146([PRODUCTS:9])
				READ WRITE:C146([PRODUCTS_SUPPLIERS:148])
				READ WRITE:C146([COMPONENTS:86])
			End if 
			
			If (Count parameters:C259>=4)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Product")+" "+[PRODUCTS:9]Product_Name:2
			
			
			
		: ($2=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
			
			READ WRITE:C146([ADDITIONAL_RECORD_ANALYSIS:53])
			
			FORM SET INPUT:C55([ADDITIONAL_RECORD_ANALYSIS:53]; "Furthers_In")
			WIN_t_CurrentInputForm:="Furthers_In"
			If (Count parameters:C259>=4)
				QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_FurtherAnalyses")+" "+[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
		: ($2=Table:C252(->[PRODUCT_GROUPS:10]))
			READ WRITE:C146([PRODUCT_GROUPS:10])
			FORM SET INPUT:C55([PRODUCT_GROUPS:10]; "ProductGroup_In")
			WIN_t_CurrentInputForm:="ProductGroup_In"
			If (Count parameters:C259>=4)
				QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Group")+" "+[PRODUCT_GROUPS:10]Group_Name:2
		: ($2=Table:C252(->[HEADINGS:84]))
			READ WRITE:C146([HEADINGS:84])
			FORM SET INPUT:C55([HEADINGS:84]; "Heading_in")
			WIN_t_CurrentInputForm:="Heading_in"
			If (Count parameters:C259>=4)
				QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$4)
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_AccountsHeading")+" "+[HEADINGS:84]Heading_Name:2
		: ($2=Table:C252(->[INVOICES:39]))  //based on zinvoice Mod
			
			
			FORM SET INPUT:C55([INVOICES:39]; "Invoice_In")
			//INV_aptr_ListboxSetup
			ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
			WIN_t_CurrentInputForm:="Invoice_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Sales Ledger Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([INVOICES:39])
				End if 
			End if 
			If (Count parameters:C259>=4)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$4)
			End if 
			Case of 
				: ([INVOICES:39]State:10=-3)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Receipt")+" "+[INVOICES:39]Invoice_Number:1
					
				: ([INVOICES:39]State:10=-2)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposit")+" "+[INVOICES:39]Invoice_Number:1
					FORM SET INPUT:C55([INVOICES:39]; "Invoice_inP")
					WIN_t_CurrentInputForm:="Invoice_inP"
					
				: ([INVOICES:39]State:10=-1)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Proforma")+[INVOICES:39]Invoice_Number:1
					
					
				: ([INVOICES:39]State:10=0)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
					
					
				: ([INVOICES:39]State:10=1)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
					
					
				: ([INVOICES:39]State:10=2)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
					
				: ([INVOICES:39]State:10=3)
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
					
				Else 
					$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
					
			End case 
			$_t_WindowTitle:=Term_SLPLWT($_t_WindowTitle)
		: ($2=Table:C252(->[INVOICES_ITEMS:161]))  //based on AccBal Bal
			FORM SET INPUT:C55([INVOICES_ITEMS:161]; "Items_in")
			//INV_aptr_ListboxSetup
			//ARRAY POINTER(INV_aptr_ListboxSetup;0)
			WIN_t_CurrentInputForm:="Items_in"
			
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Sales Ledger Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([INVOICES_ITEMS:161])
				End if 
			End if 
			If (Count parameters:C259>=4)
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]ID:17=Num:C11($4))
			End if 
			If (False:C215)
				Case of 
					: ([INVOICES:39]State:10=-3)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Receipt")+" "+[INVOICES:39]Invoice_Number:1
						
					: ([INVOICES:39]State:10=-2)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Deposit")+" "+[INVOICES:39]Invoice_Number:1
						FORM SET INPUT:C55([INVOICES:39]; "Invoice_inP")
						WIN_t_CurrentInputForm:="Invoice_inP"
						
					: ([INVOICES:39]State:10=-1)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Proforma")+[INVOICES:39]Invoice_Number:1
						
						
					: ([INVOICES:39]State:10=0)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
						
						
					: ([INVOICES:39]State:10=1)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
						
						
					: ([INVOICES:39]State:10=2)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
						
					: ([INVOICES:39]State:10=3)
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
						
					Else 
						$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Invoice")+" "+[INVOICES:39]Invoice_Number:1
						
				End case 
			End if 
			$_t_WindowTitle:=Term_SLPLWT("view: invoice item")
			
		: ($2=Table:C252(->[JOB_STAGES:47]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([JOB_STAGES:47]; "JobStage_in")
			//INV_aptr_ListboxSetup
			ARRAY POINTER:C280(JST_aptr_LBSettings; 0)
			WIN_t_CurrentInputForm:="JobStage_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Job Costing Module"; "Cancel")
				$_bo_Continue:=False:C215
				vJ:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([JOB_STAGES:47])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_JobStage")
			If (Count parameters:C259>=4)
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$4)
			End if 
			
			$_t_WindowTitle:=Term_SLPLWT($_t_WindowTitle+[JOB_STAGES:47]Stage_Name:3)
		: ($2=Table:C252(->[JOB_TYPES:65]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([JOB_TYPES:65]; "Types_In")
			WIN_t_CurrentInputForm:="Types_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([JOB_TYPES:65])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_JobTypes")
			If (Count parameters:C259>=4)
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=$4)
			End if 
			
			$_t_WindowTitle:=$_t_WindowTitle+[JOB_TYPES:65]Type_Name:2
			
		: ($2=Table:C252(->[JOB_TYPES:65]))  //based on AccBal Bal
			//NG April 2020 this looks incorrect
			FORM SET INPUT:C55([JOBS:26]; "Job_In")
			ARRAY POINTER:C280(JOB_aPtr_OrderItemsSetup; 0)
			WIN_t_CurrentInputForm:="Job_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Job Costing Module"; "Cancel")
				$_bo_Continue:=False:C215
				
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([JOBS:26])
					READ WRITE:C146([JOB PERSONNEL:48])
					READ WRITE:C146([JOB_STAGES:47])
					READ WRITE:C146([ORDER_ITEMS:25])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Jobs")
			If (Count parameters:C259>=4)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$4)
			End if 
			
			$_t_WindowTitle:=$_t_WindowTitle+[JOBS:26]Job_Name:2
		: ($2=Table:C252(->[LAYERS:76]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([LAYERS:76]; "Layer_In")
			WIN_t_CurrentInputForm:="Layer_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([LAYERS:76])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Layer")
			If (Count parameters:C259>=4)
				QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[LAYERS:76]Layer_Name:2
			
		: ($2=Table:C252(->[LOCATIONS:61]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([LOCATIONS:61]; "Location_In")
			WIN_t_CurrentInputForm:="Location_In"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([LOCATIONS:61])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Location")
			If (Count parameters:C259>=4)
				QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]Location_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[LOCATIONS:61]Location_Name:2
		: ($2=Table:C252(->[SCRIPTS:80]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([SCRIPTS:80]; "Scripts_in")
			WIN_t_CurrentInputForm:="Scripts_in"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([SCRIPTS:80])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Macro")
			If (Count parameters:C259>=4)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[SCRIPTS:80]Script_Name:2
		: ($2=Table:C252(->[MOVEMENT_TYPES:60]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([MOVEMENT_TYPES:60]; "MoveType_in")
			WIN_t_CurrentInputForm:="MoveType_in"
			MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([MOVEMENT_TYPES:60])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_MovementType")
			If (Count parameters:C259>=4)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[MOVEMENT_TYPES:60]Type_Code:1
		: ($2=Table:C252(->[ORDERS:24]))  //based on AccBal Bal
			
			
			LBI_bo_RowDragged:=False:C215
			
			FORM SET INPUT:C55([ORDERS:24]; "Order_In")
			WIN_t_CurrentInputForm:="Order_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Sales Orders_Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ORDERS:24])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Order")
			If (Count parameters:C259>=4)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ORDERS:24]Order_Code:3
		: ($2=Table:C252(->[ORDER_ITEMS:25]))  //based on AccBal Bal
			
			ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
			FORM SET INPUT:C55([ORDER_ITEMS:25]; "Items_in")
			If ($3="Subscriptions")
				FORM SET INPUT:C55([ORDER_ITEMS:25]; "Items_Su")
			End if 
			
			WIN_t_CurrentInputForm:="Items_in"
			$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
			
			
			If ($_l_ModuleAccess<2)
				Gen_Alert("You do not have access to the Sales Orders_Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If ($_l_ModuleAccess#3)
					READ WRITE:C146([ORDER_ITEMS:25])
				End if 
			End if 
			If ($3="")
				$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_OrderItem")
			Else 
				$_t_WindowTitle:=$3
			End if 
			If (Count parameters:C259>=4)
				If ($4#"")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=Num:C11($4))
				End if 
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ORDER_ITEMS:25]Order_Code:1
		: ($2=Table:C252(->[PERIODS:33]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PERIODS:33]; "Period_In")
			WIN_t_CurrentInputForm:="Period_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PERIODS:33])
				End if 
				
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Period")
			
			If (Count parameters:C259>=4)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$4)
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PERIODS:33]Period_Name:2
		: ($2=Table:C252(->[PERSONNEL_GROUPS:92]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PERSONNEL_GROUPS:92]; "PersonnelGroup_In")
			WIN_t_CurrentInputForm:="PersonnelGroup_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PERSONNEL_GROUPS:92])
				End if 
				
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
			
			If (Count parameters:C259>=4)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PERSONNEL_GROUPS:92]Group_Name:2
		: ($2=Table:C252(->[PERSONNEL:11]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PERSONNEL:11]; "Personnel_In")
			WIN_t_CurrentInputForm:="Personnel_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PERSONNEL:11])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Person")
			If (Count parameters:C259>=4)
				If ($4#"")
					If (Num:C11($4)#0)
						If ([PERSONNEL:11]Personnel_ID:48#Num:C11($4))
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=Num:C11($4))
						Else 
							LOAD RECORD:C52([PERSONNEL:11])
						End if 
					Else 
						If ([PERSONNEL:11]Initials:1#$4)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$4)
						Else 
							LOAD RECORD:C52([PERSONNEL:11])
							
						End if 
						
					End if 
					PER_l_Context:=0
					If (Count parameters:C259>=5)
						Case of 
							: ($5="Diary Settings")
								PER_l_Context:=1
						End case 
					End if 
				End if 
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PERSONNEL:11]Name:2
		: ($2=Table:C252(->[PICTURES:85]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PICTURES:85]; "Picture_In")
			WIN_t_CurrentInputForm:="Picture_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PICTURES:85])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Picture")
			If (Count parameters:C259>=4)
				If ([PICTURES:85]Picture_Code:1#($4))
					QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=($4))
				End if 
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PICTURES:85]Picture_Name:2
		: ($2=Table:C252(->[POSTAL_CODES:50]))  //based on
			
			FORM SET INPUT:C55([POSTAL_CODES:50]; "PostalCode_In")
			WIN_t_CurrentInputForm:="PostalCode_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([POSTAL_CODES:50])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PostCode")
			If (Count parameters:C259>=4)
				QUERY:C277([POSTAL_CODES:50]; [POSTAL_CODES:50]xRec_ID:5=Num:C11($4))
				
			End if 
			
		: ($2=Table:C252(->[PRICE_GROUPS:18]))  //based on
			
			FORM SET INPUT:C55([PRICE_GROUPS:18]; "PriceGroup_In")
			WIN_t_CurrentInputForm:="PriceGroup_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PRICE_GROUPS:18])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PriceGroup")
			If (Count parameters:C259>=4)
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PRICE_GROUPS:18]Price_Name:2
		: ($2=Table:C252(->[PRICE_TABLE:28]))  //based on
			
			FORM SET INPUT:C55([PRICE_TABLE:28]; "PriceTable_In")
			WIN_t_CurrentInputForm:="PriceTable_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_PriceTable))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Price table Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PRICE_TABLE:28])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Price")
			If (Count parameters:C259>=4)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=Num:C11($4))
				
			End if 
			
			
		: ($2=Table:C252(->[PROBLEMS:22]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PROBLEMS:22]; "Problems_In")
			WIN_t_CurrentInputForm:="Problems_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PROBLEMS:22])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Problem")
			If (Count parameters:C259>=4)
				QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PROBLEMS:22]Problem_Name:2
		: ($2=Table:C252(->[PROJECTS:89]))  //based on AccBal Bal
			
			
			
			FORM SET INPUT:C55([PROJECTS:89]; "Projects_In")
			WIN_t_CurrentInputForm:="Projects_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_JobCosting))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Job Costing Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PROJECTS:89])
					READ WRITE:C146([JOBS:26])
					READ WRITE:C146([JOB PERSONNEL:48])
					READ WRITE:C146([JOB_STAGES:47])
					READ WRITE:C146([ORDER_ITEMS:25])
				End if 
			End if 
			$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Project")
			If (Count parameters:C259>=4)
				QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PROJECTS:89]Project_Name:2
			
		: ($2=Table:C252(->[PRODUCTS:9]))  //based on AccBal Bal
			
			ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
			
			FORM SET INPUT:C55([PRODUCTS:9]; "Products_in2009")
			WIN_t_CurrentInputForm:="Products_in2009"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_Products))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Product Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PRODUCTS:9])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Product")
			If (Count parameters:C259>=4)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PRODUCTS:9]Product_Name:2
		: ($2=Table:C252(->[PUBLICATIONS:52]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([PUBLICATIONS:52]; "Public_in")
			WIN_t_CurrentInputForm:="Public_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PUBLICATIONS:52])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Publication")
			If (Count parameters:C259>=4)
				QUERY:C277([PUBLICATIONS:52]; [PUBLICATIONS:52]Publication_Code:1=($4))
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PUBLICATIONS:52]Publication_Name:2
		: ($2=Table:C252(->[PURCHASE_ORDERS:57]))  //based on AccBal Bal
			
			ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
			FORM SET INPUT:C55([PURCHASE_ORDERS:57]; "PurchaseOrder_In")
			WIN_t_CurrentInputForm:="PurchaseOrder_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Purchase Order module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PURCHASE_ORDERS:57])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
			If (Count parameters:C259>=4)
				QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=($4))
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2
		: ($2=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([PURCHASE_ORDERS_ITEMS:169]; "Items_in")
			WIN_t_CurrentInputForm:="Items_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Purchase Order module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseOrderItem")
			If (Count parameters:C259>=4)
				QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]ID:17=Num:C11($4))
			End if 
			
		: ($2=Table:C252(->[PURCHASE_INVOICES:37]))  //based on AccBal Bal
			
			ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
			FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")
			WIN_t_CurrentInputForm:="Purchases_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Purchase ledger module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([PURCHASE_INVOICES:37])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
			If (Count parameters:C259>=4)
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$4)
				Case of 
					: ([PURCHASE_INVOICES:37]State:24=-2)  //pre payment
						
						FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_inP")
						WIN_t_CurrentInputForm:="Purchases_inP"
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchasePrepayment")
						$_t_WindowTitle:=$_t_WindowTitle+" "+[PURCHASE_INVOICES:37]Purchase_Code:1
					: ([PURCHASE_INVOICES:37]State:24=-3)  //pre payment
						
						$_t_WindowName:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_PurchasePrepayment")
						$_t_WindowTitle:=$_t_WindowTitle+" "+[PURCHASE_INVOICES:37]Purchase_Code:1
						
					Else 
						$_t_WindowTitle:=$_t_WindowTitle+" "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
						
				End case 
			End if 
			
		: ($2=Table:C252(->[RECURRING_JOURNALS:38]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([RECURRING_JOURNALS:38]; "Standing_In")
			WIN_t_CurrentInputForm:="Standing_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Nominal ledger module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([RECURRING_JOURNALS:38])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_RecurJournal")
			If (Count parameters:C259>=4)
				QUERY:C277([RECURRING_JOURNALS:38]; [RECURRING_JOURNALS:38]x_ID:15=Num:C11($4))
			End if 
			
		: ($2=Table:C252(->[RESULTS:14]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([RESULTS:14]; "Results_in")
			WIN_t_CurrentInputForm:="Results_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([RESULTS:14])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Result")
			If (Count parameters:C259>=4)
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[RESULTS:14]Result_Name:2
		: ($2=Table:C252(->[ROLES:87]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([ROLES:87]; "Roles_In")
			WIN_t_CurrentInputForm:="Roles_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([ROLES:87])
					
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Role")
			If (Count parameters:C259>=4)
				QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[ROLES:87]Role_Name:2
		: ($2=Table:C252(->[SERVICE_CALLS:20]))  //
			
			FORM SET INPUT:C55([SERVICE_CALLS:20]; "Calls_in")
			WIN_t_CurrentInputForm:="Calls_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the service centre  module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([SERVICE_CALLS:20])
					READ WRITE:C146([ORDER_ITEMS:25])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_ServiceCall")
			If (Count parameters:C259>=4)
				QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[SERVICE_CALLS:20]Call_Code:4
			
		: ($2=Table:C252(->[SOLUTIONS:23]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([SOLUTIONS:23]; "Solutions_in")
			
			WIN_t_CurrentInputForm:="Solutions_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([SOLUTIONS:23])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Solutions")
			If (Count parameters:C259>=4)
				QUERY:C277([SOLUTIONS:23]; [SOLUTIONS:23]Solution_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[SOLUTIONS:23]Solution_Name:2
		: ($2=Table:C252(->[SOURCES:6]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([SOURCES:6]; "Sources_In")
			WIN_t_CurrentInputForm:="Sources_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([SOURCES:6])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Source")
			If (Count parameters:C259>=4)
				QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[SOURCES:6]Source_Name:2
		: ($2=Table:C252(->[STAGES:45]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STAGES:45]; "Stages_in")
			WIN_t_CurrentInputForm:="Stages_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STAGES:45])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_JobStage")
			If (Count parameters:C259>=4)
				QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[STAGES:45]Stage_Name:2
		: ($2=Table:C252(->[STATUS:4]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STATUS:4]; "Status_in")
			WIN_t_CurrentInputForm:="Status_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the data manager module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STATUS:4])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Status")
			If (Count parameters:C259>=4)
				QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[STATUS:4]Status_Name:2
			
		: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "Stock_in")
			WIN_t_CurrentInputForm:="Stock_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the stock control module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockItems")
			If (Count parameters:C259>=4)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=Num:C11($4))
			End if 
			$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)+" "+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
			
		: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_in")
			WIN_t_CurrentInputForm:="Movements_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the stock control module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STOCK_MOVEMENTS:40])
				End if 
			End if 
			If ($3="")
				$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockMovement")
				$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)+" "+[STOCK_MOVEMENTS:40]Movement_Code:1
				
			Else 
				$_t_WindowTitle:=$3
			End if 
			
			If (Count parameters:C259>=4)
				If ([STOCK_MOVEMENTS:40]Movement_Code:1#$4)
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$4)
				End if 
			End if 
			$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)+" "+[STOCK_MOVEMENTS:40]Movement_Code:1
			
			
		: ($2=Table:C252(->[STOCK_LEVELS:58]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STOCK_LEVELS:58]; "StockLev_in")
			WIN_t_CurrentInputForm:="StockLev_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the stock control module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STOCK_LEVELS:58])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockLevel")
			If (Count parameters:C259>=4)
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=Num:C11($4))
			End if 
			$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)
		: ($2=Table:C252(->[STOCK_TYPES:59]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([STOCK_TYPES:59]; "StockTypes_in")
			WIN_t_CurrentInputForm:="StockTypes_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([STOCK_TYPES:59])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_StockType")
			If (Count parameters:C259>=4)
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[STOCK_TYPES:59]Type_Name:2
			$_t_WindowTitle:=Term_StoWT($_t_WindowTitle)
		: ($2=Table:C252(->[TAX_CODES:35]))  //based on AccBal Bal
			
			FORM SET INPUT:C55([TAX_CODES:35]; "Vat_in")
			WIN_t_CurrentInputForm:="Vat_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TAX_CODES:35])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TaxCode")
			If (Count parameters:C259>=4)
				QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[TAX_CODES:35]Tax_Name:2
			$_t_WindowTitle:=Term_VATWT($_t_WindowTitle)
			
		: ($2=Table:C252(->[TERMINOLOGY:75]))  //
			
			FORM SET INPUT:C55([TERMINOLOGY:75]; "Term_in")
			WIN_t_CurrentInputForm:="Term_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TERMINOLOGY:75])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Terminology")
			If (Count parameters:C259>=4)
				QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]Terminology_Code:1=$4)
				
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[TERMINOLOGY:75]Terminology_Name:2
		: ($2=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			
			
			FORM SET INPUT:C55([TRANSACTION_BATCHES:30]; "TransB_in")
			WIN_t_CurrentInputForm:="TransB_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Nominal Ledger Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TRANSACTION_BATCHES:30])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TransBatch")
			If (Count parameters:C259>=4)
				QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=Num:C11($4))
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
			
			
		: ($2=Table:C252(->[TRANSACTIONS:29]))  //
			
			
			FORM SET INPUT:C55([TRANSACTIONS:29]; "Trans_in")
			WIN_t_CurrentInputForm:="Trans_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Nominal Ledger  Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TRANSACTIONS:29])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Transaction")
			If (Count parameters:C259>=4)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=Num:C11($4))
			End if 
			//$_t_WindowTitle:=$_t_WindowTitle
		: ($2=Table:C252(->[TRANSACTION_TYPES:31]))  //
			
			
			FORM SET INPUT:C55([TRANSACTION_TYPES:31]; "TransT_in")
			WIN_t_CurrentInputForm:="TransT_in"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TRANSACTION_TYPES:31])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_TransactionType")
			If (Count parameters:C259>=4)
				QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[TRANSACTION_TYPES:31]Transaction_Type_Name:2
			
		: ($2=Table:C252(->[TYPES:5]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([TYPES:5]; "Types_In")
			WIN_t_CurrentInputForm:="Types_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([TYPES:5])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Type")
			If (Count parameters:C259>=4)
				QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[TYPES:5]Type_Name:2
			
		: ($2=Table:C252(->[WORKFLOW_CONTROL:51]))  //based on AccBal Bal
			
			
			FORM SET INPUT:C55([WORKFLOW_CONTROL:51]; "Workflow_Control_In")
			WIN_t_CurrentInputForm:="Workflow_Control_In"
			MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
			
			If (MOD_l_CurrentModuleAccess<2)
				Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
				$_bo_Continue:=False:C215
				vD:=0
			Else 
				If (MOD_l_CurrentModuleAccess#3)
					READ WRITE:C146([WORKFLOW_CONTROL:51])
				End if 
			End if 
			$_t_WindowTitle:=Get localized string:C991("MenuItem_Edit")+" "+Get localized string:C991("MenuItem_Workflow")
			If (Count parameters:C259>=4)
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$4)
			End if 
			$_t_WindowTitle:=$_t_WindowTitle+" "+[WORKFLOW_CONTROL:51]Workflow_name:18
		Else 
			$_bo_Continue:=False:C215
			
	End case 
	If ($_bo_Continue)
		If (Not:C34($_bo_NoWindow))
			Open_Pro_Window($_t_WindowTitle; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
			$_t_WindowReference:=Table name:C256($_ptr_Table)+"_"+WIN_t_CurrentInputForm
		End if 
		If ($_l_Process#Current process:C322)
			
			PROC_SetProcess(Current process:C322; 0; $_l_Process)
		End if 
		$_bo_InRecord:=DB_bo_InRecord
		DB_bo_InRecord:=True:C214
		If (MOD_l_CurrentModuleAccess#3)
			//TRACE
			If (Records in selection:C76($_ptr_Table->)#0)
				If (Locked:C147($_ptr_Table->))
					$_bo_OK:=Check_Locked($_ptr_Table; 1)
				Else 
					$_bo_OK:=True:C214
				End if 
				If (Not:C34($_bo_OK))
					
					Gen_Alert("This record is locked by another user")
					UNLOAD RECORD:C212($_ptr_Table->)
					READ ONLY:C145($_ptr_Table->)
					LOAD RECORD:C52($_ptr_Table->)
					DB_bo_hasScrollBars:=True:C214
					//OUTPUT FORM($_ptr_Table->;WIN_t_CurrentInputForm)
					DISPLAY SELECTION:C59($_ptr_Table->; False:C215)
					DB_bo_hasScrollBars:=False:C215
					
					
				Else 
					MODIFY RECORD:C57($_ptr_Table->; *)
				End if 
				
				If ($_l_Process#Current process:C322)
					If ($_l_Process>0)
						SET PROCESS VARIABLE:C370($_l_Process; DB_bo_RefreshScreen; True:C214)
						POST OUTSIDE CALL:C329($_l_Process)
						SHOW PROCESS:C325($_l_Process)
						
					End if 
				End if 
			Else 
				//Record does not exist
			End if 
		Else 
			If (Records in selection:C76($_ptr_Table->)#0)
				If (Locked:C147($_ptr_Table->))
					$_bo_OK:=Check_Locked($_ptr_Table; 1)
				Else 
					$_bo_OK:=True:C214
				End if 
				If (Not:C34($_bo_OK))
					Gen_Alert("This record is locked by another user")
					UNLOAD RECORD:C212($_ptr_Table->)
					READ ONLY:C145($_ptr_Table->)
					LOAD RECORD:C52($_ptr_Table->)
					FORM SET OUTPUT:C54($_ptr_Table->; WIN_t_CurrentInputForm)
					DB_bo_hasScrollBars:=True:C214
					MODIFY SELECTION:C204($_ptr_Table->)
					
					DB_bo_hasScrollBars:=False:C215
				Else 
					READ WRITE:C146($_ptr_Table->)
					MODIFY RECORD:C57($_ptr_Table->; *)
					
					
				End if 
				
				
				If ($_l_Process#Current process:C322)
					SET PROCESS VARIABLE:C370($_l_Process; DB_bo_RefreshScreen; True:C214)
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
				
			Else 
				Gen_Alert("Sorry the record does not exist")
			End if 
		End if 
		//<---here implement work flow
		
		DB_bo_InRecord:=$_bo_InRecord
		If (OK=0)
		End if 
		If (Not:C34($_bo_NoWindow))
			If ($_t_WindowReference#"")
				Close_ProWin($_t_WindowReference)
			Else 
				Close_ProWin
			End if 
		Else 
			
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
		End if 
	End if 
	WIN_t_CurrentInputForm:=$_t_CurrentInputForm
	WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
End if 
//
ERR_MethodTrackerReturn("DBI_DisplayRecord"; $_t_oldMethodName)
