//%attributes = {}
If (False:C215)
	//Project Method Name:      STK2010_UpdateStockItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/06/2010 05:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MovementAddToStockTypes; 0)
	ARRAY TEXT:C222($_at_MovementCodes; 0)
	ARRAY TEXT:C222($_at_MovementsFromCodes; 0)
	ARRAY TEXT:C222($_at_MovementTypeCodes; 0)
	C_DATE:C307($_d_StockMovementDate)
	C_LONGINT:C283($_l_CountStockMovementItems2; $_l_MovementItemCopiedFromID; $_l_MovementItemIndex; $_l_NumberSet; $_l_RecordNumber; $_l_RecordsinSelection; $_l_StockMovementItemID; $_l_StockMovementRecord)
	C_REAL:C285($_r_Available; $_r_POItemsIndex; $_r_Quantity; $_r_QuantityCopied; $_r_Sum; $_r_Sum2; $_r_SumA)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode; $_t_SupplierCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK2010_UpdateStockItems")
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
Repeat 
	$_l_NumberSet:=0
	//There movement types are the ones thatt copy from ISH..
	//however RR dont do that they use(generally ISH and ISHC-which dont add to any stock type..and the ISO(and SDC) copy from them
	//with iSHC they copy from more than one
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Minus:4=""; *)
	QUERY:C277([MOVEMENT_TYPES:60];  & ; [MOVEMENT_TYPES:60]Stock_Plus:3="")
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypeCodes)
	ARRAY TEXT:C222($_at_MovementTypeCodes; 0)
	APPEND TO ARRAY:C911($_at_MovementTypeCodes; "ISHC")
	QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_MovementTypeCodes)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17<=0)
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
	ORDER BY:C49([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Posted_Date:7; <)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENTS:40]; "MOVEMENTS")
	$_l_StockMovementRecord:=Records in selection:C76([STOCK_MOVEMENTS:40])
	For ($_l_MovementItemIndex; 1; $_l_StockMovementRecord)
		USE NAMED SELECTION:C332("MOVEMENTS")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENTS:40]; $_l_MovementItemIndex)
		MESSAGE:C88(String:C10($_l_MovementItemIndex)+" of "+String:C10($_l_StockMovementRecord)+" ISHC Movements")
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17<=0)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "STOCKITEMS")
		$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		For ($_l_MovementItemIndex; 1; $_l_RecordsinSelection)
			USE NAMED SELECTION:C332("MOVEMENTS")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENTS:40]; $_l_MovementItemIndex)
			USE SET:C118("STOCKITEMS")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_MovementItemIndex)
			MESSAGE:C88(String:C10($_l_MovementItemIndex)+" of "+String:C10($_l_StockMovementRecord)+" ISHC Movements "+String:C10($_l_MovementItemIndex)+" of "+String:C10($_l_RecordsinSelection)+" Stock items"+" Total number set this try="+String:C10($_l_NumberSet))
			
			$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
			$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
			$_d_StockMovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
			$_t_SupplierCode:=[STOCK_MOVEMENTS:40]Company_From:2
			$_r_QuantityCopied:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			//NG April 2020...i don't kno what happened here-this should be a different table
			//QUERY([BUILT_CODE_FORMAT_SECTION];[BUILT_CODE_FORMAT_SECTION]FORMAT_ID=[STOCK_MOVEMENT_ITEMS]x_ID)
			//$SumA:=Sum([BUILT_CODE_FORMAT_SECTION]SECTION_NAME)
			//$Suma:=SUM([BUILT_CODE_FORMAT_SECTION]
			$_r_QuantityCopied:=$_r_QuantityCopied-$_r_SumA
			QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6="ISH"; *)
			QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Movement_Date:5<=$_d_StockMovementDate; *)
			QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Company_From:2=$_t_SupplierCode)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementsFromCodes)
			QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementsFromCodes)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode)
			DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementsFromCodes)
			QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementsFromCodes)
			ORDER BY:C49([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Posted_Date:7; <)
			$_l_MovementItemCopiedFromID:=0
			$_r_Available:=0
			For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "STOCKITEMS2")
					$_l_CountStockMovementItems2:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
					For ($_r_POItemsIndex; 1; $_l_CountStockMovementItems2)
						USE SET:C118("STOCKITEMS2")
						GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_r_POItemsIndex)
						$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						If ($_l_StockMovementItemID=0)
							//TRACE
						End if 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockMovementItemID)
						QUERY:C277([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3=$_l_StockMovementItemID)
						$_r_Sum2:=Sum:C1([BUILT_CODE_FORMAT_SECTION:188]SECTION_NAME:4)
						//TRACE
						
						$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						$_r_Available:=$_r_Quantity-($_r_Sum+$_r_Sum2)
						If ($_r_Sum2>0)
							//TRACE
						End if 
						If ($_r_Available<=$_r_QuantityCopied) & ($_r_Available>0)
							USE SET:C118("STOCKITEMS2")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_r_POItemsIndex)
							
							$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							$_l_MovementItemCopiedFromID:=$_l_StockMovementItemID
							$_r_POItemsIndex:=$_l_CountStockMovementItems2+1
							$_l_MovementItemIndex:=Records in selection:C76([STOCK_MOVEMENTS:40])
							$_l_NumberSet:=$_l_NumberSet+1
						End if 
					End for 
					
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENTS:40])
			End for 
			If ($_l_MovementItemCopiedFromID>0)
				
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				
			End if 
			
			
			
		End for 
		
		
	End for 
Until ($_l_NumberSet=0)

//Quantity> ISH
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypeCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_MovementTypeCodes)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_MovementAddToStockTypes)
QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Stock_Minus:4; $_at_MovementAddToStockTypes)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovementTypeCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_MovementTypeCodes)
SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_MovementCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
ORDER BY:C49([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Posted_Date:7; <)



Gen_Alert("DONE")
ERR_MethodTrackerReturn("STK2010_UpdateStockItems"; $_t_oldMethodName)
