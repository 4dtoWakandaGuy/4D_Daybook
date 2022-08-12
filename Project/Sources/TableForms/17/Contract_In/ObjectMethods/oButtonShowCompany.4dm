If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/06/2011 17:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; CONT_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oCoButton"; Form event code:C388)

If ([CONTRACTS:17]Company_Code:1#"")
	If (CONT_SubProcCO=0)
		//DBI_MenuDisplayRecords ("Companies";Module_ServiceCentre ;"";->CONT_SubProcCO;->[CONTRACTS]Company Code)
		//ZCompanies_Mod ([CONTRACTS]Company Code;"True";->CONT_SubProcCO)
		CONT_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [CONTRACTS:17]Company_Code:1)
		
	Else 
		$_l_ProcessState:=Process state:C330(CONT_SubProcCO)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_ServiceCentre ;"";->CONT_SubProcCO;->[CONTRACTS]Company Code)
			//ZCompanies_Mod ([CONTRACTS]Company Code;"True";->CONT_SubProcCO)
			CONT_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [CONTRACTS:17]Company_Code:1)
			
		Else 
			BRING TO FRONT:C326(CONT_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oCoButton"; $_t_oldMethodName)
