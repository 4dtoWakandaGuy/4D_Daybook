//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_AssignDelivery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(STK_ad_DeliveryDates;0)
	ARRAY LONGINT:C221($_al_MovementItemIDS; 0)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY TEXT(STK_at_ChooseDelivery;0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	C_BOOLEAN:C305($_bo_Continue; STK_bo_Create; STK_bo_LineTrackerActive)
	C_DATE:C307($_d_DeliveryDate; Stk_D_DeliveryDate)
	C_LONGINT:C283($_l_ChosenElement; $_l_DeliveryIndex; $_l_MovementItemIndex; $_l_MovementItemRow)
	C_TEXT:C284($_t_DeliveryReference; $_t_oldMethodName; STK_T_DeliveryReference; STK_T_PurchaseReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_AssignDelivery")
If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=""; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
	If (Size of array:C274(STK_at_DeliveryReferences)>0)
		ARRAY TEXT:C222(STK_at_ChooseDelivery; 0)
		COPY ARRAY:C226(STK_at_DeliveryReferences; STK_at_ChooseDelivery)
		//APPEND TO ARRAY(STK_at_ChooseDelivery;"-")
		//APPEND TO ARRAY(STK_at_ChooseDelivery;"All Remaining Items")
		//APPEND TO ARRAY(STK_at_ChooseDelivery;"No Items Selection")
		ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_ChooseDelivery))
		
		For ($_l_DeliveryIndex; 1; Size of array:C274(STK_at_ChooseDelivery))
			STK_al_CHooseElement{$_l_DeliveryIndex}:=$_l_DeliveryIndex
		End for 
		$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_ChooseDelivery; ->STK_al_CHooseElement; "Set delivery reference"; True:C214; ->STK_bo_Create; "Stop"; "Continue")
		If (Not:C34(STK_bo_Create))
			If ($_l_ChosenElement>0)
				STK_T_DeliveryReference:=STK_at_ChooseDelivery{$_l_ChosenElement}
				Stk_D_DeliveryDate:=STK_ad_DeliveryDates{$_l_ChosenElement}
				STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
				$_bo_Continue:=True:C214
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=Stk_D_DeliveryDate)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=STK_T_DeliveryReference)
				If (STK_bo_LineTrackerActive)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
					For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
						$_l_MovementItemRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
						If ($_l_MovementItemRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
						End if 
					End for 
				End if 
				STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			End if 
		Else 
			$_t_DeliveryReference:=Gen_Request("What is the Delivery Reference "; "")
			If ($_t_DeliveryReference#"")
				$_d_DeliveryDate:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
				If ($_d_DeliveryDate#!00-00-00!)
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_DeliveryDate)
				End if 
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_DeliveryReference)
				If (STK_bo_LineTrackerActive)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
					For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
						$_l_MovementItemRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
						If ($_l_MovementItemRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
						End if 
					End for 
				End if 
				STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			End if 
		End if 
	Else 
		$_t_DeliveryReference:=Gen_Request("What is the Delivery Reference "; "")
		If ($_t_DeliveryReference#"")
			$_d_DeliveryDate:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
			If ($_d_DeliveryDate#!00-00-00!)
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_DeliveryDate)
			End if 
			APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_DeliveryReference)
			If (STK_bo_LineTrackerActive)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
				For ($_l_MovementItemIndex; 1; Size of array:C274($_al_MovementItemIDS))
					$_l_MovementItemRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
					If ($_l_MovementItemRow<0)
						APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemIndex})
					End if 
				End for 
			End if 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
		End if 
	End if 
Else 
	Gen_Alert("There are no remaining lines with quantities awaiting delivery!")
End if 
ERR_MethodTrackerReturn("STK_AssignDelivery"; $_t_oldMethodName)
