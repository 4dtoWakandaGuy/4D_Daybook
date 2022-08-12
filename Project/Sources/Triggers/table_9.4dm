If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PRODUCTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCTS]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PRODUCTS:9]Product_Code:1; 0)
			If ([PRODUCTS:9]X_ID:43=0)
				If ([PRODUCTS:9]Product_Code:1#"")
					[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
				End if 
				
			End if 
			AUTO_AUDIT(->[PRODUCTS:9]; Field:C253(->[PRODUCTS:9]Product_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PRODUCTS:9]Product_Code:1; 1)
			If ([PRODUCTS:9]X_ID:43=0)
				[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
			End if 
			AUTO_AUDIT(->[PRODUCTS:9]; Field:C253(->[PRODUCTS:9]Product_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[PRODUCTS:9]; Field:C253(->[PRODUCTS:9]Product_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [PRODUCTS]"; $_t_oldMethodName)
