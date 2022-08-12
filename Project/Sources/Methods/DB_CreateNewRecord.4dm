//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreateNewRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:         26/08/2010 17:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Else acc_ba)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY POINTER(ACC_aptr_Transaction;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_CompanyNames;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	C_BOOLEAN:C305(<>ContDedupCo; <>StatesLoaded; $_bo_Continue; $_bo_InAllowed; $_bo_InTransaction; $_bo_OpenWindow; $_bo_ProcessVisible; $_bo_StandardCode; $_bo_StartProcess; $_bo_Stop; $_bo_UseBatchedEntry)
	C_BOOLEAN:C305($_bo_UseDialog; $_bo_UseTransType; $_bo_WindowIsOpen; $2; $4; COM_bo_AddingCompany; DB_bo_ReadyForParameters; INV_bo_PeriodSet; LBI_bo_RowDragged; SD_bo_Contnue; vFromin)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StockMovementDate)
	C_LONGINT:C283(<>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; $_l_AddMode; $_l_AssemblyMovementID; $_l_ButtonClickedFunction; $_l_CallBackID; $_l_CallBackProcessID; $_l_CurrentDisplayedForm; $_l_ModuleAccess; $_l_ModuleAccessWas; $_l_OrderStateRow)
	C_LONGINT:C283($_l_PeriodID; $_l_ProcessState; $_l_ProcessTime; $_l_RecordNumber; $_l_RecordsCount; $_l_Retries; $_l_StockAllocationLevel; $_l_TableToAddTo; $_l_UniqueProcessID; $_l_WindowReferenceRow; $1)
	C_LONGINT:C283($3; DB_l_ButtonClickedFunction; DB_l_ButtonPrefsSet; DB_l_TableNum; INV_l_AssignedrecordID; MOD_l_CurrentModuleAccess; NV_l_AssignedTable; R2; SD_l_EntryPoint; SD_l_ParentProcess; SUBS_l_PageNumber)
	C_LONGINT:C283(Vadd; vIn; vNo; vSNo; vTr; WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_obj_FormData)
	C_POINTER:C301($_ptr_Table; VFilePtr)
	C_REAL:C285($_r_AssemblyCanBuildQuantity; $_r_StockAllocationTotalCost; $_r_StockMovementQuantity; INV_R_Depositmaxamt)
	C_TEXT:C284(<>CompCode; $_t_AddTypeName; $_t_AnalysisCode; $_t_CallCode; $_t_CloseReference; $_t_CompanyCode; $_t_CurrencyCode; $_t_CurrentFormUsage; $_t_CurrentFormUsage2; $_t_CurrentInputForm; $_t_DocManagerType)
	C_TEXT:C284($_t_EntryType; $_t_ForeNames; $_t_InputTestText; $_t_LayerCode; $_t_oldMethodName; $_t_OrderState; $_t_Plural; $_t_PostProcessingMethod; $_t_processName; $_t_ProductCode; $_t_RecordsAddedSet)
	C_TEXT:C284($_t_SingleDisassembly; $_t_StateType; $_t_StockMovementType; $_t_TableName; $_t_WindowTitle; $5; ABC_t_AccountCode; COM_t_OpenCompanyName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_ReportName; DIA_t_EntryType; DOC_t_EntryType; INV_t_SetPeriodCode; ORD_T_OrderStateCode; PUR_t_PurchaseEntryType; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName; VCompCode; vCompName)
	C_TEXT:C284(vForename; vPostcode; vSurname; vTitle; vTitle1; vTown; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreateNewRecord")
PUR_t_PurchaseEntryType:=""
$_bo_InTransaction:=False:C215  //set this to true if the data entry should be in a transaciton when using the standard code
$_bo_UseTransType:=False:C215
$_t_PostProcessingMethod:=""  //method to execute after creating record if any
//note-When calling this method to add records as a sub entity the batch mode setting should be ignored
If (Count parameters:C259>=3)
	$_bo_UseBatchedEntry:=$2
	$_l_CallBackProcessID:=$1
	$_l_TableToAddTo:=$3
	
	If (Count parameters:C259>=4)
		$_bo_OpenWindow:=$4
		
	Else 
		$_bo_OpenWindow:=True:C214
	End if 
	If (Current process:C322#$_l_CallBackProcessID)
		$_bo_OpenWindow:=True:C214
		$_bo_StartProcess:=True:C214
	Else 
		$_bo_StartProcess:=False:C215
	End if 
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	If ($_bo_StartProcess)  //we are opening a new
		Start_Process
	End if 
	If (<>SCPT_l_PlayerActive#0)
		
		<>SCPT_l_currentScriptProcess:=Current process:C322
	End if 
	
	If ($_l_CallBackProcessID<0)
		SD_l_ParentProcess:=0
		$_l_CallBackID:=Abs:C99($_l_CallBackProcessID)  //this is to keep the coms simple-no additional vars needed
		DB_bo_ReadyForParameters:=True:C214
		SET PROCESS VARIABLE:C370($_l_CallBackID; DB_bo_ReadyForParameters; DB_bo_ReadyForParameters)
		$_l_Retries:=0
		Repeat 
			$_l_CallBackProcessID:=SD_l_ParentProcess  //set this var last!
			If ($_l_CallBackProcessID=0)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End if 
		Until ($_l_CallBackProcessID>0) | (SD_bo_Contnue)
	End if 
	
	$_t_CurrentInputForm:=WIN_t_CurrentInputForm
	$_l_AddMode:=Vadd
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	vAdd:=1
	$_ptr_Table:=Table:C252($3)
	COPY NAMED SELECTION:C331($_ptr_Table->; "$CurrentSelection")
	$_bo_StandardCode:=False:C215
	$_t_InputTestText:=""
	$_l_ModuleAccess:=0
	vFromin:=False:C215
	$_l_ModuleAccessWas:=MOD_l_CurrentModuleAccess
	Case of 
		: ($_l_TableToAddTo=Table:C252(->[COMPANIES:2]))
			//TRACE
			ARRAY TEXT:C222(SD_at_CompanyCodes; 0)
			ARRAY TEXT:C222(SD_at_CompanyNames; 0)
			SD_at_CompanyNames:=0
			
			If ($_bo_UseBatchedEntry)
				$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Companies")
			Else 
				$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Company")
			End if 
			FORM SET INPUT:C55([COMPANIES:2]; "Company_In")  //
			WIN_t_CurrentInputForm:="Company_In"
			ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
			ARRAY POINTER:C280(COM_aPtr_CoFurthers; 0)
			ARRAY POINTER:C280(QUAL_aptr_Information; 0)
			$_bo_InAllowed:=True:C214
			If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[COMPANIES:2])})>2)
				$_bo_InAllowed:=False:C215
				If (<>SYS_al_RecStateRestriction{Table:C252(->[ORDERS:24])}{3}%2=1)
					
					$_bo_InAllowed:=True:C214
					
				End if 
			End if 
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
			MOD_l_CurrentModuleAccess:=$_l_ModuleAccess
			If (In_Allowed($_t_AddTypeName; ->[COMPANIES:2]; $_l_ModuleAccess)) & ($_bo_InAllowed)
				READ WRITE:C146([COMPANIES:2])
				READ WRITE:C146([COMPANIES_RECORD_ANALYSIS:146])
				READ WRITE:C146([CONTACTS:1])
				READ WRITE:C146([CONTACTS_COMPANIES:145])
				READ WRITE:C146([CONTACTS_RECORD_ANALYSIS:144])
				READ WRITE:C146([INFORMATION:55])
				$_l_RecordsCount:=0
				$_bo_Stop:=False:C215
				CREATE EMPTY SET:C140([COMPANIES:2]; "$RecordsAdded")
				$_bo_WindowIsOpen:=False:C215
				Repeat 
					$_l_RecordsCount:=$_l_RecordsCount+1
					vFromIn:=False:C215  //need to set this more dynamically!!
					vTitle1:="Company_Details for duplicate check:"
					vCompName:=""
					vTown:=""
					vTitle:=""
					vForename:=""
					vSurname:=""
					vPostcode:=""
					COM_bo_AddingCompany:=True:C214
					REDUCE SELECTION:C351([COMPANIES:2]; 0)
					If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
						
						Open_Pro_Window($_t_AddTypeName; 0; 2; ->[COMPANIES:2]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
						$_bo_WindowIsOpen:=True:C214
					Else 
						$_t_WindowTitle:=Get window title:C450
						If ($_bo_UseBatchedEntry)
							SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Companies"))
							
						Else 
							SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Company"))
						End if 
						
					End if 
					$_t_CloseReference:=""  //added NG may 2004
					COM_t_OpenCompanyName:=""
					ADD RECORD:C56([COMPANIES:2]; *)
					$_t_CloseReference:=Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
					If (OK=1)
						ADD TO SET:C119([COMPANIES:2]; "$RecordsAdded")
						If (COM_t_OpenCompanyName#"")
							QUERY:C277([COMPANIES:2]Company_Name:2=COM_t_OpenCompanyName)
							If ([COMPANIES:2]Deleted:61#0)
								[COMPANIES:2]Deleted:61:=0
								DB_SaveRecord(->[COMPANIES:2])
							End if 
							MODIFY RECORD:C57([COMPANIES:2]; *)
						End if 
					Else 
						$_bo_Stop:=True:C214
					End if 
					
				Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
				If ($_bo_OpenWindow)
					If ($_t_CloseReference="")
						Close_ProWin
					Else 
						Close_ProWin($_t_CloseReference)
					End if 
				End if 
				If (Current process:C322#$_l_CallBackProcessID)
					//Need to send added records back to the process
				Else 
					
					//need to add added records to the selection
					USE NAMED SELECTION:C332("$CurrentSelection")
					CREATE SET:C116([COMPANIES:2]; "$CurrentSet")
					UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
					USE SET:C118("$CurrentSet")
					
				End if 
				
			End if 
		: ($_l_TableToAddTo=Table:C252(->[ACCOUNTS:32]))
			//This should have the ability to pass in the heading
			$_bo_StandardCode:=True:C214
			
			WIN_t_CurrentInputForm:="Accounts_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Accounts")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Account")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[ACTIONS:13]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Action_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Actions")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Action")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[ACC_Bank_Statements:198]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Balance_Entry"
			$_t_Plural:="Bank Statements"  //Get localized string("Bank Statements")
			$_t_SingleDisassembly:="Bank Statement"  //Get localized string("Bank Statement")
			$_obj_FormData:=New object:C1471("CallBackProcess"; Current process:C322; "formName"; "Balance_Entry"; "Plural"; "Bank Statements"; "Singular"; "Bank Statement"; "Bank_Account_Number"; ABC_t_AccountCode)
			
			$_bo_UseDialog:=True:C214
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[ADDRESS_FORMATS:74]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Types_In"
			$_t_Plural:=Get localized string:C991("MenuItem_AddressFormats")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_AddressFormat")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[ANALYSES:36]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Analysis_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Analyses")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Analysis")
			
		: ($_l_TableToAddTo=Table:C252(->[AREAS:3]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Area_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Areas")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Area")
		: ($_l_TableToAddTo=Table:C252(->[PRODUCT_BRANDS:8]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Brands_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Brands")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Brand")
		: ($_l_TableToAddTo=Table:C252(->[CATALOGUE:108]))
			ARRAY TEXT:C222(CAT_at_Catalogueclasses; 2)
			ARRAY LONGINT:C221(CAT_al_catalgoueclasses; 2)
			CAT_at_Catalogueclasses{1}:="Static"
			CAT_al_catalgoueclasses{1}:=-1
			CAT_at_Catalogueclasses{2}:="Dynamic"
			CAT_al_catalgoueclasses{2}:=1
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Catalogue_Input"
			$_t_Plural:=Get localized string:C991("MenuItem_Collections")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Collection")
			
		: ($_l_TableToAddTo=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Categories_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Categories")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Category")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[CONTACTS:1]))
			$_bo_StandardCode:=False:C215
			Contacts_File
			
			$_t_Plural:=Get localized string:C991("MenuItem_Contacts")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Contact")
			If ($_bo_UseBatchedEntry)
				$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural
			Else 
				$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly
			End if 
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
			MOD_l_CurrentModuleAccess:=$_l_ModuleAccess
			If (In_Allowed($_t_AddTypeName; ->[CONTACTS:1]; $_l_ModuleAccess))
				$_l_RecordsCount:=0
				$_bo_Stop:=False:C215
				CREATE EMPTY SET:C140([CONTACTS:1]; "$RecordsAdded")
				$_bo_WindowIsOpen:=False:C215
				Repeat 
					$_l_RecordsCount:=$_l_RecordsCount+1
					vFromIn:=False:C215  //need to set this more dynamically!!
					vTitle1:="Company_Details for duplicate check:"
					vTitle1:="Contact_Details for duplicate check:"
					vCompName:=""
					vTown:=""
					vTitle:=""
					vPostcode:=""
					vForename:=""
					vSurname:=""
					$_t_CloseReference:=""
					REDUCE SELECTION:C351([CONTACTS:1]; 0)
					Open_AnyTypeWindow(233; 362; 5; $_t_AddTypeName; ""; ->[CONTACTS:1]; "dAsk_NewCont")  //NG may 2004 added form
					DIALOG:C40([CONTACTS:1]; "dAsk_NewCont")
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					If (OK=1)
						REDUCE SELECTION:C351([CONTACTS:1]; 0)
						If ((vForename="") & (vSurname="") & (vCompName="") & (vPostcode="") & (vTown=""))
							If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
								Open_Pro_Window($_t_AddTypeName; 0; 2; ->[CONTACTS:1]; WIN_t_CurrentInputForm)
								$_bo_WindowIsOpen:=True:C214
							Else 
								$_t_WindowTitle:=Get window title:C450
								If ($_bo_UseBatchedEntry)
									SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural)
									
								Else 
									SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly)
								End if 
								
							End if 
							$_t_CloseReference:=""  //added NG may 2004
							DB_t_CurrentFormUsage:=""
							ADD RECORD:C56([CONTACTS:1]; *)
						Else 
							//Company name entered
							$_t_CompanyCode:=VCompCode
							vCompCode:=""
							If ((<>ContDedupCo) & ((vCompName#"") | (vTown#"") | (vPostcode#"")))
								Companies_InSrc
								vCompCode:=[COMPANIES:2]Company_Code:1
								Project_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1)
							Else 
								//NG not relevant as contact dedup already done
								REDUCE SELECTION:C351([CONTACTS:1]; 0)
								//ALL RECORDS([CONTACTS])
							End if 
							If ((vForename#"") | (vSurname#""))
								$_t_ForeNames:=Substring:C12(vForename; 1; 1)+"@"
								QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Surname:5=vSurname; *)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeNames; *)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)  //Modified NG 2004
							End if 
							If (Records in selection:C76([CONTACTS:1])>0)  //NG Modification March 2004
								If ($_t_CompanyCode#"") & ((R2=1) | (VcompName#""))
									SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_CompanyCode)
									CREATE SET:C116([CONTACTS:1]; "Set1")
									
									QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									CREATE SET:C116([CONTACTS:1]; "Set2")
									UNION:C120("$Set1"; "$Set2"; "$Set1")
									USE SET:C118("$Set1")
								Else 
									VCompCode:=""
								End if 
							End if 
							
							
							If (Records in selection:C76([CONTACTS:1])=0)
								If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
									Open_Pro_Window($_t_AddTypeName; 0; 2; ->[CONTACTS:1]; WIN_t_CurrentInputForm)
									$_bo_WindowIsOpen:=True:C214
								Else 
									$_t_WindowTitle:=Get window title:C450
									If ($_bo_UseBatchedEntry)
										SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural)
										
									Else 
										SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly)
									End if 
									
								End if 
								
								//Moved from above and added form name
								DB_t_CurrentFormUsage:="In"
								If (R2=1)
									vCompCode:=$_t_CompanyCode
								Else 
									VCompCode:=""
									<>CompCode:=""
								End if 
								ADD RECORD:C56([CONTACTS:1]; *)
								vCompCode:=""
							Else 
								If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
									Open_Pro_Window($_t_AddTypeName; 0; 2; ->[CONTACTS:1]; WIN_t_CurrentInputForm)
									$_bo_WindowIsOpen:=True:C214
								Else 
									$_t_WindowTitle:=Get window title:C450
									If ($_bo_UseBatchedEntry)
										SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural)
										
									Else 
										SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly)
									End if 
									
								End if 
								//Moved from above and added form name
								DB_t_CurrentFormUsage:="Check"
								If (R2=1)
									vCompCode:=$_t_CompanyCode
								Else 
									VCompCode:=""
									<>CompCode:=""
								End if 
								vNo:=Records in selection:C76([CONTACTS:1])
								ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Forename:4; >; [CONTACTS:1]Title:3; >)
								DB_l_ButtonPrefsSet:=1
								FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[CONTACTS:1]))
								
								WIn_SetFormSize(1; ->[CONTACTS:1]; "Contacts_Out")
								MODIFY SELECTION:C204([CONTACTS:1]; *)
								DB_l_ButtonPrefsSet:=0
								vCompCode:=""
							End if 
						End if 
						$_t_CloseReference:=Table name:C256(->[CONTACTS:1])+"_"+WIN_t_CurrentInputForm  //
						If (OK=1)
							ADD TO SET:C119([CONTACTS:1]; "$RecordsAdded")
						Else 
							$_bo_Stop:=True:C214
						End if 
					Else 
						OK:=1
						$_bo_Stop:=True:C214
					End if 
				Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
				If ($_bo_OpenWindow)
					If ($_t_CloseReference="")
						Close_ProWin
					Else 
						Close_ProWin($_t_CloseReference)
					End if 
				End if 
				If (Current process:C322#$_l_CallBackProcessID)
					//Need to send added records back to the process
				Else 
					
					//need to add added records to the selection
					USE NAMED SELECTION:C332("$CurrentSelection")
					CREATE SET:C116([CONTACTS:1]; "$CurrentSet")
					UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
					USE SET:C118("$CurrentSet")
					
				End if 
				
				
			End if 
		: ($_l_TableToAddTo=Table:C252(->[CONTRACT_TYPES:19]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="ContractType_In"
			$_t_Plural:=Get localized string:C991("MenuItem_ContractTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_ContractType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[CONTRACTS:17]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
			//current method has ability to pass i n a contact/company code. This is used w hen the method is called from COm_AddSubentity and CON_addsubentity
			If (Contracts_File)
				If (SD_t_InputFormName#"")
					FORM SET INPUT:C55([CONTRACTS:17]; SD_t_InputFormName)
					WIN_t_CurrentInputForm:=SD_t_InputFormName
				End if 
				$_t_InputTestText:=""
				If ($_bo_UseBatchedEntry)
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Contracts")
				Else 
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Contract")
				End if 
				$_bo_StandardCode:=True:C214
				WIN_t_CurrentInputForm:="Contract_in"
				$_t_Plural:=Get localized string:C991("MenuItem_Contracts")
				$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Contract")
			End if 
		: ($_l_TableToAddTo=Table:C252(->[CREDIT_STAGES:54]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="CreditStage_In"
			$_t_Plural:=Get localized string:C991("MenuItem_CreditStages")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_CreditStage")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[COUNTRIES:73]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Country_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Countries")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Country")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[CURRENCIES:71]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Currency_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Currencies")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Currency")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[DIARY:12]))
			//SD2_l_EntryPoint= entry point for the diary
			//options for this are
			//menu
			If (Count parameters:C259>=5)
				DIA_t_EntryType:=$5
			End if 
			If (DIA_t_EntryType="")
				DIA_t_EntryType:="Diary"
			End if 
			Case of 
				: (DIA_t_EntryType="Calendar")
					SD2_AddDiaryRecord(String:C10(SD_l_EntryPoint); ""; "Schedule"; False:C215; SD_l_ParentProcess)
					ARRAY TEXT:C222(SD2_at_ActionCodes; 0)  // this will be displayed on the form if there are multiple action codes
					$_bo_StandardCode:=False:C215
				: (DIA_t_EntryType="Workflow")
					SD2_AddDiaryRecord(String:C10(SD_l_EntryPoint); ""; "Workflow"; False:C215; SD_l_ParentProcess)
					
					$_bo_StandardCode:=False:C215
				: (DIA_t_EntryType="Letter")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					If ($_l_ModuleAccess<2)
						Gen_Alert("You do not have access to the WP Module"; "Cancel")
					Else 
						READ WRITE:C146([DOCUMENTS:7])
						READ WRITE:C146([DIARY:12])
						$_bo_StandardCode:=True:C214
						WIN_t_CurrentInputForm:="Diary_inLW"
						
						$_t_Plural:=Get localized string:C991("MenuItem_Letters")
						$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Letter")
						
						
					End if 
					
				: (DIA_t_EntryType="Email")
					//TRACE
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					
					//If ($_l_ModuleAccess<2)
					//Gen_Alert ("You do not have access to the WP Module";"Cancel")
					//Else
					READ WRITE:C146([DOCUMENTS:7])
					READ WRITE:C146([DIARY:12])
					$_bo_StandardCode:=False:C215
					WIN_t_CurrentInputForm:="Diary_InEmail"
					
					$_t_Plural:=Get localized string:C991("MenuItem_Emails")
					$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Email")
					
					zDiary_inEmail
					//End if
					
					
				Else 
			End case 
			//contextual non standard-coming back to this one as i will get bogged down
		: ($_l_TableToAddTo=Table:C252(->[DOCUMENTS:7]))
			//contextual non standard-coming back to this one as i will get bogged down
			If (Count parameters:C259>=5)
				DOC_t_EntryType:=$5
			End if 
			
			
			If (DOC_t_EntryType="")
				DOC_t_EntryType:="Letters"
			End if 
			Case of 
				: (DOC_t_EntryType="Letters")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
					$_t_DocManagerType:=Documents_4DWriteAccessType(True:C214)
					If ($_t_DocManagerType#"")
						$_bo_StandardCode:=True:C214
						FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_in"+$_t_DocManagerType)  //NG April 2004 removed reference to ◊screen
						WIN_t_CurrentInputForm:="Letters_in"+$_t_DocManagerType
						$_t_Plural:=Get localized string:C991("MenuItem_LetterTemplates")
						$_t_SingleDisassembly:=Get localized string:C991("MenuItem_LetterTemplate")
					End if 
					
				: (DOC_t_EntryType="Reports")
					If (DB_l_TableNum=0)
						DB_l_TableNum:=Table:C252(->[COMPANIES:2])
					End if 
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
					VFilePtr:=Table:C252(DB_l_TableNum)
					//DB_t_ReportName
					$_bo_StandardCode:=True:C214
					FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
					WIN_t_CurrentInputForm:="Report_in"
					$_t_Plural:=Get localized string:C991("MenuItem_Reports")
					$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Report")
			End case 
			
		: ($_l_TableToAddTo=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
			$_bo_StandardCode:=True:C214
			//WI:=CustomFieldDef_In
			WIN_t_CurrentInputForm:="CustomFieldDef_In"
			$_t_Plural:=Get localized string:C991("MenuItem_FurtherAnalyses")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_FurtherAnalysis")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			//these were not previously added via an 'input' form. The FF were displayed on a list box array based format. We will therefore continue similar on the new 'output' form with the list of tables displayed to the side as selection manager lists(autoshow selection manager)
		: ($_l_TableToAddTo=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  //could easily be managed by direct input on the new output form
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Furthers_In"
			$_t_Plural:=Get localized string:C991("MenuItem_FurtherAnalyses")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_FurtherAnalysis")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[HEADINGS:84]))  //may not display headings-they may get created on the accounts format
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Heading_in"
			$_t_Plural:=Get localized string:C991("MenuItem_AccountsHeadings")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_AccountsHeading")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[INVOICES:39]))
			If (Count parameters:C259>=5)
				PUR_t_PurchaseEntryType:=$5
			End if 
			If (PUR_t_PurchaseEntryType="")
				PUR_t_PurchaseEntryType:="Invoice"
			End if 
			//invoices have a way of being called with some parameters currently. this will be from sub entities
			Case of 
				: (PUR_t_PurchaseEntryType="Invoice") | (PUR_t_PurchaseEntryType="View Invoices")
					INV_t_SetPeriodCode:=""
					$_t_AddTypeName:="Enter Adhoc Invoices"
					If ($_bo_UseBatchedEntry)
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdHocInvoices")
					Else 
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdHocInvoice")
					End if 
					If (Invoices_File)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							If (In_Allowed($_t_AddTypeName; ->[INVOICES:39]))
								$_l_RecordsCount:=0
								$_bo_Stop:=False:C215
								CREATE EMPTY SET:C140([INVOICES:39]; "$RecordsAdded")
								$_bo_WindowIsOpen:=False:C215
								Repeat 
									$_l_RecordsCount:=$_l_RecordsCount+1
									vFromIn:=False:C215  //need to set this more dynamically!!
									//COM_bo_AddingCompany:=True
									REDUCE SELECTION:C351([INVOICES:39]; 0)
									If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
										Open_Pro_Window($_t_AddTypeName; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
										$_bo_WindowIsOpen:=True:C214
									Else 
										$_t_WindowTitle:=Get window title:C450
										If ($_bo_UseBatchedEntry)
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdHocInvoices"))
											
										Else 
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdHocInvoice"))
										End if 
										
									End if 
									GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
									$_t_CloseReference:=Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
									StartTransaction  // 13/05/02 pb
									Repeat 
										$_bo_Stop:=False:C215
										$_l_PeriodID:=Check_Period(Current date:C33(*))
										Check_PerCloseI
										INV_bo_PeriodSet:=True:C214
										INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
										If (INV_t_SetPeriodCode="")
											Gen_Confirm("You cannot enter an invoice with no accounting period"; "Retry"; "Stop")
											If (OK=0)
												$_bo_Stop:=True:C214
											End if 
										End if 
									Until (INV_t_SetPeriodCode#"") | ($_bo_Stop)
									Check_PerCloseI
									INV_bo_PeriodSet:=True:C214
									INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
									If (INV_t_SetPeriodCode#"")
										ADD RECORD:C56([INVOICES:39]; *)
										If (OK=1)
											Transact_End
											ADD TO SET:C119([INVOICES:39]; "$RecordsAdded")
										Else 
											Transact_End
											$_bo_Stop:=True:C214
										End if 
									Else 
										Transact_End
										$_bo_Stop:=True:C214
									End if 
								Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
								If ($_bo_OpenWindow)
									If ($_t_CloseReference="")
										Close_ProWin
									Else 
										Close_ProWin($_t_CloseReference)
									End if 
								End if 
								If (Current process:C322#$_l_CallBackProcessID)
									//Need to send added records back to the process
								Else 
									
									//need to add added records to the selection
									USE NAMED SELECTION:C332("$CurrentSelection")
									CREATE SET:C116([INVOICES:39]; "$CurrentSet")
									UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
									USE SET:C118("$CurrentSet")
									
								End if 
								
							End if 
						End if 
					End if 
				: (PUR_t_PurchaseEntryType="Proforma") | (PUR_t_PurchaseEntryType="View Proformas")
					INV_t_SetPeriodCode:=""
					$_t_AddTypeName:="Enter Adhoc Proformas"
					If ($_bo_UseBatchedEntry)
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Proformas")
					Else 
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Proforma")
					End if 
					If (Invoices_File)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							If (In_Allowed($_t_AddTypeName; ->[INVOICES:39]))
								$_l_RecordsCount:=0
								$_bo_Stop:=False:C215
								CREATE EMPTY SET:C140([INVOICES:39]; "$RecordsAdded")
								$_bo_WindowIsOpen:=False:C215
								Repeat 
									$_l_RecordsCount:=$_l_RecordsCount+1
									vFromIn:=False:C215  //need to set this more dynamically!!
									//COM_bo_AddingCompany:=True
									REDUCE SELECTION:C351([INVOICES:39]; 0)
									If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
										Open_Pro_Window($_t_AddTypeName; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
										$_bo_WindowIsOpen:=True:C214
									Else 
										$_t_WindowTitle:=Get window title:C450
										If ($_bo_UseBatchedEntry)
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Proformas"))
											
										Else 
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Proforma"))
										End if 
										
									End if 
									GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
									$_t_CloseReference:=Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
									StartTransaction  // 13/05/02 pb
									Repeat 
										$_bo_Stop:=False:C215
										$_l_PeriodID:=Check_Period(Current date:C33(*))
										Check_PerCloseI
										INV_bo_PeriodSet:=True:C214
										INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
										If (INV_t_SetPeriodCode="")
											Gen_Confirm("You cannot enter an invoice with no accounting period"; "Retry"; "Stop")
											If (OK=0)
												$_bo_Stop:=True:C214
											End if 
										End if 
									Until (INV_t_SetPeriodCode#"") | ($_bo_Stop)
									Check_PerCloseI
									INV_bo_PeriodSet:=True:C214
									INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
									$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
									DB_t_CurrentFormUsage2:="Proforma"
									If (INV_t_SetPeriodCode#"")
										
										ADD RECORD:C56([INVOICES:39]; *)
										
										If (OK=1)
											Transact_End
											ADD TO SET:C119([INVOICES:39]; "$RecordsAdded")
										Else 
											Transact_End
											$_bo_Stop:=True:C214
										End if 
									Else 
										Transact_End
										$_bo_Stop:=True:C214
									End if 
								Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
								DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
								If ($_bo_OpenWindow)
									If ($_t_CloseReference="")
										Close_ProWin
									Else 
										Close_ProWin($_t_CloseReference)
									End if 
								End if 
								If (Current process:C322#$_l_CallBackProcessID)
									//Need to send added records back to the process
								Else 
									
									//need to add added records to the selection
									USE NAMED SELECTION:C332("$CurrentSelection")
									CREATE SET:C116([INVOICES:39]; "$CurrentSet")
									UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
									USE SET:C118("$CurrentSet")
									
								End if 
								
							End if 
						End if 
					End if 
				: (PUR_t_PurchaseEntryType="Deposit") | (PUR_t_PurchaseEntryType="View Deposits")
					If (Invoices_File)
						
						If (vIn=1)
							QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
							
							If ((DB_GetLedgerTRANSDeposit#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
								$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
								If ($_bo_UseBatchedEntry)
									$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_DepositReceipts")
								Else 
									$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_DepositReceipts")
								End if 
								FORM SET INPUT:C55([INVOICES:39]; "Invoice_inP")  //NG April 2004 removed reference to ◊screen
								WIN_t_CurrentInputForm:="Invoice_inP"  //Added NG May 2004
								
								$_bo_InTransaction:=True:C214
								
								$_l_RecordsCount:=0
								$_bo_Stop:=False:C215
								CREATE EMPTY SET:C140($_ptr_Table->; "$RecordsAdded")
								$_bo_WindowIsOpen:=False:C215
								$_ptr_Table:=->[INVOICES:39]
								Repeat 
									
									GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
									
									If ($_bo_InTransaction)
										StartTransaction
									End if 
									$_l_RecordsCount:=$_l_RecordsCount+1
									REDUCE SELECTION:C351($_ptr_Table->; 0)
									$_t_WindowTitle:=""
									FORM SET INPUT:C55($_ptr_Table->; WIN_t_CurrentInputForm)
									If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
										If ($_bo_UseBatchedEntry)
											Open_Pro_Window(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
										Else 
											Open_Pro_Window(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
										End if 
										$_bo_WindowIsOpen:=True:C214
									Else 
										$_t_WindowTitle:=Get window title:C450
										If ($_bo_UseBatchedEntry)
											//SET WINDOW TITLE(Get localized string("MenuItem_Enter")+" "+$_t_Plural)
											
										Else 
											//SET WINDOW TITLE(Get localized string("MenuItem_Enter")+" "+$_t_SingleDisassembly)
										End if 
									End if 
									
									$_t_CloseReference:=""  //added NG may 2004
									ADD RECORD:C56($_ptr_Table->; *)
									If (OK=1)
										Inv_DepPost
										If ($_bo_InTransaction)
											Transact_End
										End if 
										ADD TO SET:C119([INVOICES:39]; "$RecordsAdded")
										If (SD_l_ParentProcess>0)
											$_l_ButtonClickedFunction:=DB_GetButtonFunction("ReloadAuths")
											SET PROCESS VARIABLE:C370(SD_l_PARENTPROCESS; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
											POST OUTSIDE CALL:C329(SD_l_ParentProcess)
											Repeat 
												GET PROCESS VARIABLE:C371(SD_l_PARENTPROCESS; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
											Until ($_l_ButtonClickedFunction=0)
											
										End if 
									Else 
										If ($_bo_InTransaction)
											Transact_End
										End if 
										$_bo_Stop:=True:C214
										OK:=1
									End if 
									
									$_t_CloseReference:=Table name:C256($_ptr_Table)+"_"+WIN_t_CurrentInputForm
									If (False:C215)
										If (Count parameters:C259>=4)
											If ($_l_CallBackProcessID>0)
												SET PROCESS VARIABLE:C370($_l_CallBackProcessID; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Auto Print"))
												POST OUTSIDE CALL:C329($_l_CallBackProcessID)
											End if 
										End if 
									End if 
								Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
								If ($_bo_OpenWindow)
									If ($_t_CloseReference="")
										Close_ProWin
									Else 
										Close_ProWin($_t_CloseReference)
									End if 
								Else 
									SET WINDOW TITLE:C213($_t_WindowTitle)
								End if 
								If (Current process:C322#$_l_CallBackProcessID)
									//Need to send added records back to the process
								Else 
									
									//need to add added records to the selection
									USE NAMED SELECTION:C332("$CurrentSelection")
									CREATE SET:C116($_ptr_Table->; "$CurrentSet")
									UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
									USE SET:C118("$CurrentSet")
									
								End if 
								
								$_t_Plural:=Get localized string:C991("MenuItem_Deposits")
								$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Deposit")
								
							End if 
						End if 
					End if 
				: (PUR_t_PurchaseEntryType="Receipt")
				: (PUR_t_PurchaseEntryType="CreditNote") | (PUR_t_PurchaseEntryType="ViewCreditnotes") | (PUR_t_PurchaseEntryType="View Credit notes")
					//This is the equivalent of ZInvoices_InCr
					INV_t_SetPeriodCode:=""
					$_t_AddTypeName:=Get localized string:C991("MenuItem_EnterCreditNote")
					
					If ($_bo_UseBatchedEntry)
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdhocCreditNotes")
					Else 
						$_t_AddTypeName:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdhocCreditNote")
					End if 
					$_t_AddTypeName:=Term_SLPLWT($_t_AddTypeName)
					If (Invoices_File)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							If (In_Allowed($_t_AddTypeName; ->[INVOICES:39]))
								$_l_RecordsCount:=0
								$_bo_Stop:=False:C215
								CREATE EMPTY SET:C140([INVOICES:39]; "$RecordsAdded")
								$_bo_WindowIsOpen:=False:C215
								Repeat 
									$_l_RecordsCount:=$_l_RecordsCount+1
									vFromIn:=False:C215  //need to set this more dynamically!!
									//COM_bo_AddingCompany:=True
									REDUCE SELECTION:C351([INVOICES:39]; 0)
									If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
										Open_Pro_Window($_t_AddTypeName; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
										$_bo_WindowIsOpen:=True:C214
									Else 
										$_t_WindowTitle:=Get window title:C450
										If ($_bo_UseBatchedEntry)
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdhocCreditNotes"))
											
										Else 
											SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_AdhocCreditNote"))
										End if 
										
									End if 
									GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
									$_t_CloseReference:=Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
									StartTransaction  // 13/05/02 pb
									Repeat 
										$_bo_Stop:=False:C215
										$_l_PeriodID:=Check_Period(Current date:C33(*))
										Check_PerCloseI
										INV_bo_PeriodSet:=True:C214
										INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
										If (INV_t_SetPeriodCode="")
											Gen_Confirm("You cannot enter a Credit with no accounting period"; "Retry"; "Stop")
											If (OK=0)
												$_bo_Stop:=True:C214
											End if 
										End if 
									Until (INV_t_SetPeriodCode#"") | ($_bo_Stop)
									Check_PerCloseI
									INV_bo_PeriodSet:=True:C214
									INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
									If (INV_t_SetPeriodCode#"")
										ADD RECORD:C56([INVOICES:39]; *)
										If (OK=1)
											Transact_End
											ADD TO SET:C119([INVOICES:39]; "$RecordsAdded")
										Else 
											Transact_End
											$_bo_Stop:=True:C214
										End if 
									Else 
										Transact_End
										$_bo_Stop:=True:C214
									End if 
								Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
								If ($_bo_OpenWindow)
									If ($_t_CloseReference="")
										Close_ProWin
									Else 
										Close_ProWin($_t_CloseReference)
									End if 
								End if 
								If (Current process:C322#$_l_CallBackProcessID)
									//Need to send added records back to the process
								Else 
									
									//need to add added records to the selection
									USE NAMED SELECTION:C332("$CurrentSelection")
									CREATE SET:C116([INVOICES:39]; "$CurrentSet")
									UNION:C120("$CurrentSet"; "$RecordsAdded"; "$CurrentSet")
									USE SET:C118("$CurrentSet")
									
								End if 
								
							End if 
						End if 
					End if 
					
					
					//: (PUR_t_PurchaseEntryType="Deposit")
			End case 
		: ($_l_TableToAddTo=Table:C252(->[JOB PERSONNEL:48]))
			//there never was a way to add job personnel from the menu-it was only within a job stage-and thats how it stays for the moment..
		: ($_l_TableToAddTo=Table:C252(->[JOB_TYPES:65]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Types_In"
			$_t_Plural:=Get localized string:C991("MenuItem_JobTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_JobType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[JOBS:26]))
			//The Jobs_In code has the ability to have parameters called note that
			If (Jobs_File)
				If (SD_t_InputFormName#"")
					FORM SET INPUT:C55([JOBS:26]; SD_t_InputFormName)
					WIN_t_CurrentInputForm:=SD_t_InputFormName
				End if 
				$_t_InputTestText:=""
				If ($_bo_UseBatchedEntry)
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Jobs")
				Else 
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Job")
				End if 
				$_bo_StandardCode:=True:C214
				WIN_t_CurrentInputForm:="Job_In"
				$_t_Plural:=Get localized string:C991("MenuItem_Jobs")
				$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Job")
			End if 
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
		: ($_l_TableToAddTo=Table:C252(->[LAYERS:76]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Layer_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Layers")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Layer")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[LOCATIONS:61]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Location_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Locations")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Location")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[SCRIPTS:80]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Scripts_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Scripts")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Script")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[MOVEMENT_TYPES:60]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="MoveType_in"
			$_t_Plural:=Get localized string:C991("MenuItem_MovementTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_MovementTypes")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[ORDER_ITEMS:25]))
		: ($_l_TableToAddTo=Table:C252(->[ORDERS:24]))
			//TRACE
			
			If (Count parameters:C259>=5)  //this can be set in the calling method or passed as $5
				ORD_T_OrderStateCode:=$5
				$_t_OrderState:="024"+ORD_T_OrderStateCode
				$_l_OrderStateRow:=Find in array:C230(<>SYS_at_RecStateCodes{24}; $_t_OrderState)
				If ($_l_OrderStateRow>0)
					ORD_T_OrderStateCode:=<>SYS_at_RecStateCodes{24}{$_l_OrderStateRow}
				Else 
					$_t_StateType:=Replace string:C233(ORD_T_OrderStateCode; "View "; "")
					Case of 
						: ($_t_StateType=Get localized string:C991("MenuItem_Enquiry"))
							ORD_T_OrderStateCode:=<>SYS_at_RecStateCodes{24}{1}
						: ($_t_StateType=Get localized string:C991("MenuItem_Quotation"))
							ORD_T_OrderStateCode:=<>SYS_at_RecStateCodes{24}{2}
					End case 
				End if 
				
			End if 
			FORM SET INPUT:C55([ORDERS:24]; "Order_In")  //NG April 2004 Removed ◊Screen
			WIN_t_CurrentInputForm:="Order_In"
			
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				If (ORD_T_OrderStateCode="")
					//ORD_T_OrderStateCode:=
				End if 
				Case of 
					: (<>SYS_at_RecStateCodes{24}{1}=ORD_T_OrderStateCode)  //enquiry
						If (<>SYS_al_RecStateRestriction{24}{1}%2=1)
							$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Enquiries))
							Case of 
								: ($_l_ModuleAccess<2)
									Gen_Alert("You do not have access to the Enquiries Module"; "Cancel")
								: ($_l_ModuleAccess#3)
									READ WRITE:C146([ORDERS:24])
									READ WRITE:C146([ORDER_ITEMS:25])
									$_t_InputTestText:=""
									If ($_bo_UseBatchedEntry)
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 35)
										//$_t_InputTestText:=Get localized string("MenuItem_Enter")+" "+Get localized string("MenuItem_Enquiries")
									Else 
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 35)
										//$_t_InputTestText:=Get localized string("MenuItem_Enter")+" "+Get localized string("MenuItem_Enquiry")
									End if 
									DB_t_CurrentFormUsage:="inEAdd"
									$_bo_StandardCode:=True:C214
									WIN_t_CurrentInputForm:="Order_In"
									$_t_Plural:=Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 35)
									$_t_SingleDisassembly:=Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 35)
							End case 
						Else 
							Gen_Alert("You do not have access to enter "+<>SYS_at_RecStateNames{24}{1}; "Cancel")
						End if 
						
					: (<>SYS_at_RecStateCodes{24}{2}=ORD_T_OrderStateCode)  //Quotation
						If (<>SYS_al_RecStateRestriction{24}{2}%2=1)
							$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Enquiries))
							Case of 
								: ($_l_ModuleAccess<2)
									Gen_Alert("You do not have access to the Enquiries Module"; "Cancel")
								: ($_l_ModuleAccess#3)
									READ WRITE:C146([ORDERS:24])
									READ WRITE:C146([ORDER_ITEMS:25])
									$_t_InputTestText:=""
									If ($_bo_UseBatchedEntry)
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 35)
										//$_t_InputTestText:=Get localized string("MenuItem_Enter")+" "+Get localized string("MenuItem_Enquiries")
									Else 
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 35)
										//$_t_InputTestText:=Get localized string("MenuItem_Enter")+" "+Get localized string("MenuItem_Enquiry")
									End if 
									DB_t_CurrentFormUsage:="inQAdd"
									$_bo_StandardCode:=True:C214
									WIN_t_CurrentInputForm:="Order_In"
									$_t_Plural:=Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 35)
									$_t_SingleDisassembly:=Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 35)
							End case 
						Else 
							Gen_Alert("You do not have access to enter "+<>SYS_at_RecStateNames{24}{2}; "Cancel")
						End if 
					Else   //order
						If (<>SYS_al_RecStateRestriction{24}{3}%2=1)
							$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
							Case of 
								: ($_l_ModuleAccess<2)
									Gen_Alert("You do not have access to the Orders_Module"; "Cancel")
								: ($_l_ModuleAccess#3)
									READ WRITE:C146([ORDERS:24])
									READ WRITE:C146([ORDER_ITEMS:25])
									$_t_InputTestText:=""
									If ($_bo_UseBatchedEntry)
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 35)
									Else 
										$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 35)
									End if 
									DB_t_CurrentFormUsage:="InVAdd"
									$_bo_StandardCode:=True:C214
									WIN_t_CurrentInputForm:="Order_In"
									$_t_Plural:=Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 35)
									$_t_SingleDisassembly:=Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 35)
							End case 
						Else 
							Gen_Alert("You do not have access to enter "+<>SYS_at_RecStateNames{24}{3}; "Cancel")
						End if 
				End case 
			Else 
				Gen_Alert("Suitable Record States have not been defined"; "Cancel")
			End if 
		: ($_l_TableToAddTo=Table:C252(->[PRODUCT_GROUPS:10]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="ProductGroup_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Groups")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Group")
		: ($_l_TableToAddTo=Table:C252(->[PERSONNEL_GROUPS:92]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="PersonnelGroup_In"
			$_t_Plural:=Get localized string:C991("MenuItem_PersonnelGroups")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PersonnelGroup")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PERSONNEL:11]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Personnel_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Personnel")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Personnel")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PICTURES:85]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Picture_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Pictures")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Picture")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
		: ($_l_TableToAddTo=Table:C252(->[POSTAL_CODES:50]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="PostalCode_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Postcodes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PostCode")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PRICE_GROUPS:18]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="PriceGroup_In"
			$_t_Plural:=Get localized string:C991("MenuItem_PriceGroups")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PriceGroup")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PRICE_TABLE:28]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="PriceTable_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Prices")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Price")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PROBLEMS:22]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Problems_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Problems")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Problem")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[PRODUCTS:9]))
			ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
			
			
			
			FORM SET INPUT:C55([PRODUCTS:9]; "Products_in2009")
			WIN_t_CurrentInputForm:=SD_t_InputFormName
			
			$_t_InputTestText:=""
			If ($_bo_UseBatchedEntry)
				$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Products")
			Else 
				$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Product")
			End if 
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Products_in2009"
			$_t_Plural:=Get localized string:C991("MenuItem_Products")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Product")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)
			
		: ($_l_TableToAddTo=Table:C252(->[PROJECTS:89]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)
			
			FORM SET INPUT:C55([PROJECTS:89]; "Projects_In")  //NG April 2004 Removed ◊Screen
			
			If ($_l_ModuleAccess>=2)
				READ WRITE:C146([PROJECTS:89])
				READ WRITE:C146([JOBS:26])
				READ WRITE:C146([JOB PERSONNEL:48])
				READ WRITE:C146([JOB_STAGES:47])
				READ WRITE:C146([ORDER_ITEMS:25])
				$_t_InputTestText:=""
				If ($_bo_UseBatchedEntry)
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Projects")
				Else 
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Project")
				End if 
				$_bo_StandardCode:=True:C214
				WIN_t_CurrentInputForm:="Projects_In"
				$_t_Plural:=Get localized string:C991("MenuItem_Projects")
				$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Project")
			End if 
		: ($_l_TableToAddTo=Table:C252(->[PUBLICATIONS:52]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Public_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Publications")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Publication")
		: ($_l_TableToAddTo=Table:C252(->[PURCHASE_ORDERS:57]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
			//TRACE
			FORM SET INPUT:C55([PURCHASE_ORDERS:57]; "PurchaseOrder_In")  //NG April 2004 Removed ◊Screen
			WIN_t_CurrentInputForm:="PurchaseOrder_In"
			ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
			
			If ($_l_ModuleAccess>=2)
				If ($_bo_UseBatchedEntry)
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseOrders")
				Else 
					$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseOrder")
				End if 
				$_bo_InTransaction:=True:C214
				$_bo_StandardCode:=True:C214
				WIN_t_CurrentInputForm:="PurchaseOrder_In"
				$_t_Plural:=Get localized string:C991("MenuItem_PurchaseOrders")
				$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PurchaseOrder")
			End if 
		: ($_l_TableToAddTo=Table:C252(->[PURCHASE_INVOICES:37]))
			If (Count parameters:C259>=5)
				PUR_t_PurchaseEntryType:=$5
			End if 
			If (PUR_t_PurchaseEntryType="")
				PUR_t_PurchaseEntryType:="Purchase Invoice"
			End if 
			Case of 
				: (PUR_t_PurchaseEntryType="Purchase Invoice")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
					FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")  //NG April 2004 Removed ◊Screen
					WIN_t_CurrentInputForm:="Purchases_in"
					ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
					If ($_l_ModuleAccess>=2)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSPURpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							$_bo_UseTransType:=True:C214
							If ($_bo_UseBatchedEntry)
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")
							Else 
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseInvoice")
							End if 
							$_bo_InTransaction:=True:C214
							$_bo_StandardCode:=True:C214
							
							$_t_Plural:=Get localized string:C991("MenuItem_PurchaseInvoices")
							$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PurchaseInvoice")
							If ((DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=4))
								$_t_PostProcessingMethod:="Purch_InvJobs"
							End if 
							
						End if 
					End if 
				: (PUR_t_PurchaseEntryType="Purchase Credit") | (PUR_t_PurchaseEntryType="CreditNote")
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
					FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")  //NG April 2004 Removed ◊Screen
					WIN_t_CurrentInputForm:="Purchases_in"
					ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
					If ($_l_ModuleAccess>=2)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSPURpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							$_bo_UseTransType:=True:C214
							If ($_bo_UseBatchedEntry)
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseCredits")
								$_t_InputTestText:=Term_SLPLWT($_t_InputTestText)
							Else 
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchaseCredit")
								$_t_InputTestText:=Term_SLPLWT($_t_InputTestText)
							End if 
							$_bo_InTransaction:=True:C214
							$_bo_StandardCode:=True:C214
							DB_t_CurrentFormUsage:="CN"
							$_t_Plural:=Get localized string:C991("MenuItem_PurchaseCredits")
							$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PurchaseCredit")
							
							
						End if 
					End if 
				: (PUR_t_PurchaseEntryType="Purchase prepayment") | (PUR_t_PurchaseEntryType="PrePayment")  // ZPurchases_InP
					$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
					FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_inP")  //NG April 2004 Removed ◊Screen
					WIN_t_CurrentInputForm:="Purchases_inP"
					ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
					If ($_l_ModuleAccess>=2)
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay)
						$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
						If ((DB_GetLedgerTRANSPURPrePay#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							$_bo_UseTransType:=True:C214
							If ($_bo_UseBatchedEntry)
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchasePrepayments")
								$_t_InputTestText:=Term_SLPLWT($_t_InputTestText)
							Else 
								$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_PurchasePrepayment")
								$_t_InputTestText:=Term_SLPLWT($_t_InputTestText)
							End if 
							$_bo_InTransaction:=True:C214
							$_bo_StandardCode:=True:C214
							
							$_t_Plural:=Get localized string:C991("MenuItem_PurchasePrepayments")
							$_t_SingleDisassembly:=Get localized string:C991("MenuItem_PurchasePrepayment")
							
						End if 
					End if 
					
					
			End case 
		: ($_l_TableToAddTo=Table:C252(->[RECURRING_JOURNALS:38]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Standing_In"
			$_t_Plural:=Get localized string:C991("MenuItem_RecurJournals")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_RecurJournal")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
			
		: ($_l_TableToAddTo=Table:C252(->[RESULTS:14]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Results_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Results")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Result")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[ROLES:87]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Roles_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Roles")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Role")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[SERVICE_CALLS:20]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Calls_in"
			READ WRITE:C146([ORDER_ITEMS:25])
			$_t_Plural:=Get localized string:C991("MenuItem_ServiceCalls")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_ServiceCall")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)
			
		: ($_l_TableToAddTo=Table:C252(->[SOLUTIONS:23]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Solutions_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Solutions")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Solution")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[SOURCES:6]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Sources_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Sources")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Source")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[STAGES:45]))  //job stage types
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Stages_in"
			$_t_Plural:=Get localized string:C991("MenuItem_JobStageTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_JobStageType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[STATUS:4]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Status_in"
			$_t_Plural:=Get localized string:C991("MenuItem_StockTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[STOCK_MOVEMENTS:40]))
			FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_in")  //NG April 2004 removed reference to ◊screen
			WIN_t_CurrentInputForm:="Movements_in"
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
			$_t_EntryType:=""
			If (($_l_ModuleAccess>1) & ($_l_ModuleAccess#3))
				If (Count parameters:C259>=5)
					$_t_EntryType:=$5
				End if 
				If ($_t_EntryType#"")
					Case of 
						: ($_t_EntryType="Assembly")  //in this we create a stock movement but the entry is stock ITEMS
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
							If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
								$_bo_Continue:=True:C214
								If ($_bo_UseBatchedEntry)
									$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockAssemblies")
									$_t_Plural:=Get localized string:C991("MenuItem_StockAssemblies")
								Else 
									$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockAssembly")
									$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockAssembly")
								End if 
								$_bo_InTransaction:=True:C214
								$_bo_StandardCode:=False:C215
								FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "StockAss_in")
								WIN_t_CurrentInputForm:="StockAss_in"
								Repeat 
									READ WRITE:C146([STOCK_MOVEMENTS:40])
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									StartTransaction  // 13/05/02 pb
									CREATE RECORD:C68([STOCK_MOVEMENTS:40])
									[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
									[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
									Move_InLPBDef
									Move_InType
									ADD RECORD:C56([STOCK_MOVEMENT_ITEMS:27]; *)
									If (OK=1)
										$_r_StockMovementQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										If ((OK=1) & ($_r_StockMovementQuantity>0) & (vSNo>0))  //VsNo=number available(from current stock of product?)
											
											$_t_StockMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
											$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
											$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
											$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
											$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
											$_d_StockMovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
											$_l_StockAllocationLevel:=1
											$_r_StockAllocationTotalCost:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
											DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
											$_t_CallCode:=""
											//The product used class should be checked
											QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$_t_ProductCode)
											$_r_AssemblyCanBuildQuantity:=StockAss_Movt($_r_StockMovementQuantity; $_t_ProductCode; $_l_StockAllocationLevel; $_r_StockAllocationTotalCost; $_t_StockMovementType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_d_StockMovementDate; $_t_CallCode)
											
											
										Else 
											OK:=0
										End if 
										
									End if 
									Transact_End
								Until ((OK=0) | (DB_t_CallOnCloseorSave="Close") | (Not:C34($_bo_UseBatchedEntry)))
								
								
							Else 
								Gen_Alert("No Movement Type has been specified as being used for Assembly"; "Cancel")
							End if 
						: ($_t_EntryType="Disassembly")  //in this we create a stock movement but the entry is stock ITEMS
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
							If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
								$_bo_Continue:=True:C214
								If ($_bo_UseBatchedEntry)
									$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockDisassemblies")
									$_t_Plural:=Get localized string:C991("MenuItem_StockDisassemblies")
								Else 
									$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockDisassembly")
									$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockDisassembly")
								End if 
								$_bo_InTransaction:=True:C214
								$_bo_StandardCode:=False:C215
								FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "dStockAss_Dis")
								WIN_t_CurrentInputForm:="dStockAss_Dis"
								Repeat 
									READ WRITE:C146([STOCK_MOVEMENTS:40])
									READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
									StartTransaction  // 13/05/02 pb
									CREATE RECORD:C68([STOCK_MOVEMENTS:40])
									[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
									[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
									Move_InLPBDef
									Move_InType
									ADD RECORD:C56([STOCK_MOVEMENT_ITEMS:27]; *)
									If (OK=1)
										$_r_StockMovementQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										If ((OK=1) & ($_r_StockMovementQuantity>0) & (vSNo>0))  //VsNo=number available(from current stock of product?)
											
											$_t_StockMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
											$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
											$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
											$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
											$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
											$_d_StockMovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
											$_l_StockAllocationLevel:=1
											$_r_StockAllocationTotalCost:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
											DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
											$_t_CallCode:=""
											//The product used class should be checked
											Gen_Alert("THIS FUNCTION COULD NOT BE READILY REWRITTEN IT HAS AN ERROR I THINK!")
											
											Else acc_ba
											
											OK:=0
										End if 
										
									End if 
									Transact_End
								Until ((OK=0) | (DB_t_CallOnCloseorSave="Close") | (Not:C34($_bo_UseBatchedEntry)))
								
								
							Else 
								Gen_Alert("No Movement Type has been specified as being used for Disassembly"; "Cancel")
							End if 
					End case 
				Else 
					$_bo_Continue:=True:C214
					If ($_bo_UseBatchedEntry)
						$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockMovements")
					Else 
						$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_StockMovement")
					End if 
					$_t_Plural:=Get localized string:C991("MenuItem_StockMovements")
					$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockMovement")
					If ($_bo_Continue)
						If ($_l_ModuleAccess>=2)
							$_bo_InTransaction:=True:C214
							$_bo_StandardCode:=True:C214
							WIN_t_CurrentInputForm:="Movements_in"
							$_t_Plural:=Get localized string:C991("MenuItem_StockMovements")
							$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockMovement")
						End if 
					Else 
						$_bo_StandardCode:=False:C215
					End if 
				End if 
			Else 
			End if 
		: ($_l_TableToAddTo=Table:C252(->[STOCK_TYPES:59]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="StockTypes_in"
			$_t_Plural:=Get localized string:C991("MenuItem_StockTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_StockType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[SUBSCRIPTIONS:93]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)
			If (Count parameters:C259>=5)
				Case of 
					: ($5="Billing")
						//currently these can only be 'added' throught orders
						$_bo_StandardCode:=True:C214
						SUBS_l_PageNumber:=1
						WIN_t_CurrentInputForm:="Subs_In"
						$_t_Plural:=Get localized string:C991("MenuItem_Billing")
						$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Billing")
						
					: ($5="Renewals")
						//currently these can only be 'added' throught orders
						$_bo_StandardCode:=True:C214
						SUBS_l_PageNumber:=2
						WIN_t_CurrentInputForm:="Subs_In"
						$_t_Plural:=Get localized string:C991("MenuItem_Billing")
						$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Billing")
				End case 
			End if 
		: ($_l_TableToAddTo=Table:C252(->[TAX_CODES:35]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Vat_in"
			$_t_Plural:=Get localized string:C991("MenuItem_TaxCodes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_TaxCode")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[TERMINOLOGY:75]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Term_in"
			$_t_Plural:=Get localized string:C991("MenuItem_Terminology")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Terminology")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[TRANSACTION_BATCHES:30]))
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
			If ($_l_ModuleAccess>0)
				vTr:=1
				ARRAY POINTER:C280(ACC_aptr_Transaction; 0)
				LBI_bo_RowDragged:=False:C215
				FORM SET INPUT:C55([TRANSACTION_BATCHES:30]; "TransB_in")  //NG April 2004 Removed ◊Screen
				WIN_t_CurrentInputForm:="TransB_in"
				If (vTr=1)
					If (DB_GetLedgerVatInputACC#"")
						If ($_bo_UseBatchedEntry)
							$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TransBatches")
						Else 
							$_t_InputTestText:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_TransBatch")
						End if 
						$_bo_InTransaction:=True:C214
						$_bo_StandardCode:=True:C214
						WIN_t_CurrentInputForm:="TransB_in"
						$_t_Plural:=Get localized string:C991("MenuItem_TransBatches")
						$_t_SingleDisassembly:=Get localized string:C991("MenuItem_TransBatch")
					Else 
						Gen_Alert("The VAT Return Account must first be specified in Preferences"; "Cancel")
					End if 
				End if 
			End if 
		: ($_l_TableToAddTo=Table:C252(->[TRANSACTION_TYPES:31]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="TransT_in"
			$_t_Plural:=Get localized string:C991("MenuItem_TransactionTypes")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_TransactionType")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[TRANSACTIONS:29]))
		: ($_l_TableToAddTo=Table:C252(->[TYPES:5]))  //company and contact types
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Types_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Types")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Type")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
		: ($_l_TableToAddTo=Table:C252(->[WORKFLOW_CONTROL:51]))
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Workflow_Control_In"
			$_t_Plural:=Get localized string:C991("MenuItem_Workflow")
			$_t_SingleDisassembly:=Get localized string:C991("MenuItem_Workflow")
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			$_obj_FormData:=New object:C1471("CallBackProcess"; Current process:C322)
			
			$_bo_UseDialog:=True:C214
		: ($_l_TableToAddTo=Table:C252(->[WORKFLOW_Campaign:209]))
			TRACE:C157
			$_bo_StandardCode:=True:C214
			WIN_t_CurrentInputForm:="Campaign_Entry"
			$_t_Plural:="Campaigns"
			$_t_SingleDisassembly:="Campaign"
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
			
			
			
	End case 
	If ($_bo_StandardCode)
		If ($_t_InputTestText="")
			$_t_InputTestText:="Add records"
		End if 
		If (In_Allowed($_t_InputTestText; $_ptr_Table; $_l_ModuleAccess))
			MOD_l_CurrentModuleAccess:=$_l_ModuleAccess
			$_l_RecordsCount:=0
			$_bo_Stop:=False:C215
			$_t_TableName:=Table name:C256($_ptr_Table)
			
			PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
			
			$_t_RecordsAddedSet:="$RA"+$_t_TableName+String:C10($_l_UniqueProcessID)
			CREATE EMPTY SET:C140($_ptr_Table->; $_t_RecordsAddedSet)
			$_bo_WindowIsOpen:=False:C215
			Repeat 
				If ($_bo_UseTransType)
					GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
				End if 
				If ($_bo_InTransaction)
					StartTransaction
				End if 
				$_l_RecordsCount:=$_l_RecordsCount+1
				REDUCE SELECTION:C351($_ptr_Table->; 0)
				$_t_WindowTitle:=""
				FORM SET INPUT:C55($_ptr_Table->; WIN_t_CurrentInputForm)
				If ($_bo_OpenWindow) & ($_bo_WindowIsOpen=False:C215)
					If ($_bo_UseBatchedEntry)
						Open_Pro_Window(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
					Else 
						Open_Pro_Window(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
					End if 
					$_bo_WindowIsOpen:=True:C214
					$_t_WindowTitle:=Get window title:C450
					If ($_bo_UseBatchedEntry)
						SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural)
						
					Else 
						SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly)
					End if 
				Else 
					$_t_WindowTitle:=Get window title:C450
					If ($_bo_UseBatchedEntry)
						SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_Plural)
						
					Else 
						SET WINDOW TITLE:C213(Get localized string:C991("MenuItem_Enter")+" "+$_t_SingleDisassembly)
					End if 
				End if 
				
				$_t_CloseReference:=""  //added NG may 2004
				READ WRITE:C146($_ptr_Table->)
				If ($_bo_UseDialog)
					DIALOG:C40($_ptr_Table->; WIN_t_CurrentInputForm; $_obj_FormData)
					
					
				Else 
					ADD RECORD:C56($_ptr_Table->; *)
				End if 
				If (OK=1)
					If ($_bo_InTransaction)
						Transact_End
					End if 
					TRACE:C157
					
					
					ADD TO SET:C119($_ptr_Table->; $_t_RecordsAddedSet)
					If ($_t_PostProcessingMethod#"")
						EXECUTE FORMULA:C63($_t_PostProcessingMethod)
						
					End if 
				Else 
					If ($_bo_InTransaction)
						Transact_End
					End if 
					$_bo_Stop:=True:C214
					OK:=1
				End if 
				$_t_CloseReference:=Table name:C256($_ptr_Table)+"_"+WIN_t_CurrentInputForm  //added NG may 2004
				
			Until ($_bo_Stop) | ($_bo_UseBatchedEntry=False:C215)
			If ($_bo_OpenWindow)
				If ($_t_CloseReference="")
					Close_ProWin
				Else 
					Close_ProWin($_t_CloseReference)
				End if 
			Else 
				SET WINDOW TITLE:C213($_t_WindowTitle)
			End if 
			If (Current process:C322#$_l_CallBackProcessID)
				//Need to send added records back to the process
				USE SET:C118($_t_RecordsAddedSet)
				CREATE SET:C116($_ptr_Table->; "◊TempSet")
				POST OUTSIDE CALL:C329($_l_CallBackProcessID)
				
			Else 
				
				//need to add added records to the selection
				USE NAMED SELECTION:C332("$CurrentSelection")
				CREATE SET:C116($_ptr_Table->; "$CurrentSet")
				UNION:C120("$CurrentSet"; $_t_RecordsAddedSet; "$CurrentSet")
				USE SET:C118("$CurrentSet")
				
			End if 
			
		End if 
	End if 
	MOD_l_CurrentModuleAccess:=$_l_ModuleAccessWas
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	Vadd:=$_l_AddMode
	WIN_t_CurrentInputForm:=$_t_CurrentInputForm
End if 
//Commentery


If ($_bo_StartProcess)
	Process_End
End if 
//
ERR_MethodTrackerReturn("DB_CreateNewRecord"; $_t_oldMethodName)
