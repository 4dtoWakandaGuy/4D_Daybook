//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EditCheckMovementType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2014 13:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocCLog; $0)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckMovementType")
$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Check movement type start="+String:C10(Current time:C178)
End if 
If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
End if 
$0:=False:C215
If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
	If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
		//this messes with the system beyond anything it needs-it cant be done.
		[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
		[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
		[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
		[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
		
	End if 
End if 
If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)  // something has changed the movement type..so change the stock item type
	
	[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
	$0:=True:C214
	If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40>=0)
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Plus:3)
			[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
			[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
			
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Minus:4)
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
		End if 
		
	Else 
		
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#[MOVEMENT_TYPES:60]Stock_Minus:4)
			[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
			[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
			
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32#[MOVEMENT_TYPES:60]Stock_Plus:3)
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
			
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
			[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
			
		End if 
	End if 
End if 
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Check movement type end="+String:C10(Current time:C178)
End if 
ERR_MethodTrackerReturn("STK_EditCheckMovementType"; $_t_oldMethodName)
