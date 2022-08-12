If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oContButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; SVS_SubProcCON)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oContButton"; Form event code:C388)

If ([SERVICE_CALLS:20]Contact_Code:2#"")
	If (SVS_SubProcCON=0)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_ServiceCentre; ""; ->[CONTACTS:1]Contact_Code:2; [SERVICE_CALLS:20]Contact_Code:2)
		
		
	Else 
		$_l_ProcessState:=Process state:C330(SVS_SubProcCON)
		If ($_l_ProcessState<0)
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_ServiceCentre; ""; ->[CONTACTS:1]Contact_Code:2; [SERVICE_CALLS:20]Contact_Code:2)
			
		Else 
			BRING TO FRONT:C326(SVS_SubProcCON)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oContButton"; $_t_oldMethodName)
