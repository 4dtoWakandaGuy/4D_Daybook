If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:INVOICES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INVOICES]")

C_TEXT:C284($_t_oldMethodName)
C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab)
$0:=0


$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[INVOICES:39]Invoice_Number:1; 0)
			AUTO_AUDIT(->[INVOICES:39]; Field:C253(->[INVOICES:39]Invoice_Number:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If (Not:C34(<>SI_bo_AllocationValidationDisab))
				If (Not:C34(<>SI_bo_AllocationValidationDisab))
					C_LONGINT:C283(DataDummy)
					Datadummy:=0
					ProcessServices_CreateRecord(->[INVOICES:39]; ->Datadummy; [INVOICES:39]Invoice_Number:1)
					If ([INVOICES:39]Total_Due:7=0) & ([INVOICES:39]Invoice_Number:1#"")  //Ng September 2004
						[INVOICES:39]X_invoiceClearedDate:43:=Current date:C33(*)
					End if 
				End if 
				
				
			End if 
			<>SI_bo_AllocationValidationDisab:=False:C215
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[INVOICES:39]Invoice_Number:1; 1)
			
			AUTO_AUDIT(->[INVOICES:39]; Field:C253(->[INVOICES:39]Invoice_Number:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If (Not:C34(<>SI_bo_AllocationValidationDisab))
				If (Not:C34(<>SI_bo_AllocationValidationDisab))
					C_LONGINT:C283(DataDummy)
					Datadummy:=0
					ProcessServices_CreateRecord(->[INVOICES:39]; ->Datadummy; [INVOICES:39]Invoice_Number:1)
					Case of 
						: ([INVOICES:39]Total_Due:7=0) & (Old:C35([INVOICES:39]Total_Due:7)#0)  //Ng September 2004
							[INVOICES:39]X_invoiceClearedDate:43:=Current date:C33(*)
						: ([INVOICES:39]Total_Due:7=0) & (Old:C35([INVOICES:39]Total_Due:7)=0) & ([INVOICES:39]X_invoiceClearedDate:43=!00-00-00!)  //Ng September 2004
							//Legacy data was already cleared
							ProcessServices_CreateRecord(->[INVOICES:39]; ->Datadummy; "•"+[INVOICES:39]Invoice_Number:1)
							
					End case 
					
				End if 
				
			End if 
			<>SI_bo_AllocationValidationDisab:=False:C215
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[INVOICES:39]; Field:C253(->[INVOICES:39]Invoice_Number:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [INVOICES]"; $_t_oldMethodName)
