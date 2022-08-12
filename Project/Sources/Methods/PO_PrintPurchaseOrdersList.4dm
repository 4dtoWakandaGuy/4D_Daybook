//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_PrintPurchaseOrdersList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 12:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284(DB_t_CurrentContext; DB_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_PrintPurchaseOrdersList")
CREATE SET:C116([PURCHASE_ORDERS:57]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([PURCHASE_ORDERS:57])>=1)
	If (Not:C34(SR_ReportOK("POList")))
		Gen_Confirm("Do you want to print the Items?"; "Yes"; "No")
		If (OK=1)
			DB_t_CurrentFormUsage:="Items"
			FORM SET OUTPUT:C54([PURCHASE_ORDERS:57]; "PurchaseOrders_List")
			PRINT SELECTION:C60([PURCHASE_ORDERS:57])
			
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PO_PrintPurchaseOrdersList"; $_t_oldMethodName)
