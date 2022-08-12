//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PrintItemsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 10:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PrintItemsList")
CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	If (Not:C34(SR_ReportOK("StockItList")))
		FORM SET OUTPUT:C54([STOCK_MOVEMENT_ITEMS:27]; "Stock_List")
		ACCUMULATE:C303([STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
		PRINT SELECTION:C60([STOCK_MOVEMENT_ITEMS:27])
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("STK_PrintItemsList"; $_t_oldMethodName)