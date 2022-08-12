If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:SCRIPTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SCRIPTS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369

C_LONGINT:C283(<>SCPT_l_CheckVersion)
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SCRIPTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[SCRIPTS:80]Script_Code:1; 0)
			
			$Updated:=False:C215
			
			$Updated:=True:C214
			[SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4)
			
			If ($Updated)
				C_LONGINT:C283(<>SCPT_l_CheckVersion)
				If (<>SCPT_l_CheckVersion=0)
					<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck
				End if 
				[SCRIPTS:80]Script_Checked:12:=<>SCPT_l_CheckVersion
				[SCRIPTS:80]ModifiedStamp:23:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
				SMC_SaveMacroInfo
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SCRIPTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			db_CheckMyUnique(->[SCRIPTS:80]Script_Code:1; 1)
			
			$Updated:=False:C215
			
			$Updated:=True:C214
			[SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4)
			
			SMC_SaveMacroInfo
			AUTO_AUDIT(->[SCRIPTS:80]; Field:C253(->[SCRIPTS:80]Script_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ($Updated)
				If (<>SCPT_l_CheckVersion=0)
					<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck
				End if 
				[SCRIPTS:80]ModifiedStamp:23:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
				[SCRIPTS:80]Script_Checked:12:=<>SCPT_l_CheckVersion
			End if 
		End if 
		
End case 





ERR_MethodTrackerReturn("TRIGGER [SCRIPTS]"; $_t_oldMethodName)
