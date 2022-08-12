//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_InLPB
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
	//Array BOOLEAN(LB_lb_StockItems;0)
	//ARRAY DATE(STK_ad_MovementDate;0)
	//ARRAY LONGINT(STK_al_SIUIDS;0)
	//ARRAY LONGINT(STK_ar_SIOrderITem;0)
	//ARRAY REAL(STK_ar_SIQuantiy;0)
	//ARRAY REAL(STK_ar_SIRemaining;0)
	//ARRAY REAL(STK_ar_SICostPrice;0)
	//ARRAY TEXT(STK_at_SIMovement;0)
	//ARRAY TEXT(STK_at_SITypes;0)
	C_BOOLEAN:C305(STK_bo_ShowAll; STK_bo_ShowOriginal)
	C_LONGINT:C283(SI_l_BUT1; SI_l_BUT2; SI_l_BUT3; SI_l_BUT4; SI_l_BUT5; SI_l_BUT6; SI_l_BUT7; SI_l_BUT8; SI_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; oSI_COL1; oSI_COL2; oSI_COL3; oSI_COL4; oSI_COL5; oSI_COL6; oSI_COL7; oSI_COL8; oSI_COL9; oSI_HED1)
	C_TEXT:C284(oSI_HED2; oSI_HED3; oSI_HED4; oSI_HED5; oSI_HED6; oSI_HED7; oSI_HED8; oSI_HED9; vButtDisSCR; vCompany; vLocation)
	C_TEXT:C284(vProduct; vTitleL; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_InLPB")

//STK_MenuUpdate ("Current stock";[CURRENT STOCK]Product Code;False)

RELATE ONE:C42([CURRENT_STOCK:62]Stock_Type:3)
vType:=[STOCK_TYPES:59]Type_Name:2
RELATE ONE:C42([CURRENT_STOCK:62]Product_Code:1)
vProduct:=[PRODUCTS:9]Product_Name:2
RELATE ONE:C42([CURRENT_STOCK:62]Location:8)
vLocation:=[LOCATIONS:61]Location_Name:2
If ([CURRENT_STOCK:62]Item_Number:5=0)
	REDUCE SELECTION:C351([ORDERS:24]; 0)
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
	vCompany:=""
Else 
	RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
	RELATE ONE:C42([ORDERS:24]Company_Code:1)
	vCompany:=[COMPANIES:2]Company_Name:2
End if 
vTitleL:=Uppercase:C13(Term_StoWT("Current Stock"))
vButtDisSCR:="I  PMO  FSSSRCADT"
Input_Buttons(->[CURRENT_STOCK:62]; ->vButtDisSCR)
If ([CURRENT_STOCK:62]X_ID:13>0)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
	MESSAGES OFF:C175
	//APPLY TO SELECTION([STOCK ITEMS];STK_UpdateCalledOffQuantity )
	MESSAGES ON:C181
	If (Not:C34(STK_bo_ShowAll))
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
	End if 
Else 
	REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
End if 
ARRAY LONGINT:C221(STK_al_SIUIDS; 0)
ARRAY TEXT:C222(STK_at_SIMovement; 0)
ARRAY TEXT:C222(STK_at_SITypes; 0)
ARRAY REAL:C219(STK_ar_SIRemaining; 0)
ARRAY REAL:C219(STK_ar_SIQuantiy; 0)
ARRAY REAL:C219(STK_ar_SICostPrice; 0)
ARRAY LONGINT:C221(STK_ar_SIOrderITem; 0)
ARRAY DATE:C224(STK_ad_MovementDate; 0)
SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_SIUIDS; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; STK_at_SIMovement; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_SITypes; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_SIRemaining; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_SICostPrice; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_ar_SIOrderITem; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; STK_ar_SIQuantiy; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; STK_ad_MovementDate)
SORT ARRAY:C229(STK_ar_SIRemaining; STK_ar_SIQuantiy; STK_ar_SIOrderITem; STK_ar_SICostPrice; STK_at_SITypes; STK_al_SIUIDS; STK_ad_MovementDate; STK_at_SIMovement)

LB_SetupListbox(->LB_lb_StockItems; "oSI"; "SI_L"; 1; ->STK_ad_MovementDate; ->STK_ar_SIQuantiy; ->STK_ar_SIRemaining; ->STK_ar_SICostPrice; ->STK_ar_SIOrderITem; ->STK_at_SIMovement; ->STK_at_SITypes; ->STK_al_SIUIDS)
LB_SetColumnHeaders(->LB_lb_StockItems; "SI_L"; 1; "Date"; "Moved Quantity"; "Remaining Quantity"; "Cost Price"; "Order Item"; "Stock Movement"; "Type"; "ID")
If (STK_bo_ShowOriginal)
	
	LB_SetColumnWidths(->LB_lb_StockItems; "oSI"; 1; 80; 90; 90; 120; 140; 140; 90; 0)
Else 
	LB_SetColumnWidths(->LB_lb_StockItems; "oSI"; 1; 80; 0; 90; 120; 140; 140; 90; 0)
End if 
LB_SETENTRYOPTIONS  // doesn't actually do anything ...
LB_StyleSettings(->LB_lb_StockItems; "blue"; 9; "oSI"; ->[STOCK_MOVEMENTS:40])
LB_SetScroll(->LB_lb_StockItems; -3; -2)
LB_SetEnterable(->LB_lb_StockItems; False:C215; 0)
LB_SetSortOptions(->LB_lb_StockItems; 0)
ERR_MethodTrackerReturn("StockCurr_InLPB"; $_t_oldMethodName)