If (False:C215)
	//object Name: [STOCK_MOVEMENTS]Movements_in.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2010 23:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; STK_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.oCoButton"; Form event code:C388)

If ([STOCK_MOVEMENTS:40]Company_From:2#"")
	If (STK_SubProcCO=0)
		
		STK_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [STOCK_MOVEMENTS:40]Company_From:2)
		
		//ZCompanies_Mod ([STOCK MOVEMENTS]Company From;"True";->STK_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(STK_SubProcCO)
		If ($_l_ProcessState<0)
			STK_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [STOCK_MOVEMENTS:40]Company_From:2)
			
			
			//ZCompanies_Mod ([STOCK MOVEMENTS]Company From;"True";->STK_SubProcCO)
		Else 
			BRING TO FRONT:C326(STK_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.oCoButton"; $_t_oldMethodName)
