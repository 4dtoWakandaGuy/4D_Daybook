If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oCoButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; CONT_SubProcCON)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oCoButton1"; Form event code:C388)

If ([CONTRACTS:17]Contact_Code:2#"")
	If (CONT_SubProcCON=0)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_ServiceCentre; ""; ->[CONTACTS:1]Contact_Code:2; [CONTRACTS:17]Contact_Code:2)
		
		//ZContacts_Mod ([CONTRACTS]Contact Code;"True";->CONT_SubProcCON)
	Else 
		$_l_ProcessState:=Process state:C330(CONT_SubProcCON)
		If ($_l_ProcessState<0)
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_ServiceCentre; ""; ->[CONTACTS:1]Contact_Code:2; [CONTRACTS:17]Contact_Code:2)
			
			//ZContacts_Mod ([CONTRACTS]Contact Code;"True";->CONT_SubProcCON)
		Else 
			BRING TO FRONT:C326(CONT_SubProcCON)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oCoButton1"; $_t_oldMethodName)
