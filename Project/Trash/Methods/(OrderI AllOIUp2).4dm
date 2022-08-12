//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_AllOIUp2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/04/2010 12:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_SMQuantity; 0)
	ARRAY REAL:C219($_ar_SMtotalCost; 0)
	ARRAY TEXT:C222($_at_AddStockType; 0)
	ARRAY TEXT:C222($_at_MTaddtoStockType; 0)
	ARRAY TEXT:C222($_at_SMSerialNumber; 0)
	ARRAY TEXT:C222($_at_ValidMovementTypes; 0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_ZeroWarning)
	C_LONGINT:C283($_l_CurrentStockID; $_l_index; $_l_SizeofArray; $2)
	C_POINTER:C301($4; $5; $6; $7)
	C_REAL:C285($_r_AllocatedQuantity; $_r_AverageCost; $_r_CostAmount; $_r_Quantity; $_r_StockQty; $_r_TotalAllocated; $_r_UnallocatedQuantity; $_r_UnallocatedTotalValue; vTot)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode; $_t_SerialNumber; $1; $8; PRD_t_FurtherApplicable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllOIUp2")
//OrderI_AllOIUp2
//Called from both Allocation & UnAllocation procs
//TRACE
$_bo_ZeroWarning:=False:C215
$_r_UnallocatedQuantity:=0
If (Count parameters:C259=0)
	
	If ([ORDER_ITEMS:25]Item_Number:27=0)
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
	Else 
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=[ORDER_ITEMS:25]Item_Number:27)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
		$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
		
	End if 
Else 
	//Actually all this is now not needed its always the stock items
	If (Count parameters:C259<3)
		If ($1#"") | ($2>0)
			If ($2>0)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$2)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$2)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
			Else 
				If ([CURRENT_STOCK:62]UniqueConstruct:14#$1)  //bsw 2/06/04 was $CurrentStockIdent instead of $1
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$1)
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CurrentStockID)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
					$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				End if 
			End if 
			
			
		Else 
			
			If ([ORDER_ITEMS:25]Item_Number:27=0)
				REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
				$_r_UnallocatedQuantity:=0
			Else 
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=[ORDER_ITEMS:25]Item_Number:27)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
				
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				
				//OrdDel_AllowSrc   `this is double-checked below but the search is impt
			End if 
		End if 
	Else 
		If ($1#"") | ($2>0)
			If ($2>0)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$2)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$2)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
			Else 
				If ([CURRENT_STOCK:62]UniqueConstruct:14#$1)  //bsw 2/06/04 was $CurrentStockIdent instead of $1
					QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$1)
					$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=$_l_CurrentStockID)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
					$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=$_l_CurrentStockID)
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				End if 
			End if 
			
			
		Else 
			
			If ([ORDER_ITEMS:25]Item_Number:27=0)
				REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
			Else 
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=[ORDER_ITEMS:25]Item_Number:27)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				$_r_UnallocatedQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				$_r_UnallocatedTotalValue:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MTaddtoStockType)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_ValidMovementTypes)
				
				//OrdDel_AllowSrc   `this is double-checked below but the search is impt
			End if 
			
		End if 
		
	End if 
End if 

