If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]Stock_in.oORDButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/03/2013 12:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OrderViewProcess; $_l_ProcessState; STK_SubProcORD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oORDButton"; Form event code:C388)

If ([STOCK_MOVEMENT_ITEMS:27]Order_Code:3#"")
	If (STK_SubProcORD=0)
		$_l_OrderViewProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Orders"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
		
		//ZOrders_Mod ([STOCK ITEMS]Order Code;"True";->STK_SubProcORD)
	Else 
		$_l_ProcessState:=Process state:C330(STK_SubProcORD)
		If ($_l_ProcessState<0)
			$_l_OrderViewProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Orders"; Current process:C322; Table:C252(->[ORDERS:24]); ""; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
			
		Else 
			BRING TO FRONT:C326(STK_SubProcORD)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oORDButton"; $_t_oldMethodName)
