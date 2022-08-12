If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oAddressBook
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
	//ARRAY BOOLEAN(SD_lb_People;0)
	//ARRAY BOOLEAN(SD2_abo_FoundNameSelect;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY TEXT(SD2_at_ContCompany;0)
	//ARRAY TEXT(SD2_at_FoundNameCode;0)
	//ARRAY TEXT(Sd2_at_FoundNameCompany;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_InviteeEmailOption;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	C_BOOLEAN:C305($_bo_Getout; $_bo_OK; $_bo_ReadOnlyState)
	C_LONGINT:C283($_l_ArraySize; $_l_atPosition; $_l_Column; $_l_Delay; $_l_EmailAddressRow; $_l_event; $_l_NextRow; $_l_Repeats; $_l_Row; $_l_SizeofArray; SD_l_InviteeContext)
	C_TEXT:C284($_t_EmailAddress; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oAddressBook"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)  //Can only be column 1(NG now changed-select box hidden )
		
		$_l_Row:=LB_GetRow(->SD_lb_People)
		$_l_Column:=1
		Case of 
			: ($_l_Column=1)
				If (SD2_abo_FoundNameSelect{$_l_Row})
					If (SD2_at_InviteeEmailAddress{Size of array:C274(SD2_at_InviteeEmailAddress)}#"")
						$_l_NextRow:=Size of array:C274(SD2_at_InviteeEmailAddress)+1
					Else 
						If (Size of array:C274(SD2_at_InviteeEmailAddress)>0)
							$_l_NextRow:=Size of array:C274(SD2_at_InviteeEmailAddress)
						Else 
							$_l_NextRow:=1
						End if 
					End if 
					If ($_l_NextRow>Size of array:C274(SD2_at_InviteeEmailAddress))
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_Row})
						If (Records in selection:C76([CONTACTS:1])=1)
							If ([CONTACTS:1]Email_Address:35="")
								Gen_Alert("There is no email address for "+[CONTACTS:1]Contact_Name:31+", please enter an email address to send to."; "Continue")
								$_t_EmailAddress:=Gen_Request("Email address"; "")
								If (OK=1)
									//test the format of the address
									$_l_atPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
									If ($_l_atPosition=0)
										Gen_Alert("Sorry that is not a valid email address")
										$_t_EmailAddress:=""
									Else 
										Gen_Confirm("Would you like to save that email address for "+[CONTACTS:1]Contact_Name:31; "Yes"; "No")
										If (OK=1)
											$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
											READ WRITE:C146([CONTACTS:1])
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
											Else 
												//$_t_EmailAddress:=""
											End if 
										End if 
										
									End if 
								End if 
							Else 
								$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
							End if 
							If ($_t_EmailAddress#"")
								$_l_EmailAddressRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_EmailAddressRow<0)
									$_l_SizeofArray:=Size of array:C274(SD2_at_InviteeEmailAddress)
									
									If (True:C214)  //`Replaced by the above line September 2008
										APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
										APPEND TO ARRAY:C911(SD2_at_Invitees; [CONTACTS:1]Contact_Name:31)
										APPEND TO ARRAY:C911(SD2_at_InviteeStatus; "Not Sent")
										APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
										APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
										APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
										APPEND TO ARRAY:C911(SD2_al_RecordID; [CONTACTS:1]x_ID:33)
										APPEND TO ARRAY:C911(SD2_at_ContCompany; Sd2_at_FoundNameCompany{$_l_Row})
									End if 
									Case of 
										: (SD_l_InviteeContext=1)  //email
											APPEND TO ARRAY:C911(SD2_at_InviteeEmailOption; "")
											$_l_SizeofArray:=Size of array:C274(SD2_at_InviteeEmailOption)
											If ($_l_SizeofArray>1)
												SD2_at_InviteeEmailOption{$_l_SizeofArray}:=SD2_at_InviteeEmailOption{$_l_SizeofArray-1}
											Else 
												SD2_at_InviteeEmailOption{$_l_SizeofArray}:="To"
											End if 
									End case 
									LBI_Scrollonresize(->SD_lb_EventInvites)
									LB_SetScroll(->SD_lb_EventInvites; Size of array:C274(SD2_at_ContCompany); -1)
								End if 
							End if 
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					Else 
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_Row})
						If (Records in selection:C76([CONTACTS:1])=1)
							If ([CONTACTS:1]Email_Address:35="")
								Gen_Alert("There is no email address for "+[CONTACTS:1]Contact_Name:31+", please enter an email address to send to."; "Continue")
								$_t_EmailAddress:=Gen_Request("Email address"; "")
								If (OK=1)
									//test the format of the address
									$_l_atPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
									If ($_l_atPosition=0)
										Gen_Alert("Sorry that is not a valid email address")
										$_t_EmailAddress:=""
									Else 
										Gen_Confirm("Would you like to save that email address for "+[CONTACTS:1]Contact_Name:31; "Yes"; "No")
										If (OK=1)
											$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
											READ WRITE:C146([CONTACTS:1])
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
											Else 
												//$_t_EmailAddress:=""
											End if 
										End if 
										
									End if 
								End if 
							Else 
								$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
							End if 
							If ($_t_EmailAddress#"")
								$_l_EmailAddressRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_EmailAddressRow<0)
									SD2_at_InviteeEmailAddress{$_l_NextRow}:=$_t_EmailAddress
									SD2_at_Invitees{$_l_NextRow}:=[CONTACTS:1]Contact_Name:31
									SD2_at_InviteeStatus{$_l_NextRow}:="Not Sent"
									SD2_al_InviteeStatus{$_l_NextRow}:=0
									SD2_al_InviteeClass{$_l_NextRow}:=1
									SD2_at_inviteeClass{$_l_NextRow}:="Contact"
									SD2_al_RecordID{$_l_NextRow}:=[CONTACTS:1]x_ID:33
									SD2_at_ContCompany{$_l_NextRow}:=Sd2_at_FoundNameCompany{$_l_Row}
									LBI_Scrollonresize(->SD_lb_EventInvites)
									LB_SetScroll(->SD_lb_EventInvites; $_l_NextRow; -1)
								End if 
							End if 
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					End if 
				End if 
		End case 
	: ($_l_event=On Double Clicked:K2:5)
		$_l_Row:=LB_GetRow(->SD_lb_People)
		$_l_Column:=1
		SD2_abo_FoundNameSelect{$_l_Row}:=True:C214
		Case of 
			: ($_l_Column=1)
				If (SD2_abo_FoundNameSelect{$_l_Row})
					If (SD2_at_InviteeEmailAddress{Size of array:C274(SD2_at_InviteeEmailAddress)}#"")
						$_l_NextRow:=Size of array:C274(SD2_at_InviteeEmailAddress)+1
					Else 
						If (Size of array:C274(SD2_at_InviteeEmailAddress)>0)
							$_l_NextRow:=Size of array:C274(SD2_at_InviteeEmailAddress)
						Else 
							$_l_NextRow:=1
						End if 
					End if 
					If ($_l_NextRow>Size of array:C274(SD2_at_InviteeEmailAddress))
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_Row})
						If (Records in selection:C76([CONTACTS:1])=1)
							If ([CONTACTS:1]Email_Address:35="")
								Gen_Alert("There is no email address for "+[CONTACTS:1]Contact_Name:31+", please enter an email address to send to."; "Continue")
								$_t_EmailAddress:=Gen_Request("Email address"; "")
								If (OK=1)
									//test the format of the address
									$_l_atPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
									If ($_l_atPosition=0)
										Gen_Alert("Sorry that is not a valid email address")
										$_t_EmailAddress:=""
									Else 
										Gen_Confirm("Would you like to save that email address for "+[CONTACTS:1]Contact_Name:31; "Yes"; "No")
										If (OK=1)
											$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
											READ WRITE:C146([CONTACTS:1])
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
											Else 
												//$_t_EmailAddress:=""
											End if 
										End if 
										
									End if 
								End if 
							Else 
								$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
							End if 
							If ($_t_EmailAddress#"")
								$_l_EmailAddressRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_EmailAddressRow<0)
									
									APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
									APPEND TO ARRAY:C911(SD2_at_Invitees; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_at_InviteeStatus; "Not Sent")
									APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
									APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
									APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
									APPEND TO ARRAY:C911(SD2_al_RecordID; [CONTACTS:1]x_ID:33)
									APPEND TO ARRAY:C911(SD2_at_ContCompany; Sd2_at_FoundNameCompany{$_l_Row})
									Case of 
										: (SD_l_InviteeContext=1)  //email
											APPEND TO ARRAY:C911(SD2_at_InviteeEmailOption; "")
											$_l_ArraySize:=Size of array:C274(SD2_at_InviteeEmailOption)
											If ($_l_ArraySize>1)
												SD2_at_InviteeEmailOption{$_l_ArraySize}:=SD2_at_InviteeEmailOption{$_l_ArraySize-1}
											Else 
												SD2_at_InviteeEmailOption{$_l_ArraySize}:="To"
											End if 
									End case 
									
									LBI_Scrollonresize(->SD_lb_EventInvites)
									LB_SetScroll(->SD_lb_EventInvites; Size of array:C274(SD2_at_ContCompany); -1)
								End if 
							End if 
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					Else 
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_Row})
						If (Records in selection:C76([CONTACTS:1])=1)
							If ([CONTACTS:1]Email_Address:35="")
								Gen_Alert("There is no email address for "+[CONTACTS:1]Contact_Name:31+", please enter an email address to send to."; "Continue")
								$_t_EmailAddress:=Gen_Request("Email address"; "")
								If (OK=1)
									//test the format of the address
									$_l_AtPosition:=(Position:C15(Char:C90(64); $_t_EmailAddress))
									If ($_l_AtPosition=0)
										Gen_Alert("Sorry that is not a valid email address")
										$_t_EmailAddress:=""
									Else 
										Gen_Confirm("Would you like to save that email address for "+[CONTACTS:1]Contact_Name:31; "Yes"; "No")
										If (OK=1)
											$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
											READ WRITE:C146([CONTACTS:1])
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
											Else 
												//$_t_EmailAddress:=""
											End if 
										End if 
										
									End if 
								End if 
							Else 
								$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
							End if 
							If ($_t_EmailAddress#"")
								$_l_EmailAddressRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_EmailAddressRow<0)
									SD2_at_InviteeEmailAddress{$_l_NextRow}:=$_t_EmailAddress
									SD2_at_Invitees{$_l_NextRow}:=[CONTACTS:1]Contact_Name:31
									SD2_at_InviteeStatus{$_l_NextRow}:="Not Sent"
									SD2_al_InviteeStatus{$_l_NextRow}:=0
									SD2_al_InviteeClass{$_l_NextRow}:=1
									SD2_at_inviteeClass{$_l_NextRow}:="Contact"
									SD2_al_RecordID{$_l_NextRow}:=[CONTACTS:1]x_ID:33
									SD2_at_ContCompany{$_l_NextRow}:=Sd2_at_FoundNameCompany{$_l_Row}
									LBI_Scrollonresize(->SD_lb_EventInvites)
									LB_SetScroll(->SD_lb_EventInvites; $_l_NextRow; -1)
								End if 
							End if 
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					End if 
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oAddressBook"; $_t_oldMethodName)
