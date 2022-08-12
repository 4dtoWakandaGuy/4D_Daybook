If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]Stock_in.oITMButton1
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
	C_LONGINT:C283($_l_ProcessState; STK_SubProcCO2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oITMButton1"; Form event code:C388)

If ([STOCK_MOVEMENT_ITEMS:27]Company_To:2#"")
	If (STK_SubProcCO2=0)
		//DBI_MenuDisplayRecords ("Companies";Module_StockControl ;"";->STK_SubProcCO2;->[STOCK ITEMS]Company To)
		STK_SubProcCO2:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [STOCK_MOVEMENT_ITEMS:27]Company_To:2)
		
		//ZCompanies_Mod ([STOCK ITEMS]Company To;"True";->STK_SubProcCO2)
	Else 
		$_l_ProcessState:=Process state:C330(STK_SubProcCO2)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_StockControl ;"";->STK_SubProcCO2;->[STOCK ITEMS]Company To)
			//ZCompanies_Mod ([STOCK ITEMS]Company To;"True";->STK_SubProcCO2)
			STK_SubProcCO2:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [STOCK_MOVEMENT_ITEMS:27]Company_To:2)
			
		Else 
			BRING TO FRONT:C326(STK_SubProcCO2)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oITMButton1"; $_t_oldMethodName)
