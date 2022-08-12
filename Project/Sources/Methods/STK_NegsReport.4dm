//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_NegsReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_MakeChanges)
	C_LONGINT:C283($_l_CurrentStockIndex; $_l_CurrentStockIndex2; $_l_index; $_l_RecordsinSelection; $_l_StockItemNumber)
	C_REAL:C285($_r_NegQuantity)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_ProductCode)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_NegsReport")

$_ti_DocumentRef:=Create document:C266(""; "TEXT")
$_bo_MakeChanges:=True:C214
READ WRITE:C146(*)

QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4<0; *)
QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Product_Code:1#"_@")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1#"")

CREATE SET:C116([CURRENT_STOCK:62]; "ALLNEGS")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1; >)
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "NEGPFREE")
$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
	USE NAMED SELECTION:C332("NEGPFREE")
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
	SEND PACKET:C103($_ti_DocumentRef; "Negative Free P Current stock record"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="P")
	SEND PACKET:C103($_ti_DocumentRef; "Stock level"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(13))
	$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
	$_r_NegQuantity:=[CURRENT_STOCK:62]Quantity:4
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		
		SEND PACKET:C103($_ti_DocumentRef; "Potential Current stock records"+Char:C90(13))
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
			SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
		If ($_bo_MakeChanges)
			FIRST RECORD:C50([CURRENT_STOCK:62])
			Case of 
				: (Records in selection:C76([CURRENT_STOCK:62])=0)
					If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity)
						[CURRENT_STOCK:62]Quantity:4:=0
						SAVE RECORD:C53([CURRENT_STOCK:62])
						[STOCK_LEVELS:58]Free_Level:3:=0
						[STOCK_LEVELS:58]Free_Cost:5:=0
						SAVE RECORD:C53([STOCK_LEVELS:58])
					End if 
				: (Records in selection:C76([CURRENT_STOCK:62])=1)
					Case of 
						: ([CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
							[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
							SAVE RECORD:C53([CURRENT_STOCK:62])
							USE NAMED SELECTION:C332("NEGPFREE")
							GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
							[CURRENT_STOCK:62]Quantity:4:=0
							SAVE RECORD:C53([CURRENT_STOCK:62])
						: ([CURRENT_STOCK:62]Quantity:4=0)
							If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
								USE NAMED SELECTION:C332("NEGOFREE")
								GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
								[CURRENT_STOCK:62]Quantity:4:=0
								SAVE RECORD:C53([CURRENT_STOCK:62])
								[STOCK_LEVELS:58]Free_Level:3:=0
								[STOCK_LEVELS:58]Free_Cost:5:=0
								SAVE RECORD:C53([STOCK_LEVELS:58])
							End if 
					End case 
				Else 
					CREATE SET:C116([CURRENT_STOCK:62]; "T1")
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
					If (Records in selection:C76([CURRENT_STOCK:62])>=1)
						FIRST RECORD:C50([CURRENT_STOCK:62])
						If ([CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
							[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
							SAVE RECORD:C53([CURRENT_STOCK:62])
							USE NAMED SELECTION:C332("NEGPFREE")
							GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
							[CURRENT_STOCK:62]Quantity:4:=0
							SAVE RECORD:C53([CURRENT_STOCK:62])
							
						End if 
					Else 
						USE SET:C118("T1")
						Case of 
							: (Sum:C1([CURRENT_STOCK:62]Quantity:4)=Abs:C99($_r_NegQuantity))
								For ($_l_index; 1; Records in selection:C76([CURRENT_STOCK:62]))
									[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
									SAVE RECORD:C53([CURRENT_STOCK:62])
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE NAMED SELECTION:C332("NEGPFREE")
								GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
								[CURRENT_STOCK:62]Quantity:4:=0
								SAVE RECORD:C53([CURRENT_STOCK:62])
							: (Sum:C1([CURRENT_STOCK:62]Quantity:4)=0)
								If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
									USE NAMED SELECTION:C332("NEGPFREE")
									GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
									[CURRENT_STOCK:62]Quantity:4:=0
									
									SAVE RECORD:C53([CURRENT_STOCK:62])
									[STOCK_LEVELS:58]Free_Level:3:=0
									[STOCK_LEVELS:58]Free_Cost:5:=0
									SAVE RECORD:C53([STOCK_LEVELS:58])
								End if 
						End case 
						
					End if 
			End case 
		End if 
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO Potential Current stock records"+Char:C90(13))
		If ($_bo_MakeChanges)
			
			If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
				USE NAMED SELECTION:C332("NEGPFREE")
				GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
				[CURRENT_STOCK:62]Quantity:4:=0
				SAVE RECORD:C53([CURRENT_STOCK:62])
				[STOCK_LEVELS:58]Free_Level:3:=0
				[STOCK_LEVELS:58]Free_Cost:5:=0
				SAVE RECORD:C53([STOCK_LEVELS:58])
			End if 
		End if 
	End if 
	
End for 
USE SET:C118("ALLNEGS")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0)
ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1; >)
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "NEGPALOC")
$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
	USE NAMED SELECTION:C332("NEGPALOC")
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
	SEND PACKET:C103($_ti_DocumentRef; "Negative Allocated P Current stock record"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13))
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="P")
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[CURRENT_STOCK:62]Item_Number:5)
	If (Records in selection:C76([ORDER_ITEMS:25])=1)
		$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
		SEND PACKET:C103($_ti_DocumentRef; "Order state:="+String:C10([ORDERS:24]State:15)+Char:C90(9)+[ORDER_ITEMS:25]Product_Code:2+Char:C90(9)+String:C10([ORDER_ITEMS:25]Quantity:3)+Char:C90(9)+"INVOICE NO:"+[ORDER_ITEMS:25]Invoice_Number:17+Char:C90(9)+"Delivery Date:"+String:C10([ORDER_ITEMS:25]Delivery_Date:11)+Char:C90(13))
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO SALES ORDER ITEM!!!"+Char:C90(13))
	End if 
	
	SEND PACKET:C103($_ti_DocumentRef; "Stock level"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(13))
	$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
	$_l_StockItemNumber:=[CURRENT_STOCK:62]Item_Number:5
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P")
	
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		SEND PACKET:C103($_ti_DocumentRef; "Potential Allocated Current stock records"+Char:C90(13))
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
			SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO Potential Allocated Current stock records"+Char:C90(13))
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			SEND PACKET:C103($_ti_DocumentRef; " Potential FREE Current stock records"+Char:C90(13))
			FIRST RECORD:C50([CURRENT_STOCK:62])
			For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
				SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
				NEXT RECORD:C51([CURRENT_STOCK:62])
			End for 
		Else 
			SEND PACKET:C103($_ti_DocumentRef; "NO Potential Free Current stock records either"+Char:C90(13))
			
		End if 
	End if 
	
End for 
USE SET:C118("ALLNEGS")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O"; *)
QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1; >)
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "NEGOFREE")
$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
	USE NAMED SELECTION:C332("NEGOFREE")
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
	SEND PACKET:C103($_ti_DocumentRef; "Negative Free O Current stock record"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="O")
	SEND PACKET:C103($_ti_DocumentRef; "Stock level"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(13))
	$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
	$_r_NegQuantity:=[CURRENT_STOCK:62]Quantity:4
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="O"; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		SEND PACKET:C103($_ti_DocumentRef; "Potential Current stock records"+Char:C90(13))
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
			SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
		
		If ($_bo_MakeChanges)
			FIRST RECORD:C50([CURRENT_STOCK:62])
			Case of 
				: (Records in selection:C76([CURRENT_STOCK:62])=0)
					If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity)
						[CURRENT_STOCK:62]Quantity:4:=0
						SAVE RECORD:C53([CURRENT_STOCK:62])
						[STOCK_LEVELS:58]Free_Level:3:=0
						[STOCK_LEVELS:58]Free_Cost:5:=0
						SAVE RECORD:C53([STOCK_LEVELS:58])
					End if 
				: (Records in selection:C76([CURRENT_STOCK:62])=1)
					Case of 
						: ([CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
							[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
							SAVE RECORD:C53([CURRENT_STOCK:62])
							USE NAMED SELECTION:C332("NEGPFREE")
							GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
							[CURRENT_STOCK:62]Quantity:4:=0
							SAVE RECORD:C53([CURRENT_STOCK:62])
						: ([CURRENT_STOCK:62]Quantity:4=0)
							If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
								USE NAMED SELECTION:C332("NEGOFREE")
								GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
								[CURRENT_STOCK:62]Quantity:4:=0
								SAVE RECORD:C53([CURRENT_STOCK:62])
								[STOCK_LEVELS:58]Free_Level:3:=0
								[STOCK_LEVELS:58]Free_Cost:5:=0
								SAVE RECORD:C53([STOCK_LEVELS:58])
							End if 
					End case 
				Else 
					CREATE SET:C116([CURRENT_STOCK:62]; "T1")
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
					If (Records in selection:C76([CURRENT_STOCK:62])>=1)
						FIRST RECORD:C50([CURRENT_STOCK:62])
						If ([CURRENT_STOCK:62]Quantity:4>=Abs:C99($_r_NegQuantity))
							[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
							SAVE RECORD:C53([CURRENT_STOCK:62])
							USE NAMED SELECTION:C332("NEGPFREE")
							GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
							[CURRENT_STOCK:62]Quantity:4:=0
							SAVE RECORD:C53([CURRENT_STOCK:62])
							
						End if 
					Else 
						USE SET:C118("T1")
						Case of 
							: (Sum:C1([CURRENT_STOCK:62]Quantity:4)=Abs:C99($_r_NegQuantity))
								For ($_l_index; 1; Records in selection:C76([CURRENT_STOCK:62]))
									[CURRENT_STOCK:62]Quantity:4:=[CURRENT_STOCK:62]Quantity:4+$_r_NegQuantity
									SAVE RECORD:C53([CURRENT_STOCK:62])
									NEXT RECORD:C51([CURRENT_STOCK:62])
								End for 
								USE NAMED SELECTION:C332("NEGPFREE")
								GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
								[CURRENT_STOCK:62]Quantity:4:=0
								SAVE RECORD:C53([CURRENT_STOCK:62])
							: (Sum:C1([CURRENT_STOCK:62]Quantity:4)=0)
								If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
									USE NAMED SELECTION:C332("NEGOFREE")
									GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
									[CURRENT_STOCK:62]Quantity:4:=0
									SAVE RECORD:C53([CURRENT_STOCK:62])
									[STOCK_LEVELS:58]Free_Level:3:=0
									[STOCK_LEVELS:58]Free_Cost:5:=0
									SAVE RECORD:C53([STOCK_LEVELS:58])
								End if 
						End case 
						
					End if 
			End case 
		End if 
		
		
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO Potential Current stock records"+Char:C90(13))
		If ($_bo_MakeChanges)
			
			If ([STOCK_LEVELS:58]Free_Level:3=$_r_NegQuantity) | ([STOCK_LEVELS:58]Free_Level:3=0)
				USE NAMED SELECTION:C332("NEGOFREE")
				GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
				[CURRENT_STOCK:62]Quantity:4:=0
				SAVE RECORD:C53([CURRENT_STOCK:62])
				[STOCK_LEVELS:58]Free_Level:3:=0
				[STOCK_LEVELS:58]Free_Cost:5:=0
				SAVE RECORD:C53([STOCK_LEVELS:58])
			End if 
		End if 
	End if 
	
End for 
USE SET:C118("ALLNEGS")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3="O"; *)
QUERY SELECTION:C341([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0)
ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1; >)
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "NEGOALOC")
$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
	USE NAMED SELECTION:C332("NEGOALOC")
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_CurrentStockIndex)
	SEND PACKET:C103($_ti_DocumentRef; "Negative Allocated O Current stock record"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+String:C10([CURRENT_STOCK:62]Item_Number:5)+Char:C90(13))
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2="O")
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[CURRENT_STOCK:62]Item_Number:5)
	If (Records in selection:C76([ORDER_ITEMS:25])=1)
		$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
		
		SEND PACKET:C103($_ti_DocumentRef; "Order state:="+String:C10([ORDERS:24]State:15)+Char:C90(9)+[ORDER_ITEMS:25]Product_Code:2+Char:C90(9)+String:C10([ORDER_ITEMS:25]Quantity:3)+Char:C90(9)+"INVOICE NO:"+[ORDER_ITEMS:25]Invoice_Number:17+Char:C90(9)+"Delivery Date:"+String:C10([ORDER_ITEMS:25]Delivery_Date:11)+Char:C90(13))
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO SALES ORDER ITEM!!!"+Char:C90(13))
	End if 
	
	SEND PACKET:C103($_ti_DocumentRef; "Stock level"+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(13))
	$_t_ProductCode:=[CURRENT_STOCK:62]Product_Code:1
	$_l_StockItemNumber:=[CURRENT_STOCK:62]Item_Number:5
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$_l_StockItemNumber; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="O")
	
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		SEND PACKET:C103($_ti_DocumentRef; "Potential Allocated O Current stock records"+Char:C90(13))
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
			SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "NO Potential Allocated O Current stock records"+Char:C90(13))
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>=0; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3="P"; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0)
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			SEND PACKET:C103($_ti_DocumentRef; " Potential FREE  O Current stock records"+Char:C90(13))
			FIRST RECORD:C50([CURRENT_STOCK:62])
			For ($_l_CurrentStockIndex2; 1; Records in selection:C76([CURRENT_STOCK:62]))
				SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Cost_Price:6)+Char:C90(13))
				NEXT RECORD:C51([CURRENT_STOCK:62])
			End for 
		Else 
			SEND PACKET:C103($_ti_DocumentRef; "NO Potential Free O Current stock records either"+Char:C90(13))
			
		End if 
	End if 
	
End for 
ERR_MethodTrackerReturn("STK_NegsReport"; $_t_oldMethodName)
