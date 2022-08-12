If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:AddressRecords
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [AddressRecords]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [AddressRecords]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([AddressRecords:125]X_ID:1=0)
				[AddressRecords:125]X_ID:1:=AA_GetNextID(->[AddressRecords:125]X_ID:1)
			End if 
			[AddressRecords:125]FormattedAddress:12:=WS_BUILDADDRESS([AddressRecords:125]AddressLine1:6; [AddressRecords:125]AddressLine2:7; [AddressRecords:125]Town_City:8; [AddressRecords:125]County_State:9; [AddressRecords:125]Postal_Code:10; [AddressRecords:125]Country:11)
			AUTO_AUDIT(->[AddressRecords:125]; Field:C253(->[AddressRecords:125]X_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [AddressRecords]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([AddressRecords:125]X_ID:1=0)
				[AddressRecords:125]X_ID:1:=AA_GetNextID(->[AddressRecords:125]X_ID:1)
			End if 
			[AddressRecords:125]FormattedAddress:12:=WS_BUILDADDRESS([AddressRecords:125]AddressLine1:6; [AddressRecords:125]AddressLine2:7; [AddressRecords:125]Town_City:8; [AddressRecords:125]County_State:9; [AddressRecords:125]Postal_Code:10; [AddressRecords:125]Country:11)
			AUTO_AUDIT(->[AddressRecords:125]; Field:C253(->[AddressRecords:125]X_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [AddressRecords]"; $_l_event)
		If (DB_TableTriggerEnabled(->[AddressRecords:125]))
			AUTO_AUDIT(->[AddressRecords:125]; Field:C253(->[AddressRecords:125]X_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [AddressRecords]"; $_t_oldMethodName)
