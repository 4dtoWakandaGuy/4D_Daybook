//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PrintStockMovementsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PrintStockMovementsList")
CREATE SET:C116([STOCK_MOVEMENTS:40]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
	If (Not:C34(SR_ReportOK("MovtList")))
		Gen_Confirm("Do you want to print the Items?"; "Yes"; "No")
		If (OK=1)
			DB_t_CurrentFormUsage:="Stock"
		Else 
			REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
			
			//QUERY([STOCK ITEMS];[STOCK ITEMS]Product Code="zzzzz")
		End if 
		FORM SET OUTPUT:C54([STOCK_MOVEMENTS:40]; "Movements_List")
		PRINT SELECTION:C60([STOCK_MOVEMENTS:40])
		
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("STK_PrintStockMovementsList"; $_t_oldMethodName)