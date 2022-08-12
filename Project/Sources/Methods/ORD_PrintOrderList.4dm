//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_PrintOrderList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 13:26
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

$_t_oldMethodName:=ERR_MethodTracker("ORD_PrintOrderList")
CREATE SET:C116([ORDERS:24]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	If (Not:C34(SR_ReportOK("OrdList")))
		FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
		ORDER BY:C49([ORDERS:24]; [ORDERS:24]Company_Code:1; >; [ORDERS:24]Order_Date:4; >)
		BREAK LEVEL:C302(1)
		ACCUMULATE:C303([ORDERS:24]Total_Amount:6; [ORDERS:24]Total_TAX:7; [ORDERS:24]Total_Total:8; [ORDERS:24]Total_Cost:11; [ORDERS:24]Total_Margin:12)
		PRINT SELECTION:C60([ORDERS:24])
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_PrintOrderList"; $_t_oldMethodName)