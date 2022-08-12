//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CancelReceipt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/06/2012 12:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_AddtoOrdetItemNumber; 0)
	ARRAY LONGINT:C221($_al_MovementItemIDS; 0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY REAL:C219($_ar_AddQuantity; 0)
	C_BOOLEAN:C305($_bo_CanCancel; STK_bo_LineTrackerActive)
	C_LONGINT:C283($_l_CopiedFromID; $_l_index; $_l_Index2; $_l_indexD; $_l_indexnsert; $_l_insert; $_l_ModifiedRow; $_l_RecordinSelection)
	C_POINTER:C301($_Ptr_ListBox)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("STK_CancelReceipt")

If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
$_Ptr_ListBox:=->STK_LB_StockItems
ARRAY LONGINT:C221($_al_Lines; 0)
//$OK:=AL_GetSelect ($_Ptr_ListBox->;$_al_Lines)
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CurrentSelection")
If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
End if 
If ([MOVEMENT_TYPES:60]UseForStockReceipt:33=True:C214)
	Gen_Confirm("This function will cancel the receipt and restore the on order stock(if from on order). Do you wish to continue"; "Yes"; "No")
	If (OK=1)
		LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
		If (LBi_FindLines($_Ptr_ListBox))
			COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$APPLY")
			$_l_RecordinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			For ($_l_index; 1; $_l_RecordinSelection)
				USE NAMED SELECTION:C332("$APPLY")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_index)
				$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				$_l_indexD:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_indexD)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$APPLY2")
					$_bo_CanCancel:=True:C214
					For ($_l_Index2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
							$_bo_CanCancel:=False:C215
							Gen_Alert("This item has been allocated and the allocation has had further action(such as delivery) so cannot be undone, cancellation of this item will not happen")
						End if 
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					ARRAY LONGINT:C221($_al_AddtoOrdetItemNumber; 0)  //this will the sales order items that get added back onto the PO -thhe
					ARRAY REAL:C219($_ar_AddQuantity; 0)
					If ($_bo_CanCancel)
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						
						For ($_l_Index2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							USE NAMED SELECTION:C332("$APPLY2")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_index)
							
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
							If ([MOVEMENT_TYPES:60]Alloc_Type:10)
								//Gen_Confirm ("The received stock item has been allocated to sales order, do you wish to undo this allocation?";"Yes";"No")
								
								APPEND TO ARRAY:C911($_al_AddtoOrdetItemNumber; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
								APPEND TO ARRAY:C911($_ar_AddQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								
								//set the alocated quantity to zero and take the copied from off. we will return to this item -and ajust the current stock
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
								SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])  //This will cause the stock watcher to see this record and check the called off on the old copied from item
								//this is not done in a transacion?
								
								If ($_l_CopiedFromID>0)  // / January 2015-this is a place we do need to do this
									STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
								End if 
								
							Else 
								//its not an allocation-this could be a delivery or anything.
								
							End if 
							
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
							
						End for 
						
					End if 
					
				Else 
					$_bo_CanCancel:=True:C214
					
				End if 
				If ($_bo_CanCancel)
					USE NAMED SELECTION:C332("$APPLY")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_index)
					$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
					If ($_l_CopiedFromID>0)  // January 2015 this is somewhere we DO want to do this
						STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
					End if 
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=0
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					If ($_l_CopiedFromID>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromID)
						If (Size of array:C274($_al_AddtoOrdetItemNumber)>0)
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_al_AddtoOrdetItemNumber{1}
							If ($_ar_AddQuantity{1}#[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								//$Split:=True
							End if 
							SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
							
							STK_UpdateCalledOffQuantity(-$_l_CopiedFromID)
						End if 
						
					End if 
					
					
				End if 
			End for 
			If (STK_bo_LineTrackerActive)
				SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_MovementItemIDS)
				For ($_l_insert; 1; Size of array:C274($_al_MovementItemIDS))
					$_l_ModifiedRow:=Find in array:C230(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_insert})
					If ($_l_ModifiedRow<0)
						APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; $_al_MovementItemIDS{$_l_insert})
					End if 
				End for 
			End if 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			
			
		End if 
	End if 
End if 

USE NAMED SELECTION:C332("$CurrentSelection")
ERR_MethodTrackerReturn("STK_CancelReceipt"; $_t_oldMethodName)