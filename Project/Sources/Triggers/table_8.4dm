If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:02
	//Method Name: Trigger:PRODUCT_BRANDS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCT_BRANDS]")

//[PRODUCTS]Product Code
$0:=0
$_l_event:=Trigger event:C369
C_TEXT:C284($_t_oldMethodName)
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCT_BRANDS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[PRODUCT_BRANDS:8]Brand_Code:1; 0)
			AUTO_AUDIT(->[PRODUCT_BRANDS:8]; Field:C253(->[PRODUCT_BRANDS:8]Brand_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		If ([PRODUCT_BRANDS:8]X_ID:4=0)
			[PRODUCT_BRANDS:8]X_ID:4:=AA_GetNextID(->[PRODUCT_BRANDS:8]X_ID:4)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCT_BRANDS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[PRODUCT_BRANDS:8]Brand_Code:1; 1)
			AUTO_AUDIT(->[PRODUCT_BRANDS:8]; Field:C253(->[PRODUCT_BRANDS:8]Brand_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		If ([PRODUCT_BRANDS:8]X_ID:4=0)
			[PRODUCT_BRANDS:8]X_ID:4:=AA_GetNextID(->[PRODUCT_BRANDS:8]X_ID:4)
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PRODUCT_BRANDS]"; $_l_event)
		If (DB_TableTriggerEnabled(->[PRODUCT_BRANDS:8]))
			AUTO_AUDIT_DEL(->[PRODUCT_BRANDS:8]; Field:C253(->[PRODUCT_BRANDS:8]Brand_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [PRODUCT_BRANDS]"; $_t_oldMethodName)
