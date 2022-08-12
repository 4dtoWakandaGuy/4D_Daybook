If (False:C215)
	//object Name: Object Name:      STK_Legend.oStockItems1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_StockItems;0)
	//ARRAY LONGINT(STK_al_SIUIDS;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Process; $_l_Row; $_l_SIUID; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; STK_i_ShowLegend; STK_i_ShowMovement; STK_i_ShowPrevious; STK_l_PreviousID)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_Legend.oStockItems1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		$_ptr_FocusObject:=Focus object:C278  // $_l_Column contains a pointer to col2
		$_l_Row:=$_ptr_FocusObject->  //$_l_Row equals 5
		$_l_SIUID:=STK_al_SIUIDS{$_l_Row}
		If ($_l_SIUID>0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_SIUID)
			STK_l_PreviousID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663(LB_lb_StockItems; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			
			Open window:C153(($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop+($_l_Row*12)); ($_l_WindowLeft+$_l_ObjectLeft)+320; ($_l_windowTop+$_l_ObjectTop+($_l_Row*12))+130)
			DIALOG:C40("STK_LogShowOptions")
			CLOSE WINDOW:C154
			Case of 
				: (STK_i_ShowPrevious=1)
					$_l_Process:=New process:C317("STK_bo_ShowCSBySI"; 128000; "Show Current Stock"; STK_l_PreviousID; ($_l_WindowLeft+$_l_ObjectLeft); ($_l_windowTop+$_l_ObjectTop+($_l_Row*12)))
					
				: (STK_i_ShowLegend=1)  //show log of this stock ite
					
				: (STK_i_ShowMovement=1)  //show stock movement
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ STK_Legend.oStockItems1"; $_t_oldMethodName)
