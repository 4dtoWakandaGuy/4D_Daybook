If (False:C215)
	//object Name: [CURRENT_STOCK]CurrentStock_In.oStockItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/10/2012 13:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_StockItems;0)
	//ARRAY DATE(STK_ad_MovementDate2;0)
	//ARRAY LONGINT(STK_al_SIUIDS;0)
	//ARRAY LONGINT(STK_al_SIUIDS2;0)
	//ARRAY LONGINT(STK_ar_SIOrderITem2;0)
	//ARRAY REAL(STK_ar_SIQuantiy2;0)
	//ARRAY REAL(STK_ar_SIRemaining2;0)
	//ARRAY REAL(STK_ar_SICostPrice2;0)
	//ARRAY TEXT(STK_at_SIMovement2;0)
	//ARRAY TEXT(STK_at_SITypes2;0)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Process; $_l_Row; $_l_SIUID; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; STK_i_ShowLegend; STK_i_ShowMovement; STK_i_ShowPrevious; STK_l_PreviousID)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285(STK_R_StockItemQuantity)
	C_TEXT:C284($_t_oldMethodName; STK_T_CameFromMovement; STK_t_CameFromType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].CurrentStock_In.oStockItems"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		$_ptr_FocusObject:=Focus object:C278  // $_ptr_FocusObject contains a pointer to col2
		$_l_Row:=$_ptr_FocusObject->  //$_l_Row equals 5
		$_l_SIUID:=STK_al_SIUIDS{$_l_Row}
		If ($_l_SIUID>0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SIUID)
			STK_l_PreviousID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663(LB_lb_StockItems; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			
			Open window:C153(($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop+($_l_Row*12)); ($_l_WindowLeft+$_l_ObjectLeft)+320; ($_l_windowTop+$_l_ObjectTop+($_l_Row*12))+130; 1)
			DIALOG:C40("STK_LogShowOptions")
			CLOSE WINDOW:C154
			Case of 
				: (STK_i_ShowPrevious=1)
					$_l_Process:=New process:C317("STK_bo_ShowCSBySI"; 128000; "Show Current Stock"; STK_l_PreviousID; ($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop+($_l_Row*12)))
					
				: (STK_i_ShowLegend=1)  //show log of this stock ite
					If (STK_l_PreviousID>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_l_PreviousID)
						STK_T_CameFromMovement:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
						STK_t_CameFromType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
						STK_R_StockItemQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					Else 
						STK_T_CameFromMovement:=""
						STK_t_CameFromType:=""
						STK_R_StockItemQuantity:=0
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SIUID)
					$_l_SIUID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					ARRAY LONGINT:C221(STK_al_SIUIDS2; 0)
					ARRAY TEXT:C222(STK_at_SIMovement2; 0)
					ARRAY TEXT:C222(STK_at_SITypes2; 0)
					ARRAY REAL:C219(STK_ar_SIRemaining2; 0)
					ARRAY REAL:C219(STK_ar_SIQuantiy2; 0)
					ARRAY REAL:C219(STK_ar_SICostPrice2; 0)
					ARRAY LONGINT:C221(STK_ar_SIOrderITem2; 0)
					ARRAY DATE:C224(STK_ad_MovementDate2; 0)
					
					If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_SIUID)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_SIUIDS2; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; STK_at_SIMovement2; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_SITypes2; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_SIRemaining2; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_SICostPrice2; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_ar_SIOrderITem2; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; STK_ar_SIQuantiy2; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; STK_ad_MovementDate2)
						SORT ARRAY:C229(STK_ar_SIRemaining2; STK_ar_SIQuantiy2; STK_ar_SIOrderITem2; STK_ar_SICostPrice2; STK_at_SITypes2; STK_al_SIUIDS2; STK_ad_MovementDate2; STK_at_SIMovement2)
					End if 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_SIUIDS{$_l_Row})
					Open window:C153(($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop+($_l_Row*12)); ($_l_WindowLeft+$_l_ObjectLeft)+600; ($_l_windowTop+$_l_ObjectTop+($_l_Row*12))+500; Plain window:K34:13)
					DIALOG:C40("STK_Legend")
					CLOSE WINDOW:C154
				: (STK_i_ShowMovement=1)  //show stock movement
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].CurrentStock_In.oStockItems"; $_t_oldMethodName)
