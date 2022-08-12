//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EditDiaryRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2010 15:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($Ref3)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	ARRAY TEXT:C222($_at_SelectionCodes; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_rTableNames;0)
	C_BOOLEAN:C305($_bo_DoneItem; $_bo_NoRestrictions; $_bo_OK; $_bo_OpenRecord; $_bo_ShowSelection; SD2_bo_ActionsLoaded)
	C_LONGINT:C283($_l_CallBackProcess; $_l_NumberofRecords; $_l_ProcessID; $_l_ProcessState; $_l_ProcessTime; $_l_RestrictionsIndex; $_l_RestrictTableRow; $_l_SourceDataTable; $3; $DiaryIDToCheckForDeletion; SD_l_ProcID)
	C_LONGINT:C283(SD2_l_EventCall)
	C_TEXT:C284($_t_CalledFrom; $_t_FormReference; $_t_oldMethodName; $_t_ProcessName; $_t_SourceRecordCode; $_t_UseDiaryForm; $_t_WinCurrentInputForm; $1; $2; $4; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("SD2_EditDiaryRecord")
//NG this method will open a diary record in the appropriate form
//First we must check if the diary record should open the original record or the diary item
READ ONLY:C145([DIARY:12])
$_t_WinCurrentInputForm:=WIN_t_CurrentInputForm

If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		$_t_CalledFrom:=$2
	Else 
		$_t_CalledFrom:=""
	End if 
	If (Count parameters:C259>=3)
		$_l_CallBackProcess:=$3
	Else 
		$_l_CallBackProcess:=0
	End if 
	SD2_LoadDiaryFormNames
	If ([DIARY:12]Diary_Code:3#($1))
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$1)
	End if 
	$_t_UseDiaryForm:=[DIARY:12]xDiaryForm:66  //USE THE FORM DEFINED ON THE DIARY RECORD
	If ($_t_UseDiaryForm="")  //IF NO FORM ON THE DIARY RECORD USE THE 'PREFERENCE' FROM THE ACTION
		If ([DIARY:12]Action_Code:9#"")
			If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
			End if 
			SD2_ActionAttributesToArrays
			$_l_RestrictTableRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
			If ($_l_RestrictTableRow>0)
				$_t_UseDiaryForm:=SD2_at_ActionVirtFieldDataTXT{$_l_RestrictTableRow}
			End if 
			If ($_t_UseDiaryForm="Pagination")
				$_t_UseDiaryForm:=$4
			End if 
			
			
		End if 
	End if 
	If ($_t_UseDiaryForm="")
		If ($4#"")
			$_t_UseDiaryForm:=$4
		End if 
	End if 
	
	If ([DIARY:12]x_Open_Parent:69=1)  //don't open the diary=open the related record
		//Here find the KEY related record in that table
		$_l_SourceDataTable:=[DIARY:12]Data_Source_Table:49
		$_bo_ShowSelection:=False:C215
		ARRAY TEXT:C222($_at_SelectionCodes; 0)
		
		If ([DIARY:12]Data_Source_Table:49#0)
			QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
			QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=[DIARY:12]Data_Source_Table:49)
			Case of 
				: (Records in selection:C76([xDiaryRelations:137])=1)
					$_t_SourceRecordCode:=[xDiaryRelations:137]XRecord_Code:5
					QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_SourceRecordCode)
					
				: (Records in selection:C76([xDiaryRelations:137])=0)
					//`Maybe not--check if the Action is restricted for any tables
					If ([DIARY:12]Action_Code:9#"")
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
						SD2_ActionAttributesToArrays
						$_bo_OK:=False:C215
						$_l_RestrictTableRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
						ARRAY LONGINT:C221(SD2_al_rTableNUMs; 0)
						ARRAY TEXT:C222(SD2_at_rTableNames; 0)
						//If ($Ref3>0)
						If ($_l_RestrictTableRow>0)
							ARRAY LONGINT:C221(SD2_al_rTableNUMs; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
							ARRAY TEXT:C222(SD2_at_rTableNames; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
							For ($_l_RestrictionsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
								SD2_al_rTableNUMs{$_l_RestrictionsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}{$_l_RestrictionsIndex}
								If (SD2_al_rTableNUMs{$_l_RestrictionsIndex}>0)  //it should be but just in case
									If (Is table number valid:C999(SD2_al_rTableNUMs{$_l_RestrictionsIndex}))
										SD2_at_rTableNames{$_l_RestrictionsIndex}:=Table name:C256(Table:C252(SD2_al_rTableNUMs{$_l_RestrictionsIndex}))
									Else 
										SD2_at_rTableNames{$_l_RestrictionsIndex}:="UNKNOWN"
									End if 
									
								End if 
								
							End for 
							If (Size of array:C274(SD2_al_rTableNUMs)=0)
								$_bo_NoRestrictions:=True:C214
							End if 
						End if 
						
						///Else 
						//$_bo_NoRestrictions:=True  //action not set up so we are guessing
						//End if 
						
					Else 
						$_bo_NoRestrictions:=True:C214
					End if 
					
					
					
					Case of 
						: ([DIARY:12]Company_Code:1#"") & ((($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[COMPANIES:2]))>0))) | ($_l_SourceDataTable=Table:C252(->[COMPANIES:2]))
							//company code is not empty and either companies is in the restriction or there are no restrictions
							//this means that an action can be restricted to companies so it always opens a company etc
							$_t_SourceRecordCode:=[DIARY:12]Company_Code:1
							$_l_SourceDataTable:=Table:C252(->[COMPANIES:2])
						: ([DIARY:12]Contact_Code:2#"") & ((($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[CONTACTS:1]))>0))) | ($_l_SourceDataTable=Table:C252(->[CONTACTS:1]))
							$_t_SourceRecordCode:=[DIARY:12]Contact_Code:2
							$_l_SourceDataTable:=Table:C252(->[CONTACTS:1])
						: ([DIARY:12]Call_Code:25#"") & ((($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[SERVICE_CALLS:20]))>0))) | ($_l_SourceDataTable=Table:C252(->[SERVICE_CALLS:20]))
							$_t_SourceRecordCode:=[DIARY:12]Call_Code:25
							$_l_SourceDataTable:=Table:C252(->[SERVICE_CALLS:20])
							
						: ([DIARY:12]Job_Code:19#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[JOBS:26]))>0)) | ($_l_SourceDataTable=Table:C252(->[JOBS:26]))
							$_t_SourceRecordCode:=[DIARY:12]Job_Code:19
							$_l_SourceDataTable:=Table:C252(->[JOBS:26])
						: ([DIARY:12]Order_Code:26#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[ORDERS:24]))>0)) | ($_l_SourceDataTable=Table:C252(->[ORDERS:24]))
							$_t_SourceRecordCode:=[DIARY:12]Order_Code:26
							$_l_SourceDataTable:=Table:C252(->[ORDERS:24])
						: ([DIARY:12]Stage_Code:21#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[JOB_STAGES:47]))>0)) | ($_l_SourceDataTable=Table:C252(->[JOB_STAGES:47]))
							$_t_SourceRecordCode:=[DIARY:12]Stage_Code:21
							$_l_SourceDataTable:=Table:C252(->[JOB_STAGES:47])
						: ([DIARY:12]Product_Code:13#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[PRODUCTS:9]))>0)) | ($_l_SourceDataTable=Table:C252(->[PRODUCTS:9]))
							$_t_SourceRecordCode:=[DIARY:12]Product_Code:13
							$_l_SourceDataTable:=Table:C252(->[PRODUCTS:9])
					End case 
					
					
				: (Records in selection:C76([xDiaryRelations:137])>1)
					//this may be for displaying a seleciton of records
					$_bo_ShowSelection:=True:C214
					SELECTION TO ARRAY:C260([xDiaryRelations:137]XRecord_Code:5; $_at_SelectionCodes)
					QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_SelectionCodes)
					
			End case 
		Else 
			//into guessing then
			//`Maybe not--check if the Action is restricted for any tables
			If ([DIARY:12]Action_Code:9#"")
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				SD2_ActionAttributesToArrays
				$_bo_OK:=False:C215
				$_l_RestrictTableRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
				ARRAY LONGINT:C221(SD2_al_rTableNUMs; 0)
				ARRAY TEXT:C222(SD2_at_rTableNames; 0)
				If ($Ref3>0)
					If ($_l_RestrictTableRow>0)
						ARRAY LONGINT:C221(SD2_al_rTableNUMs; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
						ARRAY TEXT:C222(SD2_at_rTableNames; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
						For ($_l_RestrictionsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
							SD2_al_rTableNUMs{$_l_RestrictionsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}{$_l_RestrictionsIndex}
							If (SD2_al_rTableNUMs{$_l_RestrictionsIndex}>0)  //it should be but just in case
								SD2_at_rTableNames{$_l_RestrictionsIndex}:=Table name:C256(Table:C252(SD2_al_rTableNUMs{$_l_RestrictionsIndex}))
								
							End if 
							
						End for 
						If (Size of array:C274(SD2_al_rTableNUMs)=0)
							$_bo_NoRestrictions:=True:C214
						End if 
					End if 
					
				Else 
					$_bo_NoRestrictions:=True:C214  //action not set up so we are guessing
				End if 
				
			Else 
				$_bo_NoRestrictions:=True:C214
			End if 
			
			
			
			Case of 
				: ([DIARY:12]Company_Code:1#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[COMPANIES:2]))>0))
					//company code is not empty and either companies is in the restriction or there are no restrictions
					//this means that an action can be restricted to companies so it always opens a company etc
					$_t_SourceRecordCode:=[DIARY:12]Company_Code:1
					$_l_SourceDataTable:=Table:C252(->[COMPANIES:2])
				: ([DIARY:12]Contact_Code:2#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[CONTACTS:1]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Contact_Code:2
					$_l_SourceDataTable:=Table:C252(->[CONTACTS:1])
					
				: ([DIARY:12]Call_Code:25#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[SERVICE_CALLS:20]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Call_Code:25
					$_l_SourceDataTable:=Table:C252(->[SERVICE_CALLS:20])
					
				: ([DIARY:12]Job_Code:19#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[JOBS:26]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Job_Code:19
					$_l_SourceDataTable:=Table:C252(->[JOBS:26])
				: ([DIARY:12]Order_Code:26#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[ORDERS:24]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Order_Code:26
					$_l_SourceDataTable:=Table:C252(->[ORDERS:24])
				: ([DIARY:12]Stage_Code:21#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[JOB_STAGES:47]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Stage_Code:21
					$_l_SourceDataTable:=Table:C252(->[JOB_STAGES:47])
				: ([DIARY:12]Product_Code:13#"") & (($_bo_NoRestrictions) | (Find in array:C230(SD2_al_rTableNUMs; Table:C252(->[PRODUCTS:9]))>0))
					$_t_SourceRecordCode:=[DIARY:12]Product_Code:13
					$_l_SourceDataTable:=Table:C252(->[PRODUCTS:9])
			End case 
			
			
		End if 
		$_bo_OpenRecord:=False:C215
		If ($_l_SourceDataTable>0) & ($_t_SourceRecordCode#"")
			$_l_ProcessID:=0
			Case of 
				: ($_l_SourceDataTable=Table:C252(->[ACCOUNTS:32]))
					//DBI_MenuDisplayRecords ("Accounts";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					UNLOAD RECORD:C212([ACCOUNTS:32])
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Account"; Current process:C322; Table:C252(->[ACCOUNTS:32]); ""; $_t_SourceRecordCode)
					
					//ZAccounts_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested
					
				: ($_l_SourceDataTable=Table:C252(->[ACTIONS:13]))
					//DBI_MenuDisplayRecords ("Actions";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Account"; Current process:C322; Table:C252(->[ACTIONS:13]); ""; $_t_SourceRecordCode)
					
					//ZActions_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
				: ($_l_SourceDataTable=Table:C252(->[ANALYSES:36]))
					//DBI_MenuDisplayRecords ("Analyses";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					
					
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Analysis"; Current process:C322; Table:C252(->[ANALYSES:36]); ""; $_t_SourceRecordCode)
					
					
				: ($_l_SourceDataTable=Table:C252(->[AREAS:3]))
					//DBI_MenuDisplayRecords ("Areas";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					
					//Tested
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Area"; Current process:C322; Table:C252(->[AREAS:3]); ""; $_t_SourceRecordCode)
					
					
					
					
				: ($_l_SourceDataTable=Table:C252(->[PRODUCT_BRANDS:8]))
					//DBI_MenuDisplayRecords ("Brands";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Area"; Current process:C322; Table:C252(->[PRODUCT_BRANDS:8]); ""; $_t_SourceRecordCode)
					
				: ($_l_SourceDataTable=Table:C252(->[CATALOGUE:108]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[TIME_BILLING_CATEGORIES:46]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[CODE_USES:91]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[COMPANIES:2]))
					//DBI_MenuDisplayRecords ("Companies";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; $_t_SourceRecordCode)
					
					//ZCompanies_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested
					
				: ($_l_SourceDataTable=Table:C252(->[COMPONENTS:86]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[CONTACTS:1]))
					//DBI_MenuDisplayRecords ("Contacts";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; $_t_SourceRecordCode)
					
					//Tested
					
				: ($_l_SourceDataTable=Table:C252(->[CONTRACT_TYPES:19]))
					//DBI_MenuDisplayRecords ("Contract Types";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Contract Type"; Current process:C322; Table:C252(->[CONTRACT_TYPES:19]); ""; $_t_SourceRecordCode)
					
					//`ZContTypes_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
				: ($_l_SourceDataTable=Table:C252(->[COUNTRIES:73]))
					//ZCountries_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Country"; Current process:C322; Table:C252(->[COUNTRIES:73]); ""; $_t_SourceRecordCode)
					
					//Tested
					
				: ($_l_SourceDataTable=Table:C252(->[CREDIT_STAGES:54]))
					//DBI_MenuDisplayRecords ("Credit Stages";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Credit Stage"; Current process:C322; Table:C252(->[CREDIT_STAGES:54]); ""; $_t_SourceRecordCode)
					
					
				: ($_l_SourceDataTable=Table:C252(->[CURRENCIES:71]))
					//DBI_MenuDisplayRecords ("Currencies";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Currency"; Current process:C322; Table:C252(->[CURRENCIES:71]); ""; $_t_SourceRecordCode)
					
					//ZCurrencies_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					//Tested
				: ($_l_SourceDataTable=Table:C252(->[CURRENCY_RATES:72]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[CURRENT_STOCK:62]))
					//DBI_MenuDisplayRecords ("Current Stock";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Current Stock"; Current process:C322; Table:C252(->[CURRENT_STOCK:62]); ""; $_t_SourceRecordCode)
					
					//`ZStockCurr_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					//Tested
				: ($_l_SourceDataTable=Table:C252(->[DOCUMENTS:7]))
					//DBI_MenuDisplayRecords ("DiaryDocument";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Document"; Current process:C322; Table:C252(->[DOCUMENTS:7]); ""; $_t_SourceRecordCode)
					
					//ZDiary_ModL ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					//Tested `Note that this opens a diary record that has a document linked to it
				: ($_l_SourceDataTable=Table:C252(->[PRODUCT_GROUPS:10]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[INVOICES:39]))
					//DBI_MenuDisplayRecords ("Invoices";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Invoice"; Current process:C322; Table:C252(->[INVOICES:39]); ""; $_t_SourceRecordCode)
					
					//ZInvoices_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
					
				: ($_l_SourceDataTable=Table:C252(->[JOB PERSONNEL:48]))
					//DBI_MenuDisplayRecords ("Job Personnel";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Job Personnel"; Current process:C322; Table:C252(->[JOB PERSONNEL:48]); ""; $_t_SourceRecordCode)
					
					
					
				: ($_l_SourceDataTable=Table:C252(->[JOB_STAGES:47]))
					//DBI_MenuDisplayRecords ("Job Stages";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Job Stage"; Current process:C322; Table:C252(->[JOB_STAGES:47]); ""; $_t_SourceRecordCode)
					
					
					
					
				: ($_l_SourceDataTable=Table:C252(->[JOBS:26]))
					//Actually change this to get the job class
					//DBI_MenuDisplayRecords ("Jobs";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "View Job"; Current process:C322; Table:C252(->[JOBS:26]); ""; $_t_SourceRecordCode)
					
					//DBI_MenuDisplayRecords ("Jobs";"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					//ZJobs_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
					
					
				: ($_l_SourceDataTable=Table:C252(->[LAYERS:76]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[LOCATIONS:61]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[ORDER_ITEMS:25]))
					
					//DBI_MenuDisplayRecords ("Order Items";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Order Item"; Current process:C322; Table:C252(->[ORDER_ITEMS:25]); ""; $_t_SourceRecordCode)
					
					
				: ($_l_SourceDataTable=Table:C252(->[ORDERS:24]))
					//ZOrders_View ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					//DBI_MenuDisplayRecords ("Orders";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; $_t_SourceRecordCode)
					
				: ($_l_SourceDataTable=Table:C252(->[PERIODS:33]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[PERSONNEL:11]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[PICTURES:85]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[PRICE_GROUPS:18]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[PRICE_TABLE:28]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[PROBLEMS:22]))  // Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[PRODUCTS:9]))
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Product"; Current process:C322; Table:C252(->[PRODUCTS:9]); ""; $_t_SourceRecordCode)
					//Tested
				: ($_l_SourceDataTable=Table:C252(->[PROJECTS:89]))
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Project"; Current process:C322; Table:C252(->[PROJECTS:89]); ""; $_t_SourceRecordCode)
					
					
				: ($_l_SourceDataTable=Table:C252(->[PUBLICATIONS:52]))  // Dont think we will be linking to these-left the door open for changes
					
				: ($_l_SourceDataTable=Table:C252(->[PURCHASE_ORDERS:57]))
					//DBI_MenuDisplayRecords ("Purchase Orders";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Purchase Order"; Current process:C322; Table:C252(->[PURCHASE_ORDERS:57]); ""; $_t_SourceRecordCode)
					
					//ZPurchOrd_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
					
				: ($_l_SourceDataTable=Table:C252(->[PURCHASE_INVOICES:37]))
					//DBI_MenuDisplayRecords ("Purchases";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Purchase Invoice"; Current process:C322; Table:C252(->[PURCHASE_INVOICES:37]); ""; $_t_SourceRecordCode)
					
					//ZPurchases_Mod ($_t_SourceRecordCode;"TRUE";->SD_l_ProcID)  ` Tested"
					
				: ($_l_SourceDataTable=Table:C252(->[RESULTS:14]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[ROLES:87]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[SERVICE_CALLS:20]))
					//◊CallCode:=$_t_SourceRecordCode
					//◊AutoFind:=True
					//DBI_MenuDisplayRecords ("Service Calls";Module_DiaryManager ;"";->$_t_SourceRecordCode;->SD_l_ProcID)
					SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Service Call"; Current process:C322; Table:C252(->[SERVICE_CALLS:20]); ""; $_t_SourceRecordCode)
					
					
				: ($_l_SourceDataTable=Table:C252(->[SOLUTIONS:23]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[SOURCES:6]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[STAGES:45]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[STATUS:4]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[STOCK_LEVELS:58]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[STOCK_MOVEMENTS:40]))
					
				: ($_l_SourceDataTable=Table:C252(->[STOCK_TYPES:59]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[SUBSCRIPTIONS:93]))
				: ($_l_SourceDataTable=Table:C252(->[TAX_CODES:35]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[TRANSACTION_BATCHES:30]))
					
				: ($_l_SourceDataTable=Table:C252(->[TIME_BUDGETS:49]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[TRANSACTIONS:29]))  //Dont think we will be linking to these-left the door open for changes
				: ($_l_SourceDataTable=Table:C252(->[TYPES:5]))  //Dont think we will be linking to these-left the door open for changes
					
					
			End case 
			$_l_ProcessID:=SD_l_ProcID
			If ($_l_ProcessID>0)
				//get the process state to check it did not close again(e.g. an error such as record not existing
				SD2_OpenDiaryInfoPallette($1; $_l_ProcessID)
				
			End if 
		Else 
			If ($_bo_ShowSelection)
			Else 
				$_bo_OpenRecord:=True:C214
			End if 
		End if 
		
	Else 
		//Open diary record
		$_bo_OpenRecord:=True:C214
		
		
	End if 
	If ($_bo_OpenRecord)
		
		If (Diary_File)  //NG modified June 2004
			If ($_t_UseDiaryForm="")
				
				Case of 
					: ($_t_CalledFrom="Schedule")
						FORM SET INPUT:C55([DIARY:12]; "SD2_DefScheduleEntry")
						WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"SD2_DefScheduleEntry"
					: ($_t_CalledFrom="Workflow")
						FORM SET INPUT:C55([DIARY:12]; "Diary_InNEW")
						WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
						
						
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"SD2_DefScheduleEntry"
					: ($_t_CalledFrom="TABS")
						FORM SET INPUT:C55([DIARY:12]; "Diary_InNEW")
						WIN_t_CurrentInputForm:="Diary_InNEW"
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"Diary_InNEW"
					Else 
						FORM SET INPUT:C55([DIARY:12]; "Diary_InNEW")
						WIN_t_CurrentInputForm:="Diary_InNEW"
						$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"Diary_InNEW"
				End case 
			Else 
				FORM SET INPUT:C55([DIARY:12]; $_t_UseDiaryForm)
				WIN_t_CurrentInputForm:=$_t_UseDiaryForm
				$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+$_t_UseDiaryForm
			End if 
			If ([DIARY:12]Action_Code:9="PDT")
				If (Count parameters:C259>=4)
					FORM SET INPUT:C55([DIARY:12]; $4)
					WIN_t_CurrentInputForm:=$4
				Else 
					FORM SET INPUT:C55([DIARY:12]; "Diary_PDTEditor")
					WIN_t_CurrentInputForm:="Diary_PDTEditor"
				End if 
			Else 
				
			End if 
			CREATE EMPTY SET:C140([DIARY:12]; "Dmaster")
			Open_Pro_Window("View Diary"; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
			
			If ($_l_CallBackProcess>0)
				
				$DiaryIDToCheckForDeletion:=[DIARY:12]x_ID:50
				//End if
			End if 
			//TRACE
			$_bo_DoneItem:=[DIARY:12]Done:14
			MODIFY RECORD:C57([DIARY:12]; *)
			If (Not:C34($_bo_DoneItem)) & ([DIARY:12]Done:14)
				//we have just 'done the action
				If ((DB_GetModuleSettingByNUM(Module_Sequences)>1))
					If (([DIARY:12]Action_Code:9#"") & ([DIARY:12]Result_Code:11#"") & (Records in table:C83([WORKFLOW_CONTROL:51])>0))
						
						DB_SaveRecord(->[DIARY:12])
						If (Count parameters:C259>=2)
							
							Diary_InLPASeq("LPA"; True:C214)
							
						Else 
							Diary_InLPASeq("LPA")
						End if 
					End if 
				End if 
			End if 
			If ($_l_CallBackProcess>0)
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_NumberofRecords)
				QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$DiaryIDToCheckForDeletion)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_NumberofRecords=0)
					PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState>=0)
						SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_l_EventCall; 14)  //kmw, 26/06/08 - I have arbitrarily picked the number 14 as the event number. At time of writing the only other number being used in the method being called is 13 (actually, for all I know 13 is not even being called from anywhere). Anyway, I'm not sure if diary "event call" numbers have any special significance/naming convention but if so this line may need to be updated for clarity. If so please also remember to update in the method being called and bear in mind any requirements specific to this particular call.
						POST OUTSIDE CALL:C329($_l_CallBackProcess)
					End if 
				End if 
				//End if
			End if 
			
			//
		End if 
		
		
		UNLOAD RECORD:C212([DIARY:12])
		READ ONLY:C145([DIARY:12])
		
	End if 
End if 
WIN_t_CurrentInputForm:=$_t_WinCurrentInputForm
ERR_MethodTrackerReturn("SD2_EditDiaryRecord"; $_t_oldMethodName)
