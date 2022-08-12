//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormLayout
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/04/2010 20:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_SelectededFromInvDate; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(PRD_abo_Expanded;0)
	//ARRAY BOOLEAN(STG_abo_StageFromiDate;0)
	//ARRAY INTEGER(STG_al_LEtterDays;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	ARRAY LONGINT:C221($_al_ActionIDs; 0)
	ARRAY LONGINT:C221($_al_LetterDays; 0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_DocIncludes;0)
	//ARRAY LONGINT(DB_al_TabIncludes;0)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY LONGINT(PRD_al_ProductID;0)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY LONGINT(STG_al_Selected;0)
	//ARRAY PICTURE(PRD_aPic_Expanded;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_AccBals;0)
	//ARRAY POINTER(DB_aptr_Accounts;0)
	//ARRAY POINTER(DB_aptr_Actions;0)
	//ARRAY POINTER(DB_aptr_AddrFormats;0)
	//ARRAY POINTER(DB_aptr_Analyses;0)
	//ARRAY POINTER(DB_aptr_Areas;0)
	//ARRAY POINTER(DB_aptr_Brands;0)
	//ARRAY POINTER(DB_aptr_Catagories;0)
	//ARRAY POINTER(DB_aptr_Catalogue;0)
	//ARRAY POINTER(DB_aptr_Companies;0)
	//ARRAY POINTER(DB_aptr_Contacts;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_Contracts;0)
	//ARRAY POINTER(DB_aptr_ContractTypes;0)
	//ARRAY POINTER(DB_aptr_Countries;0)
	//ARRAY POINTER(DB_aptr_Credits;0)
	//ARRAY POINTER(DB_aptr_CreditStages;0)
	//ARRAY POINTER(DB_aptr_Currencies;0)
	//ARRAY POINTER(DB_aptr_CurrentStock;0)
	//ARRAY POINTER(DB_aptr_Deposits;0)
	//ARRAY POINTER(DB_aptr_Documents;0)
	//ARRAY POINTER(DB_aptr_Enquiries;0)
	//ARRAY POINTER(DB_aptr_FieldDefs;0)
	//ARRAY POINTER(DB_aptr_Groups;0)
	//ARRAY POINTER(DB_aptr_Heading;0)
	//ARRAY POINTER(DB_aptr_Invoices;0)
	//ARRAY POINTER(DB_aptr_InvoicesItems;0)
	//ARRAY POINTER(DB_aptr_JobPers;0)
	//ARRAY POINTER(DB_aptr_Jobs;0)
	//ARRAY POINTER(DB_aptr_JobStages;0)
	//ARRAY POINTER(DB_aptr_JobTypes;0)
	//ARRAY POINTER(DB_aptr_Layers;0)
	//ARRAY POINTER(DB_aptr_Locations;0)
	//ARRAY POINTER(DB_aptr_Macros;0)
	//ARRAY POINTER(DB_aptr_MovementTypes;0)
	//ARRAY POINTER(DB_aptr_Orderitems;0)
	//ARRAY POINTER(DB_aptr_Orders;0)
	//ARRAY POINTER(DB_aptr_periods;0)
	//ARRAY POINTER(DB_aptr_PersonGroup;0)
	//ARRAY POINTER(DB_aptr_Personnel;0)
	//ARRAY POINTER(DB_aptr_Pictures;0)
	//ARRAY POINTER(DB_aptr_PostCodes;0)
	//ARRAY POINTER(DB_aptr_PriceGroups;0)
	//ARRAY POINTER(DB_aptr_PriceTable;0)
	//ARRAY POINTER(DB_aptr_Problems;0)
	//ARRAY POINTER(DB_aptr_Products;0)
	//ARRAY POINTER(DB_aptr_Proformas;0)
	//ARRAY POINTER(DB_aptr_Projects;0)
	//ARRAY POINTER(DB_aptr_Publications;0)
	//ARRAY POINTER(DB_aptr_PurchaseItems;0)
	//ARRAY POINTER(DB_aptr_PurchaseOrderItems;0)
	//ARRAY POINTER(DB_aptr_PurchaseOrders;0)
	//ARRAY POINTER(DB_aptr_Purchases;0)
	//ARRAY POINTER(DB_aptr_Quotations;0)
	//ARRAY POINTER(DB_aptr_Receipts;0)
	//ARRAY POINTER(DB_aptr_RecordJournals;0)
	//ARRAY POINTER(DB_aptr_RecTransactions;0)
	//ARRAY POINTER(DB_aptr_Results;0)
	//ARRAY POINTER(DB_aptr_Roles;0)
	//ARRAY POINTER(DB_aptr_ServiceCalls;0)
	//ARRAY POINTER(DB_aptr_Solutions;0)
	//ARRAY POINTER(DB_aptr_Sources;0)
	//ARRAY POINTER(DB_aptr_Stages;0)
	//ARRAY POINTER(DB_aptr_Status;0)
	//ARRAY POINTER(DB_aptr_StockITems;0)
	//ARRAY POINTER(DB_aptr_StockLevels;0)
	//ARRAY POINTER(DB_aptr_StockMovement;0)
	//ARRAY POINTER(DB_aptr_StockType;0)
	//ARRAY POINTER(DB_aptr_TaxCodes;0)
	//ARRAY POINTER(DB_aptr_Terminology;0)
	//ARRAY POINTER(DB_aptr_Transactions;0)
	//ARRAY POINTER(DB_aptr_TransIn;0)
	//ARRAY POINTER(DB_aptr_TransTypes;0)
	//ARRAY POINTER(DB_aptr_Types;0)
	//ARRAY POINTER(DB_aptr_Workflow;0)
	//ARRAY REAL(ACC_ar_Group1Totals;0)
	//ARRAY REAL(ACC_ar_Group2Totals;0)
	//ARRAY REAL(ACC_ar_Group3Totals;0)
	//ARRAY REAL(ACC_ar_Group4Totals;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_OrderStates; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SelectedStageCodes; 0)
	ARRAY TEXT:C222($_at_ValidStates; 0)
	//ARRAY TEXT(ACC_at_Group1;0)
	//ARRAY TEXT(ACC_at_Group1Codes;0)
	//ARRAY TEXT(ACC_at_Group2;0)
	//ARRAY TEXT(ACC_at_Group2Codes;0)
	//ARRAY TEXT(ACC_at_Group3;0)
	//ARRAY TEXT(ACC_at_Group3Codes;0)
	//ARRAY TEXT(ACC_at_Group4;0)
	//ARRAY TEXT(ACC_at_Group4Codes;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	//ARRAY TEXT(DB_at_PopUpSelector;0)
	//ARRAY TEXT(DB_at_TabNames;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	//ARRAY TEXT(PRD_at_STKHistoryName;0)
	//ARRAY TEXT(PRD_at_STKHistoryProducts;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	//ARRAY TEXT(STG_at_StageCodes;0)
	//ARRAY TEXT(STG_at_StageNames;0)
	C_BOOLEAN:C305($_bo_GraphsAvailable; $_bo_LoadSetup; $_bo_newLevel; $_bo_OnScreenEdit; $_bo_ReadWriteEdit; $_bo_StatsAvaiable; $_bo_UseContext; DB_bo_DisplayFilters; DB_bo_DisplayStats; DB_bo_FiltersActivated; DB_bo_FiltersAvailable)
	C_BOOLEAN:C305(DB_bo_GraphsAvailable; DB_bo_OnScreenEdit; DB_bo_PopupSelectorInited; DB_bo_ReturnSelection; DB_bo_RootTabDefined; DB_bo_SelectionManagerAvailable; DB_bo_ShowArrayBased; DB_bo_ShowCurrentSelection; DB_bo_StatsAvailabe; DB_bo_StatsAvailable; INV_bo_DisplayPostedSet)
	C_BOOLEAN:C305(LAY_bo_AreasSetup; LAY_bo_ContractTypesSetup; LAY_bo_ConTypeSetup; LAY_bo_CoTypesSetup; LAY_bo_CountiesSetup; LAY_bo_CountriesSetup; LAY_bo_CreditStatesSetup; LAY_bo_HeadingsSetup; LAY_bo_MoveTypesSetup; LAY_bo_OrdStatesSetup; LAY_bo_OrdTypeSetup)
	C_BOOLEAN:C305(LAY_bo_pBrandsSetup; LAY_bo_pCollectionsSetup; LAY_bo_PeriodsSetup; LAY_bo_pGroupsSetup; LAY_bo_POStatesSetup; LAY_bo_RolesSetup; LAY_bo_SalesPersonSetup; LAY_bo_StatusSetup; LAY_bo_StockLocationsSetup; LAY_bo_StockTypesSetup; PRD_bo_ScreenFilterLoaded)
	C_BOOLEAN:C305(STK_bo_StockItemsIncluded)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_InvoiceDateTo; PER_d_Period3From; PUR_D_Date; PUR_D_PeriodToDate; vDate)
	C_LONGINT:C283($_l_CurrentLevel; $_l_DefaultFilterID; $_l_DisplayRecordsTable; $_l_GroupRow; $_l_Index; $_l_Index2; $_l_InvoicableIndex; $_l_NewTable; $_l_OldTable; $_l_PeriodID; $_l_RecordsInSelection)
	C_LONGINT:C283($_l_RecordsInSelection2; $_l_ReuseLevel; $_l_StateRow; $_l_TabIncludes; $_l_TableNumber; $_l_TabRow; $1; $3; ACC_l_BUT1; ACC_l_BUT10; ACC_l_BUT11)
	C_LONGINT:C283(ACC_l_BUT12; ACC_l_BUT13; ACC_l_BUT14; ACC_l_BUT15; ACC_l_BUT16; ACC_l_BUT17; ACC_l_BUT18; ACC_l_BUT19; ACC_l_BUT2; ACC_l_BUT20; ACC_l_BUT21)
	C_LONGINT:C283(ACC_l_BUT22; ACC_l_BUT23; ACC_l_BUT24; ACC_l_BUT25; ACC_l_BUT26; ACC_l_BUT27; ACC_l_BUT3; ACC_l_BUT4; ACC_l_BUT5; ACC_l_BUT6; ACC_l_BUT7)
	C_LONGINT:C283(ACC_l_BUT8; ACC_l_BUT9; ACC_l_CurrentSelectedRow; DB_but_ClearFiltersButton; DB_l_COlumnButton; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_MaxRecords; DB_l_Navigatetoselected; DB_l_ReturnSelectionTable; DB_l_RootTabTable)
	C_LONGINT:C283(DB_l_TurnOnFilters; INV_l_ShowState; PRD_l_BUT1; PRD_l_BUT10; PRD_l_BUT11; PRD_l_BUT12; PRD_l_BUT13; PRD_l_BUT14; PRD_l_BUT15; PRD_l_BUT16; PRD_l_BUT17)
	C_LONGINT:C283(PRD_l_BUT18; PRD_l_BUT19; PRD_l_BUT2; PRD_l_BUT20; PRD_l_BUT21; PRD_l_BUT22; PRD_l_BUT23; PRD_l_BUT24; PRD_l_BUT25; PRD_l_BUT26; PRD_l_BUT27)
	C_LONGINT:C283(PRD_l_BUT3; PRD_l_BUT4; PRD_l_BUT5; PRD_l_BUT6; PRD_l_BUT7; PRD_l_BUT8; PRD_l_BUT9; PRD_l_FilterNLA; PUR_l_Calcon)
	C_PICTURE:C286($_pi_Picture)
	C_POINTER:C301($_ptr_ListBoxSetup; $_ptr_Table)
	C_REAL:C285(PUR_R_TotalDue; PUR_R_TotalDue30; PUR_R_TotalDue60; PUR_R_TotalDue90; PUR_R_TotalDueg90)
	C_TEXT:C284($_t_Context; $_t_CurrentStockLabel; $_t_InvoiceItemLabel; $_t_InvoiceLabel; $_t_oldMethodName; $_t_OrderType; $_t_PeriodTo; $_t_PurchaseLabel; $_t_PurchasesLabel; $_t_StateCode; $_t_StateCode1)
	C_TEXT:C284($_t_StateCode2; $_t_StateCodeCode; $_t_StockLabel; $_t_StocksLabel; $_t_TableContext; $_t_TableName; $2; ACC_t_PeriodFrom; DB_t_Column; DB_t_CurrentContext; DB_t_FilterMessage)
	C_TEXT:C284(DB_t_FormUsage; DB_t_HeaderName; DB_t_SelectorFunction; DB_t_SelectorLabel; oACC_COL1; oACC_COL10; oACC_COL11; oACC_COL12; oACC_COL13; oACC_COL14; oACC_COL15)
	C_TEXT:C284(oACC_COL16; oACC_COL17; oACC_COL18; oACC_COL19; oACC_COL2; oACC_COL20; oACC_COL21; oACC_COL22; oACC_COL23; oACC_COL24; oACC_COL25)
	C_TEXT:C284(oACC_COL26; oACC_COL27; oACC_COL3; oACC_COL4; oACC_COL5; oACC_COL6; oACC_COL7; oACC_COL8; oACC_COL9; oACC_HED1; oACC_HED10)
	C_TEXT:C284(oACC_HED11; oACC_HED12; oACC_HED13; oACC_HED14; oACC_HED15; oACC_HED16; oACC_HED17; oACC_HED18; oACC_HED19; oACC_HED2; oACC_HED20)
	C_TEXT:C284(oACC_HED21; oACC_HED22; oACC_HED23; oACC_HED24; oACC_HED25; oACC_HED26; oACC_HED27; oACC_HED3; oACC_HED4; oACC_HED5; oACC_HED6)
	C_TEXT:C284(oACC_HED7; oACC_HED8; oACC_HED9; oPRD_COL1; oPRD_COL10; oPRD_COL11; oPRD_COL12; oPRD_COL13; oPRD_COL14; oPRD_COL15; oPRD_COL16)
	C_TEXT:C284(oPRD_COL17; oPRD_COL18; oPRD_COL19; oPRD_COL2; oPRD_COL20; oPRD_COL21; oPRD_COL22; oPRD_COL23; oPRD_COL24; oPRD_COL25; oPRD_COL26)
	C_TEXT:C284(oPRD_COL27; oPRD_COL3; oPRD_COL4; oPRD_COL5; oPRD_COL6; oPRD_COL7; oPRD_COL8; oPRD_COL9; oPRD_HED1; oPRD_HED10; oPRD_HED11)
	C_TEXT:C284(oPRD_HED12; oPRD_HED13; oPRD_HED14; oPRD_HED15; oPRD_HED16; oPRD_HED17; oPRD_HED18; oPRD_HED19; oPRD_HED2; oPRD_HED20; oPRD_HED21)
	C_TEXT:C284(oPRD_HED22; oPRD_HED23; oPRD_HED24; oPRD_HED25; oPRD_HED26; oPRD_HED27; oPRD_HED3; oPRD_HED4; oPRD_HED5; oPRD_HED6; oPRD_HED7)
	C_TEXT:C284(oPRD_HED8; oPRD_HED9; PER_t_Period1; PER_t_Period2; PER_t_Period3; PER_t_PeriodFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormLayout")
If (Count parameters:C259>=2)
	$_t_Context:=$2
	$_l_TableNumber:=$1
	$_ptr_Table:=Table:C252($_l_TableNumber)
	UNLOAD RECORD:C212($_ptr_Table->)
	READ ONLY:C145($_ptr_Table->)
	ARRAY TEXT:C222(DB_at_PopUpSelector; 0)  // a pop-up selector-used on account balances
	
	DB_t_SelectorLabel:=""
	DB_bo_PopupSelectorInited:=True:C214
	$_l_OldTable:=0
	$_l_NewTable:=0
	
	//Note. In some contexts there is no search or selection , and the selection of records to be displayed is drawn before we get here
	If (DB_l_Navigatetoselected=0)
		If ($_t_Context#"user@")
			If (DB_at_TabNavigation=0)
				DB_at_TabNavigation:=1
			End if 
			DB_l_MaxRecords:=-1
			If (DB_at_TabNavigation>0) & (DB_at_TabNavigation<=Size of array:C274(DB_al_TabNavigation))
				DB_l_CurrentDisplayedForm:=DB_al_TabNavigation{DB_at_TabNavigation}
			End if 
			
		Else 
			DB_l_CurrentDisplayedForm:=$1
		End if 
		
		If (Not:C34(DB_bo_ShowCurrentSelection))
			Case of 
				: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
					Case of 
						: ($_t_Context="Renumber")
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Exported:45=False:C215; *)
							QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61#1)
						: ($_t_Context="Creditors Report")
							PUR_R_TotalDue:=0
							PUR_R_TotalDue30:=0
							PUR_R_TotalDue90:=0
							PUR_R_TotalDue60:=0
							PUR_R_TotalDueg90:=0
							vDate:=Current date:C33-90
							$_l_PeriodID:=Check_Period
							ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
							PUR_D_PeriodToDate:=[PERIODS:33]To_Date:4
							PUR_D_Date:=Current date:C33
							PUR_l_Calcon:=1
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_PeriodToDate-DB_GetLedgerADStageOne); *)
							QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_PeriodToDate-DB_GetLedgerADStageOne))
							PER_t_Period1:=[PERIODS:33]Period_Code:1
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_PeriodToDate-DB_GetLedgerADStageTwo); *)
							QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_PeriodToDate-DB_GetLedgerADStageTwo))
							PER_t_Period2:=[PERIODS:33]Period_Code:1
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_PeriodToDate-DB_GetLedgerADStageThree); *)
							QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_PeriodToDate-DB_GetLedgerADStageThree))
							PER_t_Period3:=[PERIODS:33]Period_Code:1
							PER_d_Period3From:=[PERIODS:33]From_Date:3
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0; *)
							QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5<=<>DB_d_CurrentDate)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1; *)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=2; *)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=3; *)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
							//SEARCH([Purchases];[Purchases]Total Due#0)
							If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
								SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes)
								QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
							End if 
						Else 
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
					End case 
					DB_l_MaxRecords:=Records in selection:C76([COMPANIES:2])
					
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					Case of 
						: ($_t_Context="Renumber")
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Exported:23=False:C215; *)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
							
						: ($_t_Context="Prospects")
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Exported:23=False:C215; *)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
						Else 
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
					End case 
					
					DB_l_MaxRecords:=Records in selection:C76([CONTACTS:1])
				: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
					DB_l_MaxRecords:=Records in selection:C76([PERSONNEL:11])
				: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
					Case of 
						: ($_t_Context="Select Current Stock")
							//THE SELECTION IS GIVEN
							DB_bo_ReturnSelection:=True:C214
							DB_l_ReturnSelectionTable:=Table:C252(->[CURRENT_STOCK:62])
							
						Else 
							ALL RECORDS:C47([CURRENT_STOCK:62])
							If ($_t_Context#"user")  //THE SELECTION IS GIVEN
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
							End if 
					End case 
				: ($_l_TableNumber=Table:C252(->[DIARY:12]))
					Case of 
						: ($_t_Context="Letters") | ($_t_Context="Documents")
							
							
							QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15#"")
						: ($_t_Context="Mailing Diary") | ($_t_Context="History")
							ALL RECORDS:C47([DIARY:12])
						: ($_t_Context="USER@")
							ALL RECORDS:C47([DIARY:12])
						Else 
							
							If (Size of array:C274(DB_at_TabNames)>0)
								$_l_TabRow:=Find in array:C230(DB_at_TabNames; DB_at_TabNavigation{DB_at_TabNavigation})
								If ($_l_TabRow>0)
									If (Size of array:C274(DB_al_TabIncludes{$_l_TabRow})>0)
										ARRAY LONGINT:C221($_al_ActionIDs; 0)
										For ($_l_Index; 1; Size of array:C274(DB_al_TabIncludes{$_l_TabRow}))
											If (DB_al_TabIncludes{$_l_TabRow}{$_l_Index}>0)
												APPEND TO ARRAY:C911($_al_ActionIDs; DB_al_TabIncludes{$_l_TabRow}{$_l_Index})
											Else 
												$_l_TabIncludes:=DB_al_TabIncludes{$_l_TabRow}{$_l_Index}
												$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
												If ($_l_GroupRow>0)
													For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
														APPEND TO ARRAY:C911($_al_ActionIDs; SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index2})
													End for 
												End if 
											End if 
										End for 
										QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_ActionIDs)
										SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
										QUERY WITH ARRAY:C644([DIARY:12]Action_Code:9; $_at_ActionCodes)
										If (DB_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
											
											QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
										End if 
										
										
										
										
									End if 
								End if 
							Else 
								//context comes into play
								
							End if 
					End case 
					
					
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
					DB_l_MaxRecords:=Records in selection:C76([DIARY:12])
				: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
					Case of 
						: ($_t_Context="Letters")
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
							
						: ($_t_Context="Reports")
							READ WRITE:C146([DOCUMENTS:7])
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
							QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Class:14#SuperReportReport Template)
							
							If (Records in selection:C76([DOCUMENTS:7])>0)
								APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14:=SuperReportReport Template)
								
								
							End if 
							
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
							
							
						: ($_t_Context="Emails")
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template)
						: ($_t_Context="USER@")
							ALL RECORDS:C47([DOCUMENTS:7])
							
					End case 
					DB_l_MaxRecords:=Records in selection:C76([DIARY:12])
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
					QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8=0)
					DB_l_MaxRecords:=Records in selection:C76([CUSTOM_FIELDS:98])
				: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
					ALL RECORDS:C47([PERIODS:33])
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; DB_at_PopUpSelector)
					DB_t_SelectorLabel:="to Account period."
					vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
					$_l_PeriodID:=Check_Period
					$_t_PeriodTo:=[PERIODS:33]Period_Code:1
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4<=$_t_PeriodTo)
					If ($_t_Context="Budgets")
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5="B")
					End if 
				: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([ACTIONS:13])
						Else 
							SD2_LoadTemplateActions
							ARRAY TEXT:C222(SD_at_actionAdd; 0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
							SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
							SD2_LoadResults
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12>=0)
					End case 
					
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([CUSTOM_FIELD_DEFINITiONS:99])
						Else 
							
							
							Load_Fields
							
							For ($_l_Index; 1; Size of array:C274(<>DB_at_TableNames))
								Case of 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNT_BALANCES:34])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACC_Bank_Statements:198])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_GROUPS:10])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[HEADINGS:84]))
										If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS:32])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_ANALYSES:157])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_LAYERS:156])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ANALYSES:36])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76]))
										
										//data manager and nominal ledger
										If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACTIONS:13]))
										If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
										//Stock movements and data manager
										If (DB_GetModuleSettingByNUM(Module_StockControl)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
										//orders manager and data manager
										If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[AREAS:3])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COUNTRIES:73]))
										
										//data manager
										If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
										If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
										If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
										If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
										If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SUBSCRIPTIONS:93]))
										If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTION_BATCHES:30])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTIONS:29]))
										If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
										
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CREDIT_STAGES:54]))
										//sales ledger and data manager
										If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENCIES:71])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_TYPES:65])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LOCATIONS:61])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SCRIPTS:80])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
										
										//data manager
										If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_BRANDS:8])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CATALOGUE:108])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COMPONENTS:86]))
										//products and data manager
										If (DB_GetModuleSettingByNUM(Module_Products)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DOCUMENTS:7]))
										//DB_GetModuleSettingByNUM (Module_WPManager)
										If (DB_GetModuleSettingByNUM(Module_WPManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TIME_BILLING_CATEGORIES:46])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACT_TYPES:19]))
										//service control and data manger
										If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACTS:17]))
										//Service control
										If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENT_STOCK:62]))
										//stock control
										If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DIARY:12]))
										//diary manger
										If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
										
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES:39])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES_ITEMS:161]))
										If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB PERSONNEL:48])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_STAGES:47])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOBS:26]))
										//Job costing
										If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
										If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
									: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCTS:9]))
										If (DB_GetModuleSettingByNUM(Module_Products)>1)
											
											APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
										End if 
								End case 
								//APPEND TO ARRAY(DB_at_PopUpSelector;<>DB_at_TableNames{$_l_Index})
							End for 
							SORT ARRAY:C229(DB_at_PopUpSelector)
							DB_t_SelectorLabel:="table:"
							DB_t_SelectorFunction:="DB_SetFieldDefTable"
							DB_at_PopUpSelector:=Find in array:C230(<>DB_al_TableNums; 2)
							QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_al_TableNums{<>DB_at_TableNames})
							ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
					End case 
				: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
					
					Case of 
						: ($_t_Context="ViewCreditnotes") | ($_t_Context="View Credit notes")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
							
						: ($_t_Context="ViewReceipts") | ($_t_Context="View Receipts")
							
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-3)
						: ($_t_Context="ViewDeposits") | ($_t_Context="View Deposits")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-2)
						: ($_t_Context="Proformas") | ($_t_Context="View Proformas")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-1)
						: ($_t_Context="Invoices") | ($_t_Context="View Invoices")  // View invoices only
							
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0)
						: ($_t_Context="Refund Deposit")  // View invoices only
							
							QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						: ($_t_Context="Invoice Receipt")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=1)
							If (Records in selection:C76([INVOICES:39])>0)
								Gen_Confirm("There are some Invoices that need posting to the General Ledger."+"  Do you want to check if these are relevant to the receipt?"; "Yes"; "No")
								If (OK=1)
									//here we only need to swith the context..this could
									DB_t_CurrentContext:="Post Invoices to Ledgers"
									$_t_Context:=DB_t_CurrentContext
									
								End if 
							End if 
							If ($_t_Context="Invoice Receipt")
								QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
								
								QUERY:C277([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
								QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
							End if 
						: ($_t_Context="Undo Receipt")
							QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6>=0; *)  // Modified NG 3/8/2006
							
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						: ($_t_Context="Batch Print Created Invoices")
							
							//dont change the selection.. ..this is used from a view of orders
							
						: ($_t_Context="Batch Print Invoices")
							If (Not:C34(INV_bo_DisplayPostedSet))
								//only ask the question once
								Gen_Confirm("Select only Invoices not Posted?"; "Not Posted"; "All")
								If (OK=1)
									INV_l_ShowState:=0
								Else 
									INV_l_ShowState:=1
								End if 
								INV_bo_DisplayPostedSet:=True:C214
							End if 
							If (INV_l_ShowState=0)
								QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=0)
							Else 
								QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0)
							End if 
							
						: ($_t_Context="Batch Post Invoices")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=1)
						: ($_t_Context="Send Statements")
							QUERY:C277([CREDIT_STAGES:54]; [CREDIT_STAGES:54]Document_Code:5#"")
							
							SELECTION TO ARRAY:C260([CREDIT_STAGES:54]Stage_Code:1; STG_at_StageCodes; [CREDIT_STAGES:54]Stage_Name:2; STG_at_StageNames; [CREDIT_STAGES:54]From_Invoice_Date:4; STG_abo_StageFromiDate; [CREDIT_STAGES:54]Letter_Days:3; STG_al_LEtterDays)
							
							
							SORT ARRAY:C229(STG_at_StageNames; STG_at_StageCodes; STG_al_LEtterDays; STG_abo_StageFromiDate)
							ARRAY LONGINT:C221(STG_al_Selected; 0)
							ARRAY LONGINT:C221(STG_al_Selected; Size of array:C274(STG_al_Selected))
							GEN_AskSelection(260; 180; "Please Select Stages "; "Stages.."; ->STG_al_Selected; "STG_at_StageCodes"; "Stage Code"; "180"; "False"; "STG_at_StageNames"; "Name"; "250"; "False")
							ARRAY TEXT:C222($_at_SelectedStageCodes; 0)
							ARRAY BOOLEAN:C223($_abo_SelectededFromInvDate; 0)
							ARRAY LONGINT:C221($_al_LetterDays; 0)
							For ($_l_Index; 1; Size of array:C274(STG_al_Selected))
								If (STG_al_Selected{$_l_Index}>0)
									APPEND TO ARRAY:C911($_at_SelectedStageCodes; STG_at_StageCodes{STG_al_Selected{$_l_Index}})
									APPEND TO ARRAY:C911($_abo_SelectededFromInvDate; STG_abo_StageFromiDate{STG_al_Selected{$_l_Index}})
									APPEND TO ARRAY:C911($_al_LetterDays; STG_al_LEtterDays{STG_al_Selected{$_l_Index}})
								End if 
							End for 
							CREATE EMPTY SET:C140([INVOICES:39]; "$Selected")
							For ($_l_Index; 1; Size of array:C274($_abo_SelectededFromInvDate))
								QUERY:C277([INVOICES:39]; [INVOICES:39]Credit_Stage:22=$_at_SelectedStageCodes{$_l_Index}; *)
								QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
								$_d_InvoiceDateTo:=<>DB_d_CurrentDate-$_al_LetterDays{$_l_Index}
								If ($_abo_SelectededFromInvDate{$_l_Index})
									QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4<=$_d_InvoiceDateTo)
								Else 
									QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Due_Date:18>!00-00-00!; *)
									QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Due_Date:18<=$_d_InvoiceDateTo)
								End if 
								CREATE SET:C116([INVOICES:39]; "$Extra")
								UNION:C120("$Extra"; "$Selected"; "$Selected")
							End for 
							USE SET:C118("$Selected")
						: ($_t_Context="Print Remittance Receipts")  // Print remittances and
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
							
							
							QUERY:C277([INVOICES:39];  | ; [INVOICES:39]State:10=-3)
							
						Else   //all sales ledger items
							
							ALL RECORDS:C47([INVOICES:39])
					End case 
					DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
				: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([SCRIPTS:80])
							
						: ($_t_Context="Web Handling")
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA @"; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX @"; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO @")
						Else 
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"IMA @"; *)
							QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"ITX @"; *)
							QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"ITO @")
					End case 
					DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
				: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
					
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([ORDERS:24])
							
						: ($_t_Context#"")
							
							$_t_OrderType:=Replace string:C233($_t_Context; Get localized string:C991("MenuItem_View")+" "; "")
							$_l_TabRow:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_OrderType)
							If ($_l_TabRow>0)
								//TRACE
								$_t_StateCode:=<>SYS_at_RecStateCodes{24}{$_l_TabRow}
								$_t_StateCode:="024"+$_t_StateCode
								QUERY:C277([ORDERS:24]; [ORDERS:24]State:15=$_t_StateCode)
								DB_l_MaxRecords:=Records in selection:C76([ORDERS:24])
							Else 
								//Some other functional view
								Case of 
									: ($_t_Context="Batch Invoice Orders")
										If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
											$_t_StateCode1:=<>SYS_at_RecStateCodes{24}{1}
											$_t_StateCode2:=<>SYS_at_RecStateCodes{24}{1}
											QUERY:C277([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode1)
											QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode2)
											
											DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
											ARRAY TEXT:C222($_at_ValidStates; 0)
											For ($_l_InvoicableIndex; 1; Size of array:C274($_at_OrderStates))
												$_t_StateCode:=$_at_OrderStates{$_l_InvoicableIndex}
												$_t_StateCodeCode:="090"+$_t_StateCode
												QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StateCodeCode; *)
												QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
												If (Records in selection:C76([CODE_USES:91])>0)
													APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_InvoicableIndex})
													
												End if 
											End for 
											QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
											RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
											
											QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
											QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
											RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
											QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
										Else 
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
											QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
											RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
											DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
											ARRAY TEXT:C222($_at_ValidStates; 0)
											For ($_l_InvoicableIndex; 1; Size of array:C274($_at_OrderStates))
												$_t_StateCode:=$_at_OrderStates{$_l_InvoicableIndex}
												$_t_StateCodeCode:="090"+$_t_StateCode
												QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StateCodeCode; *)
												QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
												If (Records in selection:C76([CODE_USES:91])>0)
													APPEND TO ARRAY:C911($_at_ValidStates; $_at_OrderStates{$_l_InvoicableIndex})
													
												End if 
											End for 
											QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidStates)
											
											QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
											
										End if 
										DB_l_MaxRecords:=Records in selection:C76([ORDERS:24])
										
								End case 
							End if 
						Else 
							If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
								$_t_StateCode1:=<>SYS_at_RecStateCodes{24}{1}
								$_t_StateCode2:=<>SYS_at_RecStateCodes{24}{1}
								QUERY:C277([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode1)
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode2)
								
								DB_l_MaxRecords:=Records in selection:C76([ORDERS:24])
							Else 
								ALL RECORDS:C47($_ptr_Table->)
								DB_l_MaxRecords:=Records in selection:C76([ORDERS:24])
							End if 
					End case 
				: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
					
					
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([ORDER_ITEMS:25])
							
						: ($_t_Context#"")
							
							$_t_OrderType:=Replace string:C233($_t_Context; Get localized string:C991("MenuItem_View")+" "; "")
							$_l_TabRow:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_OrderType)
							If ($_l_TabRow>0)
								//TRACE
								$_t_StateCode:=<>SYS_at_RecStateCodes{24}{$_l_TabRow}
								$_t_StateCode:="024"+$_t_StateCode
								QUERY:C277([ORDERS:24]; [ORDERS:24]State:15=$_t_StateCode)
								SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
								
								
							Else 
								//Some other functional view
								Case of 
									: ($_t_Context="Subscription Billing")
										ALL RECORDS:C47([SUBSCRIPTIONS:93])
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0; *)
										QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@")
										RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
										QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
										DB_bo_DisplayFilters:=True:C214
									: ($_t_Context="Subscription Delivery")
										ALL RECORDS:C47([SUBSCRIPTIONS:93])
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0; *)
										QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="ISS")
										RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
										QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17#"")
										DB_bo_DisplayFilters:=True:C214
									: ($_t_Context="Subscription Renewals")
										ALL RECORDS:C47([SUBSCRIPTIONS:93])
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0; *)
										QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN")
										RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
										//QUERY SELECTION([ORDER ITEMS];[ORDER ITEMS]Invoice No="")
										DB_bo_DisplayFilters:=True:C214
										
										
								End case 
								
							End if 
						Else 
							If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
								$_t_StateCode1:=<>SYS_at_RecStateCodes{24}{1}
								$_t_StateCode2:=<>SYS_at_RecStateCodes{24}{1}
								QUERY:C277([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode1)
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15#$_t_StateCode2)
								MESSAGES OFF:C175
								SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
								
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
								MESSAGES ON:C181
								
								
							Else 
								ALL RECORDS:C47($_ptr_Table->)
								
							End if 
					End case 
					DB_l_MaxRecords:=Records in selection:C76([ORDER_ITEMS:25])
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([PRODUCTS:9])
							
						Else 
							If (Not:C34(PRD_bo_ScreenFilterLoaded))
								PRD_l_FilterNLA:=ProductDeletionPreferences
								PRD_bo_ScreenFilterLoaded:=True:C214
							End if 
							If (PRD_l_FilterNLA=1)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
							Else 
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
							End if 
					End case 
				: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
					//TRACE
					Case of 
						: ($_t_Context="Post Transaction Batches")
							QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]State:15=1)
							
						: ($_t_Context="Reverse Transaction Batches")
							QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Reverse:14=False:C215)
							
							
						Else 
							ALL RECORDS:C47($_ptr_Table->)
							
					End case 
					DB_l_MaxRecords:=Records in selection:C76([TRANSACTION_BATCHES:30])
				: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
					
					
					Case of 
						: ($_t_Context="Post Purchase Invoices")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1)
							DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
							
						: ($_t_Context="Purchase Payment")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=2; *)
							QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)
							DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
						: ($_t_Context="Purchase Undo Payment")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3)
							DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
							
						: ($_t_Context="Print Cheques")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
							QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2; *)
							QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Cheque_Number:26="")
							DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
						: ($_t_Context="Autopay List")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
							QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)
							DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
							
							
							
						Else 
							ALL RECORDS:C47($_ptr_Table->)
							
					End case 
					DB_l_MaxRecords:=Records in selection:C76([PURCHASE_INVOICES:37])
				: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
					//TRACE
					Case of 
						: ($_t_Context="Outstanding Calls")
							QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215)
							
						Else 
							ALL RECORDS:C47([SERVICE_CALLS:20])
							
					End case 
					DB_l_MaxRecords:=Records in selection:C76([SERVICE_CALLS:20])
				: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
					Case of 
						: ($_t_Context="Reconcile Transactions")
							If (DB_GetSalesLedgerBankFrom#"")
								If (DB_GetSalesLedgerBankTo#"")
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
								Else 
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
								End if 
								If (DB_GetSalesLedgerBankTo#"")
									QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
								Else 
									QUERY:C277([TRANSACTIONS:29])
									
								End if 
							Else 
								QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
							End if 
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
							
							
						Else 
							ALL RECORDS:C47([TRANSACTIONS:29])
							
					End case 
					DB_l_MaxRecords:=Records in selection:C76([TRANSACTIONS:29])
				: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
					Case of 
						: ($_t_Context="USER@")
							ALL RECORDS:C47([STOCK_LEVELS:58])
							
						: ($_t_Context="Select Stock Levels")
							//THE SELECTION IS GIVEN
							DB_bo_ReturnSelection:=True:C214
							DB_l_ReturnSelectionTable:=Table:C252(->[STOCK_LEVELS:58])
							
						Else 
							//ALL RECORDS([STOCK_LEVELS])
							
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Free_Level:3#0; *)
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Allocated_Level:4#0)
					End case 
					DB_l_MaxRecords:=Records in selection:C76($_ptr_Table->)
				Else 
					ALL RECORDS:C47($_ptr_Table->)
					DB_l_MaxRecords:=Records in selection:C76($_ptr_Table->)
			End case 
		Else 
			Case of 
				: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
					//TRACE
					
					Load_Fields
					
					
					For ($_l_Index; 1; Size of array:C274(<>DB_at_TableNames))
						Case of 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNT_BALANCES:34])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACC_Bank_Statements:198])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_GROUPS:10])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[HEADINGS:84]))
								If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS:32])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_ANALYSES:157])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACCOUNTS_LAYERS:156])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ANALYSES:36])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76]))
								
								//data manager and nominal ledger
								If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ACTIONS:13]))
								If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
								//Stock movements and data manager
								If (DB_GetModuleSettingByNUM(Module_StockControl)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
								//orders manager and data manager
								If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[AREAS:3])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COUNTRIES:73]))
								
								//data manager
								If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
								If (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
								If (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
								If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
								If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SUBSCRIPTIONS:93]))
								If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTION_BATCHES:30])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TRANSACTIONS:29]))
								If (DB_GetModuleSettingByNUM(Module_NominalLedger)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
								
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CREDIT_STAGES:54]))
								//sales ledger and data manager
								If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENCIES:71])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_TYPES:65])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LAYERS:76])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[LOCATIONS:61])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[SCRIPTS:80])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[MOVEMENT_TYPES:60]))
								
								//data manager
								If (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCT_BRANDS:8])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CATALOGUE:108])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[COMPONENTS:86]))
								//products and data manager
								If (DB_GetModuleSettingByNUM(Module_Products)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DOCUMENTS:7]))
								//DB_GetModuleSettingByNUM (Module_WPManager)
								If (DB_GetModuleSettingByNUM(Module_WPManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[TIME_BILLING_CATEGORIES:46])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACT_TYPES:19]))
								//service control and data manger
								If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1) & (DB_GetModuleSettingByNUM(Module_DataManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CONTRACTS:17]))
								//Service control
								If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[CURRENT_STOCK:62]))
								//stock control
								If (DB_GetModuleSettingByNUM(Module_StockControl)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[DIARY:12]))
								//diary manger
								If (DB_GetModuleSettingByNUM(Module_DiaryManager)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
								
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES:39])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[INVOICES_ITEMS:161]))
								If (DB_GetModuleSettingByNUM(Module_SalesLedger)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB PERSONNEL:48])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOB_STAGES:47])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[JOBS:26]))
								//Job costing
								If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDER_ITEMS:25])) | (<>DB_al_TableNums{$_l_Index}=Table:C252(->[ORDERS:24]))
								If (DB_GetModuleSettingByNUM(Module_SalesOrders)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
							: (<>DB_al_TableNums{$_l_Index}=Table:C252(->[PRODUCTS:9]))
								If (DB_GetModuleSettingByNUM(Module_Products)>1)
									
									APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{$_l_Index})
								End if 
						End case 
						//APPEND TO ARRAY(DB_at_PopUpSelector;<>DB_at_TableNames{$_l_Index})
					End for 
					SORT ARRAY:C229(DB_at_PopUpSelector)
					
					DB_t_SelectorLabel:="Table :"
					DB_t_SelectorFunction:="DB_SetFieldDefTable"
					DB_at_PopUpSelector:=Find in array:C230(<>DB_al_TableNums; 2)
					If (DB_at_PopUpSelector>0)
						APPEND TO ARRAY:C911(DB_at_PopUpSelector; <>DB_at_TableNames{DB_at_PopUpSelector})
					End if 
					QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_al_TableNums{<>DB_at_TableNames})
					ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
			End case 
			
			
			DB_bo_ShowCurrentSelection:=False:C215
		End if 
	Else 
		If (Count parameters:C259<3)
			$_l_OldTable:=DB_l_CurrentDisplayedForm
			$_l_NewTable:=DB_al_TabNavigation{DB_at_TabNavigation}
		Else 
			$_l_OldTable:=$3
			$_l_NewTable:=$_l_TableNumber
		End if 
		
		If ($_l_NewTable>0)
			If ($_l_NewTable#DB_l_CurrentDisplayedForm)
				DB_l_CurrentDisplayedForm:=$_l_NewTable
				DB_bo_FiltersActivated:=False:C215  //Change window so set this or errors on change selection
				
			End if 
		End if 
		
		DB_GetRelatedRecords($_l_OldTable; DB_l_CurrentDisplayedForm)
	End if 
	
	
	
	If (Count parameters:C259>=2)
		If ($_t_Context#"USER@")
			//There is a name for the context
			If ($_t_Context#"")
				$_bo_UseContext:=True:C214
				If (DB_bo_RootTabDefined)
					$_bo_UseContext:=False:C215
					If (DB_l_RootTabTable=$_l_TableNumber)
						$_bo_UseContext:=True:C214
					End if 
				End if 
				If ($_bo_UseContext)
					$_l_TabRow:=Find in array:C230(DB_at_ContextNames; $_t_Context)
				Else 
					$_l_TabRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
				End if 
			Else 
				$_l_TabRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
			End if 
		Else 
			//$_l_TabRow:=Find in array(DB_al_ContextTableNumber;$_l_TableNumber)
			//There is a name for the context
			
			$_bo_UseContext:=True:C214
			//the context name is the same for all tables so here we look for the context with the table num on the end.
			
			$_l_TabRow:=Find in array:C230(DB_at_ContextNames; $_t_Context+"_"+String:C10($_l_TableNumber))
			If ($_l_TabRow<0)
				// /here we create the definitions-in memory for the table
				
			End if 
			
			
			
		End if 
	Else 
		$_l_TabRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
		//just use the table number-only one context
	End if 
	
	LISTBOX SET TABLE SOURCE:C1013(DB_l_LBOutputForm; $_l_TableNumber)
	$_bo_LoadSetup:=False:C215
	DB_bo_ShowArrayBased:=False:C215
	$_bo_OnScreenEdit:=False:C215
	$_bo_ReadWriteEdit:=False:C215
	$_bo_StatsAvaiable:=False:C215
	$_bo_GraphsAvailable:=False:C215
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			Case of 
				: ($_t_Context="Creditors Report")
					If ($_l_TabRow<0)
						
						ARRAY POINTER:C280(DB_aptr_Companies; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Companies)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_aB_FiltersDisplayed;False)
						//APPEND TO ARRAY(DB_aB_SelectionsDisplayed;False)
						//APPEND TO ARRAY(DB_al_CurrentViewType;0)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
						
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_bo_LoadSetup:=True:C214
					If ($_bo_newLevel)
						
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Code:1; "411111000"; "Company_In"; 4; "Companies"; "Company"; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=False:C215
					$_bo_StatsAvaiable:=False:C215
					$_bo_GraphsAvailable:=False:C215
				Else 
					If ($_l_TabRow<0)
						
						ARRAY POINTER:C280(DB_aptr_Companies; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Companies)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_aB_FiltersDisplayed;False)
						//APPEND TO ARRAY(DB_aB_SelectionsDisplayed;False)
						//APPEND TO ARRAY(DB_al_CurrentViewType;0)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
						
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_bo_LoadSetup:=True:C214
					If ($_bo_newLevel)
						Case of 
							: ($_t_Context="USER@")
								
								LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Code:1; "411111000"; "COMPANIES_IN"; -1; "Companies"; "Company"; ""; $_bo_newLevel; $_l_ReuseLevel)
								
							Else 
								LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Code:1; "411111000"; "Company_In"; 3; "Companies"; "Company"; ""; $_bo_newLevel; $_l_ReuseLevel)
						End case 
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=True:C214
					
			End case 
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Contacts; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Contacts)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
				
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				Case of 
					: ($_t_Context="USER@")
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; "411111000"; "CONTACTS_IN"; -1; "Contacts"; "Contact"; ""; $_bo_newLevel; $_l_ReuseLevel)
					Else 
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]Contact_Code:2; "411111000"; "Contact_In"; 5; "Contacts"; "Contact"; ""; $_bo_newLevel; $_l_ReuseLevel)
				End case 
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=True:C214
			$_bo_GraphsAvailable:=True:C214
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			If (Not:C34(PRD_bo_ScreenFilterLoaded))
				PRD_l_FilterNLA:=ProductDeletionPreferences
				PRD_bo_ScreenFilterLoaded:=True:C214
			End if 
			If (PRD_l_FilterNLA=1)
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
			Else 
				QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
			End if 
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Products; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Products)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PRODUCTS:9]Product_Code:1; ->[PRODUCTS:9]Product_Code:1; "411111000"; "Products_in2009"; 5; "Products"; "Product"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=True:C214
			$_bo_GraphsAvailable:=True:C214
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			
			Case of 
				: ($_t_Context="")
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Orders; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Orders)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_bo_LoadSetup:=True:C214
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					If ($_bo_newLevel)
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Code:3; "411111000"; "Order_In"; 10; "Orders"; "Order"; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=True:C214
				Else 
					
					$_t_OrderType:=Replace string:C233($_t_Context; Get localized string:C991("MenuItem_View")+" "; "")
					$_l_StateRow:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_OrderType)
					If ($_l_StateRow>0)
						Case of 
							: ($_l_StateRow=1)  //Enquiries
								
								If ($_l_TabRow<0)
									ARRAY POINTER:C280(DB_aptr_Enquiries; 0)
									APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Enquiries)
									APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
									If (Count parameters:C259>=2)
										$_t_TableContext:=$_t_Context
									Else 
										$_t_TableContext:=""
									End if 
									APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
									APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
									//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
									
									$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
									$_bo_newLevel:=True:C214
									$_l_ReuseLevel:=0
								Else 
									
									$_bo_newLevel:=False:C215
									$_l_ReuseLevel:=0
								End if 
								$_bo_LoadSetup:=True:C214
								$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
								If ($_bo_newLevel)
									LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Code:3; "411111000"; "Order_In"; 11; "Enquiries"; "Enquiry"; ""; $_bo_newLevel; $_l_ReuseLevel)
								End if 
								$_bo_OnScreenEdit:=False:C215
								$_bo_ReadWriteEdit:=True:C214
								$_bo_StatsAvaiable:=True:C214
								$_bo_GraphsAvailable:=True:C214
							: ($_l_StateRow=2)  //Quotations
								
								If ($_l_TabRow<0)
									ARRAY POINTER:C280(DB_aptr_Quotations; 0)
									APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Quotations)
									APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
									If (Count parameters:C259>=2)
										$_t_TableContext:=$_t_Context
									Else 
										$_t_TableContext:=""
									End if 
									APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
									APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
									//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
									
									$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
									$_bo_newLevel:=True:C214
									$_l_ReuseLevel:=0
								Else 
									
									$_bo_newLevel:=False:C215
									$_l_ReuseLevel:=0
								End if 
								$_bo_LoadSetup:=True:C214
								$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
								If ($_bo_newLevel)
									LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Code:3; "411111000"; "Order_In"; 12; "Quotations"; "Quotation"; ""; $_bo_newLevel; $_l_ReuseLevel)
								End if 
								$_bo_OnScreenEdit:=False:C215
								$_bo_ReadWriteEdit:=True:C214
								$_bo_StatsAvaiable:=True:C214
								$_bo_GraphsAvailable:=True:C214
							Else 
								If ($_l_TabRow<0)
									ARRAY POINTER:C280(DB_aptr_Orders; 0)
									APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Orders)
									APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
									If (Count parameters:C259>=2)
										$_t_TableContext:=$_t_Context
									Else 
										$_t_TableContext:=""
									End if 
									APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
									APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
									//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
									
									$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
									$_bo_newLevel:=True:C214
									$_l_ReuseLevel:=0
								Else 
									
									$_bo_newLevel:=False:C215
									$_l_ReuseLevel:=0
								End if 
								$_bo_LoadSetup:=True:C214
								$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
								If ($_bo_newLevel)
									LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Code:3; "411111000"; "Order_In"; 10; "Orders"; "Order"; ""; $_bo_newLevel; $_l_ReuseLevel)
								End if 
								$_bo_OnScreenEdit:=False:C215
								$_bo_ReadWriteEdit:=True:C214
								$_bo_StatsAvaiable:=True:C214
								$_bo_GraphsAvailable:=True:C214
								
								
								
								
						End case 
					Else 
						If ($_l_TabRow<0)
							ARRAY POINTER:C280(DB_aptr_Orders; 0)
							APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Orders)
							APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
							If (Count parameters:C259>=2)
								$_t_TableContext:=$_t_Context
							Else 
								$_t_TableContext:=""
							End if 
							APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
							APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
							//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
							
							$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
							$_bo_newLevel:=True:C214
							$_l_ReuseLevel:=0
						Else 
							
							$_bo_newLevel:=False:C215
							$_l_ReuseLevel:=0
						End if 
						$_bo_LoadSetup:=True:C214
						$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
						If ($_bo_newLevel)
							LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Code:3; "411111000"; "Order_In"; 10; "Orders"; "Order"; ""; $_bo_newLevel; $_l_ReuseLevel)
						End if 
						$_bo_OnScreenEdit:=False:C215
						$_bo_ReadWriteEdit:=True:C214
						$_bo_StatsAvaiable:=True:C214
						$_bo_GraphsAvailable:=True:C214
						
					End if 
			End case 
			
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			
			//TRACE
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Orderitems; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Orderitems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDER_ITEMS:25]Item_Number:27; "411111000"; "Items_in"; 21; "Order Items"; "Order item"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=False:C215
			$_bo_StatsAvaiable:=True:C214
			$_bo_GraphsAvailable:=False:C215
			
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_StatsAvaiable:=False:C215
			//when we subselect we select rows in the array and have to convert them back to balances.
			//normally when balances are displayed its not the balances that is displayed but the account with the balance calculated. the balance should be shown as individual lines within an account in my optnion..and a balance should be drillabel into to see the transactions
			//so also in an output form from a list of accounts(as accounts of balances) we should be able to drill to the selection of balances for those accounts as the accounts view is going to be incorporated into a new interface for the accounts there no need to setup outputs for the accounts other than as a balance
			Case of 
				: ($_t_Context="BUDGETS")
					
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_AccBals; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_AccBals)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_bo_LoadSetup:=True:C214
					If ($_bo_newLevel)
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ACCOUNT_BALANCES:34]Unique_StringIdent:8; ->[ACCOUNT_BALANCES:34]Unique_StringIdent:8; "411111000"; "AccBal_in"; 1; "Account Balances"; "Account Balance"; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=False:C215
					$_bo_GraphsAvailable:=False:C215
					
				Else 
					//Not that this will hide fields based listbox area to display an array based area
					//Note also that unlike showing the accounts without balances where the heading appears with the sub headings below, this shows the sub headings then the parent
					$_l_CurrentLevel:=LAY_LOADACCOUNTBALANCESARRAYS
					
					
					
					
					//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
					Case of 
						: ($_l_CurrentLevel=4)
							
							//LB_SetupListbox (->DB_lb_OutputArrays;"oCCM";"ACC_L";1;->ACC_at_Group1Codes;->ACC_at_Group1;->ACC_ar_Group1Totals;->ACC_at_Group2Codes;->ACC_at_Group2;->ACC_ar_Group2Totals;->ACC_at_Group3Codes;->ACC_at_Group3;->ACC_ar_Group3Totals;
							LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_at_Group4Codes; ->ACC_at_Group4; ->ACC_ar_Group4Totals; ->ACC_at_Group3Codes; ->ACC_at_Group3; ->ACC_ar_Group3Totals; ->ACC_at_Group2Codes; ->ACC_at_Group2; ->ACC_ar_Group2Totals; ->ACC_at_Group1Codes; ->ACC_at_Group1; ->ACC_ar_Group1Totals)
							LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; "Codes"; "Names"; "Total "; "Group Code"; "Group"; "Group Total"; "Group Code"; "Group"; "Group Total"; "Heading Code"; "Heading"; "Heading Total")
							LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 80; 290; 80; 80; 290; 80; 80; 290; 80; 80; 290; 80)
							LB_SetFormat(->DB_lb_OutputArrays; 2; "|AccountsNZ"; 3)
							LB_SetFormat(->DB_lb_OutputArrays; 2; "|AccountsNZ"; 6)
							LB_SetFormat(->DB_lb_OutputArrays; 2; "|AccountsNZ"; 9)
							LB_SetFormat(->DB_lb_OutputArrays; 2; "|AccountsNZ"; 12)
							
						: ($_l_CurrentLevel=3)
							
							LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_ar_Group3Totals; ->ACC_ar_Group2Totals; ->ACC_ar_Group1Totals; ->ACC_at_Group1Codes; ->ACC_at_Group1; ->ACC_at_Group2Codes; ->ACC_at_Group2; ->ACC_at_Group3Codes; ->ACC_at_Group3)
							
							
							
							//$showAnalysis:=False
							//$ShowLayers:=False
							
							LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; "Balance"; "Subtotal"; ""; ""; "Codes"; "Headings"; "Codes"; "Level one headings"; "Codes"; "Accounts")
							
							
							LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 80; 80; 80; 50; 209; 50; 209; 50; 209)
						: ($_l_CurrentLevel=2)
							
							LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_ar_Group2Totals; ->ACC_ar_Group1Totals; ->ACC_at_Group1Codes; ->ACC_at_Group1; ->ACC_at_Group2Codes; ->ACC_at_Group2)
							
							
							
							//$showAnalysis:=False
							//$ShowLayers:=False
							
							LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; "Subtotal"; ""; ""; "Codes"; "Headings"; "Codes")
							
							
							LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 80; 80; 50; 209; 50; 209)
						: ($_l_CurrentLevel=1)
							
							LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_ar_Group1Totals; ->ACC_at_Group1Codes; ->ACC_at_Group1)
							
							
							
							//$showAnalysis:=False
							//$ShowLayers:=False
							
							LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; ""; ""; "Codes")
							
							
							LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 80; 50; 209)
							
						: ($_l_CurrentLevel=0)
							
							LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_ar_Group1Totals; ->ACC_at_Group1Codes; ->ACC_at_Group1)
							
							
							
							//$showAnalysis:=False
							//$ShowLayers:=False
							
							LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; ""; ""; "Codes")
							
							
							LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 80; 50; 209)
							
							
					End case 
					//Card Type";"Issued by";"Card Number";'"Expiry Date";"";"";"")
					
					
					//`109;162;59;0;0;0)
					LB_SetScroll(->DB_lb_OutputArrays; -3; -2)
					
					
					
					LB_SetEnterable(->DB_lb_OutputArrays; False:C215; 0; "")
					
					LBi_InclSetupJustStyle(->DB_lb_OutputArrays)
					LB_Setdividers(->DB_lb_OutputArrays; Black:K11:16; 0)
					
					LB_StyleSettings(->DB_lb_OutputArrays; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
					
					LBI_Scrollonresize(->DB_lb_OutputArrays)
					ACC_l_CurrentSelectedRow:=0
					DB_bo_ShowArrayBased:=True:C214
			End case 
			
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			//implementing new interface for this
			If (False:C215)
				If ($_l_TabRow<0)
					ARRAY POINTER:C280(DB_aptr_Accounts; 0)
					APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Accounts)
					APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
					If (Count parameters:C259>=2)
						$_t_TableContext:=$_t_Context
					Else 
						$_t_TableContext:=""
					End if 
					APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
					APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
					//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
					
					$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
					$_bo_newLevel:=True:C214
					$_l_ReuseLevel:=0
				Else 
					$_bo_newLevel:=False:C215
					$_l_ReuseLevel:=0
				End if 
				$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Code:2; "411111000"; "Accounts_in"; 1; "Accounts"; "Account"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			LAY_LoadAccountsArrays
			
			ACC_l_CurrentSelectedRow:=0
			DB_bo_ShowArrayBased:=True:C214
			$_bo_StatsAvaiable:=False:C215
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
			
			//not displayed as a table
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
			//not displayed as a table
		: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
			
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Actions; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Actions)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Code:1; "411111000"; "Action_In"; 1; "Actions"; "Action"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_AddrFormats; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_AddrFormats)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
				$_bo_newLevel:=False:C215
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Code:1; "411111000"; "Types_In"; 1; "Address Formats"; "Address Format"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Analyses; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Analyses)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Code:1; "411111000"; "Analysis_In"; 1; "Analyses"; "Analysis"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[AREAS:3]))
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Areas; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Areas)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
				
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Code:1; "411111000"; "Area_in"; 1; "Areas"; "Area"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Brands; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Brands)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Code:1; "411111000"; "Brands_In"; 1; "Brands"; "Brand"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
			//not displayed
		: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
			//special interface for catalogues.
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Catalogue; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Catalogue)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CATALOGUE:108]x_ID:1; ->[CATALOGUE:108]x_ID:1; "411111000"; "Catalogue_Input"; 1; "Catalogues"; "Catalogue"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[Catalogue_Availability:110]))
		: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			//TRACE
			If (True:C214)
				//these were to do with events
				
				If ($_l_TabRow<0)
					ARRAY POINTER:C280(DB_aptr_Catagories; 0)
					APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Catagories)
					APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
					If (Count parameters:C259>=2)
						$_t_TableContext:=$_t_Context
					Else 
						$_t_TableContext:=""
					End if 
					APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
					APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
					//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
					
					$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
					$_bo_newLevel:=True:C214
					$_l_ReuseLevel:=0
				Else 
					$_bo_newLevel:=False:C215
					$_l_ReuseLevel:=0
				End if 
				$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
				$_bo_LoadSetup:=True:C214
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; "411111000"; "Categories_In"; 1; "Categories"; "Category"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
		: ($_l_TableNumber=Table:C252(->[CC_OrderAuths:133]))
		: ($_l_TableNumber=Table:C252(->[CCM_PSPTransaction:136]))
		: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
		: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
		: ($_l_TableNumber=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
			
		: ($_l_TableNumber=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
			
		: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_ContractTypes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_ContractTypes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CONTRACT_TYPES:19]Contract_Type_Code:1; ->[CONTRACT_TYPES:19]Contract_Type_Code:1; "411111000"; "ContractType_In"; 1; "Contract Types"; "Contract Type"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
			//TRACE
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Contracts; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Contracts)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CONTRACTS:17]Contract_Code:3; ->[CONTRACTS:17]Contract_Code:3; "411111000"; "Contract_in"; 3; "Contracts"; "Contract "; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
			
		: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Countries; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Countries)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]COUNTRY_CODE:1; "411111000"; "Country_In"; 1; "Countries"; "Country "; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_CreditStages; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_CreditStages)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Code:1; "411111000"; "CreditStage_In"; 1; "Credit Stages"; "Credit Stage "; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Currencies; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Currencies)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Code:1; "411111000"; "Currency_In"; 1; "Currencies"; "Currency "; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
			
		: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
			//this is not displayed like this-special interface
			
			
		: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_CurrentStock; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_CurrentStock)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_CurrentStockLabel:="Current Stock"
			$_t_CurrentStockLabel:=Term_StoWT($_t_CurrentStockLabel)
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CURRENT_STOCK:62]X_ID:13; ->[CURRENT_STOCK:62]X_ID:13; "411111000"; "CurrentStock_In"; 1; $_t_CurrentStockLabel; $_t_CurrentStockLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
			
		: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			//never displayed like this-except for showing letters
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Documents; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Documents)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			Case of 
				: ($_t_Context="Letters")
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_inLW"; 14; "Letters"; "Letter"; ""; $_bo_newLevel; $_l_ReuseLevel)
				Else 
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_inLW"; 14; "Letters"; "Letter"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End case 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
			
		: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Documents; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Documents)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[DOCUMENTS:7]Document_Code:1; ->[DOCUMENTS:7]Document_Code:1; "411111000"; "Letters_inW"; 1; "Document Templates"; "Document"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
		: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
			
		: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
		: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
		: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
		: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
		: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
		: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
			
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_FieldDefs; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_FieldDefs)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; "411111000"; "CustomFieldDef_In"; 4; "Further Field Definitions"; "Further Field Definition"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
			//sprecial editor interface for that
		: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
		: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_FieldDefs; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_FieldDefs)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[CUSTOM_FIELDS:98]Unique_Code:2; ->[CUSTOM_FIELDS:98]Unique_Code:2; "411111000"; "CustomFieldDef_In"; 1; "Further Field Definitions"; "Further Field Definition"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
			
		: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))  //Further analysis
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_FieldDefs; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_FieldDefs)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; "411111000"; "Furthers_In"; 3; "Further Analysis"; "Further Analysis"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Groups; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Groups)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Code:1; "411111000"; "ProductGroup_In"; 1; "Groups"; "Group"; ""; $_bo_newLevel; $_l_ReuseLevel)
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
			//If (False)
			//not doing this one-going to impleent the new accounts screen
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Heading; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Heading)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[HEADINGS:84]Heading_Code:1; ->[HEADINGS:84]Heading_Code:1; "411111000"; "Heading_in"; 1; "Headings"; "Heading"; ""; $_bo_newLevel; $_l_ReuseLevel)
			//End if
		: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
		: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			
			Case of 
				: ($_t_Context="ViewReceipts") | ($_t_Context="View Receipts") | ($_t_Context="Undo Receipt")
					
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Receipts; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Receipts)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
						
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
						
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_t_InvoiceItemLabel:="Receipts"
					$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
					$_t_InvoiceLabel:="Receipt"
					$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
					$_bo_LoadSetup:=True:C214
					If ($_bo_newLevel)
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Number:1; "411111000"; "Invoice_In"; 11; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=False:C215
				: ($_t_Context="ViewDeposits") | ($_t_Context="View Deposits") | ($_t_Context="Refund Deposit")
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Deposits; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Deposits)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_t_InvoiceItemLabel:="Deposits"
					$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
					$_t_InvoiceLabel:="Deposit"
					$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
					$_bo_LoadSetup:=True:C214
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Number:1; "411111000"; "Invoice_In"; 10; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=False:C215
				: ($_t_Context="ViewCreditnotes") | ($_t_Context="View Credit notes")
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Credits; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Credits)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_t_InvoiceItemLabel:="Credit Notes"
					$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
					$_t_InvoiceLabel:="Credits"
					$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
					$_bo_LoadSetup:=True:C214
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Number:1; "411111000"; "Invoice_In"; 9; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=False:C215
				: ($_t_Context="ViewProformas") | ($_t_Context="View Proformas")  //View invoices
					
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Proformas; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Proformas)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_t_InvoiceItemLabel:="Invoices"
					$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
					$_t_InvoiceLabel:="Invoice"
					$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
					$_bo_LoadSetup:=True:C214
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Number:1; "411111000"; "Invoice_In"; 12; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=False:C215
				Else 
					
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Invoices; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Invoices)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
						
					End if 
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					$_t_InvoiceItemLabel:="Invoices"
					$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
					$_t_InvoiceLabel:="Invoice"
					$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
					$_bo_LoadSetup:=True:C214
					If ($_bo_newLevel)
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Number:1; "411111000"; "Invoice_In"; 8; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=True:C214
					$_bo_StatsAvaiable:=True:C214
					$_bo_GraphsAvailable:=False:C215
			End case 
		: ($_l_TableNumber=Table:C252(->[INVOICES_ALLOCATIONS:162]))
		: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_InvoicesItems; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_InvoicesItems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_InvoiceItemLabel:="Invoice Items"
			$_t_InvoiceItemLabel:=Term_SLPLWT($_t_InvoiceItemLabel)
			$_t_InvoiceLabel:="Invoice Item"
			$_t_InvoiceLabel:=Term_SLPLWT($_t_InvoiceLabel)
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[INVOICES_ITEMS:161]ID:17; ->[INVOICES_ITEMS:161]ID:17; "411111000"; "Items_in"; 4; $_t_InvoiceItemLabel; $_t_InvoiceLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=False:C215
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_JobPers; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_JobPers)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[JOB PERSONNEL:48]Job_Personnel_Code:18; ->[JOB PERSONNEL:48]Job_Personnel_Code:18; "411111000"; "JobPers_in"; 2; "Job Personnel"; "Job Personnel"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
			
		: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_JobStages; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_JobStages)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[JOB_STAGES:47]Job_Stage_code:52; ->[JOB_STAGES:47]Job_Stage_code:52; "411111000"; "JobsB_Sub"; 6; "Job Stages"; "Job Stage"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_JobTypes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_JobTypes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Code:1; "411111000"; "Types_In"; 1; "Job Types"; "Job Type "; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[JOBS:26]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Jobs; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Jobs)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Code:1; "411111000"; "Job_In"; 4; "Jobs"; "Job "; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Layers; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Layers)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Code:1; "411111000"; "Layer_In"; 1; "Layers"; "Layer"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[LICENCE_UPDATES:97]))
		: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
			
		: ($_l_TableNumber=Table:C252(->[LIST_ITEMS:95]))
			
		: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Locations; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Locations)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[LOCATIONS:61]Location_Code:1; ->[LOCATIONS:61]Location_Code:1; "411111000"; "Location_In"; 1; "Locations"; "Location"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Macros; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Macros)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Code:1; "411111000"; "Scripts_in"; 1; "Macros"; "Macro"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[MAILSORT_A:77]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_B:78]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_C:79]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_D5:81]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_D6:82]))
		: ($_l_TableNumber=Table:C252(->[MAILSORT_MAIL:83]))
			
		: ($_l_TableNumber=Table:C252(->[MODULES:63]))
		: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_MovementTypes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_MovementTypes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Code:1; "411111000"; "MoveType_in"; 1; "Movement Types"; "Movement Type"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			//See earlier
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			//see earlier
		: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
			If (False:C215)
				//this wont be here -accounting periods have a special interface
				If ($_l_TabRow<0)
					ARRAY POINTER:C280(DB_aptr_periods; 0)
					APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_periods)
					APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
					If (Count parameters:C259>=2)
						$_t_TableContext:=$_t_Context
					Else 
						$_t_TableContext:=""
					End if 
					APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
					APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
					//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
					
					$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
					$_bo_newLevel:=True:C214
					$_l_ReuseLevel:=0
				Else 
					$_bo_newLevel:=False:C215
					$_l_ReuseLevel:=0
				End if 
				$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
				If ($_bo_newLevel)
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Code:1; "411111000"; "Period_In"; 1; "Accounting Periods"; "Accounting Period"; ""; $_bo_newLevel; $_l_ReuseLevel)
				End if 
			End if 
		: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PersonGroup; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PersonGroup)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Code:1; "411111000"; "PersonnelGroup_In"; 1; "Personnel Groups"; "Personnel Group"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Personnel; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Personnel)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PERSONNEL:11]Personnel_ID:48; ->[PERSONNEL:11]Personnel_ID:48; "411111000"; "Personnel_In"; 1; "Personnel"; "Personnel"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
		: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Pictures; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Pictures)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Code:1; "411111000"; "Picture_In"; 1; "Pictures"; "Picture"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PostCodes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PostCodes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[POSTAL_CODES:50]xRec_ID:5; ->[POSTAL_CODES:50]xRec_ID:5; "411111000"; "PostalCode_In"; 1; "Postal Codes"; "Post Code"; ""; $_bo_newLevel; $_l_ReuseLevel)
				//LBi_ArrDefFill ($_ptr_ListBoxSetup;->DB_l_LBOutputForm;->[PICTURES]Picture Code;->[PICTURES]Picture Code;"411111000";"Picture_In";1;"Pictures";"Picture";"";$_bo_newLevel;$_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
		: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PriceGroups; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PriceGroups)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Code:1; "411111000"; "PriceGroup_In"; 1; "Price Groups"; "Price Group"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PriceTable; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PriceTable)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PRICE_TABLE:28]Table_Code:12; ->[PRICE_TABLE:28]Table_Code:12; "411111000"; "PriceTable_In"; 9; "Price  Table"; "Price"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Problems; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Problems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PROBLEMS:22]Problem_Code:1; ->[PROBLEMS:22]Problem_Code:1; "411111000"; "Problems_In"; 1; "Problems"; "Problem"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			//See earlier
		: ($_l_TableNumber=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
		: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Projects; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Projects)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Code:1; "411111000"; "Projects_In"; 1; "Projects"; "Project"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Publications; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Publications)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PUBLICATIONS:52]Publication_Code:1; ->[PUBLICATIONS:52]Publication_Code:1; "411111000"; "Public_in"; 1; "Publications"; "Publications"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PurchaseOrders; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PurchaseOrders)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; "411111000"; "PurchaseOrder_In"; 7; "Purchase Orders"; "Purchase Order"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PurchaseOrderItems; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PurchaseOrderItems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PURCHASE_ORDERS_ITEMS:169]ID:17; ->[PURCHASE_ORDERS_ITEMS:169]ID:17; "411111000"; "Items_in"; 4; "Purchase Order Items"; "Purchase Order Item"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=False:C215
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Purchases; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Purchases)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_PurchasesLabel:="Purchases"
			$_t_PurchasesLabel:=Term_SLPLWT($_t_PurchasesLabel)
			$_t_PurchaseLabel:="Purchase Invoice"
			$_t_PurchaseLabel:=Term_SLPLWT($_t_PurchaseLabel)
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "411111000"; "Purchases_in"; 8; $_t_PurchasesLabel; $_t_PurchaseLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_PurchaseItems; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PurchaseItems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_PurchasesLabel:="Purchase Items"
			$_t_PurchasesLabel:=Term_SLPLWT($_t_PurchasesLabel)
			$_t_PurchaseLabel:="Purchase Invoice Item"
			$_t_PurchaseLabel:=Term_SLPLWT($_t_PurchaseLabel)
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[PURCHASE_INVOICE_ITEMS:158]ID:16; ->[PURCHASE_INVOICE_ITEMS:158]ID:16; "411111000"; "Purchases Items_in"; 4; $_t_PurchasesLabel; $_t_PurchaseLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=False:C215
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[QUALITY_GROUPS:56]))
		: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_RecordJournals; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_PurchaseOrderItems)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214  // this one can be edited on screen
			
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[RECURRING_JOURNALS:38]x_ID:15; ->[RECURRING_JOURNALS:38]x_ID:15; "411111000"; "Standing_In"; 1; "Re-occuring Journals"; "Re-occuring Journal"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[REC_JOURNALS_DATES:160]))
		: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Results; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Results)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214  // this one can be edited on screen
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Code:1; "411111000"; "Results_in"; 1; "Results"; "Result"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[ROLES:87]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Roles; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Roles)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214  // this one can be edited on screen
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Code:1; "411111000"; "Roles_In"; 1; "Roles"; "Role"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
		: ($_l_TableNumber=Table:C252(->[SALES_ProjectionLinks:114]))
		: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_ServiceCalls; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_ServiceCalls)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Call_Code:4; "411111000"; "Calls_in"; 3; "Service Calls"; "Service Call"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
		: ($_l_TableNumber=Table:C252(->[SMS_Log:124]))
		: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Solutions; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Solutions)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214  //This can be enabled for on screen editing
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[SOLUTIONS:23]Solution_Code:1; ->[SOLUTIONS:23]Solution_Code:1; "411111000"; "Solutions_in"; 1; "Solutions"; "Solution"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Sources; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Sources)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Code:1; "411111000"; "Sources_In"; 1; "Sources"; "Source"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[STAGES:45]))
			//TRACE
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Stages; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Stages)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214  //this can definitely be editable on screen
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Code:1; "411111000"; "Stages_in"; 1; "Stages"; "Stages"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[STATUS:4]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Status; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Status)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_bo_LoadSetup:=True:C214  //this could be made editable on screen with a pop up screen for the usage
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Code:1; "411111000"; "Status_in"; 1; "Stati"; "Status"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			If ($_t_Context#"Stock_History")
				If ($_l_TabRow<0)
					ARRAY POINTER:C280(DB_aptr_StockITems; 0)
					APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_StockITems)
					APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
					If (Count parameters:C259>=2)
						$_t_TableContext:=$_t_Context
					Else 
						$_t_TableContext:=""
					End if 
					APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
					APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
					//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
					
					$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
					$_bo_newLevel:=True:C214
					$_l_ReuseLevel:=0
				Else 
					$_bo_newLevel:=False:C215
					$_l_ReuseLevel:=0
				End if 
				$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
				$_t_StocksLabel:="Stock Movement Items"
				$_t_StocksLabel:=Term_StoWT($_t_StocksLabel)
				$_t_StockLabel:="Stock Movement Item"
				$_t_StockLabel:=Term_StoWT($_t_StockLabel)
				$_bo_LoadSetup:=True:C214
				If ($_bo_newLevel)
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; "411111000"; "Stock_in"; 14; $_t_StocksLabel; $_t_StockLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
				End if 
				$_bo_OnScreenEdit:=False:C215
				$_bo_ReadWriteEdit:=False:C215
				$_bo_StatsAvaiable:=False:C215
				$_bo_GraphsAvailable:=False:C215
			Else 
				//in this view we will use an array based view. This will display Products with the ability to expand product
				//this will display ALL products that have had stock movements of some kind
				DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
				QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
				ARRAY BOOLEAN:C223(PRD_abo_Expanded; 0)
				SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PRD_at_STKHistoryProducts; [PRODUCTS:9]Product_Name:2; PRD_at_STKHistoryName; [PRODUCTS:9]X_ID:43; PRD_al_ProductID)
				ARRAY BOOLEAN:C223(PRD_abo_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
				//be careful when changing selection to respect the expanded status of items
				ARRAY PICTURE:C279(PRD_aPic_Expanded; 0)
				ARRAY PICTURE:C279(PRD_aPic_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
				$_pi_Picture:=Get_Picture(403)
				//Get Picture FROM LIBRARY(403;$_pi_Picture)  //410 for expanded
				
				
				For ($_l_Index; 1; Size of array:C274(PRD_aPic_Expanded))
					PRD_aPic_Expanded{$_l_Index}:=$_pi_Picture
				End for 
				
				
				
				
				LB_SetupListbox(->DB_lb_OutputArrays; "oPRD"; "PRD_L"; 1; ->PRD_aPic_Expanded; ->PRD_at_STKHistoryProducts; ->PRD_at_STKHistoryName; ->PRD_abo_Expanded; ->PRD_al_ProductID)
				
				LB_SetColumnHeaders(->DB_lb_OutputArrays; "PRD_L"; 1; "Detail"; "Product Code"; "Product Name"; "Expanded"; "Product ID")
				
				
				
				LB_SetColumnWidths(->DB_lb_OutputArrays; "oPRD"; 1; 40; 210; 280; 0; 0)
				LB_SetScroll(->DB_lb_OutputArrays; -3; -2)
				LB_SetEnterable(->DB_lb_OutputArrays; False:C215; 0; "")
				
				LBi_InclSetupJustStyle(->DB_lb_OutputArrays)
				LB_Setdividers(->DB_lb_OutputArrays; Black:K11:16; 0)
				
				LB_StyleSettings(->DB_lb_OutputArrays; "Black"; 9; "PRD_S55"; ->[STOCK_MOVEMENTS:40])
				LBI_Scrollonresize(->DB_lb_OutputArrays)
				ACC_l_CurrentSelectedRow:=0
				STK_bo_StockItemsIncluded:=False:C215  //change this when we expand a line
				
				DB_bo_ShowArrayBased:=True:C214
				
			End if 
		: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_StockLevels; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_StockLevels)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_StocksLabel:="Stock Levels"
			$_t_StocksLabel:=Term_StoWT($_t_StocksLabel)
			$_t_StockLabel:="Stock Level"
			$_t_StockLabel:=Term_StoWT($_t_StockLabel)
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STOCK_LEVELS:58]X_ID:10; ->[STOCK_LEVELS:58]X_ID:10; "411111000"; "StockLev_in"; 1; $_t_StocksLabel; $_t_StockLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			//with this one there is no meaningful data entry-the filter should display automatically
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=False:C215
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_StockMovement; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_StockMovement)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_StocksLabel:="Stock Movements"
			$_t_StocksLabel:=Term_StoWT($_t_StocksLabel)
			$_t_StockLabel:="Stock Movement"
			$_t_StockLabel:=Term_StoWT($_t_StockLabel)
			$_bo_LoadSetup:=True:C214
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "411111000"; "Movements_in"; 1; $_t_StocksLabel; $_t_StockLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_StockType; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_StockType)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			$_t_StocksLabel:="Stock Types"
			$_t_StocksLabel:=Term_StoWT($_t_StocksLabel)
			$_t_StockLabel:="Stock Type"
			$_t_StockLabel:=Term_StoWT($_t_StockLabel)
			$_bo_LoadSetup:=True:C214  //this one can be edited on screen
			
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Code:1; "411111000"; "StockTypes_in"; 1; $_t_StocksLabel; $_t_StockLabel; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[Stock_Thread:143]))
		: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
			
		: ($_l_TableNumber=Table:C252(->[SYS_LISTS:167]))
		: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_TaxCodes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_TaxCodes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214  //this one can be edited on screen
			
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Code:1; "411111000"; "Vat_in"; 1; "Tax Codes"; "Tax Code"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=True:C214
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
		: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Terminology; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Terminology)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TERMINOLOGY:75]Terminology_Code:1; ->[TERMINOLOGY:75]Terminology_Code:1; "411111000"; "Term_in"; 1; "Terminology"; "Terminology"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
			
			
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_TransIn; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_TransIn)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TRANSACTION_BATCHES:30]Batch_Number:10; ->[TRANSACTION_BATCHES:30]Batch_Number:10; "411111000"; "TransB_in"; 4; "Transaction Batch Entries"; "Transaction Batch"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_TransTypes; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_TransTypes)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			//Done
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; "411111000"; "TransT_in"; 1; "Transaction Types"; "Transaction Type"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[TRANS_MULTI:128]))
		: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
			//``
			Case of 
				: ($_t_Context="")
					
					If ($_l_TabRow<0)
						ARRAY POINTER:C280(DB_aptr_Transactions; 0)
						APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Transactions)
						APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
						If (Count parameters:C259>=2)
							$_t_TableContext:=$_t_Context
						Else 
							$_t_TableContext:=""
						End if 
						APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
						APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
						//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
						
						$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
						$_bo_newLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_newLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					//done
					$_bo_LoadSetup:=True:C214
					$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
					If ($_bo_newLevel)
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TRANSACTIONS:29]Transaction_ID:31; ->[TRANSACTIONS:29]Transaction_ID:31; "411111000"; "Trans_in"; 1; "Transactions"; "Transaction"; ""; $_bo_newLevel; $_l_ReuseLevel)
					End if 
					$_bo_OnScreenEdit:=False:C215
					$_bo_ReadWriteEdit:=False:C215
					$_bo_StatsAvaiable:=False:C215
					$_bo_GraphsAvailable:=False:C215
				Else 
					Case of 
						: ($_t_Context="Reconcile Transactions")
							If ($_l_TabRow<0)
								ARRAY POINTER:C280(DB_aptr_RecTransactions; 0)
								APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_RecTransactions)
								APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
								If (Count parameters:C259>=2)
									$_t_TableContext:=$_t_Context
								Else 
									$_t_TableContext:=""
								End if 
								APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
								APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
								//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
								
								$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
								$_bo_newLevel:=True:C214
								$_l_ReuseLevel:=0
							Else 
								$_bo_newLevel:=False:C215
								$_l_ReuseLevel:=0
							End if 
							//done
							$_bo_LoadSetup:=True:C214
							$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
							If ($_bo_newLevel)
								LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TRANSACTIONS:29]Transaction_ID:31; ->[TRANSACTIONS:29]Transaction_ID:31; "411111000"; "Trans_in"; 2; "Transactions"; "Transaction"; ""; $_bo_newLevel; $_l_ReuseLevel)
							End if 
							$_bo_OnScreenEdit:=False:C215
							$_bo_ReadWriteEdit:=False:C215
							$_bo_StatsAvaiable:=False:C215
							$_bo_GraphsAvailable:=False:C215
							
						Else 
							If ($_l_TabRow<0)
								ARRAY POINTER:C280(DB_aptr_Transactions; 0)
								APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Transactions)
								APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
								If (Count parameters:C259>=2)
									$_t_TableContext:=$_t_Context
								Else 
									$_t_TableContext:=""
								End if 
								APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
								APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
								//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
								
								$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
								$_bo_newLevel:=True:C214
								$_l_ReuseLevel:=0
							Else 
								$_bo_newLevel:=False:C215
								$_l_ReuseLevel:=0
							End if 
							//done
							$_bo_LoadSetup:=True:C214
							$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
							If ($_bo_newLevel)
								LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TRANSACTIONS:29]Transaction_ID:31; ->[TRANSACTIONS:29]Transaction_ID:31; "411111000"; "Trans_in"; 1; "Transactions"; "Transaction"; ""; $_bo_newLevel; $_l_ReuseLevel)
							End if 
							$_bo_OnScreenEdit:=False:C215
							$_bo_ReadWriteEdit:=False:C215
							$_bo_StatsAvaiable:=False:C215
							$_bo_GraphsAvailable:=False:C215
					End case 
			End case 
		: ($_l_TableNumber=Table:C252(->[TYPES:5]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Types; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Types)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			//Done
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Code:1; "411111000"; "Types_In"; 1; "Types"; "Type"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[USER_SETS:105]))
		: ($_l_TableNumber=Table:C252(->[WEB_ACCESS:130]))
		: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Workflow; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Workflow)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			//Done
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; "411111000"; "Workflow_Control_In"; 1; "Workflow"; "Workflow"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
		: ($_l_TableNumber=Table:C252(->[WORKFLOW_Campaign:209]))
			If ($_l_TabRow<0)
				ARRAY POINTER:C280(DB_aptr_Workflow; 0)
				APPEND TO ARRAY:C911(DB_aptr_ContextPointers; ->DB_aptr_Workflow)
				APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $_l_TableNumber)
				If (Count parameters:C259>=2)
					$_t_TableContext:=$_t_Context
				Else 
					$_t_TableContext:=""
				End if 
				APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
				APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
				//APPEND TO ARRAY(DB_al_ContextAccess;DB_l_UserFormAccess)
				
				$_l_TabRow:=Size of array:C274(DB_at_ContextNames)
				$_bo_newLevel:=True:C214
				$_l_ReuseLevel:=0
			Else 
				$_bo_newLevel:=False:C215
				$_l_ReuseLevel:=0
			End if 
			//Done
			$_bo_LoadSetup:=True:C214
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TabRow}
			If ($_bo_newLevel)
				LBi_ArrDefFill($_ptr_ListBoxSetup; ->DB_l_LBOutputForm; ->[WORKFLOW_Campaign:209]UUID:1; ->[WORKFLOW_Campaign:209]UUID:1; "411111000"; "Campaign_Entry"; 1; "Campaign"; "Campaign"; ""; $_bo_newLevel; $_l_ReuseLevel)
			End if 
			$_bo_OnScreenEdit:=False:C215
			$_bo_ReadWriteEdit:=True:C214
			$_bo_StatsAvaiable:=False:C215
			$_bo_GraphsAvailable:=False:C215
			
	End case 
	If (Not:C34($_bo_StatsAvaiable))
		DB_bo_DisplayStats:=False:C215
		DB_bo_StatsAvailabe:=False:C215
	Else 
		$_bo_StatsAvaiable:=False:C215
		$_l_DisplayRecordsTable:=$_l_TableNumber
		Case of 
			: ($_l_DisplayRecordsTable=Table:C252(->[CONTRACTS:17]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[ACCOUNT_BALANCES:34]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[COMPANIES:2]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[CONTACTS:1]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[DIARY:12]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[ORDER_ITEMS:25]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[TRANSACTIONS:29]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_LEVELS:58]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[CURRENT_STOCK:62]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[INFORMATION:55]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[PROJECTS:89]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[PRODUCTS:9]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[DOCUMENTS:7]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[JOB_STAGES:47]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[JOBS:26]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[JOB PERSONNEL:48]))
				$_bo_StatsAvaiable:=True:C214
			: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
				$_bo_StatsAvaiable:=True:C214
			Else 
				$_bo_StatsAvaiable:=False:C215
		End case 
		If (Not:C34($_bo_StatsAvaiable))
			DB_bo_DisplayStats:=False:C215
		End if 
		
	End if 
	If (DB_bo_DisplayStats)  //if this is turned on-keep it on and update it
		
		DB_bo_DisplayStats:=DB_InitStatsView(DB_l_CurrentDisplayedForm)
		
	End if 
	If (DB_bo_ShowArrayBased)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; True:C214)
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
		If ($_bo_LoadSetup)
			
			
			LBi_LoadSetup($_ptr_ListBoxSetup)
			If ($_t_Context="")
				$_t_TableName:=Table name:C256(DB_l_CurrentDisplayedForm)
			Else 
				$_t_TableName:=$_t_Context
			End if 
			$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
			$_l_RecordsInSelection:=Records in selection:C76($_ptr_Table->)
			If (DB_l_MaxRecords=-1)
				$_l_RecordsInSelection2:=Records in table:C83($_ptr_Table->)
			Else 
				$_l_RecordsInSelection2:=DB_l_MaxRecords
			End if 
			SET WINDOW TITLE:C213($_t_TableName+" "+String:C10($_l_RecordsInSelection)+" of "+String:C10($_l_RecordsInSelection2))
			DB_SetWindowTitle(DB_l_CurrentDisplayedForm; $_t_Context)
			
			
		End if 
	End if 
	DB_bo_OnScreenEdit:=$_bo_OnScreenEdit  //This will be true if we can edit in the on screen display rather than open a window
	
	If ($_t_Context="Select Records")
		
		DB_bo_ReturnSelection:=True:C214
		DB_l_ReturnSelectionTable:=DB_l_CurrentDisplayedForm
		
	End if 
	DB_LoadFilters(DB_l_CurrentDisplayedForm)
	If (Count parameters:C259>=3)
		If ($3#DB_l_CurrentDisplayedForm)
			If (DB_bo_DisplayFilters) & (DB_bo_FiltersAvailable)
				DB_l_TurnOnFilters:=1
				POST OUTSIDE CALL:C329(Current process:C322)
			End if 
			If (DB_bo_FiltersAvailable)
				LAY_bo_PeriodsSetup:=False:C215
				LAY_bo_SalesPersonSetup:=False:C215
				LAY_bo_CountriesSetup:=False:C215
				LAY_bo_CountiesSetup:=False:C215
				LAY_bo_AreasSetup:=False:C215
				LAY_bo_CoTypesSetup:=False:C215
				LAY_bo_StatusSetup:=False:C215
				LAY_bo_RolesSetup:=False:C215
				LAY_bo_ConTypeSetup:=False:C215
				LAY_bo_HeadingsSetup:=False:C215
				LAY_bo_pGroupsSetup:=False:C215
				LAY_bo_pBrandsSetup:=False:C215
				LAY_bo_pCollectionsSetup:=False:C215
				LAY_bo_OrdTypeSetup:=False:C215
				LAY_bo_OrdStatesSetup:=False:C215
				LAY_bo_ContractTypesSetup:=False:C215
				LAY_bo_StockTypesSetup:=False:C215
				LAY_bo_StockLocationsSetup:=False:C215
				LAY_bo_CreditStatesSetup:=False:C215
				LAY_bo_POStatesSetup:=False:C215
				LAY_bo_MoveTypesSetup:=False:C215
				DB_bo_FiltersActivated:=False:C215
				$_l_DefaultFilterID:=DB_GetdefaultFilterID(DB_l_CurrentDisplayedForm)
				If ($_l_DefaultFilterID#0)
					
					
					SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
					DB_LoadFilterParameters($_l_DefaultFilterID; DB_l_CurrentDisplayedForm)
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; False:C215)
					OBJECT SET ENABLED:C1123(*; "oClearFilters"; False:C215)
					DB_t_FilterMessage:=""
					
				End if 
			End if 
		End if 
	End if 
	SRCH_SetSearchParameters(DB_l_CurrentDisplayedForm; 0; $2)
End if 
ERR_MethodTrackerReturn("DB_SetFormLayout"; $_t_oldMethodName)
