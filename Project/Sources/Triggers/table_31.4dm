If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:TRANSACTION_TYPES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTION_TYPES]")

C_TEXT:C284($_t_oldMethodName)

$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTION_TYPES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; 0)
			AUTO_AUDIT(->[TRANSACTION_TYPES:31]; Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTION_TYPES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; 1)
			AUTO_AUDIT(->[TRANSACTION_TYPES:31]; Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTION_TYPES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT_DEL(->[TRANSACTION_TYPES:31]; Field:C253(->[TRANSACTION_TYPES:31]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [TRANSACTION_TYPES]"; $_t_oldMethodName)
