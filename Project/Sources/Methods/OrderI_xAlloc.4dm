//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_xAlloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/11/2010 06:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrentStockRecordIDS; 0)
	ARRAY LONGINT:C221($_al_SMIIDSFrom; 0)
	ARRAY LONGINT:C221($_al_SMIStockNumbers; 0)
	ARRAY REAL:C219($_ar_SMICostPrices; 0)
	ARRAY REAL:C219($_ar_SMIQuantiesFrom; 0)
	ARRAY TEXT:C222($_at_SMILocations; 0)
	ARRAY TEXT:C222($_at_SMSerialNumbers; 0)
	C_BOOLEAN:C305($_bo_Edits; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_RecordsinSelection; $_l_SMIIndex; $_l_StockMovementItemID; $_l_UnallocateIndex; vRecNo)
	C_REAL:C285($_r_Allocated; $_r_Cost; $_r_Quantity)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_xAlloc")
//OrderI_xAlloc - Allocate Stock Items to Order Items
//NG December 2014 this is not used-the button this is on is not seen
If (Record number:C243([ORDER_ITEMS:25])#vRecNo)
	GOTO RECORD:C242([ORDER_ITEMS:25]; vRecNo)
End if 
If ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3)
	If (STK_IsProductAnalysed([ORDER_ITEMS:25]Product_Code:2))
		
		USE SET:C118("Userset")
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			If ([ORDER_ITEMS:25]Product_Code:2=[CURRENT_STOCK:62]Product_Code:1)
				RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockRecordIDS)
					//QUERY WITH ARRAY([STOCK_MOVEMENT_ITEMS]x_Add_to_Current_Stock_ID;$_al_CurrentStockRecordIDS)
					MESSAGES OFF:C175
					//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
					//QUERY WITH ARRAY([STOCK_MOVEMENT_ITEMS]x_Take_From_Current_Stock_ID;$_al_CurrentStockRecordIDS)
					//APPLY TO SELECTION([STOCK_MOVEMENT_ITEMS];STK_UpdateCalledOffQuantity )
					MESSAGES ON:C181
					$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
					READ WRITE:C146([STOCK_MOVEMENTS:40])
					READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
					READ WRITE:C146([STOCK_LEVELS:58])
					READ WRITE:C146([CURRENT_STOCK:62])
					
					$_r_Cost:=0
					OK:=1
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
						Gen_Alert(Term_StoWT("Please create a Stock Movement Type suitable for Allocations before using this ")+"function"; "Cancel")
						OK:=0
					Else 
						//Create a Movement
						CREATE RECORD:C68([STOCK_MOVEMENTS:40])
						Movement_Code
						[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
						[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
						If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
							[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
							
							[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
							[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
							[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
							[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
							[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
							
							//Add the Stock Items
							For ($_l_UnallocateIndex; 1; $_l_RecordsinSelection)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_al_CurrentStockRecordIDS{$_l_UnallocateIndex})
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_al_CurrentStockRecordIDS{$_l_UnallocateIndex}; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SMIIDSFrom; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; $_ar_SMIQuantiesFrom; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_ar_SMICostPrices; [STOCK_MOVEMENT_ITEMS:27]Location:7; $_at_SMILocations; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SMSerialNumbers; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9; $_al_SMIStockNumbers)
								
								$_r_Allocated:=ORDERI_GetAllocated
								For ($_l_SMIIndex; 1; Size of array:C274($_al_SMIIDSFrom))
									If (OK=1) & ($_r_Allocated<[ORDER_ITEMS:25]Quantity:3)
										//While ((Not(End selection([CURRENT STOCK]))) & ([ORDER ITEMS]Allocated<[ORDER ITEMS]Quantity) & (OK=1))
										
										CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
										[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
										[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[ORDER_ITEMS:25]Item_Number:27
										[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
										[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
										[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_at_SMSerialNumbers{$_l_SMIIndex}
										$_r_Quantity:=Gen_Round(([ORDER_ITEMS:25]Quantity:3-$_r_Allocated); 2; 6)
										If ($_r_Quantity>$_ar_SMIQuantiesFrom{$_l_SMIIndex})
											$_r_Quantity:=$_ar_SMIQuantiesFrom{$_l_SMIIndex}
										End if 
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Quantity
										$_r_Allocated:=$_r_Allocated+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_bo_Edits:=STK_SetHeaderInfo
										If ($_ar_SMICostPrices{$_l_SMIIndex}>0)
											[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_ar_SMICostPrices{$_l_SMIIndex}
										Else 
											[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
										End if 
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*$_r_Quantity); 2; 2)
										
										[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_at_SMILocations{$_l_SMIIndex}
										[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=$_al_SMIStockNumbers{$_l_SMIIndex}
										[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
										[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_SMIIDSFrom{$_l_SMIIndex}
										$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
										
										RELATE ONE:C42([CURRENT_STOCK:62]Stock_Type:3)
										
									Else 
										$_l_UnallocateIndex:=$_l_RecordsinSelection
									End if 
								End for 
							End for 
							//End while
							
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
							[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
							DB_SaveRecord(->[STOCK_MOVEMENTS:40])
							If ([STOCK_TYPES:59]Allocated:6)
								[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							End if 
							If (OK=1)
								//Post to Current Stock
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
								OrderI_AllCSUp
								If (OK=1)
									//Update the Order Item
									OrderI_AllOIUp
								End if 
							End if 
						Else 
							OK:=0
						End if 
						If (OK=1)
							DB_bo_RecordModified:=True:C214
							DB_t_CallOnCloseorSave:="File"
						Else 
							Gen_Alert("The Allocation has been Cancelled"; "")
							CANCEL:C270
						End if 
					End if 
					READ ONLY:C145([STOCK_MOVEMENTS:40])
					READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
					READ ONLY:C145([STOCK_LEVELS:58])
					READ ONLY:C145([CURRENT_STOCK:62])
				Else 
					Gen_Alert("Unallocate Items before re-allocation"; "Cancel")
				End if 
			Else 
				Gen_Alert(Term_StoWT("You have selected a Current Stock record with the wrong Product"); "Cancel")
			End if 
		End if 
		OrderI_AllStSr2
	Else 
		Gen_Alert("This product "+[ORDER_ITEMS:25]Product_Code:2+" has not had stock updated. Please complete this before allocation of stock")
	End if 
	
Else 
	Gen_Alert("This Order Item doesn't require allocation"; "Cancel")
End if 
ERR_MethodTrackerReturn("OrderI_xAlloc"; $_t_oldMethodName)
