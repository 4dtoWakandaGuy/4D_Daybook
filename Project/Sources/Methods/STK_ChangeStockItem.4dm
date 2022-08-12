//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ChangeStockItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 15:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_AllocCLog)
	C_LONGINT:C283($_l_CopiedFromMIID; $_l_GiveitUp; $_l_MovementItemIndex; $1; $2; $3; STK_l_TransactionID)
	C_REAL:C285($_r_CalledOffQuantity)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ChangeStockItem")

$_l_GiveitUp:=0
If (Count parameters:C259>=3)
	Case of 
		: ($3=-1)
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
			$_r_CalledOffQuantity:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($1))
			
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
				For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If ($_l_MovementItemIndex>1)
						While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
							DelayTicks(2)
						End while 
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
						
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
			End if 
			$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_productCode)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				//these are wrong stock movement items....
				//TRACE
				For ($_l_MovementItemIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
						DelayTicks(2)
					End while 
					$_l_CopiedFromMIID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
					If ($_l_CopiedFromMIID>0)
						SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
						STK_UpdateCalledOffQuantity(-$_l_CopiedFromMIID)
					End if 
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					
				End for 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
				$_r_CalledOffQuantity:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($1))
				
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
				DelayTicks(2)
			End while 
			If ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
				//TRACE
				[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
				[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				
			End if 
		: ($3=1)  //Change the take from current stock
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
			$_r_CalledOffQuantity:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($1))
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#$2)
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(2)
				End while 
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$2
				If ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				End if 
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			End if 
		: ($3=2) | ($3=3)  //Change the add to current stock
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
			$_r_CalledOffQuantity:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($1))
			
			READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
			If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22#$2)
				While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1))) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(2)
				End while 
				[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=$2
				If ($3=3)
					[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
				End if 
				If ($_r_CalledOffQuantity#[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
					//TRACE
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				End if 
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("STK_ChangeStockItem"; $_t_oldMethodName)
