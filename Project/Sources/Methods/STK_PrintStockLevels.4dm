//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PrintStockLevels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/11/2010 23:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vNo; vNo2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PrintStockLevels")
CREATE SET:C116([STOCK_LEVELS:58]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([STOCK_LEVELS:58])>0)
	CREATE SET:C116([STOCK_LEVELS:58]; "Master")
	vNo:=Records in selection:C76([STOCK_LEVELS:58])
	DB_t_CurrentFormUsage:="Print"
	ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9; >; [STOCK_LEVELS:58]Currency_Code:8; >; [STOCK_LEVELS:58]Analysis_Code:7; >; [STOCK_LEVELS:58]Stock_Type:2; >; [STOCK_LEVELS:58]Product_Code:1; >)
	vNo2:=vNo
	If (vNo2#vNo)
		ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9; >; [STOCK_LEVELS:58]Currency_Code:8; >; [STOCK_LEVELS:58]Analysis_Code:7; >; [STOCK_LEVELS:58]Stock_Type:2; >; [STOCK_LEVELS:58]Product_Code:1; >)
	End if 
	If (Not:C34(SR_ReportOK("StockLevVal")))
		FORM SET OUTPUT:C54([STOCK_LEVELS:58]; "StockLev_List")
		BREAK LEVEL:C302(4)
		ACCUMULATE:C303([STOCK_LEVELS:58]Free_Level:3; [STOCK_LEVELS:58]Free_Cost:5; [STOCK_LEVELS:58]Allocated_Level:4; [STOCK_LEVELS:58]Allocated_Cost:6)
		PRINT SELECTION:C60([STOCK_LEVELS:58])
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("STK_PrintStockLevels"; $_t_oldMethodName)