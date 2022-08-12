If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:STOCK_LEVELS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_LEVELS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
C_BOOLEAN:C305(Stock_bo_SkipCheck)  // dont redo the check
Stock_bo_SkipCheck:=False:C215
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_LEVELS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([STOCK_LEVELS:58]X_ID:10=0)
				If ([STOCK_LEVELS:58]Product_Code:1#"")
					[STOCK_LEVELS:58]X_ID:10:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
				End if 
			End if 
			AUTO_AUDIT(->[STOCK_LEVELS:58]; Field:C253(->[STOCK_LEVELS:58]X_ID:10); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			[STOCK_LEVELS:58]UniqueConstruct:11:=STOCK_BuildUnique([STOCK_LEVELS:58]Product_Code:1; [STOCK_LEVELS:58]Currency_Code:8; [STOCK_LEVELS:58]Layer_Code:9; [STOCK_LEVELS:58]Stock_Type:2; [STOCK_LEVELS:58]Analysis_Code:7)
			
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_LEVELS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([STOCK_LEVELS:58]X_ID:10=0)
				[STOCK_LEVELS:58]X_ID:10:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
			End if 
			$newConstruct:=STOCK_BuildUnique([STOCK_LEVELS:58]Product_Code:1; [STOCK_LEVELS:58]Currency_Code:8; [STOCK_LEVELS:58]Layer_Code:9; [STOCK_LEVELS:58]Stock_Type:2; [STOCK_LEVELS:58]Analysis_Code:7)
			If (Not:C34(Stock_bo_SkipCheck))
				If ([STOCK_LEVELS:58]UniqueConstruct:11#$newConstruct)
					
				End if 
			End if 
			
			[STOCK_LEVELS:58]UniqueConstruct:11:=$newConstruct
			
			
			AUTO_AUDIT(->[STOCK_LEVELS:58]; Field:C253(->[STOCK_LEVELS:58]X_ID:10); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_LEVELS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([STOCK_LEVELS:58]X_ID:10=0)
				[STOCK_LEVELS:58]X_ID:10:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
			End if 
			AUTO_AUDIT_DEL(->[STOCK_LEVELS:58]; Field:C253(->[STOCK_LEVELS:58]X_ID:10); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
		
End case 
<>SYS_bo_inTrigger:=False:C215


ERR_MethodTrackerReturn("TRIGGER [STOCK_LEVELS]"; $_t_oldMethodName)
