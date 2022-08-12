//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_PrintOutstandingItemsList
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_PrintOutstandingItemsList")
CREATE SET:C116([ORDERS:24]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	If (Not:C34(SR_ReportOK("OrdItOut")))
		FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Outstanding_Report")
		PRINT SELECTION:C60([ORDER_ITEMS:25])
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_PrintOutstandingItemsList"; $_t_oldMethodName)