//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SetCreatedStockItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2014 10:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $3; $4; $5)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SetCreatedStockItem")

If (Count parameters:C259>=2)
	If ($1<=0)  //new record
		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		
		
		
	End if 
	If (Count parameters:C259>=2)
		
		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
		[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99($2)
	End if 
	
	If (Count parameters:C259>=3)
		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$3
	End if 
	
	If (Count parameters:C259>=4)
		[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=$4
	Else 
		[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=0
	End if 
	If (Count parameters:C259>=5)
		If ($5>0)
			[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$5
			[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=$5
		Else 
			[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
			[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$5
		End if 
	Else 
		[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21:=0
	End if 
	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
	[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
	AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
	If ($1=0) | ($1=2)
		Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	End if 
	
End if 
ERR_MethodTrackerReturn("STK_SetCreatedStockItem"; $_t_oldMethodName)