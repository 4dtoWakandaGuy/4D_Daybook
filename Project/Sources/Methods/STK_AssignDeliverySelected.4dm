//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_AssignDeliverySelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY DATE(STK_ad_DeliveryDates;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_MovementItemIDS; 0)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(STK_at_ChooseDelivery;0)
	//ARRAY TEXT(STK_at_DeliveryReferences;0)
	C_BOOLEAN:C305($_bo_Continue; STK_bo_Create; STK_bo_LineTrackerActive)
	C_DATE:C307($_d_Date; Stk_D_DeliveryDate)
	C_LONGINT:C283($_l_index; $_l_lineRow; $_l_MovementItemindex; $_l_selectedRow)
	C_POINTER:C301($_Ptr_ListBox)
	C_TEXT:C284($_t_oldMethodName; $_t_ReferenceName; STK_T_DeliveryReference; STK_T_PurchaseReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_AssignDeliverySelected")
If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
$_Ptr_ListBox:=->STK_LB_StockItems
ARRAY LONGINT:C221($_al_Lines; 0)
//$OK:=AL_GetSelect ($_Ptr_ListBox->;$_al_Lines)
LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
If (LBi_FindLines(->STK_aptr_ItemPreferences))
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=""; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		If (Size of array:C274(STK_at_DeliveryReferences)>0)
			ARRAY TEXT:C222(STK_at_ChooseDelivery; 0)
			COPY ARRAY:C226(STK_at_DeliveryReferences; STK_at_ChooseDelivery)
			//APPEND TO ARRAY(STK_at_ChooseDelivery;"-")
			//APPEND TO ARRAY(STK_at_ChooseDelivery;"All Remaining Items")
			//APPEND TO ARRAY(STK_at_ChooseDelivery;"No Items Selection")
			ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_ChooseDelivery))
			
			For ($_l_index; 1; Size of array:C274(STK_at_ChooseDelivery))
				STK_al_CHooseElement{$_l_index}:=$_l_index
			End for 
			$_l_selectedRow:=GEN_RequestViaPopUp(->STK_at_ChooseDelivery; ->STK_al_CHooseElement; "Set delivery reference"; True:C214; ->STK_bo_Create; "Stop"; "Continue")
			If (Not:C34(STK_bo_Create))
				If ($_l_selectedRow>0)
					STK_T_DeliveryReference:=STK_at_ChooseDelivery{$_l_selectedRow}
					STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
					Stk_D_DeliveryDate:=STK_ad_DeliveryDates{$_l_selectedRow}
					STK_T_PurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
					$_bo_Continue:=True:C214
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=Stk_D_DeliveryDate)
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=STK_T_DeliveryReference)
					If (STK_bo_LineTrackerActive)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
						For ($_l_MovementItemindex; 1; Size of array:C274($_al_MovementItemIDS))
							$_l_lineRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
							If ($_l_lineRow<0)
								APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
							End if 
						End for 
					End if 
					STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
				End if 
			Else 
				$_t_ReferenceName:=Gen_Request("What is the Delivery Reference "; "")
				If ($_t_ReferenceName#"")
					$_d_Date:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
					If ($_d_Date#!00-00-00!)
						APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_Date)
					End if 
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_ReferenceName)
					If (STK_bo_LineTrackerActive)
						SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
						For ($_l_MovementItemindex; 1; Size of array:C274($_al_MovementItemIDS))
							$_l_lineRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
							If ($_l_lineRow<0)
								APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
							End if 
						End for 
					End if 
					STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
				End if 
			End if 
		Else 
			$_t_ReferenceName:=Gen_Request("What is the Delivery Reference "; "")
			If ($_t_ReferenceName#"")
				$_d_Date:=Gen_RequestDate("What is the expected Date for this delivery"; Is date:K8:7; Current date:C33+2)
				If ($_d_Date#!00-00-00!)
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_d_Date)
				End if 
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=$_t_ReferenceName)
				If (STK_bo_LineTrackerActive)
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
					For ($_l_MovementItemindex; 1; Size of array:C274($_al_MovementItemIDS))
						$_l_lineRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
						If ($_l_lineRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_MovementItemindex})
						End if 
					End for 
				End if 
				STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			End if 
		End if 
	Else 
		Gen_Alert("There are no remaining lines with quantities awaiting delivery!")
	End if 
End if 
ERR_MethodTrackerReturn("STK_AssignDeliverySelected"; $_t_oldMethodName)
