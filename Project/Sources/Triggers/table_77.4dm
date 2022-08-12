If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:MAILSORT_A
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_A]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_A]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([MAILSORT_A:77]x_ID:5=0)
				
				[MAILSORT_A:77]x_ID:5:=AA_GetNextID(->[MAILSORT_A:77]x_ID:5)
			End if 
			AUTO_AUDIT(->[MAILSORT_A:77]; Field:C253(->[MAILSORT_A:77]x_ID:5); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_A]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([MAILSORT_A:77]x_ID:5=0)
				
				[MAILSORT_A:77]x_ID:5:=AA_GetNextID(->[MAILSORT_A:77]x_ID:5)
			End if 
			AUTO_AUDIT(->[MAILSORT_A:77]; Field:C253(->[MAILSORT_A:77]x_ID:5); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [MAILSORT_A]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([MAILSORT_A:77]x_ID:5=0)
				[MAILSORT_A:77]x_ID:5:=AA_GetNextID(->[MAILSORT_A:77]x_ID:5)
			End if 
			AUTO_AUDIT_DEL(->[MAILSORT_A:77]; Field:C253(->[MAILSORT_A:77]x_ID:5); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
<>SYS_bo_inTrigger:=False:C215


ERR_MethodTrackerReturn("TRIGGER [MAILSORT_A]"; $_t_oldMethodName)
