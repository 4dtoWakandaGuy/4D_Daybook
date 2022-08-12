If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; SVS_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oCoButton"; Form event code:C388)

If ([SERVICE_CALLS:20]Company_Code:1#"")
	If (SVS_SubProcCO=0)
		SVS_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [SERVICE_CALLS:20]Company_Code:1)
		
		
		//ZCompanies_Mod ([SERVICE CALLS]Company Code;"True";->SVS_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(SVS_SubProcCO)
		If ($_l_ProcessState<0)
			SVS_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [SERVICE_CALLS:20]Company_Code:1)
			
		Else 
			BRING TO FRONT:C326(SVS_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oCoButton"; $_t_oldMethodName)
