//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetOriginInformation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    31/01/2012 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_StockOrigin; $0; STK_t_origin)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetOriginInformation")

If (Count parameters:C259=0)
	STK_t_origin:=""
	
	$_l_Process:=New process:C317("STK_getOriginInformation"; 128000; "GetOrigin"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
	Repeat 
		DELAY PROCESS:C323(Current process:C322; 2)
	Until (STK_t_origin#"")
	$0:=STK_t_origin
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$2)
	$_t_StockOrigin:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" "+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
	SET PROCESS VARIABLE:C370($1; STK_t_origin; $_t_StockOrigin)
End if 
ERR_MethodTrackerReturn("STK_GetOriginInformation"; $_t_oldMethodName)