//check the Incl in Allocated check box - 4.0.036b
Case of 
	: (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
		If (Count parameters:C259>=4)
			$4->:=0
		Else 
			[ORDER_ITEMS:25]Allocated:28:=0
		End if 
		If (Count parameters:C259>=5)
			$5->:=0
		Else 
			[ORDER_ITEMS:25]Cost_Amount:15:=0
		End if 
		If (Count parameters:C259>=6)
			$6->:=""
		Else 
			[ORDER_ITEMS:25]Serial_Number:24:=""
		End if 
		If (Count parameters:C259<4)
			Calc_Item  //else we do this when we update the record(from the trigger?)
		End if 
	: (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[STOCK_TYPES:59]Type_Code:1)
			QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
		End if 
		If ([STOCK_TYPES:59]Allocated:6)
			If (Count parameters:C259>=4)
				$4->:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity; 2; 6)
			Else 
				[ORDER_ITEMS:25]Allocated:28:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity; 2; 6)
				
			End if 
			If (Count parameters:C259>=5)
				$5->:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13-$_r_UnallocatedTotalValue; -2; 2)
			Else 
				[ORDER_ITEMS:25]Cost_Amount:15:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13-$_r_UnallocatedTotalValue; 2; 2)
			End if 
			
			If (Count parameters:C259>=7)
				$7->:=Gen_Round([ORDER_ITEMS:25]Cost_Amount:15; 2; 2)
			Else 
				[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round([ORDER_ITEMS:25]Cost_Amount:15; 2; 2)
			End if 
			
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				If (Count parameters:C259>=7)
					$_r_CostAmount:=$5->
					$7->:=Gen_Round(($_r_CostAmount/([STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity)); 2; 2)
					
				Else 
					$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity
					$_r_AverageCost:=[ORDER_ITEMS:25]Cost_Amount:15/$_r_Quantity
					[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round($_r_AverageCost; 2; 2)
					
				End if 
			Else 
				If (Count parameters:C259>=7)
					$7->:=0
				Else 
					[ORDER_ITEMS:25]Cost_Price:5:=0
				End if 
			End if 
			If (Count parameters:C259<4)
				Calc_Item
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				If (Count parameters:C259>=8)
					$_t_productCode:=$8
				Else 
					$_t_productCode:=[ORDER_ITEMS:25]Product_Code:2
				End if 
				If ([PRODUCTS:9]Product_Code:1#$_t_productCode)
					//RELATE ONE([ORDER ITEMS]Product Code)
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
				End if 
				If (([PRODUCTS:9]Serial_Numbered:17) & ([CURRENT_STOCK:62]Quantity:4#0))
					If (Count parameters:C259>=6)
						$6->:=[CURRENT_STOCK:62]Serial_Number:2
					Else 
						[ORDER_ITEMS:25]Serial_Number:24:=[CURRENT_STOCK:62]Serial_Number:2
					End if 
				End if 
			End if 
		Else 
			If (Count parameters:C259>=4)
				$4->:=0
			Else 
				[ORDER_ITEMS:25]Allocated:28:=0
			End if 
			If (Count parameters:C259>=5)
				$5->:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13-$_r_UnallocatedTotalValue; -2; 2)
			Else 
				[ORDER_ITEMS:25]Cost_Amount:15:=Gen_Round([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13-$_r_UnallocatedTotalValue; 2; 2)
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>0)
				If (Count parameters:C259>=7)
					$_r_CostAmount:=$5->
					$7->:=Gen_Round(($_r_CostAmount/([STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity)); 2; 2)
					
				Else 
					$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_UnallocatedQuantity
					$_r_AverageCost:=[ORDER_ITEMS:25]Cost_Amount:15/$_r_Quantity
					[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round($_r_AverageCost; 2; 2)
					
				End if 
			Else 
				If (Count parameters:C259>=7)
					$7->:=0
				Else 
					[ORDER_ITEMS:25]Cost_Price:5:=0
				End if 
			End if 
			If (Count parameters:C259<4)
				Calc_Item
			End if 
			If (Count parameters:C259>=6)
				$6->:=""
			Else 
				[ORDER_ITEMS:25]Serial_Number:24:=""
			End if 
			If (Count parameters:C259<4)
				Calc_Item
			End if 
		End if 
		
	Else 
		If (True:C214)
			//APPLY TO SELECTION([STOCK ITEMS];STK_UpdateCalledOffQuantity )
			ARRAY TEXT:C222($_at_AddStockType; 0)
			ARRAY TEXT:C222($_at_SMSerialNumber; 0)
			ARRAY REAL:C219($_ar_SMQuantity; 0)
			ARRAY REAL:C219($_ar_SMtotalCost; 0)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddStockType; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; $_ar_SMQuantity; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13; $_ar_SMtotalCost; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SMSerialNumber)
			SORT ARRAY:C229($_at_AddStockType; $_ar_SMQuantity; $_ar_SMtotalCost; $_at_SMSerialNumber; >)
			$_l_SizeofArray:=Size of array:C274($_at_AddStockType)
			If (Count parameters:C259>=4)
				$4->:=0
			Else 
				[ORDER_ITEMS:25]Allocated:28:=0
			End if 
			If (Count parameters:C259>=5)
				$5->:=0
			Else 
				[ORDER_ITEMS:25]Cost_Amount:15:=0
			End if 
			
			
			$_r_StockQty:=0
			If (Count parameters:C259>=5)
				$_r_CostAmount:=$5->
			Else 
				$_r_CostAmount:=[ORDER_ITEMS:25]Cost_Amount:15
			End if 
			If (Count parameters:C259>=4)
				
				$_r_AllocatedQuantity:=$4->
			Else 
				$_r_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
			End if 
			For ($_l_index; 1; $_l_SizeofArray)
				If ($_ar_SMQuantity{$_l_index}#0)
					If ($_at_AddStockType{$_l_index}#[STOCK_TYPES:59]Type_Code:1)
						QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$_at_AddStockType{$_l_index})
					End if 
					If (Count parameters:C259>=5)
						$_r_CostAmount:=$_r_CostAmount+$_ar_SMtotalCost{$_l_index}
					Else 
						$_r_CostAmount:=$_r_CostAmount+$_ar_SMtotalCost{$_l_index}
					End if 
					$_r_StockQty:=$_r_StockQty+$_ar_SMQuantity{$_l_index}
					If ([STOCK_TYPES:59]Allocated:6)
						If (Count parameters:C259>=4)
							$_r_AllocatedQuantity:=$_r_AllocatedQuantity+$_ar_SMQuantity{$_l_index}
						Else 
							$_r_AllocatedQuantity:=$_r_AllocatedQuantity+$_ar_SMQuantity{$_l_index}
						End if 
					Else 
						// $_ar_SMQuantity{$_l_index}:=0  `to avoid the Serial No bit below having to check again
					End if 
				End if 
			End for 
			
			$_r_TotalAllocated:=Gen_Round($_r_AllocatedQuantity-$_r_UnallocatedQuantity; 2; 6)
			If (Count parameters:C259>=4)
				$4->:=Gen_Round($_r_AllocatedQuantity-$_r_UnallocatedQuantity; 2; 6)
			Else 
				[ORDER_ITEMS:25]Allocated:28:=Gen_Round($_r_AllocatedQuantity-$_r_UnallocatedQuantity; 2; 6)
				//[ORDER ITEMS]Allocated:=Gen_Round ($_r_AllocatedQuantity;2;6)
			End if 
			//$_r_UnallocatedQuantity:=Sum([STOCK ITEMS]Quantity)
			//$_r_UnallocatedTotalValue:=Sum([STOCK ITEMS]Total Cost)
			If (Count parameters:C259>=5)
				$5->:=Gen_Round($_r_CostAmount-$_r_UnallocatedTotalValue; 2; 2)
			Else 
				[ORDER_ITEMS:25]Cost_Amount:15:=Gen_Round($_r_CostAmount-$_r_UnallocatedTotalValue; 2; 2)
			End if 
			
			If ($_r_TotalAllocated>0)
				If (Count parameters:C259>=7)
					$7->:=Gen_Round(($_r_CostAmount/($_r_StockQty)-$_r_UnallocatedQuantity); 2; 2)
				Else 
					[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round(([ORDER_ITEMS:25]Cost_Amount:15/($_r_StockQty-$_r_UnallocatedQuantity)); 2; 2)
				End if 
			Else 
				//Get the price from the product..
				If ([ORDER_ITEMS:25]Product_Code:2#"")
					If ([ORDER_ITEMS:25]Price_Code:36#"")
						PriceT_Check
					Else 
						QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
						If (PRD_t_FurtherApplicable#"")
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
						End if 
						
						PriceT_FilterDates
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9>0)
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							If ([ORDER_ITEMS:25]Price_Code:36#"")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[ORDER_ITEMS:25]Price_Code:36)
							End if 
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								PriceT_SearchC2([ORDERS:24]Company_Code:1)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
									SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										PriceT_SearchQt
										PriceT_CheckCo2([ORDERS:24]Company_Code:1)
										If (Records in selection:C76([PRICE_TABLE:28])>0)
											If ([PRICE_TABLE:28]Price_Code:2#[PRICE_GROUPS:18]Price_Code:1)
												RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
											End if 
											If ([PRICE_GROUPS:18]Automatic:5)
												OrderI_SubPTA
												[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
											End if 
										Else 
											If (([ORDER_ITEMS:25]Price_Code:36#"") | ([ORDER_ITEMS:25]Discount:37#0))  //has to be here cos you may be reducing
												[ORDER_ITEMS:25]Price_Code:36:=""  //the qty such that there is no discount
												[ORDER_ITEMS:25]Discount:37:=0
												[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If (Count parameters:C259>=7)
					$7->:=0
				Else 
					If ([ORDER_ITEMS:25]Product_Code:2#"")
						If ([ORDER_ITEMS:25]Price_Code:36#"")
							PriceT_Check
						Else 
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
							If (PRD_t_FurtherApplicable#"")
								QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
							End if 
							
							PriceT_FilterDates
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9>0)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								If ([ORDER_ITEMS:25]Price_Code:36#"")
									QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[ORDER_ITEMS:25]Price_Code:36)
								End if 
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									PriceT_SearchC2([ORDERS:24]Company_Code:1)
									If (Records in selection:C76([PRICE_TABLE:28])>0)
										SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
										QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
										SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
										If (Records in selection:C76([PRICE_TABLE:28])>0)
											PriceT_SearchQt
											PriceT_CheckCo2([ORDERS:24]Company_Code:1)
											If (Records in selection:C76([PRICE_TABLE:28])>0)
												If ([PRICE_TABLE:28]Price_Code:2#[PRICE_GROUPS:18]Price_Code:1)
													RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
												End if 
												If ([PRICE_GROUPS:18]Automatic:5)
													OrderI_SubPTA
													[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
												End if 
											Else 
												If (([ORDER_ITEMS:25]Price_Code:36#"") | ([ORDER_ITEMS:25]Discount:37#0))  //has to be here cos you may be reducing
													[ORDER_ITEMS:25]Price_Code:36:=""  //the qty such that there is no discount
													[ORDER_ITEMS:25]Discount:37:=0
													[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		If (Count parameters:C259<4)
			Calc_Item
		End if 
		If (False:C215)
			If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
				If (Count parameters:C259>=8)
					$_t_productCode:=$8
				Else 
					$_t_productCode:=[ORDER_ITEMS:25]Product_Code:2
				End if 
				If ([PRODUCTS:9]Product_Code:1#$_t_productCode)
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
				End if 
				If ([PRODUCTS:9]Serial_Numbered:17)
					
					//see also OrderI_Serial
					If (Count parameters:C259>=6)
						$6->:=""
					Else 
						[ORDER_ITEMS:25]Serial_Number:24:=""
					End if 
					SORT ARRAY:C229($_at_SMSerialNumber; $_ar_SMQuantity; $_ar_SMtotalCost; $_at_AddStockType; >)
					$_l_SizeofArray:=Size of array:C274($_at_SMSerialNumber)
					If (Count parameters:C259>=6)
						$_t_SerialNumber:=$6->
					Else 
						$_t_SerialNumber:=[ORDER_ITEMS:25]Serial_Number:24
					End if 
					
					For ($_l_index; 1; $_l_SizeofArray)
						If ($_ar_SMQuantity{$_l_index}#0)
							If (Count parameters:C259>=6)
								If ($_t_SerialNumber#"")
									$_t_SerialNumber:=$_t_SerialNumber+"/"
								End if 
								$_t_SerialNumber:="Multiiple Serial Nos"
							Else 
								If ([ORDER_ITEMS:25]Serial_Number:24#"")
									[ORDER_ITEMS:25]Serial_Number:24:="Multiiple Serial Nos"
								End if 
							End if 
						End if 
					End for 
					If (Count parameters:C259>=6)
						$6->:=$_t_SerialNumber
					Else 
						[ORDER_ITEMS:25]Serial_Number:24:=$_t_SerialNumber
					End if 
					
				End if 
			End if 
		End if 
End case 

vTot:=1
If (Count parameters:C259<4)
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
ERR_MethodTrackerReturn("OrderI_AllOIUp2"; $_t_oldMethodName)
