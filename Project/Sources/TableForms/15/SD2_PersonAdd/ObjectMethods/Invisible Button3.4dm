If (False:C215)
	//object Name: [USER]SD2_PersonAdd.Invisible Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	ARRAY LONGINT:C221($_al_ContactTypeSelect; 0)
	//ARRAY LONGINT(SD2_al_ContactTypeSelect;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	//ARRAY TEXT(SD2_at_ContactNamesSelect;0)
	//ARRAY TEXT(SD2_at_ContactsSelect;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	C_BOOLEAN:C305($_bo_Getout; $_bo_OK; $_bo_ReadOnlyState; SD2_al_CallBackReceived)
	C_LONGINT:C283($_l_AtPosition; $_l_Delay; $_l_Repeats; $_l_Retries; DOC_l_CallEvent; SD2_l_EditingRow; SD2_l_EmailChoiceProc; SD2_l_LastSelected; SD2_l_SelectedInSubprocess)
	C_TEXT:C284($_t_ContactCode; $_t_ContactName; $_t_EmailAddress; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.Invisible Button3"; Form event code:C388)

If (SD2_l_EmailChoiceProc>0)
	$_l_Retries:=0
	While (Semaphore:C143("$SD2NamesCall"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	SD2_al_CallBackReceived:=False:C215
	GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_LastSelected; SD2_l_SelectedInSubprocess)
	SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 4)
	BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
	POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
	$_l_Retries:=0
	While (SD2_al_CallBackReceived=False:C215)
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	
	If (SD2_l_SelectedInSubprocess>0)
		$_al_ContactTypeSelect:=SD2_al_ContactTypeSelect{SD2_l_SelectedInSubprocess}
		SD2_at_InviteeStatus{SD2_l_EditingRow}:="Not Sent"
		If (SD2_at_ContactEmailSelect{SD2_l_SelectedInSubprocess}="No EMAIL")
			Gen_Alert("There is no email address for "+SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}+", please enter an email address to send to."; "Continue")
			//```
			$_t_EmailAddress:=Gen_Request("Email address"; "")
			If (OK=1)
				
				//test the format of the address
				$_l_AtPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
				If ($_l_AtPosition=0)
					Gen_Alert("Sorry that is not a valid email address")
					$_t_EmailAddress:=""
				Else 
					SD2_at_InviteeEmailAddress{SD2_l_EditingRow}:=$_t_EmailAddress
					Gen_Confirm("Would you like to save that email address for "+SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}; "Yes"; "No")
					If (OK=1)
						If ($_al_ContactTypeSelect=1)
							$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
							READ WRITE:C146([CONTACTS:1])
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
							LOAD RECORD:C52([CONTACTS:1])
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							$_bo_Getout:=False:C215
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[CONTACTS:1]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										Gen_Alert("Record is locked and cannot be updated at the moment")
										$_bo_Getout:=True:C214
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214) | ($_bo_Getout)
							If (Not:C34($_bo_Getout))
								[CONTACTS:1]Email_Address:35:=$_t_EmailAddress
								DB_SaveRecord(->[CONTACTS:1])
								UNLOAD RECORD:C212([CONTACTS:1])
								If ($_bo_ReadOnlyState)  //table was in reead only return it to that
									READ ONLY:C145([CONTACTS:1])
								End if 
								LOAD RECORD:C52([CONTACTS:1])
							End if 
						Else 
							//personnel
							$_bo_ReadOnlyState:=Read only state:C362([PERSONNEL:11])
							READ WRITE:C146([PERSONNEL:11])
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess})
							LOAD RECORD:C52([PERSONNEL:11])
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							$_bo_Getout:=False:C215
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										Gen_Alert("Record is locked and cannot be updated at the moment")
										$_bo_Getout:=True:C214
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214) | ($_bo_Getout)
							If (Not:C34($_bo_Getout))
								[PERSONNEL:11]Email_Address:36:=$_t_EmailAddress
								DB_SaveRecord(->[PERSONNEL:11])
								UNLOAD RECORD:C212([PERSONNEL:11])
								If ($_bo_ReadOnlyState)  //table was in reead only return it to that
									READ ONLY:C145([PERSONNEL:11])
								End if 
								LOAD RECORD:C52([PERSONNEL:11])
								
							End if 
							
						End if 
						
					End if 
				End if 
			Else 
				
			End if 
			//``
		Else 
			SD2_at_InviteeEmailAddress{SD2_l_EditingRow}:=SD2_at_ContactEmailSelect{SD2_l_SelectedInSubprocess}
		End if 
		SD2_al_InviteeClass{SD2_l_EditingRow}:=$_al_ContactTypeSelect
		Case of 
			: ($_al_ContactTypeSelect=1)
				SD2_at_inviteeClass{SD2_l_EditingRow}:="Contact"
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
				SD2_al_RecordID{SD2_l_EditingRow}:=[CONTACTS:1]x_ID:33
			Else 
				SD2_at_inviteeClass{SD2_l_EditingRow}:="Internal Contact"
				$_t_ContactName:=Replace string:C233(SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}; "(Internal)"; "")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_ContactName)
				SD2_al_RecordID{SD2_l_EditingRow}:=[PERSONNEL:11]Personnel_ID:48
		End case 
		SD2_at_Invitees{SD2_l_EditingRow}:=SD2_at_ContactNamesSelect{SD2_l_SelectedInSubprocess}
		
	Else 
		
		
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess})
		SD2_al_RecordID{SD2_l_EditingRow}:=[CONTACTS:1]x_ID:33
	End if 
	$_t_ContactCode:=SD2_at_ContactsSelect{SD2_l_SelectedInSubprocess}
	
	ARRAY TEXT:C222(SD2_at_ContactsSelect; 0)
	ARRAY TEXT:C222(SD2_at_ContactNamesSelect; 0)
	ARRAY TEXT:C222(SD2_at_ContactEmailSelect; 0)
	ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; 0)
	SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
	BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
	POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
	CLEAR SEMAPHORE:C144("$SD2NamesCall")
Else   //no sub process enter is for this window
	If (SD2_al_RecordID{1}=0)
		LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; 1)
	End if 
	CANCEL:C270
	//SET PROCESS VARIABLE(SD2_l_EmailChoiceProc;DOC_l_CallEvent;1)
	//CALL PROCESS(SD2_l_EmailChoiceProc)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.Invisible Button3"; $_t_oldMethodName)
