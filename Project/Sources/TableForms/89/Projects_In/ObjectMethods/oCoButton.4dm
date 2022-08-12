If (False:C215)
	//object Name: [PROJECTS]Projects_In.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 22:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; PRJ_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].Projects_In.oCoButton"; Form event code:C388)

If ([PROJECTS:89]Company_Code:3#"")
	If (PRJ_SubProcCO=0)
		//DBI_MenuDisplayRecords ("Companies";Module_JobCosting ;"";->PRJ_SubProcCO;->[PROJECTS]Company Code)
		
		PRJ_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PROJECTS:89]Company_Code:3)
		//ZCompanies_Mod ([PROJECTS]Company Code;"True";->PRJ_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(PRJ_SubProcCO)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_JobCosting ;"";->PRJ_SubProcCO;->[PROJECTS]Company Code)
			PRJ_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PROJECTS:89]Company_Code:3)
			
			
			//ZCompanies_Mod ([PROJECTS]Company Code;"True";->PRJ_SubProcCO)
		Else 
			BRING TO FRONT:C326(PRJ_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PROJECTS].Projects_In.oCoButton"; $_t_oldMethodName)
