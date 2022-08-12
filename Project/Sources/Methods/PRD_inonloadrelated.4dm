//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_inonloadrelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: PRD_inonloadrelated
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vALLevels)
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY DATE(PRD_ad_PIDate;0)
	//ARRAY DATE(PRD_ad_POExpectedDate;0)
	//ARRAY DATE(PRD_ad_POOrderedDate;0)
	//ARRAY DATE(PRD_ad_SIDate;0)
	//ARRAY LONGINT(PRD_al_DocIncludes;0)
	//ARRAY LONGINT(PRD_al_ExpandedLocationLevel;0)
	//ARRAY LONGINT(PRD_al_Levels;0)
	//ARRAY LONGINT(PRD_al_LocationID;0)
	//ARRAY LONGINT(PRD_al_OrderItemIDs;0;0)
	//ARRAY LONGINT(PRD_al_PiIDS;0)
	//ARRAY LONGINT(PRD_al_PIItemID;0)
	//ARRAY LONGINT(PRD_al_PiOIItemNUmber;0)
	//ARRAY LONGINT(PRD_al_POIDS;0)
	//ARRAY LONGINT(PRD_al_POItemID;0)
	//ARRAY LONGINT(PRD_al_POItemIDS;0;0)
	//ARRAY LONGINT(PRD_al_POOIItemNUmber;0)
	//ARRAY LONGINT(PRD_al_SIIDS;0)
	//ARRAY LONGINT(PRD_al_SIItemID;0)
	//ARRAY LONGINT(PRD_al_SIOIItemNUmber;0)
	//ARRAY LONGINT(PRD_al_TabIncludes;0)
	//ARRAY LONGINT(PRD_al_threadItemRefs;0;0)
	//ARRAY LONGINT(PRD_al_ThreadRowIndex;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY LONGINT(PRD_al_ViewTabsSettings;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY PICTURE(PRD_apic_ExpandedLocations;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY REAL(PRD_ar_PiCostAmount;0)
	//ARRAY REAL(PRD_ar_PiCostPrice;0)
	//ARRAY REAL(PRD_ar_PIPricePer;0)
	//ARRAY REAL(PRD_ar_PIQuantity;0)
	//ARRAY REAL(PRD_ar_PITaxamount;0)
	//ARRAY REAL(PRD_ar_PITotalAmount;0)
	//ARRAY REAL(PRD_ar_POCostAmount;0)
	//ARRAY REAL(PRD_ar_POCostPrice;0)
	//ARRAY REAL(PRD_ar_PODisccount;0)
	//ARRAY REAL(PRD_ar_POOriginalCost;0)
	//ARRAY REAL(PRD_ar_POPricePer;0)
	//ARRAY REAL(PRD_ar_POQuantity;0)
	//ARRAY REAL(PRD_ar_QtyReceived;0)
	//ARRAY REAL(PRD_ar_SIamount;0)
	//ARRAY REAL(PRD_ar_SIPricePer;0)
	//ARRAY REAL(PRD_ar_SIQuantity;0)
	//ARRAY REAL(PRD_ar_SISalesPrice;0)
	//ARRAY REAL(PRD_ar_SITaxamount;0)
	//ARRAY REAL(PRD_ar_SITotalAmount;0)
	//ARRAY REAL(PRD_ar_StockQuantity;0)
	//ARRAY REAL(PRD_ar_UnitValue;0)
	ARRAY TEXT:C222($_at_PurchaseOrderCodes; 0)
	ARRAY TEXT:C222($_at_StockTypesToShow; 0)
	//ARRAY TEXT(PRD_at_CountStockTypes;0)
	//ARRAY TEXT(PRD_at_LocationCode;0)
	//ARRAY TEXT(PRD_at_PIcodes;0)
	//ARRAY TEXT(PRD_at_PiDescription;0)
	//ARRAY TEXT(PRD_at_PINumber;0)
	//ARRAY TEXT(PRD_at_PiPONUmber;0)
	//ARRAY TEXT(PRD_at_PISupplierCode;0)
	//ARRAY TEXT(PRD_at_PITaxCode;0)
	//ARRAY TEXT(PRD_at_POcodes;0)
	//ARRAY TEXT(PRD_at_PODescription;0)
	//ARRAY TEXT(PRD_at_POPricecode;0)
	//ARRAY TEXT(PRD_at_POPurchInvno;0)
	//ARRAY TEXT(PRD_at_POSupplierCode;0)
	//ARRAY TEXT(PRD_at_POTaxCode;0)
	//ARRAY TEXT(PRD_at_SerialNumber;0)
	//ARRAY TEXT(PRD_at_SIcustomercodes;0)
	//ARRAY TEXT(PRD_at_SINumber;0)
	//ARRAY TEXT(PRD_at_SIOrderNUmber;0)
	//ARRAY TEXT(PRD_at_SITaxCode;0)
	//ARRAY TEXT(PRD_at_STKAnalCode;0)
	//ARRAY TEXT(PRD_at_STKCurrencyCode;0)
	//ARRAY TEXT(PRD_at_STKLayerCode;0)
	//ARRAY TEXT(PRD_at_StockBatchRef;0)
	//ARRAY TEXT(PRD_at_stockBreakDown;0)
	//ARRAY TEXT(PRD_at_StockTypes;0)
	//ARRAY TEXT(PRD_at_TabNames;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>StockAnal; $_bo_Editable; $_bo_NewLevel; PRD_bo_StockTypesLoaded; PROD_bo_iscancelled)
	C_LONGINT:C283($_l_ActionColumnIndex; $_l_ActionID; $_l_ActionRow; $_l_CurrentFormPage; $_l_FieldNumber; $_l_InvoiceItemsIndex; $_l_InvoicesIndex; $_l_PIItemsIndex; $_l_POItemsIndex; $_l_ReceiptFunction; $_l_ReuseLevel)
	C_LONGINT:C283($_l_TabColumnIndex; $_l_TableNumber; $_l_TabRow; $_l_VarNum; PRD_l_CurrentLocationLevel; PRD_l_InfoColumn; PRD_l_ViewTabsLabelsOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_ObjectPrefix; $_t_oldMethodName; $_t_Reference; $_t_Reference2; $_t_VariableName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_inonloadrelated")

$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
PROD_bo_iscancelled:=False:C215
If (PRD_at_ViewTabsLabels=0)
	PRD_at_ViewTabsLabels:=1
End if 

Case of 
	: ($_t_HandlerCharacter1="N")  //(($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  `use this bit if don't use Before2 method
		PRD_inonloadrecord
	: (($_t_HandlerCharacter1="A") | ($_t_HandlerCharacter1="F"))
		//Products_InLPA
	: ($_t_HandlerCharacter1="C")
		PROD_bo_iscancelled:=True:C214
	: ($_t_HandlerCharacter1="D")
		//Products_InDel
End case 
If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			$_l_CurrentFormPage:=1
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
	End case 
	Case of 
		: (($_l_CurrentFormPage=1) & (Not:C34($_t_HandlerCharacter1="P"))) | (($_l_CurrentFormPage=1) & (FORM Get current page:C276=1))  //&(Current form page
			$_bo_Editable:=(PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels}=0)
			If ($_bo_Editable)
				$_t_Reference:="411111126"
				$_t_Reference2:="211111126"
			Else 
				$_t_Reference:="311111000"
				$_t_Reference2:="211111126"
			End if 
			ARRAY LONGINT:C221(PRD_al_Levels; 1)
			$_l_ReuseLevel:=0
			If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) & (vALLevels>0)
				If (PRD_al_Levels{1}=0)
					$_bo_NewLevel:=True:C214
				Else 
					$_bo_NewLevel:=False:C215
					$_l_ReuseLevel:=PRD_al_Levels{1}
				End if 
			Else 
				$_bo_NewLevel:=False:C215
			End if 
			Case of 
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //Suppliers
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
					Else 
						REDUCE SELECTION:C351([PRODUCTS_SUPPLIERS:148]; 0)
					End if 
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PRODUCTS_SUPPLIERS:148]ID:7; ->[PRODUCTS:9]Product_Code:1; "211111000"; ""; 3; "Product Suppliers"; "Product Supplier"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
							: ($_t_HandlerCharacter1="P")
								
						End case 
					End if 
					
					LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					//TRACE
					PRD_l_InfoColumn:=0
					USE SET:C118("PRD_FFSelection")
					//Because this does not use the definitions a definition set must be loaded-we will load the order items
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PRODUCTS_SUPPLIERS:148]ID:7; ->[PRODUCTS:9]Product_Code:1; "211111000"; ""; 3; "Product Suppliers"; "Product Supplier"; ""; $_bo_NewLevel; $_l_ReuseLevel)  // 03/07/06 pb
						
						
					End if 
					FUR_FillListBoxArea(->PRD_lb_RelatedData; ->[PRODUCTS:9])
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=[PRODUCTS:9]Product_Code:1)
					Else 
						REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
					End if 
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[ORDER_ITEMS:25]Item_Number:27; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "Items_in"; 12; "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								
								LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
								
								//   : ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
						
					End if 
					LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
					If (Size of array:C274(PRD_at_TabNames)=0)
						SD2_GetRelatedDiaryItems(Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Code:1); [PRODUCTS:9]Product_Code:1)
						
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
							
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[DIARY:12]Diary_Code:3; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
						End if 
						LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
						
					Else 
						$_l_TabRow:=Find in array:C230(PRD_at_TabNames; PRD_at_ViewTabsLabels{PRD_at_ViewTabsLabels})
						If ($_l_TabRow>0)  //it should be
							CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
							If (Size of array:C274(PRD_al_TabIncludes{$_l_TabRow})>0)
								For ($_l_TabColumnIndex; 1; Size of array:C274(PRD_al_TabIncludes{$_l_TabRow}))
									
									If (PRD_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex}>0)
										QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=PRD_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex})
										If (Records in selection:C76([ACTIONS:13])>0)
											QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
											If (PRD_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
											End if 
											QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
											// [DIARY];"Diary_InNEW"
											CREATE SET:C116([DIARY:12]; "Action")
											SD2_GetRelatedDiaryItems(Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Code:1); [PRODUCTS:9]Product_Code:1; (PRD_al_DocIncludes{$_l_TabRow}=1))
											CREATE SET:C116([DIARY:12]; "OrderMatch")
											INTERSECTION:C121("Action"; "OrderMatch"; "Action")
											UNION:C120("Action"; "ToDisplay"; "ToDisplay")
											UNLOAD RECORD:C212([ACTIONS:13])
										End if 
									Else 
										//action is a group of actions
										$_l_ActionRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99(PRD_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex}))
										If ($_l_ActionRow>0)
											For ($_l_ActionColumnIndex; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionRow}))
												$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_ActionRow}{$_l_ActionColumnIndex}
												If ($_l_ActionID>0)
													QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
													If (Records in selection:C76([ACTIONS:13])>0)
														QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
														
														If (PRD_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
															QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
														End if 
														
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
														CREATE SET:C116([DIARY:12]; "Action")
														SD2_GetRelatedDiaryItems(Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Code:1); [PRODUCTS:9]Product_Code:1; (PRD_al_DocIncludes{$_l_TabRow}=1))
														CREATE SET:C116([DIARY:12]; "OrderMatch")
														INTERSECTION:C121("Action"; "OrderMatch"; "Action")
														
														UNION:C120("Action"; "ToDisplay"; "ToDisplay")
														UNLOAD RECORD:C212([ACTIONS:13])
													End if 
													
												End if 
												
											End for 
											
										End if 
										
									End if 
									
								End for 
							Else 
								//we cant have no includes...
								SD2_GetRelatedDiaryItems(Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Code:1); [PRODUCTS:9]Product_Code:1)
								CREATE SET:C116([DIARY:12]; "ToDisplay")
							End if 
							USE SET:C118("ToDisplay")
							If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
								PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
								
								LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[DIARY:12]Diary_Code:3; ->[PRODUCTS:9]Product_Code:1; $_t_Reference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							Else 
								OK:=1
								Case of 
									: ($_t_HandlerCharacter1="B")
										
										LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
										//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
										//   : ($_t_HandlerCharacter1="P")
										//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
								End case 
							End if 
							LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
							
						End if 
						
					End if 
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
					If ([PRODUCTS:9]Product_Code:1#"")
						SD2_GetRelatedDiaryItems(Table:C252(->[PRODUCTS:9]); Field:C253(->[PRODUCTS:9]Product_Code:1); [PRODUCTS:9]Product_Code:1; True:C214)
					Else 
						REDUCE SELECTION:C351([DIARY:12]; 0)
					End if 
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
						
						//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
						//see _inProcess(it may be one of several forms
						
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[DIARY:12]Diary_Code:3; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
								
						End case 
					End if 
					LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
					If (False:C215)
						//here because purchase order items are a subtable we are going to load the PO items subrecords directly to arrays..the Listbox are will be an array based one
						If ([PRODUCTS:9]Product_Code:1#"")
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=[PRODUCTS:9]Product_Code:1)
							SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderCodes)
							QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderCodes)
						Else 
							REDUCE SELECTION:C351([PURCHASE_ORDERS:57]; 0)
						End if 
						ARRAY TEXT:C222(PRD_at_POSupplierCode; 0)
						ARRAY TEXT:C222(PRD_at_POcodes; 0)
						ARRAY DATE:C224(PRD_ad_POOrderedDate; 0)
						ARRAY LONGINT:C221(PRD_al_POIDS; 0)
						ARRAY REAL:C219(PRD_ar_POCostAmount; 0)
						ARRAY REAL:C219(PRD_ar_POCostPrice; 0)
						ARRAY TEXT:C222(PRD_at_PODescription; 0)
						ARRAY REAL:C219(PRD_ar_PODisccount; 0)
						ARRAY LONGINT:C221(PRD_al_POOIItemNUmber; 0)
						ARRAY DATE:C224(PRD_ad_POExpectedDate; 0)
						ARRAY REAL:C219(PRD_ar_POOriginalCost; 0)
						ARRAY LONGINT:C221(PRD_al_POItemID; 0)
						ARRAY TEXT:C222(PRD_at_POPricecode; 0)
						ARRAY REAL:C219(PRD_ar_POPricePer; 0)
						ARRAY TEXT:C222(PRD_at_POPurchInvno; 0)
						ARRAY REAL:C219(PRD_ar_POQuantity; 0)
						ARRAY TEXT:C222(PRD_at_POTaxCode; 0)
						ARRAY REAL:C219(PRD_ar_QtyReceived; 0)
						If (DB_GetModuleSettingByNUM(Module_StockControl)>0)
							//Stock Items
							//$_l_ReceiptFunction:=STK_GetMovementTypes ("Use For Receipt")
						Else 
							//$_l_ReceiptFunction:=0
						End if 
						For ($_l_POItemsIndex; 1; Records in selection:C76([PURCHASE_ORDERS:57]))
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2; *)
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=[PRODUCTS:9]Product_Code:1)
							For ($_l_PIItemsIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
								APPEND TO ARRAY:C911(PRD_at_POSupplierCode; [PURCHASE_ORDERS:57]Company_Code:1)
								APPEND TO ARRAY:C911(PRD_ad_POOrderedDate; [PURCHASE_ORDERS:57]Purchase_Order_Date:3)
								APPEND TO ARRAY:C911(PRD_at_POcodes; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
								APPEND TO ARRAY:C911(PRD_al_POIDS; [PURCHASE_ORDERS:57]x_ID:21)
								APPEND TO ARRAY:C911(PRD_ar_POCostAmount; [PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)
								APPEND TO ARRAY:C911(PRD_ar_POCostPrice; [PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
								
								APPEND TO ARRAY:C911(PRD_at_PODescription; [PURCHASE_ORDERS_ITEMS:169]Description:13)
								APPEND TO ARRAY:C911(PRD_ar_PODisccount; [PURCHASE_ORDERS_ITEMS:169]Discount:10)
								APPEND TO ARRAY:C911(PRD_al_POOIItemNUmber; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
								//APPEND TO ARRAY(PRD_ad_POExpectedDate;[PURCHASE ORDERS_ITEMS]itemsExpectedDate)
								//APPEND TO ARRAY(PRD_ar_POOriginalCost;[PURCHASE ORDERS]ITEMS]Original Cost)
								APPEND TO ARRAY:C911(PRD_al_POItemID; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
								APPEND TO ARRAY:C911(PRD_at_POPricecode; [PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
								APPEND TO ARRAY:C911(PRD_ar_POPricePer; [PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
								APPEND TO ARRAY:C911(PRD_at_POPurchInvno; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
								APPEND TO ARRAY:C911(PRD_ar_POQuantity; [PURCHASE_ORDERS_ITEMS:169]Quantity:3)
								APPEND TO ARRAY:C911(PRD_at_POTaxCode; [PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
								If ($_l_ReceiptFunction>0)
									//QUERY([Stock_Thread];[STOCK_THREAD]Product_Code=[PRODUCTS]Product Code;*)
									//QUERY([Stock_Thread]; & ;[STOCK_THREAD]xPurchaseOrderItemID=[PURCHASE ORDERS]ITEMS'POitemID)
									//QUERY([Stock_Thread];[STOCK_THREAD]xMovementTypeFunction=$_l_ReceiptFunction)
									//$_r_Sum:=Sum([Stock_Thread]Quantity)
									$_r_Sum:=0
								Else 
									
									$_r_Sum:=0
								End if 
								APPEND TO ARRAY:C911(PRD_ar_QtyReceived; $_r_Sum)
								NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
							End for 
							NEXT RECORD:C51([PURCHASE_ORDERS:57])
						End for 
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PURCHASE_ORDERS:57]x_ID:21; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "Po"; 6; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
						
					Else 
						If ([PRODUCTS:9]Product_Code:1#"")
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1=[PRODUCTS:9]Product_Code:1)
						Else 
							REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 0)
						End if 
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
							//LBi_ArrDefFill (->PRD_aPtr_RelatedConfiguration;->PRD_lb_RelatedData;->[PURCHASE ORDERS]x_ID;->[PRODUCTS]Product Code;"211111126";"Po";6;"Items";"Item";"";$_bo_NewLevel;$_l_ReuseLevel)
							
							
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PURCHASE_ORDERS_ITEMS:169]ID:17; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "Items_in"; 3; "Purchase Order Items"; "Purchase Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
						
					End if 
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))
					
					//here because purchase order items are a subtable we are going to load the PO items subrecords directly to arrays..the Listbox are will be an array based one
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1=[PRODUCTS:9]Product_Code:1)
					Else 
						REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; 0)
					End if 
					If (False:C215)
						ARRAY TEXT:C222(PRD_at_PISupplierCode; 0)
						ARRAY TEXT:C222(PRD_at_PIcodes; 0)
						ARRAY TEXT:C222(PRD_at_PINumber; 0)
						ARRAY DATE:C224(PRD_ad_PIDate; 0)
						ARRAY LONGINT:C221(PRD_al_PiIDS; 0)
						ARRAY REAL:C219(PRD_ar_PiCostAmount; 0)
						ARRAY REAL:C219(PRD_ar_PiCostPrice; 0)
						ARRAY TEXT:C222(PRD_at_PiDescription; 0)
						ARRAY LONGINT:C221(PRD_al_PiOIItemNUmber; 0)
						ARRAY TEXT:C222(PRD_at_PiPONUmber; 0)
						ARRAY REAL:C219(PRD_ar_PITaxamount; 0)
						ARRAY REAL:C219(PRD_ar_PITotalAmount; 0)
						ARRAY LONGINT:C221(PRD_al_PIItemID; 0)
						ARRAY REAL:C219(PRD_ar_PIPricePer; 0)
						ARRAY REAL:C219(PRD_ar_PIQuantity; 0)
						ARRAY TEXT:C222(PRD_at_PITaxCode; 0)
						For ($_l_PIItemsIndex; 1; Records in selection:C76([PURCHASE_INVOICES:37]))
							QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1; *)
							QUERY:C277([PURCHASE_INVOICE_ITEMS:158];  & ; [PURCHASE_INVOICE_ITEMS:158]Product_Code:1=[PRODUCTS:9]Product_Code:1)
							For ($_l_PIItemsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
								APPEND TO ARRAY:C911(PRD_at_PISupplierCode; [PURCHASE_INVOICES:37]Company_Code:2)
								APPEND TO ARRAY:C911(PRD_at_PIcodes; [PURCHASE_INVOICES:37]Purchase_Code:1)
								APPEND TO ARRAY:C911(PRD_at_PINumber; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
								APPEND TO ARRAY:C911(PRD_ad_PIDate; [PURCHASE_INVOICES:37]Posted_Date:12)
								APPEND TO ARRAY:C911(PRD_al_PiIDS; [PURCHASE_INVOICES:37]x_ID:35)
								APPEND TO ARRAY:C911(PRD_ar_PiCostAmount; [PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)
								APPEND TO ARRAY:C911(PRD_ar_PiCostPrice; [PURCHASE_INVOICE_ITEMS:158]Cost_Price:3)
								APPEND TO ARRAY:C911(PRD_at_PiDescription; [PURCHASE_INVOICE_ITEMS:158]Description:13)
								APPEND TO ARRAY:C911(PRD_al_PiOIItemNUmber; [PURCHASE_INVOICE_ITEMS:158]Item_Number:12)
								APPEND TO ARRAY:C911(PRD_at_PiPONUmber; [PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11)
								APPEND TO ARRAY:C911(PRD_ar_PITaxamount; [PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)
								APPEND TO ARRAY:C911(PRD_ar_PITotalAmount; [PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)
								APPEND TO ARRAY:C911(PRD_al_PIItemID; [PURCHASE_INVOICE_ITEMS:158]ID:16)
								APPEND TO ARRAY:C911(PRD_ar_PIPricePer; [PURCHASE_INVOICE_ITEMS:158]Price_Per:10)
								APPEND TO ARRAY:C911(PRD_ar_PIQuantity; [PURCHASE_INVOICE_ITEMS:158]Quantity:2)
								APPEND TO ARRAY:C911(PRD_at_PITaxCode; [PURCHASE_INVOICE_ITEMS:158]Tax_Code:5)
								NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
							End for 
							NEXT RECORD:C51([PURCHASE_INVOICES:37])
						End for 
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PURCHASE_INVOICES:37]x_ID:35; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "PI"; 7; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)  // todo: check if this is right!
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBI_LoadArraySetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1)
					Else 
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PURCHASE_INVOICE_ITEMS:158]ID:16; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; ""; 3; "Purchase Ledger Items"; "Purchase Ledger Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							
							//LBi_ArrDefFill (->PRD_aPtr_RelatedConfiguration;->PRD_lb_RelatedData;->[PURCHASES]x_ID;->[PRODUCTS]Product Code;"211111126";"PI";7;"Items";"Item";"";$_bo_NewLevel;$_l_ReuseLevel)  ` todo: check if this is right!
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
						
						
					End if 
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161]))
					//here because  invoice items are a subtable we are going to load the SI  items subrecords directly to arrays..the Listbox are will be an array based one
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Product_Code:1=[PRODUCTS:9]Product_Code:1)
						//SELECTION TO ARRAY([INVOICES_ITEMS]INVOICES_CODE;$_at_InvoiceNumbers)
						//QUERY WITH ARRAY([INVOICES]Invoice_Number;$_at_InvoiceNumbers)
						
					Else 
						REDUCE SELECTION:C351([INVOICES:39]; 0)
					End if 
					ARRAY TEXT:C222(PRD_at_SIcustomercodes; 0)
					ARRAY TEXT:C222(PRD_at_SINumber; 0)
					ARRAY DATE:C224(PRD_ad_SIDate; 0)
					ARRAY LONGINT:C221(PRD_al_SIIDS; 0)
					ARRAY REAL:C219(PRD_ar_SIamount; 0)
					ARRAY LONGINT:C221(PRD_al_SIOIItemNUmber; 0)
					ARRAY TEXT:C222(PRD_at_SIOrderNUmber; 0)
					ARRAY REAL:C219(PRD_ar_SIPricePer; 0)
					ARRAY REAL:C219(PRD_ar_SIQuantity; 0)
					ARRAY REAL:C219(PRD_ar_SISalesPrice; 0)
					ARRAY REAL:C219(PRD_ar_SITaxamount; 0)
					ARRAY TEXT:C222(PRD_at_SITaxCode; 0)
					ARRAY REAL:C219(PRD_ar_SITotalAmount; 0)
					
					ARRAY LONGINT:C221(PRD_al_SIItemID; 0)
					
					If (False:C215)
						
						For ($_l_InvoicesIndex; 1; Records in selection:C76([INVOICES:39]))
							QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([INVOICES_ITEMS:161];  & ; [INVOICES_ITEMS:161]Product_Code:1=[PRODUCTS:9]Product_Code:1)
							For ($_l_InvoiceItemsIndex; 1; Records in selection:C76([INVOICES_ITEMS:161]))
								APPEND TO ARRAY:C911(PRD_at_SIcustomercodes; [INVOICES:39]Company_Code:2)
								APPEND TO ARRAY:C911(PRD_at_SINumber; [INVOICES:39]Invoice_Number:1)
								APPEND TO ARRAY:C911(PRD_ad_SIDate; [INVOICES:39]Invoice_Date:4)
								APPEND TO ARRAY:C911(PRD_al_SIIDS; [INVOICES:39]X_ID:49)
								APPEND TO ARRAY:C911(PRD_ar_SIamount; [INVOICES_ITEMS:161]Amount:5)
								APPEND TO ARRAY:C911(PRD_al_SIOIItemNUmber; [INVOICES_ITEMS:161]Item_Number:12)
								APPEND TO ARRAY:C911(PRD_at_SIOrderNUmber; [INVOICES_ITEMS:161]Order_Code:11)
								APPEND TO ARRAY:C911(PRD_ar_SIPricePer; [INVOICES_ITEMS:161]Price_Per:16)
								APPEND TO ARRAY:C911(PRD_ar_SIQuantity; [INVOICES_ITEMS:161]Quantity:3)
								APPEND TO ARRAY:C911(PRD_ar_SISalesPrice; [INVOICES_ITEMS:161]Sales_Price:4)
								APPEND TO ARRAY:C911(PRD_ar_SITaxamount; [INVOICES_ITEMS:161]Tax_Amount:7)
								APPEND TO ARRAY:C911(PRD_at_SITaxCode; [INVOICES_ITEMS:161]Tax_Code:6)
								APPEND TO ARRAY:C911(PRD_ar_SITotalAmount; [INVOICES_ITEMS:161]Total_Amount:8)
								APPEND TO ARRAY:C911(PRD_al_SIItemID; [INVOICES_ITEMS:161]ID:17)
								NEXT RECORD:C51([INVOICES_ITEMS:161])
							End for 
							NEXT RECORD:C51([INVOICES:39])
						End for 
						
					End if 
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[INVOICES_ITEMS:161]ID:17; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "Items_in"; 7; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)  // todo: check if this is right!
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								
								LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
								//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
								//   : ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
						
					End if 
					LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
					
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
					//TRACE
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
						If ([PRODUCTS:9]Group_Code:3#"")
							QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
							If ([PRODUCTS:9]Brand_Code:4#"")
								QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
							Else 
								QUERY:C277([PRICE_TABLE:28])
							End if 
						Else 
							If ([PRODUCTS:9]Brand_Code:4#"")
								QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
							Else 
								QUERY:C277([PRICE_TABLE:28])
							End if 
						End if 
					Else 
						REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
					End if 
					If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
						PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
						LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PRICE_TABLE:28]Table_Code:12; ->[PRODUCTS:9]Product_Code:1; "211111126"; "PriceTable_In"; 7; "Price table"; "Prices"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								
								LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
								//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
								//   : ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
						
					End if 
					LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
				: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					If (<>DB_bo_NewStockActive)
						
						//Here we will load the stock broken down into Types.
						If ([PRODUCTS:9]Product_Code:1#"")
							STK_GetActiveThreads([PRODUCTS:9]X_ID:43)
							
							
						Else 
							REDUCE SELECTION:C351([Stock_Thread:143]; 0)
						End if 
						QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]FilterOut:9=False:C215)
						SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_StockTypesToShow)
						If (Records in selection:C76([Stock_Thread:143])>0)
							CREATE SET:C116([Stock_Thread:143]; "$thisProduct")
							
							//QUERY WITH ARRAY([STOCK_THREAD]AddedToStockType;$_at_StockTypesToShow)
							CREATE SET:C116([Stock_Thread:143]; "$showCurrentstock")
							INTERSECTION:C121("$showCurrentstock"; "$thisProduct"; "$showCurrentstock")
							USE SET:C118("$showCurrentstock")
						Else 
							
						End if 
						ARRAY TEXT:C222(PRD_at_StockTypes; 0)
						ARRAY PICTURE:C279(PRD_apic_ExpandedLocations; 0)  //Reuse the pictures from diary thread expander)
						ARRAY LONGINT:C221(PRD_al_ExpandedLocationLevel; 0)  //Not displayed
						ARRAY TEXT:C222(PRD_at_LocationCode; 0)
						ARRAY LONGINT:C221(PRD_al_LocationID; 0)
						ARRAY REAL:C219(PRD_ar_StockQuantity; 0)
						ARRAY REAL:C219(PRD_ar_UnitValue; 0)
						ARRAY TEXT:C222(PRD_at_SerialNumber; 0)  //Hide this column iif product not serial nod
						ARRAY TEXT:C222(PRD_at_StockBatchRef; 0)  //hid this column if product not batch
						ARRAY LONGINT:C221(PRD_al_ThreadRowIndex; 0)  // Reference for each row of the following 2d Arrrays
						ARRAY TEXT:C222(PRD_at_STKCurrencyCode; 0)
						ARRAY TEXT:C222(PRD_at_STKLayerCode; 0)
						ARRAY TEXT:C222(PRD_at_STKAnalCode; 0)
						ARRAY LONGINT:C221(PRD_al_threadItemRefs; 0; 0)
						ARRAY LONGINT:C221(PRD_al_OrderItemIDs; 0; 0)
						ARRAY LONGINT:C221(PRD_al_POItemIDS; 0; 0)
						ARRAY TEXT:C222(PRD_at_stockBreakDown; 9)  //this could be read from a preference
						PRD_at_stockBreakDown{1}:="Type"
						PRD_at_stockBreakDown{2}:="Status"
						PRD_at_stockBreakDown{3}:="Layer"
						PRD_at_stockBreakDown{4}:="Analysis"
						PRD_at_stockBreakDown{5}:="Location"
						PRD_at_stockBreakDown{6}:="Currency"
						PRD_at_stockBreakDown{7}:="Value"
						PRD_at_stockBreakDown{8}:="Serial"
						PRD_at_stockBreakDown{9}:="Batch"
						If (Not:C34([PRODUCTS:9]Serial_Numbered:17))
							$_l_TabRow:=Find in array:C230(PRD_at_stockBreakDown; "Serial")
							If ($_l_TabRow>0)
								DELETE FROM ARRAY:C228(PRD_at_stockBreakDown; $_l_TabRow)
							End if 
						End if 
						If (Not:C34([PRODUCTS:9]x_Batch_Numbering:52))
							$_l_TabRow:=Find in array:C230(PRD_at_stockBreakDown; "Stock Batch")
							If ($_l_TabRow>0)
								DELETE FROM ARRAY:C228(PRD_at_stockBreakDown; $_l_TabRow)
							End if 
						End if 
						If (Not:C34(<>StockAnal))
							$_l_TabRow:=Find in array:C230(PRD_at_stockBreakDown; "Analysis")
							If ($_l_TabRow>0)
								DELETE FROM ARRAY:C228(PRD_at_stockBreakDown; $_l_TabRow)
							End if 
						End if 
						If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<1)  //no layers on the system
							$_l_TabRow:=Find in array:C230(PRD_at_stockBreakDown; "Layer")
							If ($_l_TabRow>0)
								DELETE FROM ARRAY:C228(PRD_at_stockBreakDown; $_l_TabRow)
							End if 
						Else 
							If (Records in table:C83([LAYERS:76])<=1)  //there is no more than one layer on this system no point in breaking by layer
								$_l_TabRow:=Find in array:C230(PRD_at_stockBreakDown; "Layer")
								If ($_l_TabRow>0)
									DELETE FROM ARRAY:C228(PRD_at_stockBreakDown; $_l_TabRow)
								End if 
							End if 
							
						End if 
						
						
						//We can also breakdown by  Order item, and Purchase order item..
						PRD_l_CurrentLocationLevel:=0
						//ARRAY STRING(10;PRD_aS10_STKLayerCode;0)
						//ARRAY STRING(10;PRD_aS10_STKAnalCode;0)
						
						STK_BreakDownStock(1; ->PRD_at_stockBreakDown; PRD_l_CurrentLocationLevel; ->PRD_at_StockTypes; ->PRD_apic_ExpandedLocations; ->PRD_al_ExpandedLocationLevel; ->PRD_at_LocationCode; ->PRD_al_LocationID; ->PRD_at_STKLayerCode; ->PRD_at_STKAnalCode; ->PRD_ar_StockQuantity; ->PRD_at_STKCurrencyCode; ->PRD_ar_UnitValue; ->PRD_at_SerialNumber; ->PRD_at_StockBatchRef; ->PRD_al_ThreadRowIndex; ->PRD_al_threadItemRefs; ->PRD_al_OrderItemIDs; ->PRD_al_POItemIDS)
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							//LBi_ArrDefFill (->PRD_aPtr_RelatedConfiguration;->PRD_lb_RelatedData;->[STOCK_THREAD]ThreadItemReferenceNumber;->[PRODUCTS]Product Code;"211111126";"Po";1;"Items";"Item";"";$_bo_NewLevel;$_l_ReuseLevel) ` todo: check if this is right!
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBI_LoadArraySetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1)
						$_ptr_ArrayFieldPointers:=PRD_aPtr_RelatedConfiguration{2}
						$_ptr_ArrayOfArrayNames:=PRD_aPtr_RelatedConfiguration{4}
						RESOLVE POINTER:C394($_ptr_ArrayFieldPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						
						If (Not:C34([PRODUCTS:9]Serial_Numbered:17))  //Note that we are not going to change the value stored in the array-just hide the column
							$_l_TabRow:=Find in array:C230($_ptr_ArrayOfArrayNames->; "PRD_at_SerialNumber")
							$_l_VarNum:=Num:C11($_t_VariableName)
							$_t_ObjectPrefix:="o"+String:C10($_l_VarNum)
							If ($_l_TabRow>0)
								LB_SetColumnWidths(->PRD_lb_RelatedData; $_t_ObjectPrefix; $_l_TabRow; 0)
							End if 
							
						End if 
						If (Not:C34([PRODUCTS:9]x_Batch_Numbering:52))  //Note that we are not going to change the value stored in the array-just hide the column
							$_l_TabRow:=Find in array:C230($_ptr_ArrayOfArrayNames->; "PRD_at_StockBatchRef")
							$_l_VarNum:=Num:C11($_t_VariableName)
							$_t_ObjectPrefix:="o"+String:C10($_l_VarNum)
							If ($_l_TabRow>0)
								LB_SetColumnWidths(->PRD_lb_RelatedData; $_t_ObjectPrefix; $_l_TabRow; 0)
							End if 
							
						End if 
						If (Not:C34(<>StockAnal))  //Note that we are not going to change the value stored in the array-just hide the column
							$_l_TabRow:=Find in array:C230($_ptr_ArrayOfArrayNames->; "PRD_aS10_STKAnalCode")
							$_l_VarNum:=Num:C11($_t_VariableName)
							$_t_ObjectPrefix:="o"+String:C10($_l_VarNum)
							If ($_l_TabRow>0)
								LB_SetColumnWidths(->PRD_lb_RelatedData; $_t_ObjectPrefix; $_l_TabRow; 0)
							End if 
							
						End if 
						If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<1) | (Records in table:C83([LAYERS:76])<=1)  //Note that we are not going to change the value stored in the array-just hide the column
							$_l_TabRow:=Find in array:C230($_ptr_ArrayOfArrayNames->; "PRD_aS10_STKLayerCode")
							$_l_VarNum:=Num:C11($_t_VariableName)
							$_t_ObjectPrefix:="o"+String:C10($_l_VarNum)
							If ($_l_TabRow>0)
								LB_SetColumnWidths(->PRD_lb_RelatedData; $_t_ObjectPrefix; $_l_TabRow; 0)
							End if 
							
						End if 
					Else 
						
						If (Not:C34(PRD_bo_StockTypesLoaded))
							ARRAY TEXT:C222(PRD_at_CountStockTypes; 0)
							QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]FilterOut:9=False:C215)
							SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; PRD_at_CountStockTypes)
							PRD_bo_StockTypesLoaded:=True:C214
						End if 
						If ([PRODUCTS:9]Product_Code:1#"")
							QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[PRODUCTS:9]Product_Code:1)
							QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; PRD_at_CountStockTypes)
							
							
						Else 
							REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
						End if 
						
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0) | (PRD_l_ViewTabsLabelsOLD#PRD_at_ViewTabsLabels)
							PRD_l_ViewTabsLabelsOLD:=PRD_at_ViewTabsLabels
							LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[CURRENT_STOCK:62]X_ID:13; ->[PRODUCTS:9]Product_Code:1; $_t_Reference2; "CurrentStock_In"; 2; "Current Stock"; "Current Stock"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
							
						End if 
						LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1; PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels})
					End if 
			End case 
			If (PRD_al_Levels{1}=0)
				PRD_al_Levels{1}:=vALLevels
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("PRD_inonloadrelated"; $_t_oldMethodName)
