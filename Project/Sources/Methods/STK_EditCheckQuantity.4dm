//%attributes = {}

If (False:C215)
	//Project Method Name:      STK_EditCheckQuantity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocCLog; $_bo_Edit; $0)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckQuantity")

$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)

If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stk_EditcheckQuantity Start="+String:C10(Current time:C178)
End if 

$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckQuantity")
If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
End if 
$0:=False:C215
If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
	[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
	[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
	[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
	[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	$_bo_Edit:=True:C214
Else 
	
End if 
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stk_EditcheckQuantity End="+String:C10(Current time:C178)
End if 
ERR_MethodTrackerReturn("STK_EditCheckQuantity"; $_t_oldMethodName)
