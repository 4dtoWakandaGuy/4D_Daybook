//%attributes = {}
If (False:C215)
	//Project Method Name:      inButtSubHandle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2010 18:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(LB_SetMode)
	//C_UNKNOWN(P_Message)
	//C_UNKNOWN(vTot)
	//C_UNKNOWN(vTot2)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY BOOLEAN(COM_LB_FurtherAnalysis;0)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY BOOLEAN(CONT_abo_IsDefault;0)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY BOOLEAN(SC_abo_PartsOrdered;0)
	//ARRAY BOOLEAN(SC_abo_ProductisForRepair;0)
	//ARRAY BOOLEAN(SC_abo_RelatedContract;0)
	//ARRAY BOOLEAN(SC_abo_RelatedOrder;0)
	//ARRAY BOOLEAN(SVS_abo_AccessoryIncluded;0)
	ARRAY INTEGER:C220($_ai_RetainedOrderSequence; 0)
	//ARRAY INTEGER(ACC_ai_TransDelete;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	ARRAY LONGINT:C221($_al_DeleteRows; 0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_NewSortOrder; 0)
	ARRAY LONGINT:C221($_al_OrderItemNumber; 0)
	//ARRAY LONGINT(ACC_al_BatchitemCompanion;0)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY LONGINT(ACC_al_SublineDelete;0)
	//ARRAY LONGINT(ACC_al_TransBatchItemIDDEL;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY LONGINT(PUR_al_ItemsMode;0)
	//ARRAY LONGINT(SC_al_ComponentID;0)
	//ARRAY LONGINT(SC_al_LocationID;0)
	//ARRAY LONGINT(SC_al_OrderitemNumber;0)
	//ARRAY LONGINT(SC_al_PartsrequiredStatus;0)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY LONGINT(SC_al_RepairStatus;0)
	//ARRAY LONGINT(SC_al_SeverityID;0)
	//ARRAY LONGINT(SC_al_SymptomID;0)
	//ARRAY LONGINT(SC_al_WarrantyStatus;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY LONGINT(SVS_al_Accessory;0)
	//ARRAY LONGINT(SVS_al_IncProdID;0)
	//ARRAY LONGINT(SVS_al_LocationID;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	//ARRAY POINTER(CUS_aptr_LBSetup;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY POINTER(PTR_aptr_LbSetup;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY REAL(ACC_ar_BatchItemAmountDEL;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY REAL(ACC_ar_TransTaxAmtDEL;0)
	//ARRAY REAL(ACC_ar_TransTotalDEL;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(CNT_at_ProductNames;0)
	//ARRAY TEXT(CONT_at_ProductCodes;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	//ARRAY TEXT(JOB_at_Modeorders;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	//ARRAY TEXT(JST_at_JobStageTab;0)
	//ARRAY TEXT(JST_at_ModeOrderI;0)
	//ARRAY TEXT(JST_at_ModePersonnel;0)
	//ARRAY TEXT(ORD_at_ModeDiary;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	//ARRAY TEXT(PRJ_at_ModeJob;0)
	//ARRAY TEXT(PUR_at_ItemMode;0)
	//ARRAY TEXT(SC_at_additionalInformation;0)
	//ARRAY TEXT(SC_at_ComponentName;0)
	//ARRAY TEXT(SC_at_ContractDatesStrings;0)
	//ARRAY TEXT(SC_at_ContractTypeCode;0)
	//ARRAY TEXT(SC_at_FaultNotes;0)
	//ARRAY TEXT(SC_at_LocationName;0)
	//ARRAY TEXT(SC_at_ModeCharge;0)
	//ARRAY TEXT(SC_at_OrderCode;0)
	//ARRAY TEXT(SC_at_PartsrequiredName;0)
	//ARRAY TEXT(SC_at_ProductCode;0)
	//ARRAY TEXT(SC_at_ProductContract;0)
	//ARRAY TEXT(SC_at_ProductName;0)
	//ARRAY TEXT(SC_at_ProductSerial;0)
	//ARRAY TEXT(SC_at_RelatedRecordCode;0)
	//ARRAY TEXT(SC_at_Relatedtype;0)
	//ARRAY TEXT(SC_at_RepairStatusName;0)
	//ARRAY TEXT(SC_at_severityName;0)
	//ARRAY TEXT(SC_at_SymptomName;0)
	//ARRAY TEXT(SC_at_Systems;0)
	//ARRAY TEXT(SC_at_Warranty;0)
	//ARRAY TEXT(SD_at_TrState;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	//ARRAY TEXT(SUB_at_Modes;0)
	//ARRAY TEXT(SVS_at_Accessory;0)
	//ARRAY TEXT(SVS_at_AnLocationnames;0)
	C_BOOLEAN:C305($_bo_isDefault; $_bo_NoFault; $_bo_OK; $_bo_ReadOnly; $_bo_Refresh; BAT_bo_addingSub; BAT_bo_UseAreaList; CNT_bo_ProductIsFound; CON_bo_AddFurthers; GEN_Bo_ShowCreate; LB_bo_AddLine)
	C_BOOLEAN:C305(ORD_bo_QuickAddMode; STK_bo_LineTrackerActive; $_bo_Continue; $_bo_isDefault; $_bo_NoFault; $_bo_OK; $_bo_ReadOnly; $_bo_Refresh; BAT_bo_addingSub; BAT_bo_UseAreaList; CNT_bo_ProductIsFound)
	C_BOOLEAN:C305(CON_bo_AddFurthers; DB_bo_RecordModified; GEN_Bo_ShowCreate; ORD_bo_QuickAddMode; STK_bo_LineTrackerActive)
	C_LONGINT:C283($_l_ArraySize; $_l_ButtonPressed; $_l_CurrentColumn; $_l_CurrentFormPage; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delete; $_l_Index; $_l_Index2; $_l_ItemNumberPosition; $_l_Line)
	C_LONGINT:C283($_l_LinkedRecordsCount; $_l_No; $_l_NumberOfInvoicedRecords; $_l_ProductCodePosition; $_l_RecordClash; $_l_RowElement; $_l_SizeofArray; $_l_SortFieldNumber; $_l_TableNumber; $FIeldNumber; ACC_l_Deletion)
	C_LONGINT:C283(CON_l_CurrentSubArea; DB_l_ButtonClickedFunction; DS_l_BATCHITEMRef; LB_l_SelectedRow; LB_SetMode; P_Message; PROD_l_SelectorPallette; SC_l_ItemID; STOCK_l_Context; SVS_l_ItemForRepair; SVS_l_Itemlocation)
	C_LONGINT:C283(SVS_l_PartsStatus; SVS_l_RepairStatus; SVS_l_SelectedItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_AddedLineNumber; $_l_ArraySize)
	C_LONGINT:C283($_l_ButtonPressed; $_l_CurrentColumn; $_l_CurrentFormPage; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delete; $_l_Index; $_l_Index2; $_l_ItemNumberPosition; $_l_LbEditState; $_l_Line)
	C_LONGINT:C283($_l_LinkedRecordsCount; $_l_No; $_l_NumberOfInvoicedRecords; $_l_ProductCodePosition; $_l_RecordClash; $_l_RowElement; $_l_SizeofArray; $_l_SortFieldNumber; $_l_TableNumber; $1; ACC_l_Deletion)
	C_LONGINT:C283(CON_l_CurrentSubArea; DB_l_ButtonClickedFunction; DS_l_BATCHITEMRef; LB_l_SelectedRow; SC_l_ItemID; SD_l_EditingDiaryRecord; STOCK_l_Context; SVS_l_ItemForRepair; SVS_l_Itemlocation; SVS_l_PartsStatus; SVS_l_RepairStatus)
	C_LONGINT:C283(SVS_l_SelectedItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty; vNo; WIN_l_CurrentWinRef)
	C_PICTURE:C286(PI_pic_EditMode)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_Ptr_ColumArray; $_Ptr_ColumnArray; $_ptr_EnterabilityArray; $_ptr_FieldReferences; $_ptr_LBTabl)
	C_POINTER:C301($_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $2; $_ptr_AreaPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_ColumArray; $_Ptr_ColumnArray; $_ptr_EnterabilityArray; $_ptr_FieldReferences)
	C_POINTER:C301($_ptr_LBParentTable; $_ptr_LBTabl; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $2)
	C_REAL:C285(vTot; vTot2; $_r_QAProductQty)
	C_TEXT:C284($_t_CustomFieldCode; $_t_DataEntrytype; $_t_FormName; $_t_oldMethodName; $_t_OrderItemsString; $_t_QAProductCode; $_t_QAProductName; $_t_TableName; $3; ACC_t_CurrentFocus; CON_t_CurrentFocus)
	C_TEXT:C284(CON_t_P2Area; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; PRD_T_CompProductCode; SVS_t_ContractCode; SVS_t_FaultNote; SVS_t_ItemLocation)
	C_TEXT:C284(SVS_t_PartsStatus; SVS_t_ProductCode; SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_SerialNumber; SVS_t_Severity; SVS_t_SOCode; SVS_t_Symptom; SVS_t_Warranty; $_t_AreaReference; $_t_CustomFieldCode)
	C_TEXT:C284($_t_DataEntrytype; $_t_FormName; $_t_oldMethodName; $_t_OrderItemsString; $_t_QAProductCode; $_t_QAProductName; $_t_TableName; $3; ACC_t_CurrentFocus; AL_t_AreaFocus; CON_t_CurrentFocus)
	C_TEXT:C284(CON_t_P2Area; DB_t_CurrentFormUsage; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; PRD_T_CompProductCode; SVS_t_ContractCode; SVS_t_ContractType; SVS_t_FaultNote; SVS_t_ItemLocation; SVS_t_PartsStatus)
	C_TEXT:C284(SVS_t_ProductCode; SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_SerialNumber; SVS_t_Severity; SVS_t_SOCode; SVS_t_Symptom; SVS_t_SystemName; SVS_t_Warranty)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("inButtSubHandle")

//NG Feb 2004
//Modified 13/7/2006 new calls for listbox
//This method is to replace the buttons on screen on forms handling sub-form and area list entry
//Implemented for
$_l_ButtonPressed:=DB_l_ButtonClickedFunction
DB_l_ButtonClickedFunction:=0

ERR_MethodTracker("inButtSubHandle"; Form event code:C388)
If (Count parameters:C259>=1)
	$_l_CurrentFormPage:=$1
