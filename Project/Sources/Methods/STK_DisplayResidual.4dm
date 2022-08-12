//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_DisplayResidual
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/07/2014 08:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(STK_bo_DestinationSet)
	C_LONGINT:C283($_l_Process)
	C_REAL:C285(STK_R_CALLEDOFF)
	C_TEXT:C284($_t_oldMethodName; $0; STK_T_ERROR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_DisplayResidual")
STK_R_CALLEDOFF:=0
STK_bo_DestinationSet:=False:C215
STK_T_ERROR:=""
If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	
	$_l_Process:=New process:C317("STK_GetDestination"; 64000; "Get Called Off"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; True:C214)
	While (STK_bo_DestinationSet=False:C215)
		DelayTicks(10)
	End while 
	[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF
	If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
		STK_T_ERROR:="ERROR"
	End if 
	//TRACE
	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
End if 
$0:=STK_T_ERROR
ERR_MethodTrackerReturn("STK_DisplayResidual"; $_t_oldMethodName)
