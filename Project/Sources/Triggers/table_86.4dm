If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:COMPONENTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPONENTS]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPONENTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			Case of 
				: ([COMPONENTS:86]Component_is_Product_Group:15)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*GROUPS")
				: ([COMPONENTS:86]Component_is_Product_Brand:16)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*BRANDS")
				: ([COMPONENTS:86]Component_Code:2#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Component_Code:2)
				: ([COMPONENTS:86]Catalogue_ID:7#0)
					$IDSTRING:=String:C10([COMPONENTS:86]Catalogue_ID:7)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; $IDSTRING)
				: ([COMPONENTS:86]Group_Code:8#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Group_Code:8)
				: ([COMPONENTS:86]Macro_Rule:9#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Macro_Rule:9)
					//NG may 2004 the above line said [products]product code
			End case 
			If ([COMPONENTS:86]X_ComponentID:21=0)
				[COMPONENTS:86]X_ComponentID:21:=AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21)
			End if 
			
			AUTO_AUDIT(->[COMPONENTS:86]; Field:C253(->[COMPONENTS:86]Component_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPONENTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			Case of 
				: ([COMPONENTS:86]Component_is_Product_Group:15)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*GROUPS")
				: ([COMPONENTS:86]Component_is_Product_Brand:16)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*BRANDS")
				: ([COMPONENTS:86]Component_Code:2#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Component_Code:2)
				: ([COMPONENTS:86]Catalogue_ID:7#0)
					$IDSTRING:=String:C10([COMPONENTS:86]Catalogue_ID:7)
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; $IDSTRING)
				: ([COMPONENTS:86]Group_Code:8#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Group_Code:8)
				: ([COMPONENTS:86]Macro_Rule:9#"")
					[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Macro_Rule:9)
					//NG may 2004 the above line said [products]product code
			End case 
			//NG may 2004 the above line said [products]product code
			
			If ([COMPONENTS:86]X_ComponentID:21=0)
				[COMPONENTS:86]X_ComponentID:21:=AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21)
			End if 
			AUTO_AUDIT(->[COMPONENTS:86]; Field:C253(->[COMPONENTS:86]Component_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPONENTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[COMPONENTS:86]; Field:C253(->[COMPONENTS:86]Component_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [COMPONENTS]"; $_t_oldMethodName)
