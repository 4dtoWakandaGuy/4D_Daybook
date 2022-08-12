If (False:C215)
	//Project Form Method Name: STK_Legend
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/10/2012 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_bo_StockItems2;0)
	//ARRAY BOOLEAN(LB_lb_StockItems2;0)
	//ARRAY DATE(STK_ad_MovementDate2;0)
	//ARRAY LONGINT(STK_al_SIUIDS2;0)
	//ARRAY REAL(STK_ar_SICostPrice2;0)
	//ARRAY REAL(STK_ar_SIOrderITem2;0)
	//ARRAY REAL(STK_ar_SIQuantiy2;0)
	//ARRAY REAL(STK_ar_SIRemaining2;0)
	//ARRAY TEXT(STK_at_SIMovement2;0)
	//ARRAY TEXT(STK_at_SITypes2;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; STK_bo_ShowOriginal)
	C_LONGINT:C283($_l_event; SI2_l_BUT1; SI2_l_BUT2; SI2_l_BUT3; SI2_l_BUT4; SI2_l_BUT5; SI2_l_BUT6; SI2_l_BUT7; SI2_l_BUT8; SI2_l_BUT9)
	C_REAL:C285(STK_R_StockItemQuantity)
	C_TEXT:C284($_t_oldMethodName; oSI_HED3; oSI2_COL1; oSI2_COL2; oSI2_COL3; oSI2_COL4; oSI2_COL5; oSI2_COL6; oSI2_COL7; oSI2_COL8; oSI2_COL9)
	C_TEXT:C284(oSI2_HED1; oSI2_HED2; oSI2_HED4; oSI2_HED5; oSI2_HED6; oSI2_HED7; oSI2_HED8; oSI2_HED9; STK_T_CameFromMovement; STK_t_CameFromType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM STK_Legend"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		$_l_event:=Form event code:C388
		StockI_InLP($_l_event)
		WS_AutoscreenSize(2; 600; 600)
		
		LB_SetupListbox(->LB_lb_StockItems2; "oSI2"; "SI2_L"; 1; ->STK_ad_MovementDate2; ->STK_ar_SIQuantiy2; ->STK_ar_SIRemaining2; ->STK_ar_SICostPrice2; ->STK_ar_SIOrderITem2; ->STK_at_SIMovement2; ->STK_at_SITypes2; ->STK_al_SIUIDS2)
		
		LB_SetColumnHeaders(->LB_lb_StockItems2; "SI2_L"; 1; "Date"; "Moved Quantity"; "Remaining Quantity"; "Cost Price"; "Order Item"; "Stock Movement"; "Type"; "ID")
		If (STK_bo_ShowOriginal)
			LB_SetColumnWidths(->LB_lb_StockItems2; "oSI2"; 1; 80; 90; 90; 120; 140; 140; 90; 0)
		Else 
			LB_SetColumnWidths(->LB_lb_StockItems2; "oSI2"; 1; 80; 0; 90; 120; 140; 140; 90; 0)
		End if 
		LB_SETENTRYOPTIONS  // doesn't actually do anything ...
		
		LB_StyleSettings(->LB_lb_StockItems2; "blue"; 9; "oSI2"; ->[STOCK_MOVEMENTS:40])
		LB_SetScroll(->LB_lb_StockItems2; -3; -2)
		LB_SetEnterable(->LB_lb_StockItems2; False:C215; 0)
		LB_SetSortOptions(->LB_lb_StockItems2; 0)
		If (Size of array:C274(STK_ad_MovementDate2)=0)
			OBJECT SET VISIBLE:C603(*; "oMovedToLabel"; False:C215)
			OBJECT SET VISIBLE:C603(LB_lb_StockItems2; False:C215)
		End if 
		If (STK_T_CameFromMovement="")
			OBJECT SET VISIBLE:C603(*; "OmovedFromLabel"; False:C215)
			OBJECT SET VISIBLE:C603(STK_T_CameFromMovement; False:C215)
			OBJECT SET VISIBLE:C603(STK_t_CameFromType; False:C215)
			OBJECT SET VISIBLE:C603(STK_R_StockItemQuantity; False:C215)
		End if 
		
	Else 
		$_l_event:=Form event code:C388
		StockI_InLP($_l_event)
End case 
ERR_MethodTrackerReturn("FM STK_Legend"; $_t_oldMethodName)
