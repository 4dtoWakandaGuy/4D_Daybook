//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2010 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OI_lb_Subs;0)
	//ARRAY BOOLEAN(ORD_lb_Allocations;0)
	ARRAY DATE:C224($_ad_PODeliveryDates; 0)
	//ARRAY DATE(OI_ad_SubsActionDate;0)
	//ARRAY DATE(OI_ad_SubsActioned;0)
	//ARRAY DATE(ORD_AD_PODATE;0)
	ARRAY LONGINT:C221($_al_MovementFunctionsOrders; 0)
	//ARRAY LONGINT(OI_al_SubsID;0)
	//ARRAY LONGINT(ORD_al_StockNo;0)
	ARRAY REAL:C219($_ar_TotalCosts; 0)
	ARRAY REAL:C219($_ar_UnitCosts; 0)
	ARRAY REAL:C219($_ar_UnitQuantities; 0)
	//ARRAY REAL(ORDI_ar_ResidualStockQty;0)
	//ARRAY REAL(ORDI_ar_StockPrice;0)
	//ARRAY REAL(ORDI_ar_StockQty;0)
	ARRAY TEXT:C222($_at_MovementTypes; 0)
	ARRAY TEXT:C222($_at_OrderDeliveryReference; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	//ARRAY TEXT(OI_at_OrderItemsSubTypes;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(OI_at_SubsActionType;0)
	//ARRAY TEXT(ORD_AT_PONUMBER;0)
	//ARRAY TEXT(ORD_at_SerialNo;0)
	//ARRAY TEXT(ORDER_AT_DELIVERYREF;0)
	//ARRAY TEXT(ORDER_AT_StockNote;0)
	//ARRAY TEXT(ORDI_AT_CURRENCY;0)
	//ARRAY TEXT(ORDI_at_StockTypes;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_ShowSerial; ORDI_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_CusDelWidth; $_l_DeliveryRow; $_l_FurtherFieldsExist; $_l_Index; $_l_MovementItemRecords; $_l_MovementTypeRow; $_l_NewLeft; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_PODelRefWidth; $_l_PONumberWidth; $_l_PoRow; $_l_ProductType; $_l_SerialNumberRow; $_l_SerialWidth; $_l_StockNoWidth; $_l_TabPosition; $_l_TextLength; $_l_TotalsIndex; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; ALOa_l_BUT1; ALOa_l_BUT2; ALOa_l_BUT3; ALOa_l_BUT5; ALOa_l_BUT6; ALOa_l_BUT7; ALOa_l_BUT8)
	C_LONGINT:C283(ALOa_l_BUT9; ALODa_l_BUT4; OI_l_OrderItemClass; OI_l_SubsMail; OI_l_SubsRenew; OIS_l_BUT1; OIS_l_But2; OIS_l_BUT3; OIS_l_BUT4; OIS_l_BUT5; OIS_l_BUT6)
	C_LONGINT:C283(OIS_l_BUT7; OIS_l_BUT8; OIS_l_BUT9; ORDI_at_ViewTabsLabelsOLD; ORDI_l_FurtherFieldsMod; ORDI_l_Textlength)
	C_REAL:C285($_r_AverageUnitCost; $_r_SumCosts)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; oAloc_COL1; oAloc_COL2; oAloc_COL3; oAloc_COL4; oAloc_COL5)
	C_TEXT:C284(oAloc_COL6; oAloc_COL7; oAloc_COL8; oAloc_COL9; oAloc_HED1; oAloc_HED2; oAloc_HED3; oAloc_HED4; oAloc_HED5; oAloc_HED6; oAloc_HED7)
	C_TEXT:C284(oAloc_HED8; oAloc_HED9; OIS_t_COL1; OIS_t_COL2; OIS_t_COL3; OIS_t_COL4; OIS_t_COL5; OIS_t_COL6; OIS_t_COL7; OIS_t_COL8; OIS_t_COL9)
	C_TEXT:C284(OIS_t_HED1; OIS_t_HED2; OIS_t_HED3; OIS_t_HED4; OIS_t_HED5; OIS_t_HED6; OIS_t_HED7; OIS_t_HED8; OIS_t_HED9; SYS_t_AccessType; vButtDisOI)
	C_TEXT:C284(vCompNameA; vTelA; vTitle3; vVATTitleF)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_InLPB")
