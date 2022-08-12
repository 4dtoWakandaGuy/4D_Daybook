//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CurrentStockReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 09:35
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

$_t_oldMethodName:=ERR_MethodTracker("STK_CurrentStockReport")
CREATE SET:C116([CURRENT_STOCK:62]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([CURRENT_STOCK:62])>0)
	
	ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12; >; [CURRENT_STOCK:62]Currency_Code:11; >; [CURRENT_STOCK:62]Analysis_Code:10; >; [CURRENT_STOCK:62]Stock_Type:3; >; [CURRENT_STOCK:62]Product_Code:1; >; [CURRENT_STOCK:62]Location:8; >; [CURRENT_STOCK:62]Cost_Price:6; >)
	If (Not:C34(SR_ReportOK("StockCuList")))
		FORM SET OUTPUT:C54([CURRENT_STOCK:62]; "StockCurr_List")
		BREAK LEVEL:C302(6)
		ACCUMULATE:C303([CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
		PRINT SELECTION:C60([CURRENT_STOCK:62])
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("STK_CurrentStockReport"; $_t_oldMethodName)