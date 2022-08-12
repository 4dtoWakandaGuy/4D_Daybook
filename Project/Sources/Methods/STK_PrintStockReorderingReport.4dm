//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PrintStockReorderingReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 12:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vStockLevel; vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PrintStockReorderingReport")
CREATE SET:C116([PRODUCTS:9]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([PRODUCTS:9])>0)
	QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]ReOrdering:5=True:C214)
	If (Records in selection:C76([STOCK_TYPES:59])=0)
		Gen_Alert(Term_StoWT("Please specify Stock Types to be included for Re-Ordering in the Data Manager"); "Cancel")
	Else 
		Gen_Confirm(Term_StoWT("Do you want to only print Products with Stock Levels less than their Minimum?"); "Yes"; "As selected")
		If (OK=1)
			QUERY SELECTION BY FORMULA:C207([PRODUCTS:9]; (([PRODUCTS:9]Minimum:11>0) & ([PRODUCTS:9]Maintain_Stock:14=True:C214)))
			QUERY SELECTION BY FORMULA:C207([PRODUCTS:9]; Products_ReordS)
		End if 
		If (Records in selection:C76([PRODUCTS:9])>0)
			If (Not:C34(SR_ReportOK("ProdReord")))
				FORM SET OUTPUT:C54([PRODUCTS:9]; "Products_Stock")
				ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
				BREAK LEVEL:C302(2)
				ACCUMULATE:C303(vStockLevel; vStockVal; vStockUA; vStockValUA)
				vTitle:="RE-ORDERING REPORT"
				PRINT SELECTION:C60([PRODUCTS:9])
			End if 
		Else 
			Gen_Alert("None of the selected Products need Re-ordering"; "")
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("STK_PrintStockReorderingReport"; $_t_oldMethodName)