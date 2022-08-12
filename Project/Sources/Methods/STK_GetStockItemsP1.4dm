//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetStockItemsP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetStockItemsP1")

If (vStatus="•ALL")
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=vProdCode; *)
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=vProdCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=vStatus; *)
End if 
If (DB_t_CurrentFormUsage="Jobs")
	STK_GetStockItemsP2([JOBS:26]Analysis_Code:24; [JOBS:26]Currency_Code:25; [JOBS:26]Layer_Code:26)
Else 
	STK_GetStockItemsP2([ORDERS:24]Analysis_Code:33; [ORDERS:24]Currency_Code:32; [ORDERS:24]Layer_Code:47)
End if 
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
If (False:C215)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$TemP")
		$_bo_ReadOnlyState:=Read only state:C362([STOCK_MOVEMENT_ITEMS:27])
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		MESSAGES OFF:C175
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
		UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		MESSAGES ON:C181
		If ($_bo_ReadOnlyState)
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		End if 
		USE NAMED SELECTION:C332("$temP")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetStockItemsP1"; $_t_oldMethodName)