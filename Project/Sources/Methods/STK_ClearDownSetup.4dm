//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ClearDownSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2011 23:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_Index; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ClearDownSetup")

READ WRITE:C146([PRODUCTS:9])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
If (Count parameters:C259>=1)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
	
Else 
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
End if 
For ($_l_Index; 1; Records in selection:C76([PRODUCTS:9]))
	$_l_Retries:=0
	While (Not:C34(Check_Locked(->[PRODUCTS:9]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(60*$_l_Retries)
		
	End while 
	[PRODUCTS:9]x_Product_Stock_is_Setup:59:=False:C215
	SAVE RECORD:C53([PRODUCTS:9])
	NEXT RECORD:C51([PRODUCTS:9])
End for 

If (Count parameters:C259>=1)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1)
	
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23#0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17#0)
End if 
Repeat 
	APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0)
	APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0)
	USE SET:C118("LockedSet")
Until (Records in set:C195("LockedSet")=0)
If (Count parameters:C259>=1)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#0)
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#0)
End if 
MESSAGES OFF:C175
Repeat 
	APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
	USE SET:C118("LockedSet")
Until (Records in set:C195("LockedSet")=0)

MESSAGES ON:C181
ERR_MethodTrackerReturn("STK_ClearDownSetup"; $_t_oldMethodName)
