If (False:C215)
	//Project Form Method Name: DB_ProductTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2014 18:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PrimaryStockTypes; 0)
	ARRAY TEXT:C222($_at_SourceStockTypes; 0)
	ARRAY TEXT:C222($_at_ValidStockTypes; 0)
	//ARRAY TEXT(STK_at_StockTypesinOrder;0)
	C_LONGINT:C283($_l_AddedToArray; $_l_event; $_l_Index)
	C_REAL:C285($_r_Total)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/DB_ProductTest/{formMethod}"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1)
		ALL RECORDS:C47([STOCK_TYPES:59])
		QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Source_Stock:10=False:C215; *)
		QUERY:C277([STOCK_TYPES:59];  & ; [STOCK_TYPES:59]FilterOut:9=False:C215)
		
		SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_ValidStockTypes)
		QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Source_Stock:10=True:C214)
		SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_SourceStockTypes)
		QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Stock_Minus:4; $_at_SourceStockTypes)
		DISTINCT VALUES:C339([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_PrimaryStockTypes)
		ARRAY TEXT:C222(STK_at_StockTypesinOrder; 0)
		
		Repeat 
			SORT ARRAY:C229($_at_PrimaryStockTypes; <)
			
			$_l_AddedToArray:=0
			For ($_l_Index; Size of array:C274($_at_PrimaryStockTypes); 1; -1)
				If (Find in array:C230($_at_ValidStockTypes; $_at_PrimaryStockTypes{$_l_Index})>0)
					If (Find in array:C230(STK_at_StockTypesinOrder; $_at_PrimaryStockTypes{$_l_Index})<0)
						APPEND TO ARRAY:C911(STK_at_StockTypesinOrder; $_at_PrimaryStockTypes{$_l_Index})
						$_l_AddedToArray:=$_l_AddedToArray+1
					Else 
						DELETE FROM ARRAY:C228($_at_PrimaryStockTypes; $_l_Index)
					End if 
				Else 
					DELETE FROM ARRAY:C228($_at_PrimaryStockTypes; $_l_Index)
				End if 
				
			End for 
			QUERY WITH ARRAY:C644([MOVEMENT_TYPES:60]Stock_Minus:4; $_at_PrimaryStockTypes)  //get the movement types that take from them
			DISTINCT VALUES:C339([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_PrimaryStockTypes)  //get the stock types they add to
		Until (Size of array:C274($_at_PrimaryStockTypes)=0) | ($_l_AddedToArray=0)
		For ($_l_Index; Size of array:C274(STK_at_StockTypesinOrder); 1; -1)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_StockTypesinOrder{$_l_Index})
			$_r_Total:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<$_r_Total)
						//there is both free and allocated stock for this types
						INSERT IN ARRAY:C227(STK_at_StockTypesinOrder; $_l_Index+1; 1)
						STK_at_StockTypesinOrder{$_l_Index+1}:=STK_at_StockTypesinOrder{$_l_Index}+" Allocated"
						STK_at_StockTypesinOrder{$_l_Index}:=STK_at_StockTypesinOrder{$_l_Index}+" Free"
					Else 
						//there is only allocated stock for this type
						STK_at_StockTypesinOrder{$_l_Index}:=STK_at_StockTypesinOrder{$_l_Index}+" Allocated"
					End if 
				Else 
					//there is only free stock for this stock type
					STK_at_StockTypesinOrder{$_l_Index}:=STK_at_StockTypesinOrder{$_l_Index}+" Free"
				End if 
			Else 
				DELETE FROM ARRAY:C228(STK_at_StockTypesinOrder; $_l_Index)  //no stock no point in the column
			End if 
			
		End for 
End case 
ERR_MethodTrackerReturn("FM DB_ProductTest"; $_t_oldMethodName)
