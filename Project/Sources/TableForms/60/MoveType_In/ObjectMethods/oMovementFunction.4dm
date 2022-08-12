If (False:C215)
	//object Name: [MOVEMENT_TYPES]MoveType_in.oMovementFunction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/05/2012 17:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_MovementFunctions;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [MOVEMENT_TYPES].MoveType_in.oMovementFunction"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (STK_at_MovementFunctions>0)
			
			[MOVEMENT_TYPES:60]Alloc_Type:10:=False:C215
			[MOVEMENT_TYPES:60]Unalloc_Type:13:=False:C215
			[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=False:C215
			[MOVEMENT_TYPES:60]Delivery_Type:12:=False:C215
			[MOVEMENT_TYPES:60]UseForValueChange:28:=False:C215
			[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=False:C215
			[MOVEMENT_TYPES:60]UseForLayerMove:31:=False:C215
			[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=False:C215
			[MOVEMENT_TYPES:60]Assembly_Type:23:=False:C215
			[MOVEMENT_TYPES:60]UseForStockReceipt:33:=False:C215
			[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=False:C215
			Case of 
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for purchase ordering")
					[MOVEMENT_TYPES:60]Purch_Ord_Type:11:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock allocation")
					[MOVEMENT_TYPES:60]Alloc_Type:10:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock unallocation")
					[MOVEMENT_TYPES:60]Unalloc_Type:13:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock delivery to customer")
					[MOVEMENT_TYPES:60]Delivery_Type:12:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock delivery to customer and allocation(combined)")
					[MOVEMENT_TYPES:60]Alloc_Type:10:=True:C214
					[MOVEMENT_TYPES:60]Delivery_Type:12:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock revaluation")
					[MOVEMENT_TYPES:60]UseForValueChange:28:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for Currency change")
					[MOVEMENT_TYPES:60]UseForCurrencyMove:32:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for Layer Change")
					[MOVEMENT_TYPES:60]UseForLayerMove:31:=True:C214
					
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for Analysis code change")
					[MOVEMENT_TYPES:60]UseForAnalysisMove:30:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for stock Assembly/Disassembly")
					[MOVEMENT_TYPES:60]Assembly_Type:23:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for Receiving Stock")
					[MOVEMENT_TYPES:60]UseForStockReceipt:33:=True:C214
				: (STK_at_MovementFunctions{STK_at_MovementFunctions}="Used for Purchase Cancellation")
					[MOVEMENT_TYPES:60]UseForpurchaseCancellation:34:=True:C214
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [MOVEMENT_TYPES].MoveType_in.oMovementFunction"; $_t_oldMethodName)
