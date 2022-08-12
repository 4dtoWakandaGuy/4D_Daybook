//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CheckUsedBy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2010 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OverUsedPOITemID; 0)
	ARRAY LONGINT:C221($_al_POItemNumbers; 0)
	ARRAY LONGINT:C221($_al_StockCopiedFromiDS; 0)
	ARRAY TEXT:C222($_at_MovmentTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	C_LONGINT:C283($_l_Deletions; $_l_Index)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_CheckUsedBy")
If (True:C214)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	$_l_Deletions:=0
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_al_POItemNumbers)
	QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]POitemID:16; $_al_POItemNumbers)
	CREATE SET:C116([PURCHASE_ORDERS_ITEMS:169]; "$Linked")
	ALL RECORDS:C47([PURCHASE_ORDERS_ITEMS:169])
	CREATE SET:C116([PURCHASE_ORDERS_ITEMS:169]; "$NoTLinked")
	DIFFERENCE:C122("$NoTLinked"; "$Linked"; "$NoTLinked")
	USE SET:C118("$NoTLinked")
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	ARRAY LONGINT:C221($_al_OverUsedPOITemID; 0)
	ORDER BY:C49([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
	If (False:C215)
		For ($_l_Index; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
			If (False:C215)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
				$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
				If ($_r_Sum>[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
					$_l_Deletions:=$_l_Deletions+1
					//MESSAGE("DELETING"+String($_l_Deletions))
					
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20:="")
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21=[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
					APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=0)
					
				End if 
			End if 
			If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
			End if 
			SEND PACKET:C103($_ti_DocumentRef; [PURCHASE_ORDERS:57]Purchase_Order_Number:2+Char:C90(9)+String:C10([PURCHASE_ORDERS:57]Purchase_Order_Date:3)+Char:C90(9)+[PURCHASE_ORDERS_ITEMS:169]Product_Code:1+Char:C90(9)+String:C10([PURCHASE_ORDERS_ITEMS:169]Quantity:3)+Char:C90(13))
			
			
			
			NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
			
		End for 
	End if 
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
	SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_MovmentTypes)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_MovmentTypes)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20="")
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; >)
	
	For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			
		End if 
		SEND PACKET:C103($_ti_DocumentRef; [STOCK_MOVEMENTS:40]Movement_Code:1+Char:C90(9)+[STOCK_MOVEMENTS:40]Company_From:2+Char:C90(9)+String:C10([STOCK_MOVEMENTS:40]Movement_Date:5)+Char:C90(9)+"PO NUMBER"+[STOCK_MOVEMENTS:40]MovementSourceReference:18)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(13))
		
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		
	End for 
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
Else 
	
	//TRACE
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_StockCopiedFromiDS)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_StockCopiedFromiDS)
	
	ARRAY LONGINT:C221($_al_OverUsedPOITemID; 0)
	For ($_l_Index; 1; Size of array:C274($_al_StockCopiedFromiDS))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_StockCopiedFromiDS{$_l_Index})
		$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($_al_StockCopiedFromiDS{$_l_Index}))
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_StockCopiedFromiDS{$_l_Index})
		If ($_r_Sum>[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			APPEND TO ARRAY:C911($_al_OverUsedPOITemID; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
		End if 
		
		
	End for 
	
	
	
End if 
ERR_MethodTrackerReturn("STK_CheckUsedBy"; $_t_oldMethodName)
