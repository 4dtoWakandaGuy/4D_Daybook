//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Method7227
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2014 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentStockIndex)
	C_REAL:C285($_r_AddToQuantity; $_r_CSQuantity; $_r_ResidualQuantity; $_r_TakeQuantity)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Method7227")
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
ALL RECORDS:C47([CURRENT_STOCK:62])
//QUERY([CURRENT_STOCK];[CURRENT_STOCK]Product_Code="05-MISC VINTAGE")

For ($_l_CurrentStockIndex; 1; Records in selection:C76([CURRENT_STOCK:62]))
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1)
	If ([PRODUCTS:9]Product_Code:1="05-MISC VINTAGE")
		//TRACE
	End if 
	
	If (Records in selection:C76([PRODUCTS:9])=1) & (STK_IsProductAnalysed([PRODUCTS:9]Product_Code:1))
		
		$_r_CSQuantity:=[CURRENT_STOCK:62]Quantity:4
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"S") & ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"C")
				$_r_AddToQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				$_r_ResidualQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=[CURRENT_STOCK:62]X_ID:13)
				$_r_TakeQuantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				If ($_r_ResidualQuantity#($_r_AddToQuantity-$_r_TakeQuantity))
					SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+":"+String:C10([CURRENT_STOCK:62]X_ID:13)+" Residual Quantity is wrong it is "+String:C10($_r_ResidualQuantity)+" and add to minus take from="+String:C10($_r_AddToQuantity-$_r_TakeQuantity)+Char:C90(13))
				Else 
					If ($_r_ResidualQuantity#$_r_CSQuantity)
						SEND PACKET:C103($_ti_DocumentRef; [CURRENT_STOCK:62]Product_Code:1+":"+String:C10([CURRENT_STOCK:62]X_ID:13)+" current stock Quantity is wrong it is "+String:C10($_r_CSQuantity)+" and residual is="+String:C10($_r_ResidualQuantity)+Char:C90(13))
						
					End if 
					
				End if 
			End if 
		End if 
		
	End if 
	NEXT RECORD:C51([CURRENT_STOCK:62])
	
End for 
Close_DocUMENT($_ti_DocumentRef)

ALERT:C41("done")
ERR_MethodTrackerReturn("Method7227"; $_t_oldMethodName)
