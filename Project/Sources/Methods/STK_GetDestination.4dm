//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetDestination
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     31/01/2012 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_StockMovementDates; 0)
	//ARRAY DATE(STK_ad_MovementDate;0)
	ARRAY LONGINT:C221($_al_CopiedFromIDS; 0)
	ARRAY REAL:C219($_ar_MovedQuantities; 0)
	//ARRAY REAL(STK_ar_DestinationQuantity;0)
	ARRAY TEXT:C222($_at_AddtoStockTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	//ARRAY TEXT(STK_at_DestinationCode;0)
	//ARRAY TEXT(STK_at_destinationStockType;0)
	//ARRAY TEXT(STK_at_DestinationType;0)
	C_BOOLEAN:C305(STK_bo_DestinationSet)
	C_LONGINT:C283($1; $2)
	C_REAL:C285($_r_Sum; STK_R_CalledOff)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("STK_GetDestination")
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$2)
If (Count parameters:C259<3)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_CopiedFromIDS; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_StockMovementTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; $_at_AddtoStockTypes; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40; $_ar_MovedQuantities; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; $_ad_StockMovementDates)
	VARIABLE TO VARIABLE:C635($1; STK_at_DestinationCode; $_at_StockMovementCodes; STK_at_DestinationType; $_at_StockMovementTypes; STK_at_destinationStockType; $_at_AddtoStockTypes; STK_ar_DestinationQuantity; $_ar_MovedQuantities; STK_ad_MovementDate; $_ad_StockMovementDates)
	SET PROCESS VARIABLE:C370($1; STK_bo_DestinationSet; True:C214)
Else 
	$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($2))
	
	
	SET PROCESS VARIABLE:C370($1; STK_R_CalledOff; $_r_Sum)
	SET PROCESS VARIABLE:C370($1; STK_bo_DestinationSet; True:C214)
	RESUME PROCESS:C320($1)
End if 
ERR_MethodTrackerReturn("STK_GetDestination"; $_t_oldMethodName)
