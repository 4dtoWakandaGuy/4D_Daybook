If (False:C215)
	//object Name: [PROJECTS]Projects_In.oContButton
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
	C_LONGINT:C283($_l_ProcessState; PRJ_SubProcCON)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].Projects_In.oContButton"; Form event code:C388)

If ([PROJECTS:89]Contact_Code:4#"")
	If (PRJ_SubProcCON=0)
		//DBI_MenuDisplayRecords ("Contacts";Module_JobCosting ;"";->PRJ_SubProcCON;->[PROJECTS]Contact Code)
		PRJ_SubProcCON:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [PROJECTS:89]Contact_Code:4)
		
		//ZContacts_Mod ([PROJECTS]Contact Code;"True";->PRJ_SubProcCON)
	Else 
		$_l_ProcessState:=Process state:C330(PRJ_SubProcCON)
		If ($_l_ProcessState<0)
			PRJ_SubProcCON:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [PROJECTS:89]Contact_Code:4)
			
			//DBI_MenuDisplayRecords ("Contacts";Module_JobCosting ;"";->PRJ_SubProcCON;->[PROJECTS]Contact Code)
			//  `ZContacts_Mod ([PROJECTS]Contact Code;"True";->PRJ_SubProcCON)
		Else 
			BRING TO FRONT:C326(PRJ_SubProcCON)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PROJECTS].Projects_In.oContButton"; $_t_oldMethodName)
