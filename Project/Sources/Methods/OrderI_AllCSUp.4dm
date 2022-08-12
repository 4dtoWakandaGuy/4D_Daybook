//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllCSUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllCSUp")
//OrderI Alloc Current Stock UPdate
FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
While ((Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27]))) & (OK=1))
	If (Not:C34(STK_IsProductAnalysed([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)))
		While (Semaphore:C143("CurrentStock"+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))  //Prevent any other process from creating the same current stock
			ALERT:C41("in OrderI_AllCSUp")
			DelayTicks(2)
		End while 
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Number:7=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9)
		OrderI_AllCSUp2
		CLEAR SEMAPHORE:C144("CurrentStock"+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	End if 
	NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	
End while 
ERR_MethodTrackerReturn("OrderI_AllCSUp"; $_t_oldMethodName)