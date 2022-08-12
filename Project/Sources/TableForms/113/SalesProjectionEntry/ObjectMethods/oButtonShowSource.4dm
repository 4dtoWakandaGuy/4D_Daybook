If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 05:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283($_l_OrderViewProcess)
	C_TEXT:C284(<>JobCode; <>OrderCode; $_t_oldMethodName; SP_t_SalesOrderNUM)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Invisible Button1"; Form event code:C388)
<>AutoFind:=True:C214



Case of 
	: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[ORDERS:24]))
		If (SP_t_SalesOrderNUM#"")
			<>OrderCode:=SP_t_SalesOrderNUM
			<>AutoFind:=True:C214
			//ZOrders_View
			$_l_OrderViewProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Order"; Current process:C322; Table:C252(->[ORDERS:24]); ""; SP_t_SalesOrderNUM)
			
		End if 
		
	: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[JOBS:26]))
		If (SP_t_SalesOrderNUM#"")
			<>JobCode:=SP_t_SalesOrderNUM
			<>AutoFind:=True:C214
			
			<>DB_bo_AutoOut:=False:C215
			$_l_OrderViewProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Job"; Current process:C322; Table:C252(->[JOBS:26]); ""; SP_t_SalesOrderNUM)
			
			
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ:SalesProjectionEntry,BSourceC"; $_t_oldMethodName)
