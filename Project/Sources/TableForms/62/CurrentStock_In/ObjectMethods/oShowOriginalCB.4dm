If (False:C215)
	//object Name: [CURRENT_STOCK]CurrentStock_In.oshowOriginal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/10/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_StockItems;0)
	//ARRAY DATE(STK_ad_MovementDate;0)
	//ARRAY LONGINT(STK_al_SIUIDS;0)
	//ARRAY REAL(STK_ar_SIQuantiy;0)
	//ARRAY REAL(STK_ar_SIRemaining;0)
	//ARRAY REAL(STK_ar_SICostPrice;0)
	//ARRAY REAL(STK_ar_SIOrderITem;0)
	//ARRAY TEXT(STK_at_SIMovement;0)
	//ARRAY TEXT(STK_at_SITypes;0)
	C_BOOLEAN:C305(STK_bo_ShowOriginal)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].CurrentStock_In.oshowOriginal"; Form event code:C388)

LB_SetupListbox(->LB_lb_StockItems; "oSI"; "SI_L"; 1; ->STK_ad_MovementDate; ->STK_ar_SIQuantiy; ->STK_ar_SIRemaining; ->STK_ar_SICostPrice; ->STK_ar_SIOrderITem; ->STK_at_SIMovement; ->STK_at_SITypes; ->STK_al_SIUIDS)
LB_SetColumnHeaders(->LB_lb_StockItems; "SI_L"; 1; "Date"; "Moved Quantity"; "Remaining Quantity"; "Cost Price"; "Order Item"; "Stock Movement"; "Type"; "ID")
If (STK_bo_ShowOriginal)
	
	LB_SetColumnWidths(->LB_lb_StockItems; "oSI"; 1; 80; 90; 90; 120; 140; 140; 90; 0)
Else 
	LB_SetColumnWidths(->LB_lb_StockItems; "oSI"; 1; 80; 0; 90; 120; 140; 140; 90; 0)
End if 
LB_SETENTRYOPTIONS  // doesn't actually do anything ...
LB_StyleSettings(->LB_lb_StockItems; "blue"; 9; "oSI"; ->[STOCK_MOVEMENTS:40])
LB_SetScroll(->LB_lb_StockItems; -2; -2)
LB_SetEnterable(->LB_lb_StockItems; False:C215; 0)
LB_SetSortOptions(->LB_lb_StockItems; 0)
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].CurrentStock_In.oshowOriginal"; $_t_oldMethodName)