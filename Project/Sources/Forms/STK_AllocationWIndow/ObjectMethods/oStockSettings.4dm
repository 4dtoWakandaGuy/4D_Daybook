If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oStockSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_Allocate;0)
	//ARRAY DATE(ORDI_ad_AllocExpectedDate;0)
	ARRAY LONGINT:C221($_al_ItemNumbers; 0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbers;0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbersMAS;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDSMAS;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineIndexMAS;0)
	ARRAY REAL:C219($_ar_TotalCosts; 0)
	ARRAY REAL:C219($_ar_UnitCosts; 0)
	ARRAY REAL:C219($_ar_UnitStockQuantities; 0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocResStockQtyMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockPrice;0)
	//ARRAY REAL(ORDI_ar_AllocStockPriceMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocStockQtyMAS;0)
	ARRAY TEXT:C222($_at_AllocationTypes; 0)
	ARRAY TEXT:C222($_at_CurrenciesRange; 0)
	ARRAY TEXT:C222($_at_LocationsRange; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	ARRAY TEXT:C222($_at_PurchaseMovementTypes; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	ARRAY TEXT:C222($_at_StockTypes; 0)
	ARRAY TEXT:C222($_at_TypeCodes; 0)
	ARRAY TEXT:C222($_at_TypeNames; 0)
	//ARRAY TEXT(ORD_at_AllocSerialNo;0)
	//ARRAY TEXT(ORD_at_AllocSerialNoMAS;0)
	//ARRAY TEXT(ORDI_AT_AllocCURRENCY;0)
	//ARRAY TEXT(ORDI_AT_AllocCURRENCYMAS;0)
	//ARRAY TEXT(ORDI_At_AllocLocationCodes;0)
	//ARRAY TEXT(ORDI_At_AllocLocationCodesMAS;0)
	//ARRAY TEXT(ORDI_at_AllocOrderCodes;0)
	//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
	//ARRAY TEXT(ORDI_at_AllocProductCodesMAS;0)
	//ARRAY TEXT(ORDI_at_AlocStockTypes;0)
	//ARRAY TEXT(ORDI_at_AlocStockTypesMAS;0)
	//ARRAY TEXT(STK_at_DisProductNames;0)
	//ARRAY TEXT(STK_at_DisProductNamesMAS;0)
	//ARRAY TEXT(STK_at_DisStockTypeNames;0)
	//ARRAY TEXT(STK_at_DisStockTypeNamesMAS;0)
	//ARRAY TEXT(STK_at_FilterTypes;0)
	//ARRAY TEXT(STK_at_LocationCodes;0)
	//ARRAY TEXT(STK_at_LocationNames;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_FilterByLocation)
	C_LONGINT:C283($_l_ArraySize; $_l_ButtonHeight; $_l_ButtonTop; $_l_ButtonWidth; $_l_CurrenciesIndex; $_l_CurrencyRow; $_l_event; $_l_ItemRow; $_l_ItemsIndex; $_l_LBSIze; $_l_LBWidth)
	C_LONGINT:C283($_l_LocationsIndex; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectCentre; $_l_ObjectHalfWidth2; $_l_ObjectHeight; $_l_ObjectHeight2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2)
	C_LONGINT:C283($_l_ObjectTop; $_l_ObjectTop2; $_l_ProductRow; $_l_SerialRow; $_l_StockTypeIndex; $_l_TypeRow; STK_l_AllocateButton; STK_l_CancelAllocations; STK_l_OrderItemNumber; STK_l_ShowLocations; STK_l_Unallocate)
	C_LONGINT:C283(STL_l_CurrentFIlter)
	C_REAL:C285($_r_AverageUnitCost; $_r_SumCost; $_r_Total)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_LayerCode; $_t_oldMethodName; STK_T_AllocfromAnalCode; STK_T_AllocFromLayerCode; STK_t_Company)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oStockSettings"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		STK_t_Company:=""
		OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ButtonHeight:=22
		Case of 
			: (STK_at_FilterTypes{STK_at_FilterTypes}="Free Stock")
				If (STL_l_CurrentFIlter#1)
					STL_l_CurrentFIlter:=1
					COPY ARRAY:C226(ORDI_at_AlocStockTypesMAS; ORDI_at_AlocStockTypes)
					COPY ARRAY:C226(STK_at_DisStockTypeNamesMAS; STK_at_DisStockTypeNames)
					COPY ARRAY:C226(ORDI_at_AllocProductCodesMAS; ORDI_at_AllocProductCodes)
					COPY ARRAY:C226(STK_at_DisProductNamesMAS; STK_at_DisProductNames)
					COPY ARRAY:C226(ORDI_ar_AllocStockQtyMAS; ORDI_ar_AllocStockQty)
					COPY ARRAY:C226(ORDI_AT_AllocCURRENCYMAS; ORDI_AT_AllocCURRENCY)
					COPY ARRAY:C226(ORDI_ar_AllocStockPriceMAS; ORDI_ar_AllocStockPrice)
					COPY ARRAY:C226(ORD_at_AllocSerialNoMAS; ORD_at_AllocSerialNo)
					COPY ARRAY:C226(ORDI_At_AllocLocationCodesMAS; ORDI_At_AllocLocationCodes)
					COPY ARRAY:C226(ORDI_ar_AllocResStockQtyMAS; ORDI_ar_AllocResidualStockQty)
					COPY ARRAY:C226(STK_al_LineIndexMAS; STK_al_LineIndex)
					COPY ARRAY:C226(ORDI_al_AllocItemNumbersMAS; ORDI_al_AllocItemNumbers)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDSMAS)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; $_l_ArraySize; 0)
					For ($_l_StockTypeIndex; 1; $_l_ArraySize)
						For ($_l_ItemsIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}))
							APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_StockTypeIndex}; ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}{$_l_ItemsIndex})
						End for 
					End for 
					
					If (STK_at_LocationNames>0)
						For ($_l_StockTypeIndex; Size of array:C274(ORDI_At_AllocLocationCodes); 1; -1)
							If (ORDI_At_AllocLocationCodes{$_l_StockTypeIndex}#STK_at_LocationCodes{STK_at_LocationNames})
								DELETE FROM ARRAY:C228(ORDI_at_AlocStockTypes; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(STK_at_DisStockTypeNames; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORDI_at_AllocProductCodes; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(STK_at_DisProductNames; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORDI_ar_AllocStockQty; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORDI_AT_AllocCURRENCY; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORDI_ar_AllocStockPrice; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORD_at_AllocSerialNo; $_l_StockTypeIndex)
								DELETE FROM ARRAY:C228(ORDI_At_AllocLocationCodes; $_l_StockTypeIndex)
							End if 
						End for 
					End if 
					$_at_SerialNumbers:=0
					For ($_l_StockTypeIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
						If (ORD_at_AllocSerialNo{$_l_StockTypeIndex}#"")
							$_at_SerialNumbers:=1
							$_l_StockTypeIndex:=Size of array:C274(ORD_at_AllocSerialNo)
						End if 
						
					End for 
					ARRAY LONGINT:C221(STK_al_LineIndex; 0)
					ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
					For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
						STK_al_LineIndex{$_l_StockTypeIndex}:=$_l_StockTypeIndex
					End for 
					LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
					
					LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
					LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 40; 100; 187*(Num:C11($_at_SerialNumbers)); 200*((STK_l_ShowLocations)); 0)
					LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
					LB_SetScroll(->STK_lb_Allocate; -3; -2)
					LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
					If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
						$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
					Else 
						$_l_LBSIze:=(5*16)
					End if 
					$_l_ArraySize:=70+$_l_ObjectTop+$_l_LBSIze
					$_l_LBWidth:=7+187+88+200+60+40+100+(187*(Num:C11($_at_SerialNumbers)))+(200*((STK_l_ShowLocations)))
					If ($_l_ArraySize<250)
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						$_l_ArraySize:=250
					End if 
					
					
					WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth+20)
					OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWidth+4; $_l_ObjectTop+$_l_LBSIze+4; *)
					OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWidth; $_l_ObjectTop+$_l_LBSIze; *)
					OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
					$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
					$_l_ObjectCentre:=Int:C8($_l_ObjectLeft+$_l_LBWidth)/2
					
					OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre)-$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10; ($_l_ObjectLeft+$_l_ObjectCentre)+$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10+$_l_ObjectHeight2; *)
					OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
					OBJECT SET VISIBLE:C603(STK_l_AllocateButton; True:C214)
					$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
					OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
					OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
					$_l_ButtonTop:=$_l_ButtonTop+22+9
					OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					OBJECT MOVE:C664(STK_l_AllocateButton; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
					STL_l_CurrentFIlter:=1
				End if 
			: (STK_at_FilterTypes{STK_at_FilterTypes}="Allocated Stock")
				If (STL_l_CurrentFIlter#2)
					//ARRAY TEXT(ORDI_at_AllocProductCodes;0)
					
					ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
					ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
					ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
					ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
					ARRAY DATE:C224(ORDI_ad_AllocExpectedDate; 0)
					ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					
					
					$_bo_FilterByLocation:=False:C215
					If (STK_at_LocationNames>0)
						Gen_Confirm("Display only stock allocated at "+STK_at_LocationNames{STK_at_LocationNames})
						If (OK=1)
							$_bo_FilterByLocation:=True:C214
						End if 
					End if 
					//Always Return to the master Selection first
					COPY ARRAY:C226(ORDI_at_AlocStockTypesMAS; ORDI_at_AlocStockTypes)
					COPY ARRAY:C226(STK_at_DisStockTypeNamesMAS; STK_at_DisStockTypeNames)
					COPY ARRAY:C226(ORDI_at_AllocProductCodesMAS; ORDI_at_AllocProductCodes)
					COPY ARRAY:C226(STK_at_DisProductNamesMAS; STK_at_DisProductNames)
					COPY ARRAY:C226(ORDI_ar_AllocStockQtyMAS; ORDI_ar_AllocStockQty)
					COPY ARRAY:C226(ORDI_AT_AllocCURRENCYMAS; ORDI_AT_AllocCURRENCY)
					COPY ARRAY:C226(ORDI_ar_AllocStockPriceMAS; ORDI_ar_AllocStockPrice)
					COPY ARRAY:C226(ORD_at_AllocSerialNoMAS; ORD_at_AllocSerialNo)
					COPY ARRAY:C226(ORDI_At_AllocLocationCodesMAS; ORDI_At_AllocLocationCodes)
					COPY ARRAY:C226(ORDI_ar_AllocResStockQtyMAS; ORDI_ar_AllocResidualStockQty)
					COPY ARRAY:C226(STK_al_LineIndexMAS; STK_al_LineIndex)
					COPY ARRAY:C226(ORDI_al_AllocItemNumbersMAS; ORDI_al_AllocItemNumbers)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDSMAS)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; $_l_ArraySize; 0)
					For ($_l_StockTypeIndex; 1; $_l_ArraySize)
						For ($_l_ItemsIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}))
							APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_StockTypeIndex}; ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}{$_l_ItemsIndex})
						End for 
					End for 
					
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationTypes)
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ORDI_at_AllocProductCodes)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
					STK_MenuUpdate("Stock items"; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; True:C214)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#STK_l_OrderItemNumber)
					
					//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						
						If (<>StockAnal)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=STK_T_AllocfromAnalCode)
						End if 
						$_t_LayerCode:=""
						If ($_t_LayerCode#"")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=STK_T_AllocFromLayerCode)
						End if 
						ARRAY TEXT:C222($_at_LocationsRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
						ARRAY TEXT:C222($_at_CurrenciesRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
						$_l_CurrencyRow:=Find in array:C230($_at_CurrenciesRange; "")
						If ($_l_CurrencyRow>0)
							DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_CurrencyRow)
						End if 
						If (Size of array:C274($_at_CurrenciesRange)=0)
							APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
						End if 
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
						$_l_ItemRow:=Find in array:C230($_al_ItemNumbers; 0)
						If ($_l_ItemRow>0)
							DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_ItemRow)
						End if 
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_StockTypes)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
						// ARRAY TEXT(ORDI_at_AllocProductCodes;0)
						
						ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
						ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
						ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
						ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
						ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
						For ($_l_StockTypeIndex; 1; Size of array:C274($_at_StockTypes))
							For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
								For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
									For ($_l_ItemsIndex; 1; Size of array:C274($_al_ItemNumbers))
										USE NAMED SELECTION:C332("$ForAllocation")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_StockTypes{$_l_StockTypeIndex}; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_ItemNumbers{$_l_ItemsIndex})
										
										If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
										Else 
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
										End if 
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
											$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_ArraySize+1; 1)
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_ArraySize+1})
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_StockTypes{$_l_StockTypeIndex})
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitStockQuantities)
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											ARRAY REAL:C219($_ar_TotalCosts; 0)
											ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitStockQuantities))
											$_r_SumCost:=0
											For ($_r_Total; 1; Size of array:C274($_ar_UnitStockQuantities))
												$_ar_TotalCosts{$_r_Total}:=$_ar_UnitStockQuantities{$_r_Total}*$_ar_UnitCosts{$_r_Total}
												$_r_SumCost:=$_r_SumCost+$_ar_TotalCosts{$_r_Total}
											End for 
											$_r_AverageUnitCost:=$_r_SumCost/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnitCost; 2))
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
											$_l_SerialRow:=Find in array:C230($_at_SerialNumbers; "")
											If ($_l_SerialRow>0)
												DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_SerialRow)
											End if 
											If (Size of array:C274($_at_SerialNumbers)>1)
												APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
												
											Else 
												If (Size of array:C274($_at_SerialNumbers)>0)
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
												Else 
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
													
												End if 
											End if 
											
											
										Else 
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
											$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_ArraySize+1; 1)
											APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_ArraySize+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
										End if 
									End for 
								End for 
							End for 
						End for 
						If (STK_at_LocationNames>0)
							For ($_l_StockTypeIndex; Size of array:C274(ORDI_At_AllocLocationCodes); 1; -1)
								If (ORDI_At_AllocLocationCodes{$_l_StockTypeIndex}#STK_at_LocationCodes{STK_at_LocationNames})
									DELETE FROM ARRAY:C228(ORDI_at_AlocStockTypes; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(STK_at_DisStockTypeNames; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORDI_at_AllocProductCodes; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(STK_at_DisProductNames; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORDI_ar_AllocStockQty; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORDI_AT_AllocCURRENCY; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORDI_ar_AllocStockPrice; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORD_at_AllocSerialNo; $_l_StockTypeIndex)
									DELETE FROM ARRAY:C228(ORDI_At_AllocLocationCodes; $_l_StockTypeIndex)
								End if 
							End for 
						End if 
						
						ARRAY TEXT:C222(STK_at_DisProductNames; 0)
						ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
						If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProductNames)
							For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
								$_l_ProductRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_StockTypeIndex})
								If ($_l_ProductRow>0)
									APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProductNames{$_l_ProductRow})
								Else 
									APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
								End if 
							End for 
							
						Else 
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
							APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
						End if 
						QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
						SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_TypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_TypeNames)
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							$_l_TypeRow:=Find in array:C230($_at_TypeCodes; ORDI_at_AlocStockTypes{$_l_StockTypeIndex})
							If ($_l_TypeRow>0)
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_TypeNames{$_l_TypeRow})
							Else 
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
							End if 
							
						End for 
						$_at_SerialNumbers:=0
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
							If (ORD_at_AllocSerialNo{$_l_StockTypeIndex}#"")
								$_at_SerialNumbers:=1
								$_l_StockTypeIndex:=Size of array:C274(ORD_at_AllocSerialNo)
							End if 
							
						End for 
						ARRAY LONGINT:C221(STK_al_LineIndex; 0)
						ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							STK_al_LineIndex{$_l_StockTypeIndex}:=$_l_StockTypeIndex
						End for 
						
						LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_al_AllocItemNumbers; ->ORDI_at_AllocOrderCodes; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
						
						LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "SO item number"; "Order Code"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations"; "Line IDS")
						LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 80; 80; 40; 100; 187*(Num:C11($_at_SerialNumbers)); 200*((STK_l_ShowLocations)); 0)
						LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
						LB_SetScroll(->STK_lb_Allocate; -2; -2)
						LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						
						$_l_ArraySize:=70+$_l_ObjectTop+$_l_LBSIze
						$_l_LBWidth:=7+187+88+200+60+80+80+40+100+(187*(Num:C11($_at_SerialNumbers)))+(200*((STK_l_ShowLocations)))
						
						
						
						
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						
						
						
						
						
						WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth+20)
						OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWidth+4; $_l_ObjectTop+$_l_LBSIze+4; *)
						OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWidth; $_l_ObjectTop+$_l_LBSIze; *)
						OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
						$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
						$_l_ObjectCentre:=Int:C8($_l_ObjectLeft+$_l_LBWidth)/2
						
						OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre)-$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10; ($_l_ObjectLeft+$_l_ObjectCentre)+$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10+$_l_ObjectHeight2; *)
						
						OBJECT SET VISIBLE:C603(STK_l_Unallocate; True:C214)
						OBJECT SET VISIBLE:C603(STK_l_AllocateButton; False:C215)
						$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
						OBJECT GET COORDINATES:C663(STK_l_Unallocate; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
						OBJECT MOVE:C664(STK_l_Unallocate; $_l_ObjectLeft+10; $_l_ButtonTop; $_l_ObjectLeft+10+$_l_ButtonWidth; $_l_ButtonTop+22; *)
						OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						
						
						STL_l_CurrentFIlter:=2
					Else 
						Gen_Alert("Sorry there is no stock allocated to other orders"; "OK")
						$_at_SerialNumbers:=0
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
							If (ORD_at_AllocSerialNo{$_l_StockTypeIndex}#"")
								$_at_SerialNumbers:=1
								$_l_StockTypeIndex:=Size of array:C274(ORD_at_AllocSerialNo)
							End if 
							
						End for 
						ARRAY LONGINT:C221(STK_al_LineIndex; 0)
						ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							STK_al_LineIndex{$_l_StockTypeIndex}:=$_l_StockTypeIndex
						End for 
						LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
						
						LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
						LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 40; 100; 187*(Num:C11($_at_SerialNumbers)); 200*((STK_l_ShowLocations)); 0)
						LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
						LB_SetScroll(->STK_lb_Allocate; -3; -2)
						LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
						
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						$_l_ArraySize:=70+$_l_ObjectTop+$_l_LBSIze
						$_l_LBWidth:=7+187+88+200+60+40+100+(187*(Num:C11(True:C214)))+(200*((STK_l_ShowLocations)))
						
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						
						
						
						
						WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth+20)
						OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWidth+4; $_l_ObjectTop+$_l_LBSIze+4; *)
						OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWidth; $_l_ObjectTop+$_l_LBSIze; *)
						OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
						$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
						$_l_ObjectCentre:=Int:C8($_l_ObjectLeft+$_l_LBWidth)/2
						
						OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre)-$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10; ($_l_ObjectLeft+$_l_ObjectCentre)+$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10+$_l_ObjectHeight2; *)
						
						OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
						OBJECT SET VISIBLE:C603(STK_l_AllocateButton; True:C214)
						$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
						OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
						OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						$_l_ButtonTop:=$_l_ButtonTop+22+9
						OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT MOVE:C664(STK_l_AllocateButton; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						STL_l_CurrentFIlter:=1
						STK_at_FilterTypes:=1
						
					End if 
					
				End if 
				
			: (STK_at_FilterTypes{STK_at_FilterTypes}="On Order Stock")
				If (STL_l_CurrentFIlter#3)
					// ARRAY TEXT(ORDI_at_AllocProductCodes;0)
					
					ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
					ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
					ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
					ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
					ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
					ARRAY DATE:C224(ORDI_ad_AllocExpectedDate; 0)
					ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					
					$_bo_FilterByLocation:=False:C215
					//Always Return to the master Selection first
					COPY ARRAY:C226(ORDI_at_AlocStockTypesMAS; ORDI_at_AlocStockTypes)
					COPY ARRAY:C226(STK_at_DisStockTypeNamesMAS; STK_at_DisStockTypeNames)
					COPY ARRAY:C226(ORDI_at_AllocProductCodesMAS; ORDI_at_AllocProductCodes)
					COPY ARRAY:C226(STK_at_DisProductNamesMAS; STK_at_DisProductNames)
					COPY ARRAY:C226(ORDI_ar_AllocStockQtyMAS; ORDI_ar_AllocStockQty)
					COPY ARRAY:C226(ORDI_AT_AllocCURRENCYMAS; ORDI_AT_AllocCURRENCY)
					COPY ARRAY:C226(ORDI_ar_AllocStockPriceMAS; ORDI_ar_AllocStockPrice)
					COPY ARRAY:C226(ORD_at_AllocSerialNoMAS; ORD_at_AllocSerialNo)
					COPY ARRAY:C226(ORDI_At_AllocLocationCodesMAS; ORDI_At_AllocLocationCodes)
					COPY ARRAY:C226(ORDI_ar_AllocResStockQtyMAS; ORDI_ar_AllocResidualStockQty)
					COPY ARRAY:C226(STK_al_LineIndexMAS; STK_al_LineIndex)
					COPY ARRAY:C226(ORDI_al_AllocItemNumbersMAS; ORDI_al_AllocItemNumbers)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
					
					$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDSMAS)
					ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; $_l_ArraySize; 0)
					For ($_l_StockTypeIndex; 1; $_l_ArraySize)
						For ($_l_ItemsIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}))
							APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_StockTypeIndex}; ORDI_al_AllocStockRecordIDSMAS{$_l_StockTypeIndex}{$_l_ItemsIndex})
						End for 
					End for 
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseMovementTypes)
					
					//```
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ORDI_at_AllocProductCodes)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseMovementTypes)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
					
					//so these are the allocated to other order stock items for this product..here we want the Order Code and Order item they belong to displayed
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						
						If (<>StockAnal)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=STK_T_AllocfromAnalCode)
						End if 
						If (STK_T_AllocFromLayerCode#"")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=STK_T_AllocFromLayerCode)
						End if 
						ARRAY TEXT:C222($_at_LocationsRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_LocationsRange)
						ARRAY TEXT:C222($_at_CurrenciesRange; 0)
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; $_at_CurrenciesRange)
						$_l_CUrrencyRow:=Find in array:C230($_at_CurrenciesRange; "")
						If ($_l_CUrrencyRow>0)
							DELETE FROM ARRAY:C228($_at_CurrenciesRange; $_l_CUrrencyRow)
						End if 
						If (Size of array:C274($_at_CurrenciesRange)=0)
							APPEND TO ARRAY:C911($_at_CurrenciesRange; <>SYS_t_BaseCurrency)
						End if 
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_ItemNumbers)
						$_l_ItemRow:=Find in array:C230($_al_ItemNumbers; 0)
						If ($_l_ItemRow>0)
							If (Size of array:C274($_al_ItemNumbers)>1)
								DELETE FROM ARRAY:C228($_al_ItemNumbers; $_l_ItemRow)
							End if 
						End if 
						DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_StockTypes)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ForAllocation")
						// ARRAY TEXT(ORDI_at_AllocProductCodes;0)
						
						ARRAY TEXT:C222(ORDI_at_AlocStockTypes; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocResidualStockQty; 0)
						ARRAY REAL:C219(ORDI_ar_AllocStockPrice; 0)
						ARRAY TEXT:C222(ORDI_AT_AllocCURRENCY; 0)
						ARRAY TEXT:C222(ORD_at_AllocSerialNo; 0)
						ARRAY TEXT:C222(ORDI_At_AllocLocationCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocItemNumbers; 0)
						ARRAY DATE:C224(ORDI_ad_AllocExpectedDate; 0)
						ARRAY TEXT:C222(ORDI_at_AllocOrderCodes; 0)
						ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDS; 0; 0)
						For ($_l_StockTypeIndex; 1; Size of array:C274($_at_StockTypes))
							For ($_l_CurrenciesIndex; 1; Size of array:C274($_at_CurrenciesRange))
								For ($_l_LocationsIndex; 1; Size of array:C274($_at_LocationsRange))
									For ($_l_ItemsIndex; 1; Size of array:C274($_al_ItemNumbers))
										USE NAMED SELECTION:C332("$ForAllocation")
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_at_StockTypes{$_l_StockTypeIndex}; *)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_at_LocationsRange{$_l_LocationsIndex})
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_al_ItemNumbers{$_l_ItemsIndex})
										If ($_at_CurrenciesRange{$_l_CurrenciesIndex}=<>SYS_t_BaseCurrency)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=<>SYS_t_BaseCurrency; *)
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
										Else 
											QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_at_CurrenciesRange{$_l_CurrenciesIndex})
										End if 
										If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_ArraySize+1; 1)
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; ORDI_al_AllocStockRecordIDS{$_l_ArraySize+1})
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; $_at_StockTypes{$_l_StockTypeIndex})
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitStockQuantities)
											FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
											ARRAY REAL:C219($_ar_TotalCosts; 0)
											ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitStockQuantities))
											$_r_SumCost:=0
											For ($_r_Total; 1; Size of array:C274($_ar_UnitStockQuantities))
												$_ar_TotalCosts{$_r_Total}:=$_ar_UnitStockQuantities{$_r_Total}*$_ar_UnitCosts{$_r_Total}
												$_r_SumCost:=$_r_SumCost+$_ar_TotalCosts{$_r_Total}
											End for 
											$_r_AverageUnitCost:=$_r_SumCost/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; Round:C94($_r_AverageUnitCost; 2))
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
											$_l_SerialRow:=Find in array:C230($_at_SerialNumbers; "")
											If ($_l_SerialRow>0)
												DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_SerialRow)
											End if 
											If (Size of array:C274($_at_SerialNumbers)>1)
												APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "Various")
												
											Else 
												If (Size of array:C274($_at_SerialNumbers)>0)
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; $_at_SerialNumbers{1})
												Else 
													APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; "")
													
												End if 
											End if 
											
											
										Else 
											APPEND TO ARRAY:C911(ORDI_At_AllocLocationCodes; [STOCK_MOVEMENT_ITEMS:27]Location:7)
											APPEND TO ARRAY:C911(ORDI_al_AllocItemNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
											APPEND TO ARRAY:C911(ORDI_at_AllocOrderCodes; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
											APPEND TO ARRAY:C911(ORDI_at_AllocProductCodes; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
											APPEND TO ARRAY:C911(ORDI_ad_AllocExpectedDate; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
											APPEND TO ARRAY:C911(ORDI_at_AlocStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											APPEND TO ARRAY:C911(ORDI_ar_AllocResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
											APPEND TO ARRAY:C911(ORDI_ar_AllocStockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
											$_l_ArraySize:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
											INSERT IN ARRAY:C227(ORDI_al_AllocStockRecordIDS; $_l_ArraySize+1; 1)
											APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDS{$_l_ArraySize+1}; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											APPEND TO ARRAY:C911(ORDI_AT_AllocCURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
											APPEND TO ARRAY:C911(ORD_at_AllocSerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
										End if 
									End for 
								End for 
							End for 
						End for 
						ARRAY TEXT:C222(STK_at_DisProductNames; 0)
						ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
						If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProductNames)
							For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
								$_l_ProductRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_StockTypeIndex})
								If ($_l_ProductRow>0)
									APPEND TO ARRAY:C911(STK_at_DisProductNames; $_at_ProductNames{$_l_ProductRow})
								Else 
									APPEND TO ARRAY:C911(STK_at_DisProductNames; "")
								End if 
							End for 
							
						Else 
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=ORDI_at_AllocProductCodes{1})
							APPEND TO ARRAY:C911(STK_at_DisProductNames; [PRODUCTS:9]Product_Name:2)
						End if 
						QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
						SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_TypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_TypeNames)
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							$_l_TypeRow:=Find in array:C230($_at_TypeCodes; ORDI_at_AlocStockTypes{$_l_StockTypeIndex})
							If ($_l_TypeRow>0)
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_TypeNames{$_l_TypeRow})
							Else 
								APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
							End if 
							
						End for 
						$_at_SerialNumbers:=0
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
							If (ORD_at_AllocSerialNo{$_l_StockTypeIndex}#"")
								$_at_SerialNumbers:=1
								$_l_StockTypeIndex:=Size of array:C274(ORD_at_AllocSerialNo)
							End if 
							
						End for 
						LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_ad_AllocExpectedDate; ->ORDI_al_AllocItemNumbers; ->ORDI_at_AllocOrderCodes; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
						LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Expected Date"; "PO item number"; "Purchase Order"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
						LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 80; 80; 40; 100; 187*(Num:C11($_at_SerialNumbers)); 200*((STK_l_ShowLocations)); 0)
						
						LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
						LB_SetScroll(->STK_lb_Allocate; -3; -2)
						LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						$_l_ArraySize:=70+$_l_ObjectTop+$_l_LBSIze
						$_l_LBWidth:=7+187+88+200+60+80+80+40+100+(187*(Num:C11($_at_SerialNumbers)))+(200*((STK_l_ShowLocations)))
						
						
						
						If ($_l_ArraySize<250)
							If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
								$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
							Else 
								$_l_LBSIze:=(5*16)
							End if 
							$_l_ArraySize:=250
						End if 
						
						
						
						WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth+20)
						OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWidth+4; $_l_ObjectTop+$_l_LBSIze+4; *)
						OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWidth; $_l_ObjectTop+$_l_LBSIze; *)
						OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
						$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
						$_l_ObjectCentre:=Int:C8($_l_ObjectLeft+$_l_LBWidth)/2
						
						OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre)-$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10; ($_l_ObjectLeft+$_l_ObjectCentre)+$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10+$_l_ObjectHeight2; *)
						
						OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
						OBJECT SET VISIBLE:C603(STK_l_AllocateButton; True:C214)
						$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
						OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
						OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						$_l_ButtonTop:=$_l_ButtonTop+22+10
						OBJECT MOVE:C664(STK_l_AllocateButton; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						
						
						STL_l_CurrentFIlter:=3
					Else   //bsw 4/06/04
						Gen_Alert("Sorry there is no stock on order"; "OK")
						$_at_SerialNumbers:=0
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
							If (ORD_at_AllocSerialNo{$_l_StockTypeIndex}#"")
								$_at_SerialNumbers:=1
								$_l_StockTypeIndex:=Size of array:C274(ORD_at_AllocSerialNo)
							End if 
							
						End for 
						ARRAY LONGINT:C221(STK_al_LineIndex; 0)
						ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
						For ($_l_StockTypeIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
							STK_al_LineIndex{$_l_StockTypeIndex}:=$_l_StockTypeIndex
						End for 
						LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
						
						LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
						LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 40; 100; 187*(Num:C11($_at_SerialNumbers)); 200*((STK_l_ShowLocations)); 0)
						LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
						LB_SetScroll(->STK_lb_Allocate; -3; -2)
						LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
						
						If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
							$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
						Else 
							$_l_LBSIze:=(5*16)
						End if 
						$_l_ArraySize:=70+$_l_ObjectTop+$_l_LBSIze
						$_l_LBWidth:=7+187+88+200+60+40+100+(187*($_at_SerialNumbers))+(200*((STK_l_ShowLocations)))
						If ($_l_ArraySize<250)
							If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
								$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
							Else 
								$_l_LBSIze:=(5*16)
							End if 
							$_l_ArraySize:=250
						End if 
						
						
						WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth+20)
						OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWidth+4; $_l_ObjectTop+$_l_LBSIze+4; *)
						OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWidth; $_l_ObjectTop+$_l_LBSIze; *)
						OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
						$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
						$_l_ObjectCentre:=Int:C8($_l_ObjectLeft+$_l_LBWidth)/2
						
						OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre)-$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10; ($_l_ObjectLeft+$_l_ObjectCentre)+$_l_ObjectHalfWidth2; ($_l_ObjectTop+$_l_LBSIze)+10+$_l_ObjectHeight2; *)
						
						OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
						OBJECT SET VISIBLE:C603(STK_l_AllocateButton; True:C214)
						$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
						OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
						OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						$_l_ButtonTop:=$_l_ButtonTop+22+9
						OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT MOVE:C664(STK_l_AllocateButton; $_l_ObjectLeft+$_l_LBWidth-(10+$_l_ButtonWidth); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWidth-(10); $_l_ButtonTop+22; *)
						STL_l_CurrentFIlter:=1
						STK_at_FilterTypes:=1
					End if 
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oStockSettings"; $_t_oldMethodName)