//OrderI_InLPB
ARRAY TEXT:C222(ORDI_at_StockTypes; 0)
ARRAY REAL:C219(ORDI_ar_StockQty; 0)
ARRAY REAL:C219(ORDI_ar_StockPrice; 0)
ARRAY LONGINT:C221(ORD_al_StockNo; 0)
ARRAY TEXT:C222(ORD_at_SerialNo; 0)
If (SYS_t_AccessType#"Q") | (True:C214)
	RELATE ONE:C42([ORDER_ITEMS:25]Supplier_Code:20)
	vCompNameA:=[COMPANIES:2]Company_Name:2
	vTelA:=[COMPANIES:2]Telephone:9
	If ([COMPANIES:2]Country:8#"")
		If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
			QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
			COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
		End if 
	Else 
		COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
	End if 
	If (COM_t_TelephoneNumberFormat#"")
		OBJECT SET FORMAT:C236(vTelA; COM_t_TelephoneNumberFormat)
		
	End if 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$STOCKITEMS")
	
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_MovementTypes)
	ARRAY LONGINT:C221($_al_MovementFunctionsOrders; 0)
	ARRAY LONGINT:C221($_al_MovementFunctionsOrders; Size of array:C274($_at_MovementTypes))
	
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		For ($_l_Index; 1; Records in selection:C76([MOVEMENT_TYPES:60]))
			$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
			If ($_l_MovementTypeRow>0)
				$_al_MovementFunctionsOrders{$_l_MovementTypeRow}:=1
			End if 
			NEXT RECORD:C51([MOVEMENT_TYPES:60])
		End for 
	End if 
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		For ($_l_Index; 1; Records in selection:C76([MOVEMENT_TYPES:60]))
			$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
			If ($_l_MovementTypeRow>0)
				$_al_MovementFunctionsOrders{$_l_MovementTypeRow}:=2
			End if 
			NEXT RECORD:C51([MOVEMENT_TYPES:60])
		End for 
	End if 
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		For ($_l_Index; 1; Records in selection:C76([MOVEMENT_TYPES:60]))
			$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
			If ($_l_MovementTypeRow>0)
				$_al_MovementFunctionsOrders{$_l_MovementTypeRow}:=3
			End if 
			NEXT RECORD:C51([MOVEMENT_TYPES:60])
		End for 
	End if 
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		For ($_l_Index; 1; Records in selection:C76([MOVEMENT_TYPES:60]))
			$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
			If ($_l_MovementTypeRow>0)
				$_al_MovementFunctionsOrders{$_l_MovementTypeRow}:=4
			End if 
			NEXT RECORD:C51([MOVEMENT_TYPES:60])
		End for 
	End if 
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		For ($_l_Index; 1; Records in selection:C76([MOVEMENT_TYPES:60]))
			$_l_MovementTypeRow:=Find in array:C230($_at_MovementTypes; [MOVEMENT_TYPES:60]Type_Code:1)
			If ($_l_MovementTypeRow>0)
				$_al_MovementFunctionsOrders{$_l_MovementTypeRow}:=5
			End if 
			NEXT RECORD:C51([MOVEMENT_TYPES:60])
		End for 
	End if 
	For ($_l_Index; 1; Size of array:C274($_at_MovementTypes))
		If ($_al_MovementFunctionsOrders{$_l_Index}=0)
			$_al_MovementFunctionsOrders{$_l_Index}:=6
		End if 
		
	End for 
	SORT ARRAY:C229($_al_MovementFunctionsOrders; $_at_MovementTypes)
	ARRAY TEXT:C222(ORDI_at_StockTypes; 0)
	ARRAY REAL:C219(ORDI_ar_StockQty; 0)
	ARRAY REAL:C219(ORDI_ar_ResidualStockQty; 0)
	ARRAY REAL:C219(ORDI_ar_StockPrice; 0)
	ARRAY TEXT:C222(ORDI_AT_CURRENCY; 0)
	ARRAY LONGINT:C221(ORD_al_StockNo; 0)
	ARRAY TEXT:C222(ORD_at_SerialNo; 0)
	ARRAY TEXT:C222(ORD_AT_PONUMBER; 0)
	ARRAY DATE:C224(ORD_AD_PODATE; 0)
	ARRAY TEXT:C222(ORDER_AT_DELIVERYREF; 0)  //OUTGOING DELIVERY REFERENCE
	ARRAY TEXT:C222(ORDER_AT_StockNote; 0)
	//TRACE//If (False)  //this should not be needed-December 2014
	For ($_l_Index; 1; Size of array:C274($_at_MovementTypes))
		USE NAMED SELECTION:C332("$STOCKITEMS")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=$_at_MovementTypes{$_l_Index})
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Allocated")
		$_l_MovementItemRecords:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		//For ($Check;1;$_l_MovementItemRecords)
		//USE NAMED SELECTION("$Allocated")
		//GOTO SELECTED RECORD([STOCK_MOVEMENT_ITEMS];$Check)
		//STK_UpdateCalledOffQuantity
		//SAVE RECORD([STOCK_MOVEMENT_ITEMS])
		
		//STK_MenuUpdate ("Stock items";[STOCK ITEMS]Product Code;True)
		//End for
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
			APPEND TO ARRAY:C911(ORDI_at_StockTypes; $_at_MovementTypes{$_l_Index})
			APPEND TO ARRAY:C911(ORDI_ar_StockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
			APPEND TO ARRAY:C911(ORDI_ar_ResidualStockQty; Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_UnitCosts; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_UnitQuantities)
			ARRAY REAL:C219($_ar_TotalCosts; 0)
			ARRAY REAL:C219($_ar_TotalCosts; Size of array:C274($_ar_UnitQuantities))
			$_r_SumCosts:=0
			For ($_l_TotalsIndex; 1; Size of array:C274($_ar_UnitQuantities))
				$_ar_TotalCosts{$_l_TotalsIndex}:=$_ar_UnitQuantities{$_l_TotalsIndex}*$_ar_UnitCosts{$_l_TotalsIndex}
				$_r_SumCosts:=$_r_SumCosts+$_ar_TotalCosts{$_l_TotalsIndex}
			End for 
			$_r_AverageUnitCost:=$_r_SumCosts/(Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
			
			APPEND TO ARRAY:C911(ORDI_ar_StockPrice; Round:C94($_r_AverageUnitCost; 2))
			
			APPEND TO ARRAY:C911(ORD_al_StockNo; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9)
			APPEND TO ARRAY:C911(ORDI_AT_CURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
			$_l_SerialNumberRow:=Find in array:C230($_at_SerialNumbers; "")
			If ($_l_SerialNumberRow>0)
				DELETE FROM ARRAY:C228($_at_SerialNumbers; $_l_SerialNumberRow)
			End if 
			If (Size of array:C274($_at_SerialNumbers)>1)
				APPEND TO ARRAY:C911(ORD_at_SerialNo; "Multiple")
				
			Else 
				If (Size of array:C274($_at_SerialNumbers)>0)
					APPEND TO ARRAY:C911(ORD_at_SerialNo; $_at_SerialNumbers{1})
				Else 
					APPEND TO ARRAY:C911(ORD_at_SerialNo; "")
					
				End if 
			End if 
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; $_ad_PODeliveryDates)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_PONumbers)
			$_l_PoRow:=Find in array:C230($_at_PONumbers; "")
			If ($_l_PoRow>0)
				DELETE FROM ARRAY:C228($_at_PONumbers; $_l_PoRow)
			End if 
			If (Size of array:C274($_at_PONumbers)>1)
				APPEND TO ARRAY:C911(ORD_AT_PONUMBER; "Multiple")
				
			Else 
				If (Size of array:C274($_at_PONumbers)>0)
					APPEND TO ARRAY:C911(ORD_AT_PONUMBER; $_at_PONumbers{1})
				Else 
					APPEND TO ARRAY:C911(ORD_AT_PONUMBER; "")
					
				End if 
			End if 
			
			$_l_PoRow:=Find in array:C230($_ad_PODeliveryDates; !00-00-00!)
			If ($_l_PoRow>0)
				DELETE FROM ARRAY:C228($_ad_PODeliveryDates; $_l_PoRow)
			End if 
			If (Size of array:C274($_ad_PODeliveryDates)>1)
				APPEND TO ARRAY:C911(ORD_AD_PODATE; !00-00-00!)
			Else 
				If (Size of array:C274($_ad_PODeliveryDates)>0)
					APPEND TO ARRAY:C911(ORD_AD_PODATE; $_ad_PODeliveryDates{1})
				Else 
					APPEND TO ARRAY:C911(ORD_AD_PODATE; !00-00-00!)
					
					
				End if 
			End if 
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45; $_at_OrderDeliveryReference)
			$_l_DeliveryRow:=Find in array:C230($_at_OrderDeliveryReference; "")
			If ($_l_DeliveryRow>0)
				DELETE FROM ARRAY:C228($_at_OrderDeliveryReference; $_l_DeliveryRow)
			End if 
			If (Size of array:C274($_at_OrderDeliveryReference)>1)
				APPEND TO ARRAY:C911(ORDER_AT_DELIVERYREF; "")
			Else 
				If (Size of array:C274($_at_OrderDeliveryReference)>0)
					APPEND TO ARRAY:C911(ORDER_AT_DELIVERYREF; $_at_OrderDeliveryReference{1})
				Else 
					APPEND TO ARRAY:C911(ORDER_AT_DELIVERYREF; "")
					
					
					
				End if 
			End if 
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			Case of 
				: ([MOVEMENT_TYPES:60]Unalloc_Type:13)
					APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Unallocation")
				: ([MOVEMENT_TYPES:60]Alloc_Type:10)
					If ([ORDER_ITEMS:25]Quantity:3-(ORDI_ar_StockQty{Size of array:C274(ORDI_ar_StockQty)})>0)
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Leaving "+String:C10([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)+"to be allocated")
						
						
						
					Else 
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Full allocation")
						
					End if 
				: ([MOVEMENT_TYPES:60]Delivery_Type:12)
					If ([ORDER_ITEMS:25]Quantity:3-(ORDI_ar_StockQty{Size of array:C274(ORDI_ar_StockQty)})>0)
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Leaving "+String:C10([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)+"to be delivered")
					Else 
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Fully Delivered")
					End if 
				Else 
					APPEND TO ARRAY:C911(ORDER_AT_StockNote; "")
			End case 
		Else 
			APPEND TO ARRAY:C911(ORDI_at_StockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			APPEND TO ARRAY:C911(ORDI_ar_StockQty; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			APPEND TO ARRAY:C911(ORDI_ar_ResidualStockQty; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
			APPEND TO ARRAY:C911(ORDI_ar_StockPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
			APPEND TO ARRAY:C911(ORD_al_StockNo; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9)
			APPEND TO ARRAY:C911(ORDI_AT_CURRENCY; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
			APPEND TO ARRAY:C911(ORD_at_SerialNo; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
			APPEND TO ARRAY:C911(ORD_AT_PONUMBER; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
			APPEND TO ARRAY:C911(ORD_AD_PODATE; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
			APPEND TO ARRAY:C911(ORDER_AT_DELIVERYREF; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			Case of 
				: ([MOVEMENT_TYPES:60]Unalloc_Type:13)
					APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Unallocation")
				: ([MOVEMENT_TYPES:60]Alloc_Type:10)
					If (([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>0)
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Leaving "+String:C10([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)+"to be allocated")
						
						
						
					Else 
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Full allocation")
						
					End if 
				: ([MOVEMENT_TYPES:60]Delivery_Type:12)
					If (([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)>0)
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Leaving "+String:C10([ORDER_ITEMS:25]Quantity:3-[STOCK_MOVEMENT_ITEMS:27]Quantity:12)+"to be delivered")
					Else 
						APPEND TO ARRAY:C911(ORDER_AT_StockNote; "Fully Delivered")
					End if 
				Else 
					APPEND TO ARRAY:C911(ORDER_AT_StockNote; "")
			End case 
			
			
		End if 
	End for 
	//End if
	
End if 
$_bo_ShowSerial:=False:C215
For ($_l_Index; 1; Size of array:C274(ORD_at_SerialNo))
	If (ORD_at_SerialNo{$_l_Index}#"")
		$_bo_ShowSerial:=True:C214
	End if 
End for 

LB_SetupListbox(->ORD_lb_Allocations; "oAloc"; "ORDa_L"; 1; ->ORD_at_SerialNo; ->ORDI_at_StockTypes; ->ORDI_ar_StockQty; ->ORDI_AT_CURRENCY; ->ORDI_ar_StockPrice; ->ORD_AT_PONUMBER; ->ORD_AD_PODATE; ->ORDER_AT_DELIVERYREF; ->ORD_al_StockNo; ->ORDER_AT_StockNote)
LB_SetColumnHeaders(->ORD_lb_Allocations; "ORDa_L"; 1; "Seral Nos"; "Type"; "Qty"; "Currency"; "Price"; "Purchase Ord No"; "Expected Date"; "Cust Deliv Ref"; "Stock No"; "Notes")

$_l_PONumberWidth:=0
$_l_PODelRefWidth:=0
$_l_SerialWidth:=0
$_l_CusDelWidth:=0
$_l_StockNoWidth:=0
For ($_l_Index; 1; Size of array:C274(ORD_AT_PONUMBER))
	If (ORD_AT_PONUMBER{$_l_Index}#"")
		$_l_PONumberWidth:=80
		$_l_Index:=Size of array:C274(ORD_AT_PONUMBER)
	End if 
End for 
For ($_l_Index; 1; Size of array:C274(ORD_AD_PODATE))
	If (ORD_AD_PODATE{$_l_Index}#!00-00-00!)
		$_l_PODelRefWidth:=80
		$_l_Index:=Size of array:C274(ORD_AT_PONUMBER)
	End if 
End for 
For ($_l_Index; 1; Size of array:C274(ORD_at_SerialNo))
	If (ORD_at_SerialNo{$_l_Index}#"")
		$_l_SerialWidth:=129
		$_l_Index:=Size of array:C274(ORD_AT_PONUMBER)
	End if 
End for 

For ($_l_Index; 1; Size of array:C274(ORDER_AT_DELIVERYREF))
	If (ORDER_AT_DELIVERYREF{$_l_Index}#"")
		$_l_CusDelWidth:=120
		$_l_Index:=Size of array:C274(ORD_AT_PONUMBER)
	End if 
End for 
For ($_l_Index; 1; Size of array:C274(ORD_al_StockNo))
	If (ORD_al_StockNo{$_l_Index}#0)
		$_l_StockNoWidth:=73
		$_l_Index:=Size of array:C274(ORD_AT_PONUMBER)
	End if 
End for 
If ($_bo_ShowSerial)
	LB_SetColumnWidths(->ORD_lb_Allocations; "oAloc"; 1; $_l_SerialWidth; 40; 66; 40; 66; $_l_PONumberWidth; $_l_PODelRefWidth; $_l_CusDelWidth; $_l_StockNoWidth; 60)
	
Else 
	LB_SetColumnWidths(->ORD_lb_Allocations; "oAloc"; 1; 0; 40; 66; 40; 66; $_l_PONumberWidth; $_l_PODelRefWidth; $_l_CusDelWidth; $_l_StockNoWidth; 60)
	
End if 
LB_SetEnterable(->ORD_lb_Allocations; False:C215; 0)
LB_SetScroll(->ORD_lb_Allocations; -3; -2)
LB_StyleSettings(->ORD_lb_Allocations; "Light Grey "; 9; "oAuths"; ->[ORDERS:24])
If ([ORDER_ITEMS:25]Order_Code:1#[ORDERS:24]Order_Code:3)
	If (([ORDERS:24]Order_Code:3#"") & ([ORDER_ITEMS:25]Order_Code:1=""))
		//  [ORDER ITEMS]Order Code:=[ORDERS]Order Code
	Else 
		RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		States_CUArr(->[ORDERS:24]State:15)
	End if 
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[ORDER_ITEMS:25])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")
ORDI_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
ORDI_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!

ORDERITEM_Contexts
OI_l_OrderItemClass:=0
$_l_ProductType:=0
If ([ORDER_ITEMS:25]Product_Code:2#"")
	If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
		$_l_ProductType:=[PRODUCTS:9]x_Product_Entry_Class:55
		If ([PRODUCTS:9]Issues_Number:27>0) & ($_l_ProductType=0)
			$_l_ProductType:=7
		End if 
	End if 
End if 
ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 0)
ARRAY DATE:C224(OI_ad_SubsActionDate; 0)
ARRAY TEXT:C222(OI_at_SubsActionType; 0)
ARRAY DATE:C224(OI_ad_SubsActioned; 0)
ARRAY LONGINT:C221(OI_al_SubsID; 0)


Case of 
	: ($_l_ProductType=4)
		OI_l_OrderItemClass:=1
		ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 3)
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		
		
	: ($_l_ProductType=5)
	: ([ORDER_ITEMS:25]Invoice_Number:17="SUBS")
		OI_l_OrderItemClass:=1
		ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 3)
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		
	: ($_l_ProductType=7)
		OI_l_OrderItemClass:=1
		ARRAY TEXT:C222(OI_at_OrderItemsSubTypes; 3)
		OI_at_OrderItemsSubTypes{1}:="Issues"
		OI_at_OrderItemsSubTypes{2}:="Renewal Reminders"
		OI_at_OrderItemsSubTypes{3}:="Billing"
		
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		
	Else 
		REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
		
End case 
SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Subscription_Date:3; OI_ad_SubsActionDate; [SUBSCRIPTIONS:93]Type:7; OI_at_SubsActionType; [SUBSCRIPTIONS:93]Date_Done:9; OI_ad_SubsActioned; [SUBSCRIPTIONS:93]x_ID:11; OI_al_SubsID)
//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
LB_SetupListbox(->OI_lb_Subs; "OIS_t"; "OIS_L"; 1; ->OI_ad_SubsActionDate; ->OI_at_SubsActionType; ->OI_ad_SubsActioned; ->OI_al_SubsID)
LB_SetColumnHeaders(->OI_lb_Subs; "OIS_L"; 1; "Date"; "Type"; "Date Done"; "ID")
LB_SetColumnWidths(->OI_lb_Subs; "OIS_t"; 1; 90; 40; 60; 0)
LB_SetEnterable(->OI_lb_Subs; False:C215; 0)
LB_SetScroll(->OI_lb_Subs; -3; -2)
LB_StyleSettings(->OI_lb_Subs; "Black"; 9; "OIS_t"; ->[ORDER_ITEMS:25])
OI_at_OrderItemsSubTypes:=1
OBJECT SET VISIBLE:C603(OI_l_SubsMail; False:C215)
OBJECT SET VISIBLE:C603(OI_l_SubsRenew; False:C215)





If (ORDI_at_ViewTabsLabelsOLD>0)
	ORDI_at_ViewTabsLabels:=ORDI_at_ViewTabsLabelsOLD
End if 
If (ORDI_at_ViewTabsLabels=0)
	ORDI_at_ViewTabsLabels:=1
	ORDI_at_ViewTabsLabelsOLD:=0
End if 

//On this form the tabs will be included at the top..
//So....reset this first because otherwize it will get bigger and bigger!!!
OI_at_OrderItemTabs{1}:="Pricing  "
OI_at_OrderItemTabs{2}:="Delivery "
OI_at_OrderItemTabs:=1
$_l_TextLength:=Length:C16("Pricing")
$_l_TextLength:=$_l_TextLength+Length:C16("Delivery")
For ($_l_Index; 1; Size of array:C274(ORDI_at_ViewTabsLabels))
	$_l_TabPosition:=Find in array:C230(OI_at_OrderItemTabs; ORDI_at_ViewTabsLabels{$_l_Index})
	$_l_TextLength:=$_l_TextLength+Length:C16(ORDI_at_ViewTabsLabels{$_l_Index})
	If ($_l_TabPosition<0)
		
		APPEND TO ARRAY:C911(OI_at_OrderItemTabs; ORDI_at_ViewTabsLabels{$_l_Index})
	Else 
	End if 
End for 
ORDI_l_Textlength:=$_l_TextLength
//so here is why we gather the length
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
OBJECT GET COORDINATES:C663(*; "oOrderItemsTab"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_NewLeft:=Int:C8($_l_WindowWidth-($_l_TextLength*8.5))

//MOVE OBJECT(*;"oOrderItemsTab";$_l_NewLeft;$_l_ObjectTop;($_l_WindowWidth);$_l_ObjectBottom;*)




vVATTitleF:=Term_VATWT("VAT")

If (DB_t_CurrentFormUsage#"None")
	vButtDisOI:="II  MO  FSSSRCADT"
	Input_Buttons(->[ORDER_ITEMS:25]; ->vButtDisOI)
	
End if 

vTitle3:=Term_StoWT("Stock Allocations ...")
DB_MenuAction("Functions"; "Stock Allocation"; 1; Term_StoWT("Stock Allocation"))
DB_MenuAction("Functions"; "Stock Levels"; 1; Term_StoWT("Stock Levels"))
// SET MENU ITEM(2049;1;Term_StoWT ("Stock Allocation"))
//  SET MENU ITEM(2049;2;Term_StoWT ("Stock Levels"))

If (DB_t_CurrentFormUsage#"None")
	If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
		DB_MenuAction("Functions"; "Stock Levels"; 3; "")
		DB_MenuAction("Functions"; "Stock Allocation"; 3; "")
		//  DISABLE MENU ITEM(2049;1)
		//DISABLE MENU ITEM(2049;2)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
		DB_MenuAction("Functions"; "Trial Assembly - Display"; 3; "")
		// DISABLE MENU ITEM(2049;3)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Component_Level:47; False:C215)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Level_Up_Item_Number:48; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)
		DB_MenuAction("Functions"; "Subscription Details"; 3; "")
		// DISABLE MENU ITEM(2049;5)
	End if 
	If ((DB_GetModuleSettingByNUM(1))=5)
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Price_Per:50; False:C215)
	End if 
	GOTO OBJECT:C206([ORDER_ITEMS:25]Product_Name:13)
	QV_UpdateQualsPallette(1; Table:C252(->[ORDER_ITEMS:25]); [ORDER_ITEMS:25]x_ID:58)
	ORDI_LoadSubArea
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[ORDER_ITEMS:25])))
Case of 
	: (OI_l_OrderItemClass=1)
		FORM GOTO PAGE:C247(4)
End case 



//HIGHLIGHT TEXT([ORDER ITEMS]Product Name;32000;32000)
ERR_MethodTrackerReturn("OrderI_InLPB"; $_t_oldMethodName)
