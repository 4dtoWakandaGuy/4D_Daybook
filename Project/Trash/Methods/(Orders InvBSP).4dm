//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InvBSP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockPostAu; <>StockPostIn; <>StockPostOr)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InvBSP")
If ((OK=1) & (DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostIn) & (<>StockPostOr))
	If (<>StockPostAu=False:C215)
		Gen_Confirm("Do you want to post the Invoices as a Delivery-Type Stock Movements?"; "Yes"; "No")
	End if 
	If (OK=1)
		DB_t_CurrentFormUsage2:="NC"
		USE SET:C118("SOrders")
		FIRST RECORD:C50([ORDERS:24])
		While (Not:C34(End selection:C36([ORDERS:24])))
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
			INTERSECTION:C121("SItems"; "Extra"; "Extra")
			USE SET:C118("Extra")
			OrdDel_StockP
			NEXT RECORD:C51([ORDERS:24])
		End while 
		DB_t_CurrentFormUsage2:=""
	End if 
End if 
ERR_MethodTrackerReturn("Orders_InvBSP"; $_t_oldMethodName)