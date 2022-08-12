//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UndoDelivery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/06/2012 14:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY TEXT:C222($_at_OrderItemDeliveryNumbers; 0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Reselect; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_ALOReference; $_l_AlterCount; $_l_AlterIndex; $_l_OrderItemIndex; $_l_OrderItemTableRow)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_REAL:C285($_r_TakeOff)
	C_TEXT:C284($_t_HighlightSetName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UndoDelivery")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		
		
		Menu_Record("OrderI_AllocAut"; "Allocate - Auto")
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		If (DB_t_CurrentFormUsage#"NA@")  //((DB_t_CurrentFormUsage#"NA@") | (◊SalesAlloc=True))
			$_bo_Reselect:=False:C215
			If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
				$_bo_Reselect:=False:C215
				If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
					$_l_OrderItemTableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
					If ($_l_OrderItemTableRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemTableRow}
						$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
						$_t_HighlightSetName:=$_ptr_HighlightSet->
						$_bo_Reselect:=False:C215
						If ($_t_HighlightSetName#"")
							If (Records in set:C195($_t_HighlightSetName)>0)
								USE SET:C118($_t_HighlightSetName)
								CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
								$_bo_Reselect:=True:C214
							End if 
						End if 
					Else 
						$_bo_Reselect:=False:C215
					End if 
				End if 
				If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Number:49#"")
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						Gen_Confirm("Are you sure you wish to undo the delivery references on these order items?")
						If (OK=1)
							
							SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Delivery_Number:49; $_at_OrderItemDeliveryNumbers; [ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
							For ($_l_OrderItemIndex; 1; Size of array:C274($_al_OrderItemNumbers))
								READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_OrderItemNumbers{$_l_OrderItemIndex}; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45=$_at_OrderItemDeliveryNumbers{$_l_OrderItemIndex})
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$undoDelivery")
									$_r_TakeOff:=0
									$_l_AlterCount:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									For ($_l_AlterIndex; 1; $_l_AlterCount)
										
										USE NAMED SELECTION:C332("$undoDelivery")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_AlterIndex)
										While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0)))
											
											
											DelayTicks(2)
										End while 
										
										$_r_TakeOff:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12+$_r_TakeOff
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=0
										
										[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
										$_l_ALOReference:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										If ($_l_ALOReference>0)
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_ALOReference)
											While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0)))
												DelayTicks(2)
											End while 
											[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18-$_r_TakeOff
											//TRACE
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											STK_UpdateCalledOffQuantity
											
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										End if 
										//NEXT RECORD([STOCK ITEMS])
										
									End for 
									If ($_r_TakeOff>0)
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumbers{$_l_OrderItemIndex})
										[ORDER_ITEMS:25]Delivered:51:=[ORDER_ITEMS:25]Delivered:51-$_r_TakeOff
										[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
										[ORDER_ITEMS:25]Delivery_Number:49:=""
										SAVE RECORD:C53([ORDER_ITEMS:25])
									End if 
									
								End if 
								
							End for 
							
						End if 
						
					Else 
						Gen_Alert("The selected lines do not have a delivery number on them")
						
						
					End if 
					USE NAMED SELECTION:C332("$Temp")
					//Gen_Alert ("Please close the  order screen and re-open to see the updated order items")
					
					
				End if 
			End if 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_UndoDelivery"; $_t_oldMethodName)
