//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CancelFromOnOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	//ARRAY TEXT(STK_at_MovementNames;0)
	//ARRAY TEXT(STK_at_TypeCodes;0)
	C_BOOLEAN:C305($_bo_Stop; STK_l_Create)
	C_LONGINT:C283($_l_ButtonClickedFunction; $_l_ChosenElement; $_l_EnterStockMovement; $_l_Index; DB_l_ButtonClickedFunction; iOK; STOCK_l_CopyProcess; XNext)
	C_TEXT:C284($_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract; $_t_oldMethodName; $_t_StockMovementCode; $_t_StockMovementType; vButtDisMov)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_CancelFromOnOrder")
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
$_t_StockMovementType:=""
If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
	CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "WithResidual")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43#"")
	$_bo_Stop:=False:C215
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<Records in set:C195("WithResidual"))
			Gen_Confirm3("Cancel all remainders or just those with no stock reference?"; "All"; "Unmarked"; "Stop")
			If (XNext=1)
				xNext:=0
				If (OK=0)
					//unmarked only
					USE SET:C118("WithResidual")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43="")
				Else 
					USE SET:C118("WithResidual")
				End if 
			Else 
				xNext:=0
				$_bo_Stop:=True:C214
			End if 
		End if 
	End if 
	If (Not:C34($_bo_Stop))
		USE SET:C118("WithResidual")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			Gen_Confirm("This will only cancel items not allocated to sales orders"; "Stop"; "Continue")
			If (OK=0)
				USE SET:C118("WithResidual")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "WithResidual")
			Else 
				$_bo_Stop:=True:C214
			End if 
		End if 
		If (Not:C34($_bo_Stop))
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
			End if 
			$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
			$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]UseForpurchaseCancellation:34=True:C214)
			If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd; *)
				QUERY:C277([MOVEMENT_TYPES:60];  & ; [MOVEMENT_TYPES:60]Stock_Plus:3=$_t_MovementTypeStockSubtract)
			End if 
			$_t_StockMovementType:=""
			If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
				If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
					QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd)
					If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
						If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
							SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Name:2; STK_at_MovementNames; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_TypeCodes)
							
							ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_MovementNames))
							
							For ($_l_Index; 1; Size of array:C274(STK_at_MovementNames))
								STK_al_CHooseElement{$_l_Index}:=$_l_Index
							End for 
							$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_MovementNames; ->STK_al_CHooseElement; "Which type of cancellation are you creating"; False:C215; ->STK_l_Create; "Stop"; "Continue")
							If ($_l_ChosenElement>0)
								$_t_StockMovementType:=STK_at_TypeCodes{$_l_ChosenElement}
							End if 
						Else 
							$_t_StockMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
							
						End if 
					Else 
						Gen_Alert("The stock movemement types for cancelling on order items are not set up correctly.there are not that  subtract from "+$_t_MovementTypeStockAdd+" to be used with a "+[STOCK_MOVEMENTS:40]Movement_Type:6)
						
					End if 
				Else 
					If ([MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd)
						$_t_StockMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
						
					Else 
						Gen_Alert("The stock movemement type for cancelling on order items is not set up correctly. It will subtract from stock type "+[MOVEMENT_TYPES:60]Stock_Minus:4+" and should subtract from "+$_t_MovementTypeStockAdd+" to be used with a "+[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
				End if 
			Else 
				Gen_Alert("No movement type has been set up to cancel on order items")
				
			End if 
			If ($_t_StockMovementType#"")
				$_t_StockMovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
				iOK:=1
				In_ButtCall("R:Move_InLPA:D:Stock_InCan"; ""; "Stock_inDelete"; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "Movements"; "1 5 6"; "Move_InLPB"; "Master"; ""; "Gen_ShowTelCo"; ->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisMov)
				If (STOCK_l_CopyProcess>0)
					
					$_l_ButtonClickedFunction:=DB_GetButtonFunction("AutoCLose")
					SET PROCESS VARIABLE:C370(STOCK_l_CopyProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
					
					POST OUTSIDE CALL:C329(STOCK_l_CopyProcess)
					STOCK_l_CopyProcess:=0
				End if 
				If (In transaction:C397)
					//VALIDATE TRANSACTION
					Transact_End(True:C214)
				End if 
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "◊StockItemstoAction")
				$_l_EnterStockMovement:=New process:C317("STK_EnterMovementType"; 128000; "Enter Stock Movement"; $_t_StockMovementType; $_t_StockMovementCode; ""; "◊StockItemstoAction")
				
			End if 
		End if 
	End if 
Else 
	Gen_Alert("There are no outstanding items on this stock movement")
End if 
ERR_MethodTrackerReturn("STK_CancelFromOnOrder"; $_t_oldMethodName)
