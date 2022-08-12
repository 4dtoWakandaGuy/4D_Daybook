If (False:C215)
	//Project Form Method Name: STK_AllocationWIndow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/12/2012 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_Allocate;0)
	//ARRAY DATE(ORDI_ad_AllocExpectedDate;0)
	ARRAY LONGINT:C221($_al_SelectedRowNumbers; 0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbers;0)
	//ARRAY LONGINT(ORDI_al_AllocItemNumbersMAS;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDSMAS;0;0)
	//ARRAY LONGINT(STK_al_OIallocateTo;0)
	//ARRAY LONGINT(STK_al_CSIDtoallocate;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineIndexMAS;0)
	//ARRAY LONGINT(STK_al_SRIDtoallocate;0)
	//ARRAY REAL(ORDI_ar_AllocResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocResStockQtyMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockPrice;0)
	//ARRAY REAL(ORDI_ar_AllocStockPriceMAS;0)
	//ARRAY REAL(ORDI_ar_AllocStockQty;0)
	//ARRAY REAL(ORDI_ar_AllocStockQtyMAS;0)
	//ARRAY REAL(STK_ar_CSQTYtoAllocate;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	ARRAY TEXT:C222($_at_PurchaseTypes; 0)
	ARRAY TEXT:C222($_at_StockTypeCodes; 0)
	ARRAY TEXT:C222($_at_StockTypeNames; 0)
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
	//ARRAY TEXT(STK_At_AllocatFrom;0)
	//ARRAY TEXT(STK_at_AllocationMoves;0)
	//ARRAY TEXT(STK_at_AllocationStockTypes;0)
	//ARRAY TEXT(STK_at_DisProductNames;0)
	//ARRAY TEXT(STK_at_DisProductNamesMAS;0)
	//ARRAY TEXT(STK_at_DisStockTypeNames;0)
	//ARRAY TEXT(STK_at_DisStockTypeNamesMAS;0)
	//ARRAY TEXT(STK_at_FilterTypes;0)
	//ARRAY TEXT(STK_at_LocationCodes;0)
	//ARRAY TEXT(STK_at_LocationNames;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Continue; $_bo_Exit; $_bo_NoCommit; DB_bo_NoLoad; STK_bo_AllocatedFromPO; STK_bo_DoAllocate; STK_bo_DoooAllocate; STK_bo_ShowAllocated; STK_bo_ShowFREE; STK_bo_ShowOnOrder)
	C_BOOLEAN:C305(STK_bo_SplitRemainder; STK_bo_unAllocate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_AllocationIndex; $_l_ButtonHeight; $_l_ButtonTop; $_l_Column; $_l_DefaultsIndex; $_l_event; $_l_Height; $_L_IDRow; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_ItemNumber; $_l_LBSIze; $_l_LBWIdth; $_l_Left; $_l_LineReference; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectCentre2; $_l_ObjectHalfWidth2; $_l_ObjectHeight2; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_ProductRow; $_l_RecordsinSelection; $_l_ResidualsIndex; $_l_Retries; $_l_Right; $_l_Row)
	C_LONGINT:C283($_l_RowNumber; $_l_RowsIndex; $_l_SerialNos; $_l_SIze; $_l_StockRecordIndex; $_l_StockRow; $_l_Width; icancel; iOK; STK_l_AllocateButton; STK_l_BUT1)
	C_LONGINT:C283(STK_l_But2; STK_l_BUT3; STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9; STK_l_CancelAllocations; STK_l_IncludeAllocated; STK_l_InitialPage)
	C_LONGINT:C283(STK_l_OrderItemNumber; STK_l_ShowLocations; STK_l_Unallocate; STL_l_CurrentFIlter)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285($_r_Remainder; $_r_Remaining; $_r_Sum; $_r_ToKeepFree; STK_R_QuantityRequired)
	C_TEXT:C284(<>ButtPress; $_t_oldMethodName; $_t_ProductCode; STK_t_COL1; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8)
	C_TEXT:C284(STK_t_COL9; STK_t_Company; STK_t_DefAllocationStockType; STK_t_HED1; STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8)
	C_TEXT:C284(STK_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM STK_AllocationWIndow"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_ButtonHeight:=22
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		STK_bo_SplitRemainder:=False:C215
		STK_t_Company:=""
		ARRAY LONGINT:C221(STK_al_CSIDtoallocate; 0)
		ARRAY REAL:C219(STK_ar_CSQTYtoAllocate; 0)
		ARRAY LONGINT:C221(STK_al_OIallocateTo; 0)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; STK_at_AllocationMoves; [MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationStockTypes; [MOVEMENT_TYPES:60]Stock_Minus:4; STK_At_AllocatFrom)
		If (Size of array:C274(STK_At_AllocatFrom)>0)
			STK_t_DefAllocationStockType:=STK_At_AllocatFrom{1}
		End if 
		
		ARRAY TEXT:C222(STK_at_FilterTypes; 0)
		If (STK_bo_ShowFREE)
			APPEND TO ARRAY:C911(STK_at_FilterTypes; "Free Stock")
		End if 
		If (STK_bo_ShowAllocated)
			APPEND TO ARRAY:C911(STK_at_FilterTypes; "Allocated Stock")
		End if 
		If (STK_bo_ShowOnOrder)
			APPEND TO ARRAY:C911(STK_at_FilterTypes; "On Order Stock")
		End if 
		STK_at_FilterTypes:=1
		
		// ◊StockAnal:=False
		//STK_at_DisStockTypeNames
		OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ButtonHeight:=22
		Case of 
			: (STK_l_InitialPage=1)
				ARRAY TEXT:C222(STK_at_DisProductNames; 0)
				ARRAY TEXT:C222(STK_at_DisStockTypeNames; 0)
				If (Size of array:C274(ORDI_at_AllocProductCodes)>0)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; ORDI_at_AllocProductCodes)
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProductNames)
					For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AllocProductCodes))
						$_l_ProductRow:=Find in array:C230($_at_ProductCodes; ORDI_at_AllocProductCodes{$_l_RowsIndex})
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
				SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_StockTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_StockTypeNames)
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					$_l_StockRow:=Find in array:C230($_at_StockTypeCodes; ORDI_at_AlocStockTypes{$_l_RowsIndex})
					If ($_l_StockRow>0)
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_StockTypeNames{$_l_StockRow})
					Else 
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
					End if 
					
				End for 
				STK_l_ShowLocations:=0
				QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; ORDI_At_AllocLocationCodes)
				SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Name:2; STK_at_LocationCodes; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames)
				SORT ARRAY:C229(STK_at_LocationNames; STK_at_LocationCodes)
				If (Size of array:C274(STK_at_LocationNames)=0)
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; True:C214)
					STK_l_ShowLocations:=0
				End if 
				
				//STK_at_DisProductNames
				ARRAY LONGINT:C221(STK_al_LineIndex; 0)
				ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					STK_al_LineIndex{$_l_RowsIndex}:=$_l_RowsIndex
				End for 
				$_l_SerialNos:=0
				For ($_l_RowsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
					If (ORD_at_AllocSerialNo{$_l_RowsIndex}#"")
						$_l_SerialNos:=1
						$_l_RowsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
					End if 
					
				End for 
				LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
				
				LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
				LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 40; 100; 187*(Num:C11($_l_SerialNos)); 200*((STK_l_ShowLocations)); 0)
				LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
				LB_SetScroll(->STK_lb_Allocate; -3; -2)
				LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
				
				If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
					$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
				Else 
					$_l_LBSIze:=(5*16)
				End if 
				$_l_SIze:=70+$_l_ObjectTop+$_l_LBSIze
				$_l_LBWIdth:=7+187+88+200+60+40+100+(187*(Num:C11($_l_SerialNos)))+(200*((STK_l_ShowLocations)))
				
				
				If ($_l_SIze<250)
					If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
						$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
					Else 
						$_l_LBSIze:=(5*16)
					End if 
					$_l_SIze:=250
				End if 
				
				OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
				
				WS_AutoscreenSize(2; $_l_SIze; $_l_LBWIdth+2)
				LBI_Scrollonresize(->STK_lb_Allocate)
				
				WS_AutoscreenSize(2; $_l_SIze; $_l_LBWIdth+20)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ButtonTop:=$_l_ObjectBottom+24
				$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWIdth+4; $_l_ObjectTop+$_l_Height+4; *)
				OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWIdth; $_l_ObjectTop+$_l_Height; *)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
				$_l_ObjectCentre2:=Int:C8($_l_ObjectLeft+$_l_LBWIdth)/2
				OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre2)-$_l_ObjectHalfWidth2; ($_l_ObjectBottom)+10; ($_l_ObjectLeft+$_l_ObjectCentre2)+$_l_ObjectHalfWidth2; ($_l_ObjectBottom)+10+$_l_ObjectHeight2; *)
				
				$_l_ButtonTop:=$_l_ObjectBottom+9
				OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_Width:=$_l_ObjectRight2-$_l_ObjectLeft2
				OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWIdth-(10+$_l_Width); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWIdth-(10); $_l_ButtonTop+22; *)
				$_l_ButtonTop:=$_l_ButtonTop+22+9
				OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT MOVE:C664(STK_l_AllocateButton; $_l_ObjectLeft+$_l_LBWIdth-(10+$_l_Width); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWIdth-(10); $_l_ButtonTop+22; *)
				
				STL_l_CurrentFIlter:=1
			: (STK_l_InitialPage=2)
				QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
				SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_StockTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_StockTypeNames)
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					$_l_StockRow:=Find in array:C230($_at_StockTypeCodes; ORDI_at_AlocStockTypes{$_l_RowsIndex})
					If ($_l_StockRow>0)
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_StockTypeNames{$_l_StockRow})
					Else 
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
					End if 
					
				End for 
				STK_l_ShowLocations:=0
				QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; ORDI_At_AllocLocationCodes)
				SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Name:2; STK_at_LocationCodes; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames)
				SORT ARRAY:C229(STK_at_LocationNames; STK_at_LocationCodes)
				If (Size of array:C274(STK_at_LocationNames)=0)
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; True:C214)
					STK_l_ShowLocations:=0
				End if 
				STK_l_ShowLocations:=0
				QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; ORDI_At_AllocLocationCodes)
				SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Name:2; STK_at_LocationCodes; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames)
				SORT ARRAY:C229(STK_at_LocationNames; STK_at_LocationCodes)
				If (Size of array:C274(STK_at_LocationNames)=0)
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; True:C214)
					STK_l_ShowLocations:=0
				End if 
				
				//STK_at_DisProductNames
				ARRAY LONGINT:C221(STK_al_LineIndex; 0)
				ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					STK_al_LineIndex{$_l_RowsIndex}:=$_l_RowsIndex
				End for 
				$_l_SerialNos:=0
				For ($_l_RowsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
					If (ORD_at_AllocSerialNo{$_l_RowsIndex}#"")
						$_l_SerialNos:=1
						$_l_RowsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
					End if 
					
				End for 
				
				LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_al_AllocItemNumbers; ->ORDI_at_AllocOrderCodes; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
				
				LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "SO item number"; "Order Code"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations"; "Line IDS")
				LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 80; 80; 40; 100; 187*(Num:C11($_l_SerialNos)); 200*((STK_l_ShowLocations)); 0)
				LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
				LB_SetScroll(->STK_lb_Allocate; -2; -2)
				LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
				If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
					$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
				Else 
					$_l_LBSIze:=(5*16)
				End if 
				$_l_SIze:=70+$_l_ObjectTop+$_l_LBSIze
				
				$_l_LBWIdth:=7+187+88+200+60+80+80+40+100+(187*(Num:C11($_l_SerialNos)))+(200*((STK_l_ShowLocations)))
				
				
				
				If ($_l_SIze<250)
					If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
						$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
					Else 
						$_l_LBSIze:=(5*16)
					End if 
					
					$_l_SIze:=250
				End if 
				
				
				
				WS_AutoscreenSize(2; $_l_SIze; $_l_LBWIdth+20)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
				
				OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWIdth+4; $_l_ObjectTop+$_l_Height+4; *)
				OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWIdth; $_l_ObjectTop+$_l_Height; *)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ButtonTop:=$_l_ObjectBottom+9
				
				OBJECT GET COORDINATES:C663(*; "oSTK_t_Company"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_ObjectHalfWidth2:=Int:C8($_l_ObjectRight2-$_l_ObjectLeft2)/2
				$_l_ObjectCentre2:=Int:C8($_l_ObjectLeft+$_l_LBWIdth)/2
				
				OBJECT MOVE:C664(*; "oSTK_t_Company"; ($_l_ObjectLeft+$_l_ObjectCentre2)-$_l_ObjectHalfWidth2; $_l_ButtonTop+10; ($_l_ObjectLeft+$_l_ObjectCentre2)+$_l_ObjectHalfWidth2; $_l_ButtonTop+10+$_l_ObjectHeight2; *)
				
				OBJECT SET VISIBLE:C603(STK_l_Unallocate; True:C214)
				OBJECT SET VISIBLE:C603(STK_l_AllocateButton; False:C215)
				//$_l_ButtonTop:=$_l_ObjectTop+$_l_LBSIze+9
				OBJECT GET COORDINATES:C663(STK_l_Unallocate; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_Width:=$_l_ObjectRight2-$_l_ObjectLeft2
				OBJECT MOVE:C664(STK_l_Unallocate; $_l_ObjectLeft+10; $_l_ButtonTop; $_l_ObjectLeft+10+$_l_Width; $_l_ButtonTop+22; *)
				OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_ObjectLeft+$_l_LBWIdth-(10+$_l_Width); $_l_ButtonTop; $_l_ObjectLeft+$_l_LBWIdth-(10); $_l_ButtonTop+22; *)
				
				
				
				STL_l_CurrentFIlter:=2
			: (STK_l_InitialPage=3)
				QUERY WITH ARRAY:C644([STOCK_TYPES:59]Type_Code:1; ORDI_at_AlocStockTypes)
				SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_StockTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_StockTypeNames)
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					$_l_StockRow:=Find in array:C230($_at_StockTypeCodes; ORDI_at_AlocStockTypes{$_l_RowsIndex})
					If ($_l_StockRow>0)
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; $_at_StockTypeNames{$_l_StockRow})
					Else 
						APPEND TO ARRAY:C911(STK_at_DisStockTypeNames; "")
					End if 
					
				End for 
				STK_l_ShowLocations:=0
				QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; ORDI_At_AllocLocationCodes)
				SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Name:2; STK_at_LocationCodes; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames)
				SORT ARRAY:C229(STK_at_LocationNames; STK_at_LocationCodes)
				If (Size of array:C274(STK_at_LocationNames)=0)
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; True:C214)
					STK_l_ShowLocations:=0
				End if 
				STK_l_ShowLocations:=0
				QUERY WITH ARRAY:C644([LOCATIONS:61]Location_Code:1; ORDI_At_AllocLocationCodes)
				SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Name:2; STK_at_LocationCodes; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames)
				SORT ARRAY:C229(STK_at_LocationNames; STK_at_LocationCodes)
				If (Size of array:C274(STK_at_LocationNames)=0)
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oStockLocation@"; True:C214)
					STK_l_ShowLocations:=0
				End if 
				
				//STK_at_DisProductNames
				ARRAY LONGINT:C221(STK_al_LineIndex; 0)
				ARRAY LONGINT:C221(STK_al_LineIndex; Size of array:C274(ORDI_at_AlocStockTypes))
				For ($_l_RowsIndex; 1; Size of array:C274(ORDI_at_AlocStockTypes))
					STK_al_LineIndex{$_l_RowsIndex}:=$_l_RowsIndex
				End for 
				$_l_SerialNos:=0
				For ($_l_RowsIndex; 1; Size of array:C274(ORD_at_AllocSerialNo))
					If (ORD_at_AllocSerialNo{$_l_RowsIndex}#"")
						$_l_SerialNos:=1
						$_l_RowsIndex:=Size of array:C274(ORD_at_AllocSerialNo)
					End if 
					
				End for 
				LB_SetupListbox(->STK_lb_Allocate; "STK_t"; "STK_L"; 1; ->ORDI_at_AlocStockTypes; ->STK_at_DisStockTypeNames; ->ORDI_at_AllocProductCodes; ->STK_at_DisProductNames; ->ORDI_ar_AllocResidualStockQty; ->ORDI_ad_AllocExpectedDate; ->ORDI_al_AllocItemNumbers; ->ORDI_at_AllocOrderCodes; ->ORDI_AT_AllocCURRENCY; ->ORDI_ar_AllocStockPrice; ->ORD_at_AllocSerialNo; ->ORDI_At_AllocLocationCodes; ->STK_al_LineIndex)
				LB_SetColumnHeaders(->STK_lb_Allocate; "STK_L"; 1; "Type"; "Name"; "Product"; "Name"; "Quantity"; "Expected Date"; "PO item number"; "Purchase Order"; "Currency"; "Cost Price"; "Serial Numbers"; "Locations")
				LB_SetColumnWidths(->STK_lb_Allocate; "STK_t"; 1; 87; 187; 88; 200; 60; 80; 80; 40; 100; 187*(Num:C11($_l_SerialNos)); 200*((STK_l_ShowLocations)); 0)
				
				LB_SetEnterable(->STK_lb_Allocate; False:C215; 0)
				LB_SetScroll(->STK_lb_Allocate; -3; -2)
				LB_StyleSettings(->STK_lb_Allocate; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
				If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
					$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
				Else 
					$_l_LBSIze:=(5*16)
				End if 
				$_l_SIze:=70+$_l_ObjectTop+$_l_LBSIze
				
				$_l_LBWIdth:=7+187+88+200+60+80+80+40+100+(187*(Num:C11($_l_SerialNos)))+(200*((STK_l_ShowLocations)))
				
				
				
				If ($_l_SIze<250)
					If (Size of array:C274(ORDI_at_AlocStockTypes)>=5)
						$_l_LBSIze:=(Size of array:C274(ORDI_at_AlocStockTypes)*16)
					Else 
						$_l_LBSIze:=(5*16)
					End if 
					
					$_l_SIze:=250
				End if 
				
				
				
				WS_AutoscreenSize(2; $_l_SIze; $_l_LBWIdth+20)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(STK_at_FilterTypes; $_l_ObjectLeft-4; $_l_ObjectTop-27; $_l_ObjectLeft+$_l_LBWIdth+4; $_l_ObjectTop+$_l_Height+4; *)
				$_l_Left:=$_l_ObjectLeft
				$_l_Right:=$_l_ObjectLeft+$_l_LBWIdth+4
				OBJECT MOVE:C664(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_LBWIdth; $_l_ObjectTop+$_l_Height; *)
				OBJECT GET COORDINATES:C663(STK_lb_Allocate; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT SET VISIBLE:C603(STK_l_Unallocate; False:C215)
				$_l_ButtonTop:=$_l_ObjectTop+$_l_Height+9
				OBJECT SET VISIBLE:C603(STK_l_AllocateButton; True:C214)
				OBJECT GET COORDINATES:C663(STK_l_AllocateButton; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				
				$_l_Width:=$_l_ObjectRight2-$_l_ObjectLeft2
				OBJECT MOVE:C664(STK_l_AllocateButton; ($_l_Right-10)-$_l_Width; $_l_ButtonTop; $_l_Right-10; $_l_ButtonTop+22; *)
				OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT MOVE:C664(STK_l_CancelAllocations; $_l_Left; $_l_ButtonTop; $_l_Left+$_l_Width; $_l_ButtonTop+22; *)
				
				
				STL_l_CurrentFIlter:=3
		End case 
		//The Following COpy of these arrays is made so we can swap selections
		COPY ARRAY:C226(ORDI_at_AlocStockTypes; ORDI_at_AlocStockTypesMAS)
		COPY ARRAY:C226(STK_at_DisStockTypeNames; STK_at_DisStockTypeNamesMAS)
		COPY ARRAY:C226(ORDI_at_AllocProductCodes; ORDI_at_AllocProductCodesMAS)
		COPY ARRAY:C226(STK_at_DisProductNames; STK_at_DisProductNamesMAS)
		COPY ARRAY:C226(ORDI_ar_AllocStockQty; ORDI_ar_AllocStockQtyMAS)
		COPY ARRAY:C226(ORDI_AT_AllocCURRENCY; ORDI_AT_AllocCURRENCYMAS)
		COPY ARRAY:C226(ORDI_ar_AllocStockPrice; ORDI_ar_AllocStockPriceMAS)
		COPY ARRAY:C226(ORD_at_AllocSerialNo; ORD_at_AllocSerialNoMAS)
		COPY ARRAY:C226(ORDI_At_AllocLocationCodes; ORDI_At_AllocLocationCodesMAS)
		COPY ARRAY:C226(ORDI_ar_AllocResidualStockQty; ORDI_ar_AllocResStockQtyMAS)
		COPY ARRAY:C226(STK_al_LineIndex; STK_al_LineIndexMAS)
		COPY ARRAY:C226(ORDI_al_AllocItemNumbers; ORDI_al_AllocItemNumbersMAS)
		ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDSMAS; 0; 0)
		$_l_SIze:=Size of array:C274(ORDI_al_AllocStockRecordIDS)
		ARRAY LONGINT:C221(ORDI_al_AllocStockRecordIDSMAS; $_l_SIze; 0)
		For ($_l_Index; 1; $_l_SIze)
			For ($_l_Index2; 1; Size of array:C274(ORDI_al_AllocStockRecordIDS{$_l_Index}))
				APPEND TO ARRAY:C911(ORDI_al_AllocStockRecordIDSMAS{$_l_Index}; ORDI_al_AllocStockRecordIDS{$_l_Index}{$_l_Index2})
				
			End for 
		End for 
		
		
	: ($_l_event=On Clicked:K2:4)
		
		$_ptr_FocusObject:=Focus object:C278
	: ($_l_event=On Outside Call:K2:11)
		
		Case of 
			: (icancel=1)
				STK_bo_DoAllocate:=False:C215
				STK_bo_unAllocate:=False:C215
				
				CANCEL:C270
			: (iOK=1)
				
				Case of 
					: ($_l_event=On Clicked:K2:4)
						
						If (STK_at_FilterTypes{STK_at_FilterTypes}="Free Stock")
							LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
							ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
							If ($_l_Row>0)
								ARRAY LONGINT:C221(STK_al_SRIDtoallocate; 0)
								ARRAY LONGINT:C221($_al_SelectedRowNumbers; 0)
								LB_GetSelect(->STK_lb_Allocate; ->$_al_SelectedRowNumbers)
								$_bo_Exit:=False:C215
								For ($_l_DefaultsIndex; 1; 2)  //run through the selected twic-first only use the default-clear the row number so we dont do it a second time
									
									For ($_l_RowsIndex; 1; Size of array:C274($_al_SelectedRowNumbers))
										$_l_RowNumber:=$_al_SelectedRowNumbers{$_l_RowsIndex}
										If ($_l_DefaultsIndex=1)
											//If (STK_at_DisStockTypes{$_l_RowNumber}=STK_t_DefAllocationStockType)
											$_bo_Continue:=True:C214
											//Else
											//$_bo_Continue:=False
											//End if
										Else 
											//second pass
											$_bo_Continue:=True:C214
										End if 
										If (ORDI_al_AllocItemNumbers{$_l_RowsIndex}=0)  //absolute prevention...
											
											
											If ($_bo_Continue)  // the following line will change to itterate the array of products..
												
												Case of 
													: (STK_R_QuantityRequired>0)
														//we dont need to know this..
														$_l_LineReference:=STK_al_LineIndex{$_l_RowsIndex}
														For ($_l_StockRecordIndex; 1; Size of array:C274(ORDI_al_AllocStockRecordIDS{$_l_LineReference}))
															$_L_IDRow:=Find in array:C230(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{$_l_LineReference}{$_l_StockRecordIndex})
															If ($_L_IDRow<0)
																APPEND TO ARRAY:C911(STK_al_SRIDtoallocate; ORDI_al_AllocStockRecordIDS{$_l_LineReference}{$_l_StockRecordIndex})
															End if 
														End for 
														
														//there are enought to allocate-make sure you adjust quantity required after allocating
														ARRAY LONGINT:C221(STK_al_CSIDtoallocate; 0)
														//ARRAY REAL(STK_ar_CSQTYtoAllocate;0)
														//ARRAY LONGINT(STK_al_OIallocateTo;0)
														If (ORDI_ar_AllocResidualStockQty{$_l_RowsIndex}>0)
															If (STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_RowsIndex}>STK_R_QuantityRequired)
																STK_R_QuantityRequired:=0
															Else 
																STK_R_QuantityRequired:=STK_R_QuantityRequired-ORDI_ar_AllocResidualStockQty{$_l_RowsIndex}
															End if 
															ORDI_ar_AllocResidualStockQty{$_l_RowsIndex}:=0
															ORDI_ar_AllocResStockQtyMAS{$_l_RowsIndex}:=0
														End if 
												End case 
												If (STK_R_QuantityRequired<=0)
													$_bo_Exit:=True:C214
													$_l_DefaultsIndex:=99999
												Else 
													$_r_Remaining:=0
													For ($_l_ResidualsIndex; 1; Size of array:C274(ORDI_ar_AllocResidualStockQty))
														$_r_Remaining:=$_r_Remaining+ORDI_ar_AllocResidualStockQty{$_l_ResidualsIndex}
													End for 
													If ($_r_Remaining>0)
														$_l_DefaultsIndex:=2
														Gen_Confirm("You have not allocated sufficient stock. . Do you wish to remain in this screen to allocate additional stock?"; "Yes"; "No")
														If (OK=0)
															$_bo_Exit:=True:C214
														Else 
															$_bo_Exit:=False:C215
														End if 
														OK:=1
													Else 
														$_l_DefaultsIndex:=2
														$_bo_Exit:=True:C214
														Gen_Alert("Additional Stock needs to be allocated. However thiere is no additional free stock"; "Continue")
														
													End if 
													
													
												End if 
											End if 
										End if 
									End for 
								End for 
								If ($_bo_Exit)
									STK_bo_DoAllocate:=True:C214
									CANCEL:C270
								End if 
							End if 
						Else 
							//allocate from on order
							If (STK_R_QuantityRequired>0)
								LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
								If ($_l_Row>0)
									//Gen_Confirm ("Are you sure you want to reserve on order stock for this order?";"Yes";"No")
									If (OK=1)
										READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
										
										$_l_ItemNumber:=ORDI_al_AllocItemNumbers{$_l_Row}
										$_t_ProductCode:=ORDI_at_AllocProductCodes{$_l_Row}
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
										SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_PurchaseTypes)
										
										//```
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=$_l_ItemNumber; *)
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
										QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)  // not already allocated to order items
										
										QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_PurchaseTypes)
										$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
										If ($_r_Sum>STK_R_QuantityRequired)
											$_r_Sum:=STK_R_QuantityRequired
										End if 
										If ($_r_Sum>0)
											$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
											COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$temp")
											
											For ($_l_AllocationIndex; 1; $_l_RecordsinSelection)
												If (STK_R_QuantityRequired>0)
													USE NAMED SELECTION:C332("$temp")
													GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocationIndex)
													
													$_r_ToKeepFree:=0
													If ($_r_Sum>0)
														//so if the quantity=1000 we have received 700 and we want 400 $_r_Sum=300
														//f we simple say is quantity > $_r_Sum then the answer is yes and we would keep 1000-300
														//but to make sure the already called off quantity is always retained then i have added this
														//the residual quantity is less than the original quantity..ie we have called some off(Received cancelled etc)
														//we must keep the called off quantity so in the above example 300 if that remainder is greater than the quantity we require we must ALSO keep that quantity
														
														If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
															//The $_r_Sum is no greater than the residual.
															//we have to keep the called off quantityIf ([STOCK ITEMS]XResidualStockQuantity<$_r_Sum)
															//if some have been received have to k
															$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															$_r_Remainder:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_ToKeepFree
															If ($_r_Remainder>$_r_Sum)
																$_r_ToKeepFree:=$_r_ToKeepFree+($_r_Remainder-$_r_Sum)
															End if 
														Else 
															If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_r_Sum)
																$_r_ToKeepFree:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_Sum
															End if 
														End if 
														
														If ($_r_ToKeepFree>0)
															//START TRANSACTION
															StartTransaction
															$_bo_NoCommit:=False:C215
															//Gen_Alert ("Stock item ("+String([STOCK ITEMS]x_ID)+") current quantity is "+String([STOCK ITEMS]Quantity)+"Should retain "+String($_r_ToKeepFree)+" and create an item with "+String($_r_Sum))
															
															STK_ItemDuplicate
															[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
															STK_SetCreatedStockItem(0; ($_r_Sum); 0; 0; STK_l_OrderItemNumber)
															STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_Sum
															$_r_Sum:=$_r_Sum-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															//Gen_Alert ("Item ("+String([STOCK ITEMS]x_ID)+" ) has been created related to the order tiem")
															
															USE NAMED SELECTION:C332("$temp")
															GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AllocationIndex)
															//Gen_Alert ("Returned to stock item ("+String([STOCK ITEMS]x_ID)+" ) to change quantity to "+String($_r_ToKeepFree))
															$_l_Retries:=0
															While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<1000)
																If ($_l_Retries>10)
																	Gen_Confirm("The stock item for PO movement"+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" for product "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" is locked, Continue trying to allocate?"; "Yes"; "No")
																	If (OK=0)
																		$_l_Retries:=10001
																		$_bo_NoCommit:=True:C214
																	Else 
																		$_l_Retries:=1
																		DelayTicks(60*$_l_Retries)
																	End if 
																Else 
																	$_l_Retries:=$_l_Retries+1
																	DelayTicks(60*$_l_Retries)
																End if 
															End while 
															
															[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_ToKeepFree
															[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															//TRACE
															[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
															
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															// December 2014 this is a place we should validate the called off quantity on that item because we changed the quantity of the item.
															
															STK_bo_AllocatedFromPO:=True:C214
															If (Not:C34($_bo_NoCommit))
																//VALIDATE TRANSACTION
																Transact_End(True:C214)
															Else 
																//CANCEL TRANSACTION
																Transact_End(False:C215)
															End if 
															
														Else 
															
															[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=STK_l_OrderItemNumber
															[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=STK_l_OrderItemNumber
															STK_R_QuantityRequired:=STK_R_QuantityRequired-$_r_Sum
															$_r_Sum:=$_r_Sum-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
															STK_bo_AllocatedFromPO:=True:C214
															DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
															
														End if 
														
													End if 
												End if 
											End for 
											If (STK_R_QuantityRequired=0)
												CANCEL:C270
												STK_bo_DoooAllocate:=True:C214
											End if 
											
										End if 
										
									End if 
									
									
								End if 
								
							End if 
							
						End if 
						
					Else 
						If (STK_t_DefAllocationStockType#"")
						End if 
						
				End case 
				
				
				
		End case 
		icancel:=0
		<>ButtPress:=""
		<>SYS_l_CancelProcess:=0
		iOK:=0
	: ($_l_event=On Resize:K2:27)
		
		If (STK_l_InitialPage=2)
			OBJECT GET COORDINATES:C663(STK_l_CancelAllocations; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(STK_l_Unallocate; 12; $_l_ObjectTop2; 170; $_l_ObjectBottom2; *)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM STK_AllocationWIndow"; $_t_oldMethodName)
