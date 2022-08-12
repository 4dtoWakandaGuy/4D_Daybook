If (False:C215)
	//object Name: [RECURRING_JOURNALS]Standing_In.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2010 23:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; RJ_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [RECURRING_JOURNALS].Standing_In.oCoButton"; Form event code:C388)

If ([RECURRING_JOURNALS:38]Company_Code:1#"")
	If (RJ_SubProcCO=0)
		RJ_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [RECURRING_JOURNALS:38]Company_Code:1)
		
		
		//ZCompanies_Mod ([REC JOURNALS]Company Code;"True";->RJ_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(RJ_SubProcCO)
		If ($_l_ProcessState<0)
			//
			RJ_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [RECURRING_JOURNALS:38]Company_Code:1)
			//ZCompanies_Mod ([REC JOURNALS]Company Code;"True";->RJ_SubProcCO)
		Else 
			BRING TO FRONT:C326(RJ_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [RECURRING_JOURNALS].Standing_In.oCoButton"; $_t_oldMethodName)