Else 
	$_l_CurrentFormPage:=1
End if 
If (Count parameters:C259>=2)
	$_ptr_LBTable:=$2
Else 
	$_ptr_LBTable:=->[USER:15]  //WHICH WILL MAKE IT DO NOTHING
End if 
If (Count parameters:C259>=3)
	$_t_FormName:=$3
Else 
	$_t_FormName:=""
End if 
Case of 
	: ($_l_ButtonPressed=DB_GetButtonFunction("Plus")) | ($_l_ButtonPressed=DB_GetButtonFunction("PlusOption"))
		//Add a record
		$_l_TableNumber:=Table:C252($_ptr_LBTable)
		Case of 
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				//this could be to add an analysis or Layer
				If (ACC_t_CurrentFocus="")
					ACC_t_CurrentFocus:="Analyses"
				End if 
				Case of 
					: (ACC_t_CurrentFocus="Analyses")
						ACC_AddSubEntityAnalyses
						
					Else 
						//layers
						ACC_AddSubEntityLayers
				End case 
			: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
				Case of 
					: ($1=4)
						
						If ([CONTRACT_TYPES:19]Contract_Type_Code:1#"")
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55=1)
							If (Records in selection:C76([PRODUCTS:9])>0)
								
								CNT_bo_ProductIsFound:=False:C215
								PRD_T_CompProductCode:="@"
								Check_Product(->PRD_T_CompProductCode; "Product"; ->CNT_bo_ProductIsFound; "")
								If (CNT_bo_ProductIsFound)
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=PRD_T_CompProductCode)
									QUERY:C277([Contract_Type_Products:191]; [Contract_Type_Products:191]xContractTypeCode:1=[CONTRACT_TYPES:19]Contract_Type_Code:1)
									$_bo_isDefault:=(Records in selection:C76([Contract_Type_Products:191])=0)
									//This is the first one
									If (Records in selection:C76([Contract_Type_Products:191])>0)
										QUERY SELECTION:C341([Contract_Type_Products:191]; [Contract_Type_Products:191]xProductCodes:2=PRD_T_CompProductCode)
										$_bo_Continue:=False:C215
									Else 
										$_bo_Continue:=True:C214
									End if 
									If ($_bo_Continue)
										CREATE RECORD:C68([Contract_Type_Products:191])
										[Contract_Type_Products:191]xContractTypeCode:1:=[CONTRACT_TYPES:19]Contract_Type_Code:1
										[Contract_Type_Products:191]xProductCodes:2:=PRD_T_CompProductCode
										[Contract_Type_Products:191]xDefaultProduct:3:=$_bo_isDefault
										SAVE RECORD:C53([Contract_Type_Products:191])
										If ([CONTRACT_TYPES:19]Contract_Type_Code:1#"")
											QUERY:C277([Contract_Type_Products:191]; [Contract_Type_Products:191]xContractTypeCode:1=[CONTRACT_TYPES:19]Contract_Type_Code:1)
										Else 
											REDUCE SELECTION:C351([Contract_Type_Products:191]; 0)
										End if 
										SELECTION TO ARRAY:C260([Contract_Type_Products:191]xProductCodes:2; CONT_at_ProductCodes; [Contract_Type_Products:191]xDefaultProduct:3; CONT_abo_IsDefault)
										If (Size of array:C274(CONT_at_ProductCodes)>0)
											READ ONLY:C145([PRODUCTS:9])
											If (Size of array:C274(CONT_at_ProductCodes)>1)
												QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; CONT_at_ProductCodes)
											Else 
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=CONT_at_ProductCodes{1})
											End if 
											ARRAY TEXT:C222(CNT_at_ProductNames; Size of array:C274(CONT_at_ProductCodes))
											SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProductNames)
											For ($_l_Index; 1; Size of array:C274($_at_ProductCodes))
												$_l_ProductCodePosition:=Find in array:C230(CONT_at_ProductCodes; $_at_ProductCodes{$_l_Index})
												If ($_l_ProductCodePosition>0)
													CNT_at_ProductNames{$_l_ProductCodePosition}:=$_at_ProductNames{$_l_Index}
													
												End if 
											End for 
										Else 
											ARRAY TEXT:C222(CNT_at_ProductNames; 0)
										End if 
										
									Else 
										Gen_Alert("This product is already on this contract type you may not add it twice!")
										
									End if 
								End if 
							Else 
								Gen_Alert("Sorry you must set up time based products for this type of billing first!")
							End if   //
						Else 
							Gen_Alert("You must create a contract code first!")
						End if 
						
				End case 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				PO_AddSubentity
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				INV_addSubEntity($_l_CurrentFormPage)
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				PI_AddSubentity($_l_CurrentFormPage)
				
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				Products_AddSubentity($_t_FormName)
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
				ACCBalance_addSubentity
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				
				If ([COMPANIES:2]Company_Code:1#"") & ([COMPANIES:2]x_ID:63>0)
					
					If (Count parameters:C259<3)
						Case of 
							: ($_l_CurrentFormPage=1)
								GOTO OBJECT:C206(COM_aPtr_CoFurthers)
							: ($_l_CurrentFormPage=2)
								GOTO OBJECT:C206(COM_LB_FurtherAnalysis)
								
						End case 
						DB_l_ButtonClickedFunction:=$_l_ButtonPressed
						inButtSubHandle(FORM Get current page:C276; ->[COMPANIES:2]; "EXECUTE")
					Else 
						Companies_addSubEntity
					End if 
					
				End if 
				
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				Case of 
						
					: ($_t_FormName="Contact_In") | ($_t_FormName="Company_In")
						If (CON_l_CurrentSubArea=1) | (CON_t_CurrentFocus=CON_t_CurrentFocus)
							If (CON_bo_AddFurthers)
								DB_SaveRecord(->[CONTACTS_RECORD_ANALYSIS:144])
							End if 
							CON_bo_AddFurthers:=True:C214
							CREATE RECORD:C68([CONTACTS_RECORD_ANALYSIS:144])
							[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_RECORD_ANALYSIS:144]ID:2:=AA_GetNextID(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
							$_ptr_ListboxArea:=->CON_aPtr_LBAnalSetup
							$_ptr_ListboxArea:=$_ptr_ListboxArea->{1}
							LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxArea; ->LB_SetMode; $_l_CurrentRow; $_l_CurrentColumn)
							$_ptr_EnterabilityArray:=$_ptr_ListboxArea->{14}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxArea->{3}
							$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
							$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
							If ($_l_AddedLineNumber>0)
								$_l_SizeofArray:=$_l_AddedLineNumber
							End if 
							LB_GoToCell(->CON_lb_FurtherAnalysis; 1; $_l_SizeofArray)
						Else 
							Contacts_AddSubentity
							
						End if 
				End case 
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				If (Count parameters:C259>=3)
					$_t_DataEntrytype:=$_t_FormName
				Else 
					$_t_DataEntrytype:="Order_In"
				End if 
				If ($_t_DataEntrytype#"Jobs_TCIn")
					If (ORD_bo_QuickAddMode)
						If (((ORD_AT_QuickAddProdCode{1}#"") | (ORD_AT_QuickAddProdName{1}#"")) & (ORD_ar_QuickAddQuantity{1}#0))
							If (Gen_Option) | ($_l_ButtonPressed=DB_GetButtonFunction("PlusOption"))
								
								$_t_QAProductName:=ORD_AT_QuickAddProdName{1}
								$_t_QAProductCode:=ORD_AT_QuickAddProdCode{1}
								$_r_QAProductQty:=ORD_ar_QuickAddQuantity{1}
								LISTBOX INSERT ROWS:C913(ORD_lb_ArraySelection; 0)
								ORD_AT_QuickAddProdCode{1}:=$_t_QAProductCode
								ORD_ar_QuickAddQuantity{1}:=$_r_QAProductQty
								ORD_AT_QuickAddProdName{1}:=$_t_QAProductName
								
								LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
								
							Else 
								LISTBOX INSERT ROWS:C913(ORD_lb_ArraySelection; 0)
								LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
							End if 
							
						End if 
						
					Else 
						ORD_AddSubEntity
					End if 
					
					
				Else 
					
					If (FORM Get current page:C276=1)
						//add diary item
						If ([ORDERS:24]Your_Order_Number:10#"") & ([ORDERS:24]Source:18#"")
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							End if 
							
							If ([DIARY:12]Diary_Code:3#"")
								DB_SaveRecord(->[DIARY:12])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
								
							End if 
							CREATE RECORD:C68([DIARY:12])
							Diary_inTB
							$_ptr_ListboxSetup:=->ORD_aPtr_LbDISetup
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
							
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->ORD_at_ModeDiary; $_l_CurrentRow; $_l_CurrentColumn)
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							//put the cursor in the correct place
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
							$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
							$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
							$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
							$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
							$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
							$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
							If ($_l_AddedLineNumber>0)
								$_l_SizeofArray:=$_l_AddedLineNumber
							End if 
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
									$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
								End if 
							End for 
							
						Else 
							Gen_Alert("You cannot add times until the Job and Stage code are entered")
						End if 
						
					Else 
						//add order item
						If ([ORDERS:24]Your_Order_Number:10#"") & ([ORDERS:24]Source:18#"")
							If ([ORDER_ITEMS:25]Job_Code:34#"")  //added 10/01/07 -kmw (fix problem with previous order item not being saved when adding a new one)
								DB_SaveRecord(->[ORDER_ITEMS:25])  //added 10/01/07 -kmw (fix problem with previous order item not being saved when adding a new one)
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))  //added 10/01/07 -kmw (fix problem with previous order item not being saved when adding a new one)
							End if   //added 10/01/07 -kmw (fix problem with previous order item not being saved when adding a new one)
							
							
							CREATE RECORD:C68([ORDER_ITEMS:25])
							//`
							If (SD_at_TrState=1)
								[ORDER_ITEMS:25]State:46:="B"
							Else 
								[ORDER_ITEMS:25]State:46:="A"
							End if 
							If (DB_GetModuleSettingByNUM(Module_PriceTable)<2)
								OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Price_Code:36; False:C215)
							End if 
							[ORDER_ITEMS:25]Job_Code:34:=[ORDERS:24]Your_Order_Number:10
							[ORDER_ITEMS:25]Job_Stage:35:=[ORDERS:24]Source:18
							[ORDER_ITEMS:25]Quantity:3:=1
							//`
							OrderI_SubLPB
							$_ptr_ListboxSetup:=->ORD_aPtr_OrderItemsSetup
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
							
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->ORD_at_ModeOrders; $_l_CurrentRow; $_l_CurrentColumn)
							
							//put the cursor in the correct place
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
							$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
							$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
							$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
							$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
							$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
							$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
							If ($_l_AddedLineNumber>0)
								$_l_SizeofArray:=$_l_AddedLineNumber
							End if 
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
									$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
								End if 
							End for 
							
						Else 
							Gen_Alert("You cannot add items until the Job and Stage code are entered")
						End if 
						
					End if 
					
					//
				End if 
				
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				
				If (Not:C34([TRANSACTION_BATCHES:30]Posted_Date:16>!00-00-00!))
					
					If (Not:C34(BAT_bo_UseAreaList))
						If (BAT_bo_addingSub)
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						End if 
						BAT_bo_addingSub:=True:C214
						
						CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
						//Gen_PostKey (Current process;110;256)  `96
					Else 
						ACC_BatchAddSubItem
					End if 
				End if 
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				Case of 
					: ($_l_CurrentFormPage=2)  //Products
						If (Not:C34([SERVICE_CALLS:20]Resolved:9))
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 2)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 2)
							//GEN_at_DropDownMenu{1}:="Add Product from a Contract"
							//GEN_at_DropDownMenu{2}:="Add Product from a Sales order"
							GEN_at_DropDownMenu{1}:="Add  Product for Repair"
							GEN_at_DropDownMenu{2}:="Add Ancillery Items"
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
							GEN_Bo_ShowCreate:=False:C215
							DB_t_WindowTitle:="Type of product to add"
							GEN_t_CancelText:="Stop"
							GEN_t_OKText:="Continue"
							DIALOG:C40([USER:15]; "Gen_PopUpChoice")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							If (GEN_at_DropDownMenu>0)
								Case of 
									: (GEN_at_DropDownMenu=1)
										SVS_l_SelectedItem:=0
										$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
										WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
										DIALOG:C40([USER:15]; "SVS_EditProductInvolved")
										If (SVS_t_ProductName#"") | (SVS_t_SOCode#"") | (SVS_t_ContractCode#"") | (SVS_l_ItemForRepair=1)
											APPEND TO ARRAY:C911(SC_at_ProductCode; SVS_t_ProductCode)
											APPEND TO ARRAY:C911(SC_at_ProductSerial; SVS_t_SerialNumber)
											APPEND TO ARRAY:C911(SC_at_ProductContract; SVS_t_ContractCode)
											APPEND TO ARRAY:C911(SC_at_Systems; SVS_t_SystemName)
											APPEND TO ARRAY:C911(SC_at_ProductName; SVS_t_ProductName)
											APPEND TO ARRAY:C911(SC_abo_RelatedContract; False:C215)
											If (SC_at_ProductContract{Size of array:C274(SC_at_ProductContract)}#"")
												SC_abo_RelatedContract{Size of array:C274(SC_abo_RelatedContract)}:=True:C214
											End if 
											APPEND TO ARRAY:C911(SC_at_OrderCode; SVS_t_SOCode)
											APPEND TO ARRAY:C911(SC_abo_RelatedOrder; False:C215)
											If (SC_at_OrderCode{Size of array:C274(SC_at_OrderCode)}#"")
												SC_abo_RelatedOrder{Size of array:C274(SC_abo_RelatedOrder)}:=True:C214
											End if 
											APPEND TO ARRAY:C911(SC_at_ContractTypeCode; SVS_t_ContractType)
											APPEND TO ARRAY:C911(SC_at_ContractDatesStrings; "")
											APPEND TO ARRAY:C911(SC_at_Relatedtype; "")
											If (SC_abo_RelatedContract{Size of array:C274(SC_abo_RelatedContract)})
												SC_at_Relatedtype{Size of array:C274(SC_at_Relatedtype)}:="Contract"
												QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SC_at_ProductContract{Size of array:C274(SC_at_ProductContract)})
												SC_at_ContractDatesStrings{Size of array:C274(SC_at_ContractDatesStrings)}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
											Else 
												SC_at_Relatedtype{Size of array:C274(SC_at_Relatedtype)}:="Order Item"
												SC_at_ContractDatesStrings{Size of array:C274(SC_at_ContractDatesStrings)}:="N/A"
											End if 
											SC_l_ItemID:=0
											If (SC_l_ItemID=0)
												SC_l_ItemID:=AA_GetNextID(->SC_l_ItemID)
											End if 
											APPEND TO ARRAY:C911(SC_al_ProductItemID; -(SC_l_ItemID))
											APPEND TO ARRAY:C911(SC_al_RepairStatus; SVS_l_RepairStatus)
											APPEND TO ARRAY:C911(SC_at_RepairStatusName; SVS_t_RepairStatus)
											APPEND TO ARRAY:C911(SC_al_SymptomID; SVS_l_Symptom)
											APPEND TO ARRAY:C911(SC_at_SymptomName; SVS_t_Symptom)
											APPEND TO ARRAY:C911(SC_al_PartsrequiredStatus; SVS_l_PartsStatus)
											APPEND TO ARRAY:C911(SC_at_PartsrequiredName; SVS_t_PartsStatus)  //²
											APPEND TO ARRAY:C911(SC_al_WarrantyStatus; SVS_l_Warranty)  //²
											APPEND TO ARRAY:C911(SC_at_Warranty; SVS_t_Warranty)  //²
											APPEND TO ARRAY:C911(SC_al_OrderitemNumber; SVS_l_SOitem)  //²
											APPEND TO ARRAY:C911(SC_abo_PartsOrdered; False:C215)
											APPEND TO ARRAY:C911(SC_at_severityName; SVS_t_Severity)
											APPEND TO ARRAY:C911(SC_al_SeverityID; SVS_l_Severity)
											APPEND TO ARRAY:C911(SC_al_LocationID; SVS_l_Itemlocation)
											APPEND TO ARRAY:C911(SC_at_LocationName; SVS_t_ItemLocation)
											APPEND TO ARRAY:C911(SC_at_FaultNotes; SVS_t_FaultNote)
											APPEND TO ARRAY:C911(SC_at_additionalInformation; "")
											APPEND TO ARRAY:C911(SC_al_ComponentID; 0)
											APPEND TO ARRAY:C911(SC_at_ComponentName; "")
											APPEND TO ARRAY:C911(SC_abo_ProductisForRepair; (SVS_l_ItemForRepair=1))
											APPEND TO ARRAY:C911(SC_at_RelatedRecordCode; "")
											APPEND TO ARRAY:C911(SC_al_RepairStatus; SVS_l_RepairStatus)
											APPEND TO ARRAY:C911(SC_at_RepairStatusName; SVS_t_RepairStatus)
											
											If (SC_at_ProductContract{Size of array:C274(SC_at_ProductContract)}#"")
												SC_at_RelatedRecordCode{Size of array:C274(SC_at_RelatedRecordCode)}:=SC_at_ProductContract{Size of array:C274(SC_at_ProductContract)}
											Else 
												SC_at_RelatedRecordCode{Size of array:C274(SC_at_RelatedRecordCode)}:=SC_at_OrderCode{Size of array:C274(SC_at_OrderCode)}
											End if 
											
											
											
											//``
										End if 
										CLOSE WINDOW:C154
										WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
									: (GEN_at_DropDownMenu=2)
										//add(actually edit) the ancillary products)
										$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
										WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
										DIALOG:C40([USER:15]; "SVS_AncillaryProducts")
										For ($_l_Index; 1; Size of array:C274(SVS_abo_AccessoryIncluded))
											If (SVS_abo_AccessoryIncluded{$_l_Index})
												If (SVS_al_IncProdID{$_l_Index}#0)  //is already in list
													$_l_Line:=Find in array:C230(SC_al_ProductItemID; SVS_al_IncProdID{$_l_Index})
													SC_al_ComponentID{$_l_Line}:=SVS_al_Accessory{$_l_Index}
													SC_at_ComponentName{$_l_Line}:=SVS_at_Accessory{$_l_Index}
													SC_abo_ProductisForRepair{$_l_Line}:=False:C215
													SC_al_LocationID{$_l_Line}:=SVS_al_LocationID{$_l_Index}
													SC_at_LocationName{$_l_Line}:=SVS_at_AnLocationnames{$_l_Index}
												Else 
													//add to list
													APPEND TO ARRAY:C911(SC_at_ProductCode; "")
													APPEND TO ARRAY:C911(SC_at_ProductSerial; "")
													APPEND TO ARRAY:C911(SC_at_ProductContract; "")
													APPEND TO ARRAY:C911(SC_at_Systems; "")
													APPEND TO ARRAY:C911(SC_at_ProductName; "")
													APPEND TO ARRAY:C911(SC_abo_RelatedContract; False:C215)
													APPEND TO ARRAY:C911(SC_at_OrderCode; "")
													APPEND TO ARRAY:C911(SC_abo_RelatedOrder; False:C215)
													APPEND TO ARRAY:C911(SC_at_ContractTypeCode; "")
													APPEND TO ARRAY:C911(SC_at_ContractDatesStrings; "")
													APPEND TO ARRAY:C911(SC_at_Relatedtype; "")
													SC_l_ItemID:=0
													If (SC_l_ItemID=0)
														SC_l_ItemID:=AA_GetNextID(->SC_l_ItemID)
													End if 
													APPEND TO ARRAY:C911(SC_al_ProductItemID; -(SC_l_ItemID))
													APPEND TO ARRAY:C911(SC_al_RepairStatus; 0)
													APPEND TO ARRAY:C911(SC_at_RepairStatusName; "")
													APPEND TO ARRAY:C911(SC_al_SymptomID; 0)
													APPEND TO ARRAY:C911(SC_at_SymptomName; "")
													APPEND TO ARRAY:C911(SC_al_PartsrequiredStatus; 0)
													APPEND TO ARRAY:C911(SC_at_PartsrequiredName; "")  //²
													APPEND TO ARRAY:C911(SC_al_WarrantyStatus; 0)  //²
													APPEND TO ARRAY:C911(SC_at_Warranty; "")  //²
													APPEND TO ARRAY:C911(SC_al_OrderitemNumber; 0)  //²
													APPEND TO ARRAY:C911(SC_abo_PartsOrdered; False:C215)
													APPEND TO ARRAY:C911(SC_at_severityName; "")
													APPEND TO ARRAY:C911(SC_al_SeverityID; 0)
													APPEND TO ARRAY:C911(SC_al_LocationID; SVS_al_LocationID{$_l_Index})
													APPEND TO ARRAY:C911(SC_at_LocationName; SVS_at_AnLocationnames{$_l_Index})
													APPEND TO ARRAY:C911(SC_at_FaultNotes; "")
													APPEND TO ARRAY:C911(SC_at_additionalInformation; "")
													APPEND TO ARRAY:C911(SC_al_ComponentID; SVS_al_Accessory{$_l_Index})
													APPEND TO ARRAY:C911(SC_at_ComponentName; SVS_at_Accessory{$_l_Index})
													APPEND TO ARRAY:C911(SC_abo_ProductisForRepair; False:C215)
													APPEND TO ARRAY:C911(SC_at_RelatedRecordCode; "")
													APPEND TO ARRAY:C911(SC_al_RepairStatus; 0)
													APPEND TO ARRAY:C911(SC_at_RepairStatusName; "")
												End if 
											Else 
												If (SVS_al_IncProdID{$_l_Index}#0)
													//Is already in list-deleted it
													$_l_Line:=Find in array:C230(SC_al_ProductItemID; SVS_al_IncProdID{$_l_Index})
													DELETE FROM ARRAY:C228(SC_at_ProductCode; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ProductSerial; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ProductContract; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_Systems; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ProductName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_abo_RelatedContract; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_OrderCode; $_l_Line)
													DELETE FROM ARRAY:C228(SC_abo_RelatedOrder; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ContractTypeCode; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ContractDatesStrings; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_Relatedtype; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_ProductItemID; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_RepairStatus; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_RepairStatusName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_SymptomID; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_SymptomName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_PartsrequiredStatus; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_PartsrequiredName; $_l_Line)  //²
													DELETE FROM ARRAY:C228(SC_al_WarrantyStatus; $_l_Line)  //²
													DELETE FROM ARRAY:C228(SC_at_Warranty; $_l_Line)  //²
													DELETE FROM ARRAY:C228(SC_al_OrderitemNumber; $_l_Line)  //²
													DELETE FROM ARRAY:C228(SC_abo_PartsOrdered; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_severityName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_SeverityID; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_LocationID; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_LocationName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_FaultNotes; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_additionalInformation; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_ComponentID; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_ComponentName; $_l_Line)
													DELETE FROM ARRAY:C228(SC_abo_ProductisForRepair; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_RelatedRecordCode; $_l_Line)
													DELETE FROM ARRAY:C228(SC_al_RepairStatus; $_l_Line)
													DELETE FROM ARRAY:C228(SC_at_RepairStatusName; $_l_Line)
												Else 
													//do nothing
												End if 
											End if 
										End for 
										CLOSE WINDOW:C154
										WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
										
								End case 
							End if 
							
						End if 
						
						
					: ($_l_CurrentFormPage=3)
						If (Not:C34([SERVICE_CALLS:20]Resolved:9))
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							READ WRITE:C146([ORDER_ITEMS:25])
							
							CREATE RECORD:C68([ORDER_ITEMS:25])
							DB_t_CurrentFormUsage:="NAT"
							
							OrderI_SubLPB
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
							
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->SC_at_ModeCharge; $_l_CurrentRow; $_l_CurrentColumn)  //`````<------???
							
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
							$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
							$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
							$_ptr_LBTabl:=$_ptr_ListboxSetup->{7}
							$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
							$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
							$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
							If ($_l_AddedLineNumber>0)
								$_l_SizeofArray:=$_l_AddedLineNumber
							End if 
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
									$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
								End if 
							End for 
							
						End if 
						
				End case 
				
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				
				
				If (STOCK_l_Context>=0)
					If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
						If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
							If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
							End if 
							If ([MOVEMENT_TYPES:60]UseForValueChange:28) | ([MOVEMENT_TYPES:60]UseForLocationMove:29) | ([MOVEMENT_TYPES:60]UseForLayerMove:31) | ([MOVEMENT_TYPES:60]UseForCurrencyMove:32) | ([MOVEMENT_TYPES:60]UseForAnalysisMove:30)
								Gen_Confirm("This type of movement does not allow the manual addition of items, you must copy items from existing sfock. Do you wish to do that now?"; "Copy"; "Stop")
								If (OK=1)
									StockI_CurrButt
								End if 
								
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
									AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
								End if 
								REDUCE SELECTION:C351([PRODUCTS:9]; 0)
								REDUCE SELECTION:C351([LOCATIONS:61]; 0)
								REDUCE SELECTION:C351([COMPANIES:2]; 0)
								
								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
								
								StockI_SubLPB
								
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
								If (STK_bo_LineTrackerActive)
									$_l_ItemNumberPosition:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									If ($_l_ItemNumberPosition<0)
										APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									End if 
								End if 
								$_ptr_ListboxArea:=STK_aptr_ItemPreferences{1}
								LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
								
								$_l_AddedLineNumber:=LBi_xPlus(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; $_l_CurrentRow; $_l_CurrentColumn)  //`````<------???
								
								
								$_ptr_ListboxArea:=STK_aptr_ItemPreferences{1}
								$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
								$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
								$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
								$_ptr_LBTable:=STK_aptr_ItemPreferences{10}
								$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
								$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
								If ($_l_AddedLineNumber>0)
									$_l_SizeofArray:=$_l_AddedLineNumber
								End if 
								$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
								For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
									If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
										LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
										$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
									End if 
								End for 
							End if 
						End if 
						
					Else 
						Gen_Alert("This stock movement is posted it cannot be altered!")
					End if 
					
				End if 
				
				
				
			: ($_l_TableNumber=Table:C252(->[SF_STOCKMOVEMENTS:193]))
				If (STOCK_l_Context>=0)
					If ([SF_STOCKMOVEMENTS:193]Accounts_posted_Date:9=!00-00-00!)
						If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2#"")
							DB_SaveRecord(->[SF_STOCKMOVEMENT_ITEMS:194])
							AA_CheckFileUnlocked(->[SF_STOCKMOVEMENT_ITEMS:194])
							QUERY:C277([SF_STOCKMOVEMENT_ITEMS:194]; [SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2=[SF_STOCKMOVEMENTS:193]Movement_Code:2)
							[SF_STOCKMOVEMENTS:193]Total_Cost:21:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7); 2; 2)
							[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41); 2; 2)
						End if 
						REDUCE SELECTION:C351([PRODUCTS:9]; 0)
						REDUCE SELECTION:C351([LOCATIONS:61]; 0)
						REDUCE SELECTION:C351([COMPANIES:2]; 0)
						CREATE RECORD:C68([SF_STOCKMOVEMENT_ITEMS:194])
						STK_SFITEM_LPB
						StockI_SubLPB
						$_ptr_ListboxArea:=STK_aptr_ItemPreferences{1}
						LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
						
						$_l_AddedLineNumber:=LBi_xPlus(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; $_l_CurrentRow; $_l_CurrentColumn)  //`````<------???
						
						
						$_ptr_ListboxArea:=STK_aptr_ItemPreferences{1}
						$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
						$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
						$_ptr_EnterabilityArray:=STK_aptr_ItemPreferences{14}
						$_ptr_LBTable:=STK_aptr_ItemPreferences{10}
						$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
						$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
						If ($_l_AddedLineNumber>0)
							$_l_SizeofArray:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
						End for 
						
					Else 
						Gen_Alert("This stock movement is posted it cannot be altered!")
					End if 
					
				End if 
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				
				Contracts_AddSubentity($_l_CurrentFormPage)
				
				
				
				
			: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				If (<>DB_at_TableNames>0)
					If ([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1#"") & ([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2#"")
						DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
					End if 
					CREATE RECORD:C68([CUSTOM_FIELD_DEFINITiONS:99])
					
					[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3:=<>DB_al_TableNums{<>DB_at_TableNames}
					
					Repeat 
						$_t_CustomFieldCode:=String:C10(AA_GetNextIDinMethod(->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; Sequence number:C244([CUSTOM_FIELD_DEFINITiONS:99])-1))
						SET QUERY DESTINATION:C396(3; $_l_RecordClash)
						QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1=$_t_CustomFieldCode)
						SET QUERY DESTINATION:C396(0)
					Until ($_l_RecordClash=0)
					[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1:=$_t_CustomFieldCode
					$_ptr_ListboxSetup:=->CUS_aptr_LBSetup
					$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
					LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
					
					$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; $_l_CurrentRow; $_l_CurrentColumn)
					
				End if 
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				$_ptr_ListboxSetup:=->JST_aptr_LBSettings
				Case of 
					: ($_l_CurrentFormPage=1)
						If ([JOB_STAGES:47]Stage_Code:2#"")
							If ([JOB PERSONNEL:48]Stage_Code:2#"")
								DB_SaveRecord(->[JOB PERSONNEL:48])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB PERSONNEL:48]))
							End if 
							CREATE RECORD:C68([JOB PERSONNEL:48])
							[JOB PERSONNEL:48]Job_stage_Code:17:=[JOB_STAGES:47]Job_Stage_code:52
							[JOB PERSONNEL:48]Job_Personnel_Code:18:=String:C10(Gen_Code(Table:C252(->[JOB PERSONNEL:48])+255; ->[JOB PERSONNEL:48]Job_Personnel_Code:18))
							
							[JOB PERSONNEL:48]Job_Code:1:=[JOB_STAGES:47]Job_Code:1
							[JOB PERSONNEL:48]Stage_Code:2:=[JOB_STAGES:47]Stage_Code:2
							$_ptr_ListboxSetup:=->JST_aptr_LBSettings
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
							
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->JST_at_ModePersonnel; $_l_CurrentRow; $_l_CurrentColumn)
							
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
							$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
							$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
							$_ptr_LBTabl:=$_ptr_ListboxSetup->{7}
							$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
							$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
							$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
							If ($_l_AddedLineNumber>0)
								$_l_SizeofArray:=$_l_AddedLineNumber
							End if 
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
									$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
								End if 
							End for 
							
						Else 
							Gen_Alert("You must enter a stage code first")
						End if 
						
						JC_JSSetTimePostEnterability  //added 23/03/07 -kmw
						
					: ($_l_CurrentFormPage=2) | ($_l_CurrentFormPage=3)  //added ability to add from Page_3 (ACTUAL order items) as well - 23/03/07 -kmw
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						CREATE RECORD:C68([ORDER_ITEMS:25])
						Case of 
							: (JST_at_JobStageTab=3)
								[ORDER_ITEMS:25]State:46:="A"
							: (JST_at_JobStageTab=2)
								[ORDER_ITEMS:25]State:46:="B"
						End case 
						
						[ORDER_ITEMS:25]Job_Code:34:=[JOB_STAGES:47]Job_Code:1
						[ORDER_ITEMS:25]Job_Stage:35:=[JOB_STAGES:47]Stage_Code:2
						
						[ORDER_ITEMS:25]Job_Stage_Code:60:=[JOB_STAGES:47]Job_Stage_code:52  //added 23/03/07 -kmw
						
						OrderI_SubLPB
						$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
						LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
						
						$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->JST_at_ModeOrderI; $_l_CurrentRow; $_l_CurrentColumn)
						
						//put the cursor in the correct place
						$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
						$_ptr_LBTabl:=$_ptr_ListboxSetup->{7}
						$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
						$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
						$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
						If ($_l_AddedLineNumber>0)
							$_l_SizeofArray:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
						End for 
						
				End case 
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				Case of 
					: ($_t_FormName="Job_In")
						Case of 
							: ($_l_CurrentFormPage=1)
								
								If ([JOBS:26]End_Date:7=!00-00-00!) | ([JOBS:26]End_Date:7>=Current date:C33(*))
									//because we are about to create a record that uses this job as its parent we have to be sure it has been saved (ie in case newly created)
									DB_SaveRecord(->[JOBS:26])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
									
									//put in edit mode (user will presumably want to edit newly added record)
									//JOB_at_ModeStage:=2
									//$JOB_at_ModeStage:=JOB_at_ModeStage
									
									If ([ORDER_ITEMS:25]Job_Code:34#"")
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									End if 
									
									If ([JOB_STAGES:47]Job_Code:1#"")
										DB_SaveRecord(->[JOB_STAGES:47])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
									End if 
									
									CREATE RECORD:C68([JOB_STAGES:47])
									JobStages_JbSbB
									$_ptr_ListboxArea:=JOB_aptr_LBStageSettings{1}
									LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
									
									$_l_AddedLineNumber:=LBi_xPlus(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; $_l_CurrentRow; $_l_CurrentColumn)
									
									$_ptr_ListboxArea:=JOB_aptr_LBStageSettings{1}
									$_ptr_ArrayofArrayPointers:=JOB_aptr_LBStageSettings{3}
									$_ptr_ArrayReferences:=JOB_aptr_LBStageSettings{9}
									$_ptr_EnterabilityArray:=JOB_aptr_LBStageSettings{14}
									$_ptr_LBTable:=JOB_aptr_LBStageSettings{10}
									$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
									$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
									If ($_l_AddedLineNumber>0)
										$_l_SizeofArray:=$_l_AddedLineNumber
									End if 
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
										If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
											LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
											$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
										End if 
									End for 
									
								Else 
									Gen_Confirm("This Job has an end date of "+String:C10([JOBS:26]End_Date:7; 4)+" Do you wish to change the end date of the job?"; "No"; "Yes")
									If (OK=0)  //kmw - I couldn't figure out why this checking for OK=0 but reason is as simple as that Yes buton is set as Cancel and No button is set as accept - also note that tracing may cause there to be an unexpected OK system variable
										//change end date and recall code
										[JOBS:26]End_Date:7:=Current date:C33(*)
										DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")  //added 09/02/06 -kmw
										inButtSubHandle(FORM Get current page:C276; ->[JOBS:26]; "Job_In")
									Else 
										Gen_Alert("You cannot add a new stage to a completed (end date passed) Job")
									End if 
									
								End if 
								
								//
								JC_JobSetTimePostEnterability  //added 22/03/07 -kmw
								
							: ($_l_CurrentFormPage=3)
								If ([JOBS:26]End_Date:7=!00-00-00!) | ([JOBS:26]End_Date:7>=Current date:C33(*))
									//because we are about to create a record that uses this job as its parent we have to be sure it has been saved (ie in case newly created)
									DB_SaveRecord(->[JOBS:26])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
									
									//put in edit mode (user will presumably want to edit newly added record)
									//JOB_at_Modeorders:=2
									//$JOB_at_Modeorders:=JOB_at_Modeorders
									
									
									If ([JOB_STAGES:47]Job_Code:1#"")
										DB_SaveRecord(->[JOB_STAGES:47])
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
									End if 
									If ([ORDER_ITEMS:25]Job_Code:34#"")
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									End if 
									CREATE RECORD:C68([ORDER_ITEMS:25])
									//[ORDER ITEMS]Job Code:=[JOBS]Job Code
									//above line removed 09/02/07 -kmw ("Orderl SubLPB" will only do what it is obviously intended to do if "[order items]Job Code" is blank - and one of the things it does is the above line anyway)
									OrderI_SubLPB
									$_ptr_ListboxSetup:=->JOB_aPtr_OrderItemsSetup
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
									
									$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->JOB_at_Modeorders; $_l_CurrentRow; $_l_CurrentColumn)
									
									//put the cursor in the correct place
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
									$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
									$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
									$_ptr_LBTabl:=$_ptr_ListboxSetup->{7}
									$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
									$_Ptr_ColumnArray:=$_ptr_ArrayofArrayPointers->{1}
									$_l_SizeofArray:=Size of array:C274($_Ptr_ColumnArray->)
									If ($_l_AddedLineNumber>0)
										$_l_SizeofArray:=$_l_AddedLineNumber
									End if 
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
										If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
											LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
											$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
										End if 
									End for 
									
								Else   //added 09/02/07 - kmw (same else clause as Page_1 (job stages))
									Gen_Confirm("This Job has an end date of "+String:C10([JOBS:26]End_Date:7; 4)+" Do you wish to change the end date of the job?"; "No"; "Yes")
									If (OK=0)  //kmw - I couldn't figure out why this checking for OK=0 but reason is as simple as that Yes buton is set as Cancel and No button is set as accept - also note that tracing may cause there to be an unexpected OK system variable
										//change end date and recall code
										[JOBS:26]End_Date:7:=Current date:C33(*)
										DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")  //added 09/02/07 -kmw
										inButtSubHandle(FORM Get current page:C276; ->[JOBS:26]; "Job_In")
									Else 
										Gen_Alert("You cannot add a new cost item to a completed (end date passed) Job")
									End if 
									
								End if 
						End case 
						
						
				End case 
			: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
				Case of 
					: ($_t_FormName="Items_Su")
						//subscriptions
						If ([SUBSCRIPTIONS:93]Order_Item_Number:4#0)
							DB_SaveRecord(->[SUBSCRIPTIONS:93])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
						End if 
						CREATE RECORD:C68([SUBSCRIPTIONS:93])
						[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
						[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
						[SUBSCRIPTIONS:93]Unit_Number:6:=7
						[SUBSCRIPTIONS:93]X_Units_Type:13:="Week"
						[SUBSCRIPTIONS:93]Type:7:="ISS"
						[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Issue"
						$_ptr_ListboxArea:=SUBS_aPtr_LBSettings{1}
						LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
						
						$_l_AddedLineNumber:=LBi_xPlus(->SUBS_aPtr_LBSettings; ->SUB_at_Modes; $_l_CurrentRow; $_l_CurrentColumn)
						
						//put the cursor in the correct place
						
						$_ptr_ArrayofArrayPointers:=SUBS_aPtr_LBSettings{3}
						$_ptr_ArrayReferences:=SUBS_aPtr_LBSettings{9}
						$_ptr_EnterabilityArray:=SUBS_aPtr_LBSettings{14}
						$_ptr_LBTable:=SUBS_aPtr_LBSettings{10}
						$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
						$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
						If ($_l_AddedLineNumber>0)
							$_l_SizeofArray:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
						End for 
					Else 
						ORDERI_AddSubEntity($_l_CurrentFormPage; $_ptr_LBTable)
				End case 
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				If ([PROJECTS:89]Project_Code:1#"")
					DB_SaveRecord(->[PROJECTS:89])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PROJECTS:89]))
					
					If ([JOBS:26]Project_Code:27#"")
						DB_SaveRecord(->[JOBS:26])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
					End if 
					
					
					CREATE RECORD:C68([JOBS:26])
					[JOBS:26]Project_Code:27:=[PROJECTS:89]Project_Code:1
					[JOBS:26]Company_Code:3:=[PROJECTS:89]Company_Code:3  //added -kmw, 07/12/06
					[JOBS:26]Contact_Code:4:=[PROJECTS:89]Contact_Code:4  //added -kmw, 07/12/06
					[JOBS:26]Person:19:=[PROJECTS:89]Person:8  //added -kmw, 07/12/06
					[JOBS:26]Job_Type:21:=[PROJECTS:89]Project_Type:7  //added -kmw, 07/12/06
					
					$_bo_OK:=Jobs_InLPB
					If ($_bo_OK)
						$_ptr_ListboxSetup:=->PTR_aptr_LbSetup
						$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
						LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_CurrentColumn; $_l_CurrentRow)
						
						$_l_AddedLineNumber:=LBi_xPlus(->PTR_aptr_LbSetup; ->PRJ_at_ModeJob; $_l_CurrentRow; $_l_CurrentColumn)
						
						
						
						$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
						$_ptr_LBTabl:=$_ptr_ListboxSetup->{7}
						$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
						$_Ptr_ColumArray:=$_ptr_ArrayofArrayPointers->{1}
						$_l_SizeofArray:=Size of array:C274($_Ptr_ColumArray->)
						If ($_l_AddedLineNumber>0)
							$_l_SizeofArray:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
						End for 
						
						
					End if 
					
					
				End if 
		End case 
		
		
	: ($_l_ButtonPressed=DB_GetButtonFunction("Minus"))  //Delete  a record
		$_l_TableNumber:=Table:C252($_ptr_LBTable)
		Case of 
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
				//this could be to delete an analysis or Layer
				If (ACC_t_CurrentFocus="")
					ACC_t_CurrentFocus:="Analyses"
				End if 
				Case of 
					: (ACC_t_CurrentFocus="Analyses")
						ACC_DelSubEntityAnalyses
						
					Else 
						//layers
						ACC_DelSubEntityLayers
				End case 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				Case of 
					: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
						If (LBi_FindLine(->POI_aptr_LBSetup))
							READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
							LOAD RECORD:C52([PURCHASE_ORDERS_ITEMS:169])
							
							DELETE RECORD:C58([PURCHASE_ORDERS_ITEMS:169])
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
							vTot:=1
							LBi_Xminus(->POI_aptr_LBSetup)
							[PURCHASE_ORDERS:57]Total_Cost:4:=Gen_Round(Sum:C1([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5); 2; 2)
							DB_bo_RecordModified:=True:C214
							
						End if 
				End case 
				
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				Case of 
					: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))
						$_l_No:=vNo
						If ([INVOICES:39]State:10<1)
							If (LBi_FindLines(->INV_aptr_ListboxSetup))
								
								READ WRITE:C146([INVOICES_ITEMS:161])
								CREATE EMPTY SET:C140([INVOICES_ITEMS:161]; "ToDelete")
								$_t_OrderItemsString:=""
								$_l_LinkedRecordsCount:=0
								ARRAY LONGINT:C221($_al_DeleteRows; 0)
								For ($_l_Delete; 1; Records in selection:C76([INVOICES_ITEMS:161]))
									LOAD RECORD:C52([INVOICES_ITEMS:161])
									If ([INVOICES_ITEMS:161]Item_Number:12#0)
										$_l_LinkedRecordsCount:=$_l_LinkedRecordsCount+1
										If ($_t_OrderItemsString#"")
											$_t_OrderItemsString:=$_t_OrderItemsString+","+String:C10([INVOICES_ITEMS:161]Item_Number:12)
										Else 
											$_t_OrderItemsString:=String:C10([INVOICES_ITEMS:161]Item_Number:12)
										End if 
										//Gen_Alert ("You cannot delete this item because it has been created from an Order Item."+Char(13)+"If you need to modify it, please Cancel this Invoice and change the Order "+"instead.";"Cancel")
									Else 
										ADD TO SET:C119([INVOICES_ITEMS:161]; "ToDelete")
										APPEND TO ARRAY:C911($_al_DeleteRows; $_l_Delete)
										
									End if 
									NEXT RECORD:C51([INVOICES_ITEMS:161])
								End for 
								If ($_l_LinkedRecordsCount>0)
									If ($_l_LinkedRecordsCount=1)
										Gen_Alert("You cannot delete this item because it has been created from  Order Item ("+$_t_OrderItemsString+")."+Char:C90(13)+"If you need to modify it, please Cancel this Invoice and change the Order "+"instead."; "Cancel")
										
									Else 
										Gen_Alert("You cannot delete some items because they have been created from  Order Items ("+$_t_OrderItemsString+")."+Char:C90(13)+"If you need to modify it, please Cancel this Invoice and change the Order "+"instead."; "Cancel")
										
									End if 
								End if 
								If (Records in set:C195("ToDelete")>0)
									USE SET:C118("ToDelete")
									DELETE SELECTION:C66([INVOICES_ITEMS:161])
									QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
									$_l_No:=Records in selection:C76([INVOICES_ITEMS:161])
									For ($_l_Delete; Size of array:C274($_al_DeleteRows); 1; -1)
										vTot:=1
										LB_l_SelectedRow:=$_al_DeleteRows{$_l_Delete}
										LBi_Xminus(->INV_aptr_ListboxSetup; True:C214)
										
									End for 
									Invoices_Tot
								End if 
							End if 
						End if 
						vNo:=$_l_No
						
				End case 
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				Case of 
					: (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))
						
						If ([PURCHASE_INVOICES:37]State:24<1)
							$_l_LbEditState:=PUR_al_ItemsMode{PUR_at_ItemMode}
							//If ($_l_LbEditState=2)
							//PUR_S11_ItemMode:=1
							//$_ptr_ListboxArea:=PUR_aPtr_LBItemsSetup{1}
							//NG TODO
							//ALGetPrevCell ($_ptr_ListboxArea->;bd36;bd37)
							//LB_GetPrevCell
							//LBi_EditListLay (->PUR_aPtr_LBItemsSetup;->PUR_S11_ItemMode)  `set it to selectable
							//LBi_SetSelect1 ($_ptr_ListboxArea;LB_l_RowNumber)
							//End if
							
							If (LBi_FindLine(->PUR_aPtr_LBItemsSetup))
								READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
								LOAD RECORD:C52([PURCHASE_INVOICE_ITEMS:158])
								
								DELETE RECORD:C58([PURCHASE_INVOICE_ITEMS:158])
								QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
								
								vTot:=1
								LBi_Xminus(->PUR_aPtr_LBItemsSetup)
							End if 
							If ($_l_LbEditState#PUR_al_ItemsMode{PUR_at_ItemMode})
								LBi_EditListLay(->PUR_aPtr_LBItemsSetup; ->PUR_at_ItemMode; ->PI_pic_EditMode; ->PUR_al_ItemsMode)
							End if 
							
						End if 
				End case 
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				Products_DelSubentity($_t_FormName)
				
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				Case of 
					: ($_l_CurrentFormPage=1)
						Companies_DelSubEntity
						
					: ($_l_CurrentFormPage=2)
						If (LBi_FindLines(->COM_aPtr_CoFurthers))
							DELETE RECORD:C58([COMPANIES_RECORD_ANALYSIS:146])
							LBi_Xminuses(->COM_aPtr_CoFurthers)
						End if 
				End case 
				
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				//DELETE FURTHERS
				Case of 
					: ($_t_FormName="Contacts_InE")
						
					: ($_t_FormName="Contact_In") | ($_t_FormName="Company_In")
						
						
						If (LBi_FindLine($_ptr_ListboxArea))
							DELETE RECORD:C58([CONTACTS_RECORD_ANALYSIS:144])
							LBi_Xminuses($_ptr_ListboxArea)
						End if 
						
				End case 
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				
				
				//added deletion handling for lines on "Jobs_TCIn" (previously if table was ORDERS it assumed the user was deleting an order line and was doing it from the main order entry form) - kmw, 09/01/07
				If (Count parameters:C259>=3)
					$_t_DataEntrytype:=$_t_FormName
				Else   //no form specified so rightly or wrongly it assumes it was called from "Order_In"
					$_t_DataEntrytype:="Order_In"
				End if 
				Case of 
					: ($_t_DataEntrytype="Jobs_TCIn")  //time and costs entry form
						Case of 
							: ($_l_CurrentFormPage=1)  //time entry page
								
								
								$_l_No:=vNo  //not sure what this does or if need it -kmw
								If (LBi_FindLines(->ORD_aPtr_LbDISetup))  //NB reminder to self - note usage of ORD_aPtr_LbDISetup instead of ORD_aPtr_OrderItemsSetup as we are dealing with time entry list box not cost entry -kmw
									If (False:C215)  //not sure if correct thing to do but used delete instead of setting diary deleted flag (which is method used by diary screen) because should be a newly added record anyway -kmw
										While (Not:C34(End selection:C36([DIARY:12])))
											READ WRITE:C146([DIARY:12])
											LOAD RECORD:C52([DIARY:12])
											SD_l_EditingDiaryRecord:=0
											[DIARY:12]Deleted:43:=1
											DB_SaveRecord(->[DIARY:12])
											AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
											NEXT RECORD:C51([DIARY:12])
										End while 
									Else 
										DELETE SELECTION:C66([DIARY:12])
									End if 
									LBi_Xminuses(->ORD_aPtr_LbDISetup)  //NB reminder to self - note usage of ORD_aPtr_LbDISetup instead of ORD_aPtr_OrderItemsSetup as we are dealing with time entry list box not cost entry -kmw
								End if 
								vNo:=$_l_No  //not sure what this does or if need it -kmw
								
							: ($_l_CurrentFormPage=2)  //cost entry page
								//copied functionality for deleting an order line from the order input screen which seems to work - kmw
								$_l_No:=vNo
								If (LBi_FindLines($_ptr_ListboxSetup))
									OrderI_DelBut
									If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
										
										LBi_Xminuses($_ptr_ListboxSetup)
									End if 
								End if 
								vNo:=$_l_No
								
						End case 
						
					: ($_t_DataEntrytype="Order_In")
						
						If (ORD_bo_QuickAddMode)
							If (Size of array:C274(ORD_AT_QuickAddProdCode)>1)
								LISTBOX DELETE ROWS:C914(ORD_lb_ArraySelection; 1)
								
								LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
							End if 
						Else 
							Case of 
								: ($_l_CurrentFormPage=1)
									
									Case of 
										: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //order items
											$_l_No:=vNo
											COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
											//`here we need to make sure they are in the sorted order
											
											
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Sort_Order:26; $_ai_RetainedOrderSequence)
											ARRAY LONGINT:C221($_al_NewSortOrder; 0)
											//TRACE
											//SORT ARRAY($_ai_RetainedOrderSequence)
											ARRAY LONGINT:C221($_al_NewSortOrder; Size of array:C274($_ai_RetainedOrderSequence))
											$_bo_NoFault:=True:C214
											For ($_l_Index; 1; Size of array:C274($_ai_RetainedOrderSequence))
												If (Find in array:C230($_al_NewSortOrder; $_ai_RetainedOrderSequence{$_l_Index})>0) | ($_bo_NoFault=False:C215)
													$_al_NewSortOrder{$_l_Index}:=$_al_NewSortOrder{$_l_Index-1}+1
													$_bo_NoFault:=False:C215
												Else 
													$_al_NewSortOrder{$_l_Index}:=$_ai_RetainedOrderSequence{$_l_Index}
												End if 
											End for 
											If (False:C215)
												For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
													
													If ([ORDER_ITEMS:25]Sort_Order:26>$_ai_RetainedOrderSequence{$_l_Index})
														If ($_al_NewSortOrder{$_l_Index}#[ORDER_ITEMS:25]Sort_Order:26)
															[ORDER_ITEMS:25]Sort_Order:26:=$_al_NewSortOrder{$_l_Index}
															SAVE RECORD:C53([ORDER_ITEMS:25])
														End if 
													End if 
													NEXT RECORD:C51([ORDER_ITEMS:25])
												End for 
											End if 
											USE SET:C118("ORD_SelectedRelated")
											If (Records in selection:C76([ORDER_ITEMS:25])>0)
												OrderI_DelBut
												If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
													
												End if 
											End if 
											
											USE NAMED SELECTION:C332("$Temp")
											If (False:C215)
												//ORDER BY([ORDER_ITEMS];[ORDER_ITEMS]Sort_Order;>)
												For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
													
													If ([ORDER_ITEMS:25]Sort_Order:26>$_ai_RetainedOrderSequence{$_l_Index})
														If ($_al_NewSortOrder{$_l_Index}#[ORDER_ITEMS:25]Sort_Order:26)
															[ORDER_ITEMS:25]Sort_Order:26:=$_al_NewSortOrder{$_l_Index}
															SAVE RECORD:C53([ORDER_ITEMS:25])
														End if 
													End if 
													NEXT RECORD:C51([ORDER_ITEMS:25])
												End for 
												
												
												SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Sort_Order:26; $_ai_RetainedOrderSequence; [ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumber)
												ARRAY LONGINT:C221($_al_NewSortOrder; 0)
												//TRACE
												SORT ARRAY:C229($_ai_RetainedOrderSequence; $_al_OrderItemNumber)
												If (Find in array:C230($_ai_RetainedOrderSequence; 0)>0)
													$_l_Delete:=Find in array:C230($_ai_RetainedOrderSequence; 0)
													DELETE FROM ARRAY:C228($_ai_RetainedOrderSequence; $_l_Delete)
													DELETE FROM ARRAY:C228($_al_OrderItemNumber; $_l_Delete)
												End if 
												SORT ARRAY:C229($_ai_RetainedOrderSequence; $_al_OrderItemNumber)
												ARRAY LONGINT:C221($_al_NewSortOrder; Size of array:C274($_ai_RetainedOrderSequence))
												For ($_l_Index; 1; Size of array:C274($_ai_RetainedOrderSequence))
													$_al_NewSortOrder{$_l_Index}:=$_l_Index
												End for 
												FIRST RECORD:C50([ORDER_ITEMS:25])
												For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
													$_l_ItemNumberPosition:=Find in array:C230($_al_OrderItemNumber; [ORDER_ITEMS:25]Item_Number:27)
													If ($_l_ItemNumberPosition>0)
														If ($_al_NewSortOrder{$_l_ItemNumberPosition}#[ORDER_ITEMS:25]Sort_Order:26)
															[ORDER_ITEMS:25]Sort_Order:26:=$_al_NewSortOrder{$_l_ItemNumberPosition}
															SAVE RECORD:C53([ORDER_ITEMS:25])
														End if 
													End if 
													NEXT RECORD:C51([ORDER_ITEMS:25])
												End for 
												
												$_l_ItemNumberPosition:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
												If ($_l_ItemNumberPosition>0)
													$_ptr_AreaPointers:=ORD_aptr_SubAreaPointers{$_l_ItemNumberPosition}
													
													$_ptr_ListboxArea:=$_ptr_AreaPointers->{1}
													$_ptr_FieldReferences:=$_ptr_AreaPointers->{2}
													
													$_ptr_ArrayReferences:=$_ptr_AreaPointers->{9}
													$_t_AreaReference:=$_ptr_ArrayReferences->{6}
													
													$_l_SortFieldNumber:=Field:C253($_ptr_FieldReferences->{1})
													$_l_TableNumber:=Table:C252($_ptr_FieldReferences->{1})
													//ALAreaSort
													//If (False)
													LBi_AreaSort($_t_AreaReference; $_l_TableNumber; $_ptr_AreaPointers)
												End if 
											End if 
											
											vNo:=$_l_No
										: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
											If ([DIARY:12]Order_Code:26=[ORDERS:24]Order_Code:3)
												COPY NAMED SELECTION:C331([DIARY:12]; "$DiarySelection")
												READ WRITE:C146([DIARY:12])
												DELETE RECORD:C58([DIARY:12])
												USE NAMED SELECTION:C332("$DiarySelection")
												
											End if 
									End case 
								Else 
									$_t_TableName:=Table name:C256(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
									Gen_Alert("Sory you cannot delete a "+$_t_TableName+" records from here")
							End case 
						End if 
					Else   //a form was specified but no delete functionality has been added that is specific to that form
						If (False:C215)  //do nothing (no delete functionality has been defined that is specific to this form) (previously would have defaulted to "Order_In" code bu ti think if someone specifically Calls_InButSubHandle from a new form and forgets to enter something in here it better to do nothing than act like called from another form) - kmw
							Case of 
								: ($_l_CurrentFormPage=1)
									
									$_l_No:=vNo
									If (LBi_FindLines($_ptr_ListboxSetup))
										OrderI_DelBut
										If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
											
											LBi_Xminuses($_ptr_ListboxSetup)
										End if 
									End if 
									vNo:=$_l_No
							End case 
						End if 
				End case 
				
				
			: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
				Case of 
					: ($_l_CurrentFormPage<3) & (Not:C34(BAT_bo_UseAreaList))
						If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
							vTot:=1
							vTot2:=1
							DELETE RECORD:C58([TRANSACTION_BATCH_ITEMS:155])
							QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
							
						Else 
							Gen_Alert("You cannot delete lines from posted batches!")
						End if 
					: ($_l_CurrentFormPage<3) & ((BAT_bo_UseAreaList))
						If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
							//I don;t this this is handled here at all
							
							If (True:C214)
								ARRAY LONGINT:C221($_al_Lines; 0)
								LB_GetSelect(->ACC_LB_SubItems; ->$_al_Lines)
								If (Size of array:C274($_al_Lines)>0)
									$_l_Line:=$_al_Lines{1}  //NG TODO
									
									ARRAY LONGINT:C221(ACC_al_SublineDelete; 0)
									If ($_l_Line>0)
										If (Size of array:C274(ACC_al_BatchitemCompanion{$_l_Line})>=1)
											//it should be
											ARRAY LONGINT:C221(ACC_al_SublineDelete; Size of array:C274(ACC_al_BatchitemCompanion{$_l_Line}))
											$_l_RowElement:=0
											For ($_l_Index2; 1; Size of array:C274(ACC_al_BatchitemCompanion{$_l_Line}))
												If (ACC_al_BatchitemCompanion{$_l_Line}{$_l_Index2}#0)
													$_l_RowElement:=$_l_RowElement+1
													ACC_al_SublineDelete{$_l_RowElement}:=ACC_al_BatchitemCompanion{$_l_Line}{$_l_Index2}
													
												End if 
											End for 
											ARRAY LONGINT:C221(ACC_al_SublineDelete; $_l_RowElement)
											$_bo_Refresh:=False:C215
											Case of 
												: (Size of array:C274(ACC_al_SublineDelete)=1)
													//Delete one subrecord
													Gen_Confirm("Delete This Batch Item?"; "Yes"; "No")
													If (OK=1)
														$_bo_Refresh:=True:C214
														INSERT IN ARRAY:C227(ACC_al_BatchItemDelete; Size of array:C274(ACC_al_BatchItemDelete)+1; 1)
														ACC_al_BatchItemDelete{Size of array:C274(ACC_al_BatchItemDelete)}:=ACC_al_BatchItemID{ACC_al_SublineDelete{1}}
													End if 
												: (Size of array:C274(ACC_al_SublineDelete)>1)
													//Delete more than one subrecord
													$_l_ArraySize:=Size of array:C274(ACC_al_SublineDelete)
													ARRAY REAL:C219(ACC_ar_BatchItemAmountDEL; $_l_ArraySize)
													ARRAY LONGINT:C221(ACC_al_TransBatchItemIDDEL; $_l_ArraySize)
													ARRAY REAL:C219(ACC_ar_TransTaxAmtDEL; $_l_ArraySize)
													ARRAY REAL:C219(ACC_ar_TransTotalDEL; $_l_ArraySize)
													//```````
													For ($_l_Index; 1; $_l_ArraySize)
														ACC_ar_BatchItemAmountDEL{$_l_Index}:=ACC_ar_BatchItemAmounts{ACC_al_SublineDelete{$_l_Index}}
														ACC_al_TransBatchItemIDDEL{$_l_Index}:=ACC_al_BatchItemID{ACC_al_SublineDelete{$_l_Index}}
														ACC_ar_TransTaxAmtDEL{$_l_Index}:=ACC_ar_BatchItemTaxAmt{ACC_al_SublineDelete{$_l_Index}}
														ACC_ar_TransTotalDEL{$_l_Index}:=ACC_ar_BatchItemTotal{ACC_al_SublineDelete{$_l_Index}}
														//```````````
													End for 
													
													//these are the possible delete lines
													ACC_l_Deletion:=0
													Open window:C153(Screen width:C187/2; 60; Screen width:C187/2; 60; 1)
													DIALOG:C40([USER:15]; "TRANS_DelSelector")
													CLOSE WINDOW:C154
													If (ACC_l_Deletion=1)
														For ($_l_Index; 1; $_l_ArraySize)
															If (ACC_ai_TransDelete{$_l_Index}=1)
																INSERT IN ARRAY:C227(ACC_al_BatchItemDelete; Size of array:C274(ACC_al_BatchItemDelete)+1; 1)
																ACC_al_BatchItemDelete{Size of array:C274(ACC_al_BatchItemDelete)}:=ACC_al_BatchItemID{ACC_al_SublineDelete{$_l_Index}}
																//``````````
																$_bo_Refresh:=True:C214
																
															End if 
														End for 
													End if 
													$_l_ArraySize:=0
													ARRAY REAL:C219(ACC_ar_BatchItemAmountDEL; $_l_ArraySize)
													ARRAY LONGINT:C221(ACC_al_TransBatchItemIDDEL; $_l_ArraySize)
													ARRAY REAL:C219(ACC_ar_TransTaxAmtDEL; $_l_ArraySize)
													ARRAY REAL:C219(ACC_ar_TransTotalDEL; $_l_ArraySize)
													
											End case 
											If ($_bo_Refresh)
												$_l_ArraySize:=Size of array:C274(ACC_at_BatchItemAnalysisCode)
												
												ACC_TransSetDisplay("Trans_SetDisplay"; $_l_ArraySize)
												
											End if 
										End if 
									End if 
								End if 
							End if 
						Else 
							Gen_Alert("You cannot delete lines from posted batches!")
						End if 
						
				End case 
				
				
			: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
				
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				$_ptr_ListboxSetup:=->JST_aptr_LBSettings
				Case of 
					: ($_l_CurrentFormPage=1)
						$_l_No:=vNo
						If (LBi_FindLines($_ptr_ListboxSetup))
							If ([JOBS:26]Actual_TR:29)
							Else 
								If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
									LBi_Xminuses($_ptr_ListboxSetup)
								End if 
							End if 
							
							//THis needs to be fixed!!!! it just removes the lines in the array but does not delete the job personell records  -kmw
							
						End if 
						vNo:=$_l_No
						
						JC_JSSetTimePostEnterability  //added 23/03/07 -kmw
						
						P_Message:=111  //26/03/07 -kmw
						POST OUTSIDE CALL:C329(Current process:C322)  //26/03/07 -kmw
						
						
					: ($_l_CurrentFormPage=2) | ($_l_CurrentFormPage=3)  //delete budget or actual order item(s)
						
						If (JOB_at_ModeStage=1) | (True:C214)  //added 09/02/07 -kmw
							$_l_No:=vNo
							If (LBi_FindLines($_ptr_ListboxSetup))
								OrderI_DelBut
								If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
									
									LBi_Xminuses($_ptr_ListboxSetup)
									
								End if 
							End if 
							vNo:=$_l_No
							
							P_Message:=111  //26/03/07 -kmw
							POST OUTSIDE CALL:C329(Current process:C322)  //26/03/07 -kmw
							
						Else   //added 09/02/07 -kmw
							Gen_Alert("You must set the mode to selectable to delete a Cost Item")  //added 09/02/07 -kmw
						End if   //added 09/02/07 -kmw
						
						
				End case 
				
				
			: ($_l_TableNumber=Table:C252(->[JOBS:26]))
				$_ptr_ListboxSetup:=->JOB_aptr_LBStageSettings
				Case of 
					: ($_t_FormName="Job_In")
						Case of 
							: ($_l_CurrentFormPage=1)
								
								If (JOB_at_ModeStage=1) | (True:C214)  //Added "| (True)" 26/03/07 -kmw (Changes nigel has made mean that we are always in editable mode and never in selectable - also it seems that this check is no longer neccessary - no one seems to be able to tell me exactly why the check was required in the first place or if it is definately safe to remove it but tests seem to show it is ok - perhaps because ListBox is better at handling the deletion of a line when in editable mode. )
									
									If ([JOBS:26]End_Date:7=!00-00-00!) | ([JOBS:26]End_Date:7>=Current date:C33(*))
										DB_SaveRecord(->[JOB_STAGES:47])  //kmw, save job stage in case it has been newly added - otherwise it thinks (correctly) that we are trying to delete a non-existent record and displays unnessary message to user complaining of this (normally we could rely on LBi_findLines handling saving the current record automatically but the following query prevents it from having correct current record to save - so have to manually force a save before the  query).
										//****************remember all job stages that belong to this job to help us get back to correct selection of job stages after we have deletd some of them -kmw*************
										
										JC_FindJSFromJob  //Replaces above query 26/03/07 -kmw
										CREATE SET:C116([JOB_STAGES:47]; "$Temp")
										//********************************************************************************************************************
										If (LBi_FindLines($_ptr_ListboxSetup))  //select the job stages based on which List Box lines the user has selected -kmw
											//*******************see how many if any of the selected records have been invoiced -kmw******************
											$_l_NumberOfInvoicedRecords:=0
											SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_NumberOfInvoicedRecords)
											QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10#""; *)
											QUERY SELECTION:C341([JOB_STAGES:47];  & ; [JOB_STAGES:47]Invoice_Number:10#"N")
											SET QUERY DESTINATION:C396(Into current selection:K19:1)
											//*****************************************************************************
											If ($_l_NumberOfInvoicedRecords=0)
												//***********************keep track of the records that will be left after th edeletion - ready to use this set after the actual deletion occurs -kmw*********
												CREATE SET:C116([JOB_STAGES:47]; "$DelTemp")
												DIFFERENCE:C122("$Temp"; "$DelTemp"; "$Temp")
												CLEAR SET:C117("$DelTemp")
												//************************************************************************************************************
												Case of 
													: (Records in selection:C76([JOB_STAGES:47])=0)  //may be unneccessary - LBi_FindLines may have done a check for this already - not sure though -kmw
														OK:=1
													: (Records in selection:C76([JOB_STAGES:47])=1)
														Gen_Confirm("Are you sure you wish to delete this Job Stage?"; "No"; "Yes")
													: (Records in selection:C76([JOB_STAGES:47])>1)
														Gen_Confirm("Are you sure you wish to delete these Job Stages?"; "No"; "Yes")
												End case 
												If (OK=0)  //somewhat counter-intuitively OK=0 means user has said Yes -kmw
													OK:=1
													DELETE SELECTION:C66([JOB_STAGES:47])
													//NOTE: This still does not handle what to do with any lower level records!! (job personel, time, costs etc) -kmw
													LBi_Xminuses($_ptr_ListboxSetup)
												End if 
												
											Else 
												Gen_Alert("You cannot delete a Job Stage that has been invoiced.")
											End if 
										Else 
											//do nothing (no line selected)
										End if 
										USE SET:C118("$Temp")
										CLEAR SET:C117("$Temp")
									Else 
										Gen_Confirm("This Job has an end date of "+String:C10([JOBS:26]End_Date:7; 4)+" Do you wish to change the end date of the job?"; "No"; "Yes")
										If (OK=0)
											//change end date and recall code
											[JOBS:26]End_Date:7:=Current date:C33(*)
											inButtSubHandle(FORM Get current page:C276; ->[JOBS:26]; "Job_In")
											
										Else 
											Gen_Alert("You cannot delete a Job Stage from a completed (end date passed) Job")
										End if 
									End if 
								Else 
									Gen_Alert("You must set the mode to selectable to delete a Job Stage")
								End if 
								
								//
								JC_JobSetTimePostEnterability  //added 22/03/07 -kmw
								
								P_Message:=111  //26/03/07 -kmw
								POST OUTSIDE CALL:C329(Current process:C322)  //26/03/07 -kmw
								
								
							: ($_l_CurrentFormPage=3)  //added 09/02/07 -kmw (previously no way to delete order items off a job) - grabbed from order line deletion functionality when deleting direct from an order
								
								//NOTE - Looks like even though LBi_Xminuses etc can handle multiple deletions that "OrderI_DelBut" when called from Job/Job stage screens can only handle deleting one order item at a time. This may need to be improved  - kmw
								
								If (JOB_at_ModeStage=1) | (True:C214)  //added 09/02/07 -kmw
									$_l_No:=vNo
									If (LBi_FindLines($_ptr_ListboxSetup))
										OrderI_DelBut
										If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
											
											LBi_Xminuses($_ptr_ListboxSetup)
											
										End if 
									End if 
									vNo:=$_l_No
									
									P_Message:=111  //26/03/07 -kmw
									POST OUTSIDE CALL:C329(Current process:C322)  //26/03/07 -kmw
									
								Else   //added 09/02/07 -kmw
									Gen_Alert("You must set the mode to selectable to delete a Cost Item")  //added 09/02/07 -kmw
								End if   //added 09/02/07 -kmw
						End case 
						
						
				End case 
			: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
				$_ptr_ListboxSetup:=->JOB_aPtr_OrderItemsSetup
				Case of 
					: ($_l_CurrentFormPage=1)
						Case of 
							: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
								If ([CONTRACTS:17]End_Date:6>Current date:C33(*)) | ([CONTRACTS:17]xOpenEndedStatus:16=1)
									If ([ORDER_ITEMS:25]Contract_Code:29#"")
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									End if 
									//``````
									If (LBi_FindLines($_ptr_ListboxSetup))
										
										OrderI_DelBut
										If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
											LBi_Xminuses($_ptr_ListboxSetup)
										End if 
									End if 
								End if 
						End case 
					: ($_l_CurrentFormPage=2)
						Case of 
							: (CON_t_P2Area="Contacts")
								Con_DelSubEntityContact
							: (CON_t_P2Area="Furthers")
								Con_DelSubEntityFurthers
						End case 
				End case 
			: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
				$_ptr_ListboxSetup:=->PTR_aptr_LbSetup
				$_l_No:=vNo
				If (LBi_FindLines($_ptr_ListboxSetup))
					If (False:C215)  //here put test for completed project
						
					Else 
						If (Projects_JobDel)  //NB: do not copy this if unless there is a del proc that returns OK
							
							LBi_Xminuses(->$_ptr_ListboxSetup)
						End if 
					End if 
				End if 
				vNo:=$_l_No
			: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
				$_ptr_ListboxSetup:=->STK_aptr_ItemPreferences
				$_l_No:=vNo
				If (LBi_FindLines($_ptr_ListboxSetup))
					If ([STOCK_MOVEMENTS:40]Posted_Date:7#!00-00-00!)  //here put test for completed project
						Gen_Alert("You cannot remove items from a posted stock movement")
						
					Else 
						If (StockMovItemDel)  //NB: do not copy this if unless there is a del proc that returns OK
							
							LBi_Xminuses($_ptr_ListboxSetup)
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							//AL_UpdateArrays ($_ptr_ListboxArea->;-2)NG 27/7/06 THIS IS NOT NEEDED WITH LIST BOX
							
						End if 
					End if 
				End if 
				
				
				
				
				
		End case 
		
		
		
	: ($_l_ButtonPressed=DB_GetButtonFunction("Open"))  //edit(open) a record
		Case of 
				
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
				
				LBi_InclEdit(->POI_aptr_LBSetup)
			: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
				LBi_InclEdit(->INV_aptr_ListboxSetup)
				
			: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
				LBi_InclEdit(->PUR_aPtr_LBItemsSetup)
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				Case of 
					: ($_l_CurrentFormPage=1)
						LBi_InclEdit(->COM_aptr_LBItemsSetup)
				End case 
				
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_ptr_ListboxSetup:=->ORD_aPtr_OrderItemsSetup
				Case of 
					: ($_l_CurrentFormPage=1)
						LBi_InclEdit($_ptr_ListboxSetup)
				End case 
				
				
			: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
				Case of 
					: ($_l_CurrentFormPage=1)
						LBi_InclEdit(->JST_aptr_LBSettings)
						
				End case 
				
		End case 
	: ($_l_ButtonPressed=DB_GetButtonFunction("Delete"))  //Delete The parent record
End case 
//`"inButtSubHandle"
ERR_MethodTrackerReturn("inButtSubHandle"; $_t_oldMethodName)
