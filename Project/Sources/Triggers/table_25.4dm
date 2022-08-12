If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:ORDER_ITEMS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDER_ITEMS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDER_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			NaNFixer
			If ([ORDER_ITEMS:25]x_ID:58=0)
				If ([ORDER_ITEMS:25]Order_Code:1#"")
					
					[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
				End if 
			End if 
			AUTO_AUDIT(->[ORDER_ITEMS:25]; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			//*********added 28/02/07 -kmw********
			If ([ORDER_ITEMS:25]Job_Code:34#"") | ([ORDER_ITEMS:25]Job_Stage_Code:60#"")
				$OICompositeKey:=[ORDER_ITEMS:25]Job_Code:34+"*|Delim1|*"+[ORDER_ITEMS:25]Job_Stage:35+"*|Delim2|*"+[ORDER_ITEMS:25]Job_Stage_Code:60
				C_BLOB:C604(OI_blb_CompositeKey)
				SET BLOB SIZE:C606(OI_blb_CompositeKey; 0)
				VARIABLE TO BLOB:C532($OICompositeKey; OI_blb_CompositeKey)
				
				ProcessServices_CreateRecord(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]x_ID:58; "JCAddOI"; 0; 0; 0; False:C215; ->OI_blb_CompositeKey)  //adds Job or Job Stage with initial total or updates pre-existing Job or Job Stage
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		//
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDER_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([ORDER_ITEMS:25]x_ID:58=0)
				If ([ORDER_ITEMS:25]Order_Code:1#"")
					
					[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
				End if 
			End if 
			AUTO_AUDIT(->[ORDER_ITEMS:25]; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			//*********added 28/02/07 -kmw********
			If ([ORDER_ITEMS:25]Job_Code:34#"") | ([ORDER_ITEMS:25]Job_Stage_Code:60#"")
				$OICompositeKey:=[ORDER_ITEMS:25]Job_Code:34+"*|Delim1|*"+[ORDER_ITEMS:25]Job_Stage:35+"*|Delim2|*"+[ORDER_ITEMS:25]Job_Stage_Code:60
				C_BLOB:C604(OI_blb_CompositeKey)
				SET BLOB SIZE:C606(OI_blb_CompositeKey; 0)
				
				VARIABLE TO BLOB:C532($OICompositeKey; OI_blb_CompositeKey)
				ProcessServices_CreateRecord(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]x_ID:58; "JCModOI"; 0; 0; 0; False:C215; ->OI_blb_CompositeKey)  //updates pre-existing Job or Job Stage (if any)
				//********************************
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDER_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT_DEL(->[ORDER_ITEMS:25]; Field:C253(->[ORDER_ITEMS:25]Order_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			//*********added 28/02/07 -kmw********
			If ([ORDER_ITEMS:25]Job_Code:34#"") | ([ORDER_ITEMS:25]Job_Stage_Code:60#"")
				$OICompositeKey:=[ORDER_ITEMS:25]Job_Code:34+"*|Delim1|*"+[ORDER_ITEMS:25]Job_Stage:35+"*|Delim2|*"+[ORDER_ITEMS:25]Job_Stage_Code:60
				C_BLOB:C604(OI_blb_CompositeKey)
				SET BLOB SIZE:C606(OI_blb_CompositeKey; 0)
				VARIABLE TO BLOB:C532($OICompositeKey; OI_blb_CompositeKey)
				ProcessServices_CreateRecord(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]x_ID:58; "JCDelOI"; 0; 0; 0; False:C215; ->OI_blb_CompositeKey)  //updates pre-existing Job or Job Stage (if any)
				//********************************
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [ORDER_ITEMS]"; $_t_oldMethodName)
