If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:02
	//Method Name: Trigger:CONTACTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CONTACTS]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214

Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1) | ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CONTACTS]"; Trigger event:C369)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ($_l_event=On Saving New Record Event:K3:1)
				db_CheckMyUnique(->[CONTACTS:1]Contact_Code:2; 0)
			Else 
				db_CheckMyUnique(->[CONTACTS:1]Contact_Code:2; 1)
			End if 
			
			//
			
			$ttemp:=CON_BuildContactName  // 21/11/02 pb.
			If ($ttemp#[CONTACTS:1]Contact_Name:31)
				[CONTACTS:1]Contact_Name:31:=$ttemp
			End if 
			AUTO_AUDIT(->[CONTACTS:1]; Field:C253(->[CONTACTS:1]Contact_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			If ([CONTACTS:1]x_ID:33=0)
				//    If ([CONTACTS]Contact Code#"")
				[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
				//   End if
			End if 
			
			If ([CONTACTS:1]Email_Address:35#"") & ([CONTACTS:1]Email_Address:35#Old:C35([CONTACTS:1]Email_Address:35))
				// 01/09/03 pb
				//UNICODE TEST
				$loc:=Position:C15(Char:C90(64); [CONTACTS:1]Email_Address:35; *)
				If ($loc>0)
					[CONTACTS:1]Email_Before_At:30:=Substring:C12([CONTACTS:1]Email_Address:35; 1; $loc-1)
					[CONTACTS:1]EMail_After_At:24:=Substring:C12([CONTACTS:1]Email_Address:35; $loc+1)
				End if 
			Else 
				If ([CONTACTS:1]Email_Before_At:30#"") | ([CONTACTS:1]EMail_After_At:24#"")
					[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
					
				End if 
			End if 
		End if 
		[CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5))
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CONTACTS]"; Trigger event:C369)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT_DEL(->[CONTACTS:1]; Field:C253(->[CONTACTS:1]Contact_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
End case 



ERR_MethodTrackerReturn("TRIGGER [CONTACTS]"; $_t_oldMethodName)
