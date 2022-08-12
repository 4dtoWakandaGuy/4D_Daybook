//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI xUnalloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrentStockIDS; 0)
	ARRAY LONGINT:C221($_al_FromItemNumbers; 0)
	ARRAY LONGINT:C221($_al_FromMovementItemIDS; 0)
	ARRAY REAL:C219($_ar_FromItemQuanties; 0)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	ARRAY TEXT:C222($_at_AllocationStockTypesAdd; 0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305($_bo_Edits; $_bo_NoRecords; $_bo_ReadOnlyState; DB_bo_RecordModified; STK_bo_AllocTypesKnown)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ItemNumber; $_l_OrderItemNumber; $_l_RecordsinSelection; $_l_SelectedOrderItemNumber; $_l_StockItemID; $_l_UnallocateFromItems; $_l_UnallocateIndex)
	C_REAL:C285($_r_Cost; $_r_UnallocateQuantity)
	C_TEXT:C284($_t_CompanyTo; $_t_oldMethodName; $_t_OrderCode; $_t_productCode; DB_t_CallOnCloseorSave)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI xUnalloc")
//OrderI xUnalloc
//NG December 2014 this is not used the button it is on is not seen
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$CurentStock")

USE SET:C118("Userset")

If (Records in selection:C76([CURRENT_STOCK:62])>0)
	If (STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1))
		
		//ALERT(String(Records in selection([CURRENT STOCK])+" Records highlighted")
		$_bo_NoRecords:=True:C214
		
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$CurrentOISelection")
			
			$_l_SelectedOrderItemNumber:=Selected record number:C246([ORDER_ITEMS:25])
			$_bo_NoRecords:=False:C215
		End if 
		If (Not:C34(STK_bo_AllocTypesKnown))
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
			
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
			SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
			
			STK_bo_AllocTypesKnown:=True:C214
		End if 
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AllocationStockTypesAdd)
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5>0; *)
		QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>0)
		QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; $_at_AllocationStockTypesAdd)
		//ALERT(String(Records in selection([CURRENT STOCK])+" Records were allocatons")
		//QUERY SELECTION([CURRENT STOCK];[CURRENT STOCK]Item Number>0)
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
			READ WRITE:C146([STOCK_MOVEMENTS:40])
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			READ WRITE:C146([STOCK_LEVELS:58])
			READ WRITE:C146([CURRENT_STOCK:62])
			$_r_Cost:=0
			OK:=1
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
			If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
				Gen_Alert(Term_StoWT("Please create a Stock Movement Type suitable for Unallocations before using this")+"function"; "Cancel")
				OK:=0
			Else 
				//MESSAGES OFF
				SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockIDS)
				//QUERY WITH ARRAY([STOCK_MOVEMENT_ITEMS]x_Add_to_Current_Stock_ID;$_al_CurrentStockIDS)
				//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
				//QUERY WITH ARRAY([STOCK_MOVEMENT_ITEMS]x_Take_From_Current_Stock_ID;$_al_CurrentStockIDS)
				//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
				//UNLOAD RECORD([STOCK_MOVEMENT_ITEMS])
				//MESSAGES ON
				$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
				
				FIRST RECORD:C50([CURRENT_STOCK:62])
				RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
				RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
				//Create a Movement
				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
				Movement_Code
				[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
				[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
				
				If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
					[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [MOVEMENT_TYPES:60]Type_Code:1)
					[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
					[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
					[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
					[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
					[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
					While (Semaphore:C143("CurrentStock"+$_t_productCode))  //Prevent any other process from creating the same current stock
						ALERT:C41("in OrderI xUnalloc")
						//ALERT("Waiting for semaphore "+"CurrentStock"+[ORDER ITEMS]Product Code)
						DelayTicks(2)
					End while 
					$_t_productCode:=[ORDER_ITEMS:25]Product_Code:2
					$_l_ItemNumber:=[ORDER_ITEMS:25]Item_Number:27
					$_t_CompanyTo:=[ORDERS:24]Company_Code:1
					$_t_OrderCode:=[ORDERS:24]Order_Code:3
					For ($_l_UnallocateIndex; 1; $_l_RecordsinSelection)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CurrentStockIDS{$_l_UnallocateIndex})
						STK_UpdateCurrentStock2011
						If (OK=1)
							$_r_UnallocateQuantity:=[CURRENT_STOCK:62]Quantity:4
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_CurrentStockIDS{$_l_UnallocateIndex}; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>=1)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_FromMovementItemIDS; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_FromItemQuanties; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_FromItemNumbers)
							Else 
								ARRAY LONGINT:C221($_al_FromMovementItemIDS; 0)
							End if 
							If (Size of array:C274($_al_FromMovementItemIDS)>0)
								
								For ($_l_UnallocateFromItems; 1; Size of array:C274($_al_FromMovementItemIDS))
									
									If ($_r_UnallocateQuantity>0)
										CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
										RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
										RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
										[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
										
										[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$_t_productCode
										[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_ItemNumber
										//[STOCK ITEMS]Item Number:=[ORDER ITEMS]Item Number
										[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""  //$_t_CompanyTo
										[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""  //$_t_OrderCode
										//[STOCK_MOVEMENT_ITEMS]Serial_Number:=//"" //[CURRENT_STOCK]Serial_Number
										
										
										
										If ($_r_UnallocateQuantity>=($_ar_FromItemQuanties{$_l_UnallocateFromItems}))
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Gen_Round(($_ar_FromItemQuanties{$_l_UnallocateFromItems}); 2; 6)
										Else 
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Gen_Round(($_r_UnallocateQuantity); 2; 6)
										End if 
										$_r_UnallocateQuantity:=$_r_UnallocateQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										
										$_bo_Edits:=STK_SetHeaderInfo
										[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([CURRENT_STOCK:62]Cost_Price:6*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2)  //4.0.035/6
										
										$_r_Cost:=Round:C94(($_r_Cost+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
										[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
										[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_FromMovementItemIDS{$_l_UnallocateFromItems}
										$_l_StockItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										//QUERY([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_ID=$_al_FromMovementItemIDS{$_l_UnallocateFromItems})
										//STK_UpdateCalledOffQuantity
										//STK_UpdateCurrentStock2011
										
										If ($_l_StockItemID#[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_StockItemID)
										End if 
										$_bo_ReadOnlyState:=Read only state:C362([ORDER_ITEMS:25])
										READ WRITE:C146([ORDER_ITEMS:25])
										$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
										If ([ORDER_ITEMS:25]Item_Number:27#$_al_FromItemNumbers{$_l_UnallocateFromItems})
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_FromItemNumbers{$_l_UnallocateFromItems})
										End if 
										OrderI_Una2
										UNLOAD RECORD:C212([ORDER_ITEMS:25])
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
										If ($_bo_ReadOnlyState)
											READ ONLY:C145([ORDER_ITEMS:25])
										End if 
									End if 
								End for 
							End if 
							
							//Gen_Alert ("Order item Updated")
							//NEXT RECORD([CURRENT STOCK])
							
						Else 
							$_l_UnallocateIndex:=$_l_RecordsinSelection
						End if 
					End for 
					//End while
					CLEAR SEMAPHORE:C144("CurrentStock"+$_t_productCode)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
					
					
					[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
					DB_SaveRecord(->[STOCK_MOVEMENTS:40])
					
				Else 
					OK:=0
				End if 
				If (OK=1)
					DB_bo_RecordModified:=True:C214
					DB_t_CallOnCloseorSave:="File"
				Else 
					Gen_Alert("The Unallocation has been Cancelled"; "")
					CANCEL:C270
				End if 
			End if 
			READ ONLY:C145([STOCK_MOVEMENTS:40])
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			READ ONLY:C145([STOCK_LEVELS:58])
			READ ONLY:C145([CURRENT_STOCK:62])
			
		Else 
			Gen_Alert("Item(s) don't need unallocation"; "Cancel")
		End if 
		
		USE NAMED SELECTION:C332("$CurentStock")
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
		If (Not:C34($_bo_NoRecords))
			USE NAMED SELECTION:C332("$CurentStock")
			If (Selected record number:C246([ORDER_ITEMS:25])#$_l_SelectedOrderItemNumber)
				GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_SelectedOrderItemNumber)
			End if 
		End if 
	Else 
		Gen_Alert("This product has not had stock setup completed. Please complete this before unallocation  of stock")
	End if 
Else 
	USE NAMED SELECTION:C332("$CurentStock")
End if 
ERR_MethodTrackerReturn("OrderI xUnalloc"; $_t_oldMethodName)
