If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PICTURES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PICTURES]")

C_TEXT:C284($_t_oldMethodName)

$_l_event:=Trigger event:C369
$0:=0
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PICTURES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PICTURES:85]Picture_Code:1; 0)
			If ([PICTURES:85]x_ID:5=0)
				[PICTURES:85]x_ID:5:=AA_GetNextID(->[PICTURES:85]x_ID:5)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PICTURES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PICTURES:85]Picture_Code:1; 1)
			If ([PICTURES:85]x_ID:5=0)
				[PICTURES:85]x_ID:5:=AA_GetNextID(->[PICTURES:85]x_ID:5)
			End if 
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [PICTURES]"; $_t_oldMethodName)
