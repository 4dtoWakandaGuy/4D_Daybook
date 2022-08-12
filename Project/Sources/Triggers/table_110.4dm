If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:Catalogue_Availability
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [Catalogue_Availability]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214

Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [Catalogue_Availability]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([Catalogue_Availability:110]x_ID:1=0)
				If ([Catalogue_Availability:110]Catalogue_ID:3#0)
					[Catalogue_ProductLink:109]x_ID:1:=AA_GetNextID(->[Catalogue_Availability:110]x_ID:1)
				End if 
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [Catalogue_Availability]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([Catalogue_ProductLink:109]x_ID:1=0)
				If ([Catalogue_Availability:110]Catalogue_ID:3#0)
					[Catalogue_ProductLink:109]x_ID:1:=AA_GetNextID(->[Catalogue_Availability:110]x_ID:1)
				End if 
			End if 
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
End case 


ERR_MethodTrackerReturn("TRIGGER [Catalogue_Availability]"; $_t_oldMethodName)
