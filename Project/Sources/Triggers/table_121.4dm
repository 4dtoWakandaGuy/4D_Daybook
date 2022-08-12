If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:EW_BK_FieldMap
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_BK_FieldMap]")

C_TEXT:C284($_t_oldMethodName)
$_l_event:=Trigger event:C369
$0:=0
Case of 
		
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_BK_FieldMap]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([EW_BK_FieldMap:121]x_RecID:9=0)
				[EW_BK_FieldMap:121]x_RecID:9:=AA_GetNextID(->[EW_BK_FieldMap:121]x_MapSetID:7)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_BK_FieldMap]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([EW_BK_FieldMap:121]x_RecID:9=0)
				[EW_BK_FieldMap:121]x_RecID:9:=AA_GetNextID(->[EW_BK_FieldMap:121]x_MapSetID:7)
			End if 
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [EW_BK_FieldMap]"; $_t_oldMethodName)
