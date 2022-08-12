If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:MAILSORT_C
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_C]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_C]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			AUTO_AUDIT(->[MAILSORT_C:79]; Field:C253(->[RESULTS:14]Result_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_C]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			AUTO_AUDIT(->[MAILSORT_C:79]; Field:C253(->[RESULTS:14]Result_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_C]"; $_l_event)
		If (DB_TableTriggerEnabled(->[MAILSORT_C:79]))
			AUTO_AUDIT_DEL(->[MAILSORT_C:79]; Field:C253(->[RESULTS:14]Result_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [MAILSORT_C]"; $_t_oldMethodName)
