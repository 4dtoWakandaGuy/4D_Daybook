//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ReceiveFromOnOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	ARRAY LONGINT:C221($_al_StockItemIDS; 0)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY TEXT:C222($_at_MinusStockTypes; 0)
	//ARRAY TEXT(STK_at_ChooseDelivery;0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	//ARRAY TEXT(STK_at_MovementNames;0)
	//ARRAY TEXT(STK_at_TypeCodes;0)
	C_BOOLEAN:C305($_bo_Continue; STK_l_Create)
	C_LONGINT:C283($_l_EnterMovementProcess; $_l_Index; $_l_KeyPosition; $_l_LineIndex; $_l_LineRow; $_l_SelectedElement; $_l_ButtonClickedFunction; DB_l_ButtonClickedFunction; iOK; STOCK_l_CopyProcess)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_MovementTypeStockAdd; $_t_oldMethodName; $1; STK_T_DeliveryReference; STK_t_ISOMovementType; STK_T_PurchaseReference; vButtDisMov)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ReceiveFromOnOrder")
$_bo_Continue:=False:C215
If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
If (Count parameters:C259=0)
	If (Size of array:C274(STK_at_DeliveryReferences)>0)
		ARRAY TEXT:C222(STK_at_ChooseDelivery; 0)
		COPY ARRAY:C226(STK_at_DeliveryReferences; STK_at_ChooseDelivery)
		APPEND TO ARRAY:C911(STK_at_ChooseDelivery; "-")
		APPEND TO ARRAY:C911(STK_at_ChooseDelivery; "All Remaining Items")
		APPEND TO ARRAY:C911(STK_at_ChooseDelivery; "No Items Selection")
		ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_ChooseDelivery))
		
		For ($_l_Index; 1; Size of array:C274(STK_at_ChooseDelivery))
			STK_al_CHooseElement{$_l_Index}:=$_l_Index
		End for 
		$_l_SelectedElement:=GEN_RequestViaPopUp(->STK_at_ChooseDelivery; ->STK_al_CHooseElement; "Select Delivery Reference Received"; False:C215; ->STK_l_Create; "Stop"; "Continue")
		If ($_l_SelectedElement>0)
			STK_T_DeliveryReference:=STK_at_ChooseDelivery{$_l_SelectedElement}
			STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
			$_bo_Continue:=True:C214
		End if 
	Else 
		//this needs testing-this differs here from the old version ??
		
		ARRAY LONGINT:C221($_al_SelectedLines; 0)
		LB_GetSelect(->STK_LB_StockItems; ->$_al_SelectedLines)
		If (Size of array:C274($_al_SelectedLines)>0)
			Gen_Confirm("Receive only selected lines?"; "Yes"; "All Remaining")
			
			If (OK=1)
				//TRACE
				$_Ptr_ListBox:=STK_aptr_ItemPreferences{1}
				$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
				$_ptr_LBTable:=STK_aptr_ItemPreferences{7}
				$_Ptr_KeyField:=STK_aptr_ItemPreferences{8}
				$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				ARRAY LONGINT:C221($_al_StockItemIDS; 0)
				For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
					$_l_LineRow:=Find in array:C230($_al_SelectedLines; $_l_LineIndex)
					If ($_l_LineRow>0) & ($_l_KeyPosition>0)
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
						APPEND TO ARRAY:C911($_al_StockItemIDS; $_Ptr_ThisColumnArray->{$_l_LineIndex})
					End if 
				End for 
				//TRACE
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockItemIDS)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=String:C10(Current time:C178*1)+String:C10(Year of:C25(Current date:C33))+String:C10(Month of:C24(Current date:C33))+String:C10(Day of:C23(Current date:C33)))
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				STK_T_DeliveryReference:=String:C10(Current time:C178*1)+String:C10(Year of:C25(Current date:C33))+String:C10(Month of:C24(Current date:C33))+String:C10(Day of:C23(Current date:C33))
				STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
				$_bo_Continue:=True:C214
				
				
			Else 
				STK_T_DeliveryReference:=""
				STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
				$_bo_Continue:=True:C214
			End if 
		Else 
			STK_T_DeliveryReference:=""
			STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
			$_bo_Continue:=True:C214
		End if 
		
	End if 
Else 
	
	STK_T_DeliveryReference:=$1
	STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
	$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	DISTINCT VALUES:C339([MOVEMENT_TYPES:60]Stock_Minus:4; $_at_MinusStockTypes)
	QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MinusStockTypes)
	QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd)
	STK_t_ISOMovementType:=""
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Name:2; STK_at_MovementNames; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_TypeCodes)
			
			ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_MovementNames))
			
			For ($_l_Index; 1; Size of array:C274(STK_at_MovementNames))
				STK_al_CHooseElement{$_l_Index}:=$_l_Index
			End for 
			$_l_SelectedElement:=GEN_RequestViaPopUp(->STK_at_MovementNames; ->STK_al_CHooseElement; "Which type of stock receipt are you creating"; False:C215; ->STK_l_Create; "Stop"; "Continue")
			If ($_l_SelectedElement>0)
				STK_t_ISOMovementType:=STK_at_TypeCodes{$_l_SelectedElement}
			End if 
		Else 
			STK_t_ISOMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
		End if 
		If (STK_t_ISOMovementType#"")
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
			
			$_l_EnterMovementProcess:=New process:C317("STK_EnterMovementType"; 128000; "Enter Stock Movement"; STK_t_ISOMovementType; STK_T_PurchaseReference; STK_T_DeliveryReference)
			
			
			
		End if 
	Else 
		Gen_Alert("There is no movement type set up for receiving this stock")
	End if 
	
End if 
ERR_MethodTrackerReturn("STK_ReceiveFromOnOrder"; $_t_oldMethodName)
