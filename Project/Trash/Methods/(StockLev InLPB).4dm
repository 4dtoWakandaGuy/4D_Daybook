//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 08:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_StockByCost;0)
	//ARRAY LONGINT(STK_al_OrderItemID;0)
	//ARRAY LONGINT(STK_al_SLCSIDS;0)
	//ARRAY REAL(STK_ar_AllocatedQuantity;0)
	//ARRAY REAL(STK_ar_FreeQuantity;0)
	//ARRAY REAL(STK_ar_SLCSQuantiy;0)
	//ARRAY REAL(STK_ar_SLCSUnitCost;0)
	//ARRAY TEXT(STK_at_SKCSTypes;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; SL_l_BUT1; SL_l_BUT2; SL_l_BUT3; SL_l_BUT4; SL_l_BUT5; SL_l_BUT6; SL_l_BUT7; SL_l_BUT8; SL_l_BUT9)
	C_REAL:C285(vQuantity; vTotal)
	C_TEXT:C284($_t_oldMethodName; oSL_COL1; oSL_COL2; oSL_COL3; oSL_COL4; oSL_COL5; oSL_COL6; oSL_COL7; oSL_COL8; oSL_COL9; oSL_HED1)
	C_TEXT:C284(oSL_HED2; oSL_HED3; oSL_HED4; oSL_HED5; oSL_HED6; oSL_HED7; oSL_HED8; oSL_HED9; vButtDisSL; vProduct; vTitleL)
	C_TEXT:C284(vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_InLPB")
MESSAGES OFF:C175
//STK_MenuUpdate ("stock Levels";[STOCK_LEVELS]Product Code;False)
MESSAGES ON:C181

RELATE ONE:C42([STOCK_LEVELS:58]Stock_Type:2)
vType:=[STOCK_TYPES:59]Type_Name:2
RELATE ONE:C42([STOCK_LEVELS:58]Product_Code:1)
vProduct:=[PRODUCTS:9]Product_Name:2
vQuantity:=[STOCK_LEVELS:58]Free_Level:3+[STOCK_LEVELS:58]Allocated_Level:4
vTotal:=[STOCK_LEVELS:58]Free_Cost:5+[STOCK_LEVELS:58]Allocated_Cost:6
vTitleL:=Uppercase:C13(Term_StoWT("Stock Level"))
vButtDisSL:="I  PMO  FSSSRCADT"
Input_Buttons(->[STOCK_LEVELS:58]; ->vButtDisSL)
If ([STOCK_LEVELS:58]X_ID:10>0)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]x_Stock_Level_ID:15=[STOCK_LEVELS:58]X_ID:10; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4#0)
Else 
	REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
End if 


ARRAY LONGINT:C221(STK_al_SLCSIDS; 0)
ARRAY TEXT:C222(STK_at_SKCSTypes; 0)
ARRAY REAL:C219(STK_ar_SLCSQuantiy; 0)
ARRAY REAL:C219(STK_ar_SLCSUnitCost; 0)
ARRAY LONGINT:C221(STK_al_OrderItemID; 0)
SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; STK_al_SLCSIDS; [CURRENT_STOCK:62]Stock_Type:3; STK_at_SKCSTypes; [CURRENT_STOCK:62]Quantity:4; STK_ar_SLCSQuantiy; [CURRENT_STOCK:62]Cost_Price:6; STK_ar_SLCSUnitCost; [CURRENT_STOCK:62]Item_Number:5; STK_al_OrderItemID)

SORT ARRAY:C229(STK_ar_SLCSUnitCost; STK_ar_SLCSQuantiy; STK_at_SKCSTypes; STK_al_SLCSIDS; STK_al_OrderItemID)
ARRAY REAL:C219(STK_ar_FreeQuantity; 0)
ARRAY REAL:C219(STK_ar_AllocatedQuantity; 0)
$_l_SizeofArray:=Size of array:C274(STK_ar_SLCSUnitCost)
ARRAY REAL:C219(STK_ar_FreeQuantity; $_l_SizeofArray)
ARRAY REAL:C219(STK_ar_AllocatedQuantity; $_l_SizeofArray)
For ($_l_Index; 1; Size of array:C274(STK_ar_SLCSQuantiy))
	If (STK_al_OrderItemID{$_l_Index}#0)
		STK_ar_AllocatedQuantity{$_l_Index}:=STK_ar_SLCSQuantiy{$_l_Index}
	Else 
		STK_ar_FreeQuantity{$_l_Index}:=STK_ar_SLCSQuantiy{$_l_Index}
	End if 
End for 

LB_SetupListbox(->LB_lb_StockByCost; "oSL"; "SL_L"; 1; ->STK_at_SKCSTypes; ->STK_ar_SLCSQuantiy; ->STK_ar_FreeQuantity; ->STK_ar_AllocatedQuantity; ->STK_ar_SLCSUnitCost; ->STK_al_OrderItemID; ->STK_al_SLCSIDS)
LB_SetColumnHeaders(->LB_lb_StockByCost; "SL_L"; 1; "Type"; "Quantity"; "Free"; "Allocated"; "Cost Price"; "Order Item No"; "ID")
LB_SetColumnWidths(->LB_lb_StockByCost; "oSL"; 1; 45; 0; 45; 45; 90; 120; 0)


LB_SETENTRYOPTIONS  // doesn't actually do anything ...

LB_StyleSettings(->LB_lb_StockByCost; "blue"; 9; "oSL"; ->[STOCK_LEVELS:58])
LB_SetScroll(->LB_lb_StockByCost; -3; -2)
LB_SetEnterable(->LB_lb_StockByCost; False:C215; 0)
LB_SetSortOptions(->LB_lb_StockByCost; 0)

Macro_AccType("Load "+String:C10(Table:C252(->[STOCK_LEVELS:58])))
ERR_MethodTrackerReturn("StockLev_InLPB"; $_t_oldMethodName)
