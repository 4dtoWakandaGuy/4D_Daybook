//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_CancelPurchaseOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/01/2014 17:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_CHooseElement;0)
	ARRAY TEXT:C222($_at_CheckedStockMovements; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderNumbers; 0)
	ARRAY TEXT:C222($_at_SalesOrderCodes; 0)
	ARRAY TEXT:C222($_at_StockPurchaseOrderNumbers; 0)
	ARRAY TEXT:C222($_at_ValidPurchaseOrderNumbers; 0)
	//ARRAY TEXT(STK_at_MovementNames;0)
	//ARRAY TEXT(STK_at_TypeCodes;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoPOMCheck; $_bo_WarningGiven; STK_l_Create)
	C_LONGINT:C283($_l_ChosenElement; $_l_CountPORecords; $_l_MovementNamesIndex; $_l_NewProcess; $_l_RecordsInSelectionPOS; $_l_SalesOrdersIndex; $_l_StockPOIndex; vAB)
	C_TEXT:C284($_t_MovementCode; $_t_MovementTypeCode; $_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract; $_t_oldMethodName; $_t_OrderNumbersString; $_t_StockMovementCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_CancelPurchaseOrder")


CREATE SET:C116([PURCHASE_ORDERS:57]; "$temp")

vAB:=1
If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
	If (Records in set:C195("ListboxSet0")>0)
		Gen_Confirm("Use Highlighted Selection"; "No"; "Yes")
	End if 
	$_bo_Continue:=False:C215
	If (OK=1)  // use all records on screen
		$_l_RecordsInSelectionPOS:=Records in selection:C76([PURCHASE_ORDERS:57])
		
		Gen_Confirm("This will Auto Complete "+String:C10($_l_RecordsInSelectionPOS)+"."+" Are you sure you want to continue?"; "No"; "Yes")
		If (OK=0)
			$_bo_Continue:=True:C214
		End if 
		
	Else 
		If (Records in set:C195("ListboxSet0")>0)
			USE SET:C118("ListboxSet0")
			$_l_RecordsInSelectionPOS:=Records in selection:C76([PURCHASE_ORDERS:57])
			
			Gen_Confirm("This will Auto Complete "+String:C10($_l_RecordsInSelectionPOS)+"."+" Are you sure you want to continue?"; "No"; "Yes")
			If (OK=0)
				$_bo_Continue:=True:C214
			End if 
		End if 
		
	End if 
	If ($_bo_Continue)
		COPY NAMED SELECTION:C331([PURCHASE_ORDERS:57]; "$POSelection")
		$_l_CountPORecords:=Records in selection:C76([PURCHASE_ORDERS:57])
		
		SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNumbers)
		QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_PurchaseOrderNumbers)
		ARRAY TEXT:C222($_at_ValidPurchaseOrderNumbers; 0)
		
		$_bo_WarningGiven:=False:C215
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="O")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "STOCK_MOVEMENT_ITEMS")
		DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; $_at_StockPurchaseOrderNumbers)
		For ($_l_StockPOIndex; 1; Size of array:C274($_at_PurchaseOrderNumbers))
			If (Find in array:C230($_at_StockPurchaseOrderNumbers; $_at_PurchaseOrderNumbers{$_l_StockPOIndex})<0)
				APPEND TO ARRAY:C911($_at_ValidPurchaseOrderNumbers; $_at_PurchaseOrderNumbers{$_l_StockPOIndex})
			End if 
		End for 
		$_l_RecordsInSelectionPOS:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		$_t_OrderNumbersString:=""
		
		If ($_l_RecordsInSelectionPOS>0)
			Gen_Confirm("There is stock on these Purchase orders, do you wish to auto cancel it first?"; "No"; "Yes")
			If (OK=0)
				OK:=1
				$_bo_NoPOMCheck:=False:C215
				ARRAY TEXT:C222($_at_CheckedStockMovements; 0)
				For ($_l_StockPOIndex; 1; $_l_RecordsInSelectionPOS)
					USE NAMED SELECTION:C332("STOCK_MOVEMENT_ITEMS")
					GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_StockPOIndex)
					If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
						If (Find in array:C230($_at_CheckedStockMovements; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)<0)
							$_t_StockMovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
							APPEND TO ARRAY:C911($_at_CheckedStockMovements; $_t_StockMovementCode)
							USE NAMED SELECTION:C332("STOCK_MOVEMENT_ITEMS")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_StockMovementCode)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "WithResidual")
							
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								//$_bo_WarningGiven:=True
								//Gen_Alert ("This will only cancel items not allocated to sales orders";"Continue")
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Order_Code:3; $_at_SalesOrderCodes)
								For ($_l_SalesOrdersIndex; 1; Size of array:C274($_at_SalesOrderCodes))
									If ($_t_OrderNumbersString="")
										$_t_OrderNumbersString:=$_at_SalesOrderCodes{$_l_SalesOrdersIndex}
									Else 
										
										$_t_OrderNumbersString:=$_t_OrderNumbersString+", "+$_at_SalesOrderCodes{$_l_SalesOrdersIndex}
									End if 
								End for 
								If (OK=0)
									USE SET:C118("WithResidual")
									QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
									CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "WithResidual")
									
								End if 
								OK:=1
							Else 
								USE NAMED SELECTION:C332("STOCK_MOVEMENT_ITEMS")
								If (Find in array:C230($_at_ValidPurchaseOrderNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)<0)
									APPEND TO ARRAY:C911($_at_ValidPurchaseOrderNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
								End if 
							End if 
							
							USE SET:C118("WithResidual")
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "WithResidual")
							///these are the items we are going to cancel
							QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_t_StockMovementCode)
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
							$_t_MovementTypeCode:=""
							If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
								If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
									QUERY SELECTION:C341([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd)
									If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
										If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
											SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Name:2; STK_at_MovementNames; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_TypeCodes)
											
											ARRAY LONGINT:C221(STK_al_CHooseElement; Size of array:C274(STK_at_MovementNames))
											
											For ($_l_MovementNamesIndex; 1; Size of array:C274(STK_at_MovementNames))
												STK_al_CHooseElement{$_l_MovementNamesIndex}:=$_l_MovementNamesIndex
											End for 
											$_l_ChosenElement:=GEN_RequestViaPopUp(->STK_at_MovementNames; ->STK_al_CHooseElement; "Which type of cancellation are you creating"; False:C215; ->STK_l_Create; "Stop"; "Continue")
											If ($_l_ChosenElement>0)
												$_t_MovementTypeCode:=STK_at_TypeCodes{$_l_ChosenElement}
											End if 
										Else 
											$_t_MovementTypeCode:=[MOVEMENT_TYPES:60]Type_Code:1
											
										End if 
									Else 
										Gen_Alert("The stock movemement types for cancelling on order items are not set up correctly.there are none that subtract from "+$_t_MovementTypeStockAdd+" to be used with a "+[STOCK_MOVEMENTS:40]Movement_Type:6)
										
									End if 
								Else 
									If ([MOVEMENT_TYPES:60]Stock_Minus:4=$_t_MovementTypeStockAdd)
										$_t_MovementTypeCode:=[MOVEMENT_TYPES:60]Type_Code:1
										
									Else 
										Gen_Alert("The stock movemement type for cancelling on order items is not set up correctly. It will subtract from stock type "+[MOVEMENT_TYPES:60]Stock_Minus:4+" and should subtract from "+$_t_MovementTypeStockAdd+" to be used with a "+[STOCK_MOVEMENTS:40]Movement_Type:6)
									End if 
								End if 
							Else 
								Gen_Alert("No movement type has been set up to cancel on order items")
								$_l_StockPOIndex:=$_l_RecordsInSelectionPOS
							End if 
							If ($_t_MovementTypeCode#"") & (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								
								$_t_MovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
								If (Find in array:C230($_at_ValidPurchaseOrderNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)<0)
									APPEND TO ARRAY:C911($_at_ValidPurchaseOrderNumbers; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
								End if 
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "◊StockItemstoAction")
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								
								$_l_NewProcess:=New process:C317("STK_EnterMovementType"; 128000; "Enter Stock Movement"; $_t_MovementTypeCode; $_t_MovementCode; ""; "◊StockItemstoAction")
								While ((Process state:C330($_l_NewProcess)>=0) & (Process_Name($_l_NewProcess)="Enter Stock Movement"))
									
									DELAY PROCESS:C323(Current process:C322; 4*60)
								End while 
							End if 
						End if 
						
						
					End if 
				End for 
				If ($_t_OrderNumbersString#"")
					Gen_Alert("The following sales order numbers have stock allocated from these Purchase Orders, you will need to unallocate the stock before you can cancel the purchase order Movement "+Char:C90(13)+$_t_OrderNumbersString)
				End if 
			Else 
				$_bo_NoPOMCheck:=True:C214
				COPY ARRAY:C226($_at_PurchaseOrderNumbers; $_at_ValidPurchaseOrderNumbers)
			End if 
		Else 
			COPY ARRAY:C226($_at_PurchaseOrderNumbers; $_at_ValidPurchaseOrderNumbers)
		End if 
		OK:=1  //`now we will set the POs to completed.
		READ WRITE:C146([PURCHASE_ORDERS:57])
		//COPY NAMED SELECTION([PURCHASE_ORDERS];"$POSelection")
		//$_l_CountPORecords:=Records in selection([PURCHASE_ORDERS])
		
		For ($_l_StockPOIndex; 1; $_l_CountPORecords)
			If (Not:C34($_bo_NoPOMCheck))
				If ($_l_StockPOIndex<=Size of array:C274($_at_PurchaseOrderNumbers))
					If (Find in array:C230($_at_ValidPurchaseOrderNumbers; $_at_PurchaseOrderNumbers{$_l_StockPOIndex})>0)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20=$_at_PurchaseOrderNumbers{$_l_StockPOIndex})
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="O"; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO"; *)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
								QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_at_PurchaseOrderNumbers{$_l_StockPOIndex})
								[PURCHASE_ORDERS:57]Record_State:19:="057120"
								SAVE RECORD:C53([PURCHASE_ORDERS:57])
							End if 
						End if 
						
					Else 
						
					End if 
				End if 
			End if 
		End for 
		UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
	End if 
End if 
USE SET:C118("$temp")
ERR_MethodTrackerReturn("PO_CancelPurchaseOrder"; $_t_oldMethodName)
