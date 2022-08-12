//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ValidationReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                                  30/01/2011 18:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(STK_ar_StockCounts;0)
	//ARRAY REAL(STK_ar_StockCounts1;0)
	//ARRAY REAL(STK_ar_StockValues;0)
	//ARRAY REAL(STK_ar_StockValues1;0)
	//ARRAY REAL(STK_ar_TotalStockValues;0)
	//ARRAY TEXT(STK_at_StockTypes;0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_Save; $_bo_TakeResidualsFromMinus; CSStockLevelCompleted; STK_bo_SLCreate)
	C_LONGINT:C283($_l_ArraySIze; $_l_CopiedFromID; $_l_CountStockLevels; $_l_Index; $_l_Process; $_l_RecordsinSelection; $_l_Retries; $_l_SMIindexy; $_l_StockLevelID; $_l_StockLevelsIndex; $_l_StockTypeRow)
	C_LONGINT:C283($_l_StockTypesIndex)
	C_REAL:C285($_r_AllocatedCost; $_r_AllocatedCount; $_r_CalledOffQuantity; $_r_CallOffCount; $_r_CostPrice; $_r_FreeCost; $_r_FreeCount; $_r_Quantity; $_r_QuantityCount; $_r_ResidualsCount; $_r_ResidualStock)
	C_REAL:C285($_r_TotalAllocatedCount; $_r_TotalAllocatedValue; $_r_TotalFreeCOunt; $_r_TotalFreeValue; $_r_TotalsStockValue; CSStockLevelID)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AddToStockType; $_t_CurrentProductCode; $_t_InvertedMessage; $_t_oldMethodName; $_t_ProcessName; $_t_productCode; $_t_TakenFromStockType; $1)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ValidationReport")
ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
If (Count parameters:C259>=1)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$1)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
End if 
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_LEVELS:58])
READ WRITE:C146([CURRENT_STOCK:62])
Gen_Confirm("Stock Movement Items Validation")
If (OK=1)
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$ToReport")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	$_t_CurrentProductCode:=""
	ALL RECORDS:C47([STOCK_TYPES:59])
	SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; STK_at_StockTypes)
	ARRAY REAL:C219(STK_ar_StockCounts; 0)
	ARRAY REAL:C219(STK_ar_StockValues; 0)
	ARRAY REAL:C219(STK_ar_StockCounts1; 0)
	ARRAY REAL:C219(STK_ar_StockValues1; 0)
	ARRAY REAL:C219(STK_ar_TotalStockValues; Size of array:C274(STK_at_StockTypes))
	$_l_ArraySIze:=Size of array:C274(STK_at_StockTypes)
	ARRAY REAL:C219(STK_ar_StockCounts; $_l_ArraySIze)
	ARRAY REAL:C219(STK_ar_StockValues; $_l_ArraySIze)
	ARRAY REAL:C219(STK_ar_StockCounts1; $_l_ArraySIze)
	ARRAY REAL:C219(STK_ar_StockValues1; $_l_ArraySIze)
	$_r_TotalsStockValue:=0
	If ($_ti_DocumentRef#?00:00:00?)
		SEND PACKET:C103($_ti_DocumentRef; "Report on Stock items"+Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Stock item ID"+Char:C90(9)+"Product Code"+Char:C90(9)+"Product Name"+Char:C90(9)+"Movement Type"+Char:C90(9)+"Inverted Movement Type"+Char:C90(9)+"Add to stock type"+Char:C90(9)+"Take From Stock Type"+Char:C90(9)+"Quantity"+Char:C90(9)+"Unit Cost Price"+Char:C90(9)+"Current Stock Detais"+Char:C90(9)+"Current Stock Product Code"+Char:C90(9)+"Stock Type"+Char:C90(9)+"Cost Price"+Char:C90(9)+"Related Stock item Details"+Char:C90(9)+"Previous stock item ID"+Char:C90(9)+"Product Code"+Char:C90(9)+"Product Name"+Char:C90(9)+"Movement Type"+Char:C90(9)+"Inverted Movement Type"+Char:C90(9)+"Add to stock type"+Char:C90(9)+"Take From Stock Type"+Char:C90(9)+"Quantity"+Char:C90(9)+"Unit Cost Price"+Char:C90(13))
		For ($_l_Index; 1; $_l_RecordsinSelection)
			
			MESSAGE:C88("Processing Stock item"+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
			
			USE NAMED SELECTION:C332("$toReport")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_CurrentProductCode)
				If ($_l_Index#1)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; "Stock Counts and values"+Char:C90(13))
					
					For ($_l_StockTypesIndex; 1; Size of array:C274(STK_at_StockTypes))
						STK_ar_TotalStockValues{$_l_StockTypesIndex}:=STK_ar_TotalStockValues{$_l_StockTypesIndex}+STK_ar_StockValues{$_l_StockTypesIndex}
						SEND PACKET:C103($_ti_DocumentRef; "Stock type "+STK_at_StockTypes{$_l_StockTypesIndex}+Char:C90(9)+" Free"+Char:C90(9)+String:C10(STK_ar_StockCounts{$_l_StockTypesIndex})+Char:C90(9)+"Value"+Char:C90(9)+String:C10(STK_ar_StockValues{$_l_StockTypesIndex})+Char:C90(9)+"Allocated to orders"+Char:C90(9)+String:C10(STK_ar_StockCounts1{$_l_StockTypesIndex})+Char:C90(9)+"Value"+Char:C90(9)+String:C10(STK_ar_StockValues1{$_l_StockTypesIndex})+Char:C90(13))
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_CurrentProductCode; *)
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=STK_at_StockTypes{$_l_StockTypesIndex})
						//it should only be one record
						$_r_TotalFreeCOunt:=0
						$_r_TotalAllocatedCount:=0
						$_r_TotalFreeValue:=0
						$_r_TotalAllocatedValue:=0
						For ($_l_StockLevelsIndex; 1; Records in selection:C76([STOCK_LEVELS:58]))
							$_r_TotalFreeCOunt:=$_r_TotalFreeCOunt+[STOCK_LEVELS:58]Free_Level:3
							$_r_TotalAllocatedCount:=$_r_TotalAllocatedCount+[STOCK_LEVELS:58]Allocated_Level:4
							$_r_TotalFreeValue:=$_r_TotalFreeValue+[STOCK_LEVELS:58]Free_Cost:5
							$_r_TotalAllocatedValue:=$_r_TotalAllocatedValue+[STOCK_LEVELS:58]Allocated_Cost:6
							NEXT RECORD:C51([STOCK_LEVELS:58])
						End for 
						SEND PACKET:C103($_ti_DocumentRef; "From Stock levels"+Char:C90(9)+String:C10($_r_TotalFreeCOunt)+Char:C90(9)+String:C10($_r_TotalFreeValue)+Char:C90(13))
						If ($_r_TotalFreeCOunt#STK_ar_StockCounts{$_l_StockTypesIndex}) & (STK_at_StockTypes{$_l_StockTypesIndex}="P")
							SEND PACKET:C103($_ti_DocumentRef; "ERROR Investigate the stock count"+Char:C90(13))
						End if 
						If (STK_ar_StockValues{$_l_StockTypesIndex}#$_r_TotalFreeValue) & (STK_at_StockTypes{$_l_StockTypesIndex}="P")
							SEND PACKET:C103($_ti_DocumentRef; "ERROR Investigate the stock VALUE"+Char:C90(13))
						End if 
						
					End for 
				End if 
				ARRAY REAL:C219(STK_ar_StockCounts; 0)
				ARRAY REAL:C219(STK_ar_StockValues; 0)
				ARRAY REAL:C219(STK_ar_StockCounts1; 0)
				ARRAY REAL:C219(STK_ar_StockValues1; 0)
				$_l_ArraySIze:=Size of array:C274(STK_at_StockTypes)
				ARRAY REAL:C219(STK_ar_StockCounts; $_l_ArraySIze)
				ARRAY REAL:C219(STK_ar_StockValues; $_l_ArraySIze)
				ARRAY REAL:C219(STK_ar_StockCounts1; $_l_ArraySIze)
				ARRAY REAL:C219(STK_ar_StockValues1; $_l_ArraySIze)
				
				$_t_CurrentProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
			End if 
			
			MESSAGE:C88("Processing Stock item"+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" "+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16))
			
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
				$_t_InvertedMessage:="(Inverted movement type)"
			Else 
				$_t_InvertedMessage:=""
			End if 
			SEND PACKET:C103($_ti_DocumentRef; String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+$_t_InvertedMessage+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)+Char:C90(13))
			$_r_ResidualStock:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
			STK_UpdateCalledOffQuantity
			If ($_r_ResidualStock#[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				$_r_ResidualStock:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			End if 
			$_l_StockTypeRow:=Find in array:C230(STK_at_StockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
			If ($_l_StockTypeRow>0)
				STK_ar_StockCounts{$_l_StockTypeRow}:=STK_ar_StockCounts{$_l_StockTypeRow}+$_r_ResidualStock
				STK_ar_StockValues{$_l_StockTypeRow}:=STK_ar_StockValues{$_l_StockTypeRow}+Gen_Round([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99($_r_ResidualStock); 2; 2)
				
				
			End if 
			$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			$_r_CalledOffQuantity:=$_r_Quantity-$_r_ResidualStock
			$_t_TakenFromStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
			$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
			$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
			$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			If ([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35#0)
				$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35
			End if 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*9)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					SEND PACKET:C103($_ti_DocumentRef; "Current stock record added to"+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*9)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+[CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6))
					If ([CURRENT_STOCK:62]Product_Code:1#$_t_productCode)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR Product Code does not match")
					End if 
					If ($_t_AddToStockType#[CURRENT_STOCK:62]Stock_Type:3)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR stock type does not match")
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR CURRENT STOCK RECORD NOT FOUND"+Char:C90(13))
					CREATE RECORD:C68([CURRENT_STOCK:62])
					
					[CURRENT_STOCK:62]X_ID:13:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					[CURRENT_STOCK:62]Stock_Type:3:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="C")
						[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]Stock_Number:9#0)
						[CURRENT_STOCK:62]Stock_Number:7:=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9
					Else 
						[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
					End if 
					SAVE RECORD:C53([CURRENT_STOCK:62])
					STK_UpdateCurrentStock2011
					
					SAVE RECORD:C53([CURRENT_STOCK:62])
					
				End if 
			Else 
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Not added to any current stock record-validate this")
			End if 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*9)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					SEND PACKET:C103($_ti_DocumentRef; "Current stock record Taken From"+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*9)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+[CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6))
					If ([CURRENT_STOCK:62]Product_Code:1#$_t_productCode)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR Product Code does not match")
					End if 
					If ($_t_TakenFromStockType#[CURRENT_STOCK:62]Stock_Type:3)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR stock type does not match")
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR CURRENT STOCK RECORD NOT FOUND"+Char:C90(13))
					CREATE RECORD:C68([CURRENT_STOCK:62])
					[CURRENT_STOCK:62]X_ID:13:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
					[CURRENT_STOCK:62]Analysis_Code:10:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					[CURRENT_STOCK:62]Cost_Price:6:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					[CURRENT_STOCK:62]Currency_Code:11:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					[CURRENT_STOCK:62]Layer_Code:12:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					[CURRENT_STOCK:62]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
					[CURRENT_STOCK:62]Stock_Type:3:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32="C")
						[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]Stock_Number:9#0)
						[CURRENT_STOCK:62]Stock_Number:7:=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9
					Else 
						[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
					End if 
					SAVE RECORD:C53([CURRENT_STOCK:62])
					STK_UpdateCurrentStock2011
					
					SAVE RECORD:C53([CURRENT_STOCK:62])
					
					
					
					
					
				End if 
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Not taken from current stock record-validate this"+Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Not taken from current stock record-No Suitable preceeding stock movement item could be identified"+Char:C90(13))
				End if 
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*13)
				SEND PACKET:C103($_ti_DocumentRef; "Preceeding  stock movement items record Taken From"+Char:C90(13))
				$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*13)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromID)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
						$_t_InvertedMessage:="(Inverted movement type)"
					Else 
						$_t_InvertedMessage:=""
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+$_t_InvertedMessage+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
					If ($_t_TakenFromStockType#[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The stock types do not match")
					End if 
					If ($_t_productCode#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The product codes do not match")
					End if 
					
					If ($_r_CostPrice#[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The cost prices do not match ("+String:C10($_r_CostPrice)+" Copied from "+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					
				Else 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR PRECEEDING STOCK ITEM NOT FOUND"+Char:C90(13))
				End if 
			End if 
			USE NAMED SELECTION:C332("$toReport")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
			$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_CopiedFromID)
			$_r_CallOffCount:=0
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*22)
				SEND PACKET:C103($_ti_DocumentRef; "Suceeding  stock movement items record (Copied to)"+Char:C90(13))
				For ($_l_SMIindexy; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*22)
					
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
						$_t_InvertedMessage:="(Inverted movement type)"
					Else 
						$_t_InvertedMessage:=""
					End if 
					$_r_CallOffCount:=$_r_CallOffCount+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+$_t_InvertedMessage+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
					If ($_t_AddToStockType#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The stock types do not match")
					End if 
					If ($_t_productCode#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The product codes do not match")
					End if 
					
					If ($_r_CostPrice#[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
						If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_r_CostPrice
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						End if 
						If ($_r_CostPrice#[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
							If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_r_CostPrice
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							End if 
							If ($_r_CostPrice#[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR The cost prices do not match ("+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)+" Copied from "+String:C10($_r_CostPrice))
							End if 
						End if 
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
			End if 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*22)
			SEND PACKET:C103($_ti_DocumentRef; "Called off validation"+Char:C90(9)+"Original Quantity"+Char:C90(9)+String:C10($_r_Quantity)+Char:C90(9)+"Called of validated Quantity="+Char:C90(9)+String:C10($_r_CallOffCount))
			If ($_r_ResidualStock=($_r_Quantity-$_r_CallOffCount))
				If ($_r_ResidualStock>0)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Leaving "+String:C10($_r_ResidualStock)+" not called off")
				Else 
					If ($_r_ResidualStock<0)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR too many called off")
					End if 
				End if 
			Else 
				SEND PACKET:C103($_ti_DocumentRef; "ERROR Residual stock is "+String:C10($_r_ResidualStock)+" but it should be "+String:C10($_r_Quantity-$_r_CallOffCount)+" This is corrected automatically")
				USE NAMED SELECTION:C332("$toReport")
				GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=($_r_Quantity-$_r_CallOffCount)
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
			End if 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			
			
			
			$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			$_r_CalledOffQuantity:=$_r_Quantity-$_r_ResidualStock
			
			
		End for 
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Total Stock values"+Char:C90(13))
		
		
		For ($_l_StockTypesIndex; 1; Size of array:C274(STK_at_StockTypes))
			STK_ar_TotalStockValues{$_l_StockTypesIndex}:=STK_ar_TotalStockValues{$_l_StockTypesIndex}+STK_ar_StockValues{$_l_StockTypesIndex}
			SEND PACKET:C103($_ti_DocumentRef; "Stock type "+STK_at_StockTypes{$_l_StockTypesIndex}+Char:C90(9)+String:C10(STK_ar_TotalStockValues{$_l_StockTypesIndex})+Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 
Gen_Confirm("Current Stock counts Validation")
If (OK=1)
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	If ($_ti_DocumentRef#?00:00:00?)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Current Stock Records Validation"+Char:C90(13))
		If (Count parameters:C259>=1)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$1)
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
		End if 
		//QUERY([CURRENT STOCK];[CURRENT STOCK]Product Code#"")
		//QUERY([CURRENT STOCK];[CURRENT STOCK]Quantity<0;*)
		//QUERY([CURRENT STOCK]; & ;[CURRENT STOCK]Stock Type="P")
		ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1)
		
		For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
			If ([CURRENT_STOCK:62]Product_Code:1="HPS-3000")
				//TRACE
			End if 
			
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
				SEND PACKET:C103($_ti_DocumentRef; "This current stock record is probably wrong and should be deleted"+Char:C90(13))
			End if 
			If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
				
				READ WRITE:C146([CURRENT_STOCK:62])
				LOAD RECORD:C52([CURRENT_STOCK:62])
				$_l_Retries:=0
				While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
					$_l_Retries:=$_l_Retries+1
					DelayTicks(9*$_l_Retries)
				End while 
				READ ONLY:C145([STOCK_LEVELS:58])
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
				If (<>StockAnal)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
				End if 
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
				
				$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
				
				If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
					If ($_l_CountStockLevels>0)
						If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
							If ($_l_CountStockLevels=1)
								If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
								QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
							End if 
						Else 
							If ($_l_CountStockLevels=1)
								If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
							End if 
						End if 
						$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
					End if 
				End if 
				$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
				If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
					If ($_l_CountStockLevels>0)
						If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
							If ($_l_CountStockLevels=1)
								If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
								QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
							End if 
						Else 
							If ($_l_CountStockLevels=1)
								If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
									REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
								End if 
							Else 
								QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
							End if 
						End if 
						$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
					End if 
				End if 
				If (Records in selection:C76([STOCK_LEVELS:58])=0)
					
					CSStockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
					CSStockLevelCompleted:=False:C215
					$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; CSStockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
					PAUSE PROCESS:C319(Current process:C322)
					$_l_Retries:=0
					While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
						
						If (Not:C34(CSStockLevelCompleted))
							$_t_ProcessName:=Process_Name($_l_Process)
							
							If ($_t_ProcessName="Create New Stock Level Record")
								$_l_Retries:=$_l_Retries+1
								DelayTicks((1*$_l_Retries)*60)
							Else 
								$_l_Process:=0
							End if 
						Else 
							SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
						End if 
					End while 
					//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
					[CURRENT_STOCK:62]x_Stock_Level_ID:15:=CSStockLevelID
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=CSStockLevelID)
					ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
					SAVE RECORD:C53([CURRENT_STOCK:62])
					
				Else 
					[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
					ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
					UNLOAD RECORD:C212([STOCK_LEVELS:58])
					SAVE RECORD:C53([CURRENT_STOCK:62])
					
				End if 
				If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
					SEND PACKET:C103($_ti_DocumentRef; "This current stock record Has no stock levels ID"+Char:C90(13))
				End if 
			Else 
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=[CURRENT_STOCK:62]x_Stock_Level_ID:15)
				If (Records in selection:C76([STOCK_LEVELS:58])=0)
					READ WRITE:C146([CURRENT_STOCK:62])
					LOAD RECORD:C52([CURRENT_STOCK:62])
					$_l_Retries:=0
					While (Semaphore:C143("StockLevel"+[CURRENT_STOCK:62]Product_Code:1))  //Prevent any other process from creating the same stock level
						$_l_Retries:=$_l_Retries+1
						DelayTicks(9*$_l_Retries)
					End while 
					READ ONLY:C145([STOCK_LEVELS:58])
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
					If (<>StockAnal)
						QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10; *)
					End if 
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[CURRENT_STOCK:62]Stock_Type:3)
					
					$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
					
					If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
						If ($_l_CountStockLevels>0)
							If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
								If ($_l_CountStockLevels=1)
									If (([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11) & ([STOCK_LEVELS:58]Currency_Code:8#""))
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
									QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
								End if 
							Else 
								If ($_l_CountStockLevels=1)
									If ([STOCK_LEVELS:58]Currency_Code:8#[CURRENT_STOCK:62]Currency_Code:11)
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
								End if 
							End if 
							$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
						End if 
					End if 
					$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
					If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
						If ($_l_CountStockLevels>0)
							If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
								If ($_l_CountStockLevels=1)
									If (([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12) & ([STOCK_LEVELS:58]Layer_Code:9#""))
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
									QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
								End if 
							Else 
								If ($_l_CountStockLevels=1)
									If ([STOCK_LEVELS:58]Layer_Code:9#[CURRENT_STOCK:62]Layer_Code:12)
										REDUCE SELECTION:C351([STOCK_LEVELS:58]; 0)
									End if 
								Else 
									QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
								End if 
							End if 
							$_l_CountStockLevels:=Records in selection:C76([STOCK_LEVELS:58])
						End if 
					End if 
					If (Records in selection:C76([STOCK_LEVELS:58])=0)
						
						$_l_StockLevelID:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
						CSStockLevelCompleted:=False:C215
						$_l_Process:=New process:C317("STOCK_CreateStockLevelRecord"; 128000; "Create New Stock Level Record"; $_l_StockLevelID; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Currency_Code:11; Current process:C322)
						PAUSE PROCESS:C319(Current process:C322)
						$_l_Retries:=0
						While (Process state:C330($_l_Process)>=0) & ($_l_Process>0) & (Process_Name($_l_Process)="Create New Stock Level Record")
							
							If (Not:C34(CSStockLevelCompleted))
								$_t_ProcessName:=Process_Name($_l_Process)
								If ($_t_ProcessName="Create New Stock Level Record")
									$_l_Retries:=$_l_Retries+1
									DelayTicks(60*$_l_Retries)
								Else 
									$_l_Process:=0
								End if 
							Else 
								SET PROCESS VARIABLE:C370($_l_Process; STK_bo_SLCreate; True:C214)
							End if 
						End while 
						//SET PROCESS VARIABLE($_l_Process;STK_bo_SLCreate;True)
						[CURRENT_STOCK:62]x_Stock_Level_ID:15:=$_l_StockLevelID
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=$_l_StockLevelID)
						ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
						SAVE RECORD:C53([CURRENT_STOCK:62])
						
					Else 
						[CURRENT_STOCK:62]x_Stock_Level_ID:15:=[STOCK_LEVELS:58]X_ID:10
						ProcessServices_CreateRecord(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]X_ID:10; "StockLevelsUpdate"; [STOCK_LEVELS:58]X_ID:10)
						UNLOAD RECORD:C212([STOCK_LEVELS:58])
						SAVE RECORD:C53([CURRENT_STOCK:62])
						
					End if 
					If ([CURRENT_STOCK:62]x_Stock_Level_ID:15=0)
						SEND PACKET:C103($_ti_DocumentRef; "This current stock record Has no stock levels ID"+Char:C90(13))
					End if 
					SEND PACKET:C103($_ti_DocumentRef; "ERROR This the stock level record WAS missing"+Char:C90(13))
					
				End if 
			End if 
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1)
			MESSAGE:C88("Processing Current stock"+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([CURRENT_STOCK:62]))+[CURRENT_STOCK:62]Product_Code:1+" "+String:C10([CURRENT_STOCK:62]X_ID:13)+" "+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(13))
			
			
			If ([CURRENT_STOCK:62]Quantity:4<0) & ([CURRENT_STOCK:62]Stock_Type:3="P")
				SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+" THIS SHOULD NOT BE NEGATIVE"+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(13))
				
			Else 
				SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+[CURRENT_STOCK:62]Stock_Type:3+Char:C90(13))
			End if 
			$_r_QuantityCount:=0
			$_r_ResidualsCount:=0
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*4)
			SEND PACKET:C103($_ti_DocumentRef; "Stock movement items adding to this current stock record"+Char:C90(13))
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
			$_bo_TakeResidualsFromMinus:=False:C215
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				For ($_l_SMIindexy; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*4)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)+Char:C90(9))
					If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#[CURRENT_STOCK:62]Product_Code:1)
						SEND PACKET:C103($_ti_DocumentRef; "ERROR stock item is wrong product code")
					End if 
					If ([CURRENT_STOCK:62]Stock_Type:3#[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
						SEND PACKET:C103($_ti_DocumentRef; "ERROR stock item should not add to this current stock record")
					End if 
					$_r_QuantityCount:=$_r_QuantityCount+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					$_r_ResidualStock:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					STK_UpdateCalledOffQuantity
					If ($_r_ResidualStock#[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					End if 
					SEND PACKET:C103($_ti_DocumentRef; "Residual Stock(Not called off)"+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
					$_r_ResidualsCount:=$_r_ResidualsCount+[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
			Else 
				$_bo_TakeResidualsFromMinus:=True:C214
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*4)
				SEND PACKET:C103($_ti_DocumentRef; "Stock movement items Subtracting From This current stock record"+Char:C90(13))
				
				For ($_l_SMIindexy; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*4)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_ID:16)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17))
					
					If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#[CURRENT_STOCK:62]Product_Code:1)
						SEND PACKET:C103($_ti_DocumentRef; "ERROR stock item is wrong product code")
					End if 
					If ([CURRENT_STOCK:62]Stock_Type:3#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
						SEND PACKET:C103($_ti_DocumentRef; "ERROR stock item should not Take From this current stock record")
					End if 
					$_r_QuantityCount:=$_r_QuantityCount-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					If ($_bo_TakeResidualsFromMinus)
						$_r_ResidualsCount:=$_r_ResidualsCount-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					End if 
					
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
			End if 
			
			
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*4)
			SEND PACKET:C103($_ti_DocumentRef; "Quantities Validation"+Char:C90(13))
			SEND PACKET:C103($_ti_DocumentRef; "Stock Movements Items Quantites Count="+Char:C90(9)+String:C10($_r_QuantityCount))
			If ($_r_QuantityCount<0) & ([CURRENT_STOCK:62]Stock_Type:3="P")
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR TOO MANY MINUSES"+Char:C90(13))
			End if 
			If ($_r_QuantityCount#[CURRENT_STOCK:62]Quantity:4)
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR CUrrent stock is not correct, this is now corrected")
				[CURRENT_STOCK:62]Quantity:4:=$_r_QuantityCount
				SAVE RECORD:C53([CURRENT_STOCK:62])
			End if 
			If ($_r_QuantityCount#$_r_ResidualsCount)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
				MESSAGES OFF:C175
				APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
				MESSAGES ON:C181
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"ERROR Residuals Count does not match the quantity count!!!"+String:C10($_r_ResidualsCount)+"Why is it not "+String:C10([CURRENT_STOCK:62]Quantity:4))
				
			End if 
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			
			NEXT RECORD:C51([CURRENT_STOCK:62])
			
		End for 
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 
Gen_Confirm("Stock levels Validation")
If (OK=1)
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	If ($_ti_DocumentRef#?00:00:00?)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Stock Levels Validation"+Char:C90(13))
		If (Count parameters:C259>=1)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$1)
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
		End if 
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1#"")
		
		ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1)
		
		For ($_l_Index; 1; Records in selection:C76([STOCK_LEVELS:58]))
			MESSAGE:C88("Processing Stock levels"+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([STOCK_LEVELS:58]))+[STOCK_LEVELS:58]Product_Code:1+" "+String:C10([STOCK_LEVELS:58]X_ID:10))
			
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[STOCK_LEVELS:58]Product_Code:1)
			SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Stock_Type:2+Char:C90(9))
			
			If ([STOCK_LEVELS:58]Free_Level:3#0) | ([STOCK_LEVELS:58]Free_Cost:5#0)
				If ([STOCK_LEVELS:58]Allocated_Level:4#0) | ([STOCK_LEVELS:58]Allocated_Cost:6#0)
					SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Name:2+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Cost:5)+Char:C90(9)+Char:C90(13))
					
				End if 
			Else 
				If ([STOCK_LEVELS:58]Allocated_Level:4#0) | ([STOCK_LEVELS:58]Allocated_Cost:6#0)
					SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Code:1+Char:C90(9)+Char:C90(9)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Cost:6)+Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; [STOCK_LEVELS:58]Product_Code:1+Char:C90(9)+[PRODUCTS:9]Product_Code:1+Char:C90(13))
					
				End if 
			End if 
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]x_Stock_Level_ID:15=[STOCK_LEVELS:58]X_ID:10)
			$_r_FreeCount:=0
			$_r_FreeCost:=0
			$_r_AllocatedCount:=0
			$_r_AllocatedCost:=0
			For ($_l_SMIindexy; 1; Records in selection:C76([CURRENT_STOCK:62]))
				If ([CURRENT_STOCK:62]Item_Number:5=0)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*6)
					SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+"Free Stock(Not allocated to a sales order item)"+Char:C90(13))
					$_r_FreeCount:=$_r_FreeCount+[CURRENT_STOCK:62]Quantity:4
					$_r_FreeCost:=$_r_FreeCost+Round:C94(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2)
				Else 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*6)
					SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+"Allocated Stock( allocated to a sales order item)"+Char:C90(13))
					$_r_AllocatedCount:=$_r_AllocatedCount+[CURRENT_STOCK:62]Quantity:4
					$_r_AllocatedCost:=$_r_AllocatedCost+Round:C94(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2)
				End if 
				If ([CURRENT_STOCK:62]Product_Code:1#[STOCK_LEVELS:58]Product_Code:1)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*6)
					SEND PACKET:C103($_ti_DocumentRef; "ERROR Product code on Related Current stock record is not correct"+Char:C90(13))
				End if 
				If ([CURRENT_STOCK:62]Stock_Type:3#[STOCK_LEVELS:58]Stock_Type:2)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)*6)
					SEND PACKET:C103($_ti_DocumentRef; "ERROR STOCK Type  on Related Current stock record is not correct"+Char:C90(13))
				End if 
				
				NEXT RECORD:C51([CURRENT_STOCK:62])
				
			End for 
			$_bo_Save:=True:C214
			If ($_r_FreeCount#[STOCK_LEVELS:58]Free_Level:3)
				SEND PACKET:C103($_ti_DocumentRef; "ERROR stock levels free stock level does not match current stock, this is automatically fixed"+Char:C90(13))
				[STOCK_LEVELS:58]Free_Level:3:=$_r_FreeCount
				$_bo_Save:=True:C214
			End if 
			If ($_r_FreeCost#[STOCK_LEVELS:58]Free_Cost:5)
				SEND PACKET:C103($_ti_DocumentRef; "ERROR stock levels free stock COST does not match current stock, this is automatically fixed"+Char:C90(13))
				[STOCK_LEVELS:58]Free_Cost:5:=$_r_FreeCost
				$_bo_Save:=True:C214
			End if 
			If ($_r_AllocatedCount#[STOCK_LEVELS:58]Allocated_Level:4)
				SEND PACKET:C103($_ti_DocumentRef; "ERROR stock levels Allocated stock level does not match current stock, this is automatically fixed"+Char:C90(13))
				[STOCK_LEVELS:58]Allocated_Level:4:=$_r_AllocatedCount
				$_bo_Save:=True:C214
			End if 
			If ($_r_AllocatedCost#[STOCK_LEVELS:58]Allocated_Cost:6)
				SEND PACKET:C103($_ti_DocumentRef; "ERROR stock levels allocated stock COST does not match current stock, this is automatically fixed"+Char:C90(13))
				[STOCK_LEVELS:58]Allocated_Cost:6:=$_r_AllocatedCost
				$_bo_Save:=True:C214
			End if 
			If ($_bo_Save)
				SAVE RECORD:C53([STOCK_LEVELS:58])
			End if 
			$_bo_Save:=False:C215
			
			
			
			
			NEXT RECORD:C51([STOCK_LEVELS:58])
			
		End for 
		
		
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 
ERR_MethodTrackerReturn("STK_ValidationReport"; $_t_oldMethodName)
