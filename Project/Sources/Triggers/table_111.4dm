If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:X_LISTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [X_LISTS]")

C_TEXT:C284($_t_oldMethodName)
DB_bo_InLists:=True:C214

$_l_event:=Trigger event:C369
$0:=0
<>SYS_bo_inTrigger:=True:C214

Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [X_LISTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([X_LISTS:111]x_ID:1=0)
				[X_LISTS:111]x_ID:1:=AA_GetNextID(->[X_LISTS:111]x_ID:1)
			End if 
			
			[X_LISTS:111]X_ListVersion:5:=[X_LISTS:111]X_ListVersion:5+1
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		NaNFixer  // 12/03/04 PB
		C_POINTER:C301(SS_P_FIeldPtr)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [X_LISTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([X_LISTS:111]x_ID:1=0)
				[X_LISTS:111]x_ID:1:=AA_GetNextID(->[X_LISTS:111]x_ID:1)
			End if 
		End if 
End case 
DB_bo_InLists:=False:C215



ERR_MethodTrackerReturn("TRIGGER [X_LISTS]"; $_t_oldMethodName)
