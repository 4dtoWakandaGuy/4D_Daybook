If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oInvitees
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
	//ARRAY BOOLEAN(SD2_lb_StatusSettings;0)
	//ARRAY LONGINT(SD2_al_ContactTypeSelect;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	ARRAY TEXT:C222($_at_ContactCompanyCode; 0)
	ARRAY TEXT:C222($_at_Idents; 0)
	ARRAY TEXT:C222($_at_PersonEmailAddresses; 0)
	ARRAY TEXT:C222($_at_PersonNames; 0)
	ARRAY TEXT:C222($_at_PersonnelNames; 0)
	//ARRAY TEXT(AA_at_Proffesionaladditions;0)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	//ARRAY TEXT(SD2_at_ContactNamesSelect;0)
	//ARRAY TEXT(SD2_at_ContactsSelect;0)
	//ARRAY TEXT(SD2_at_ContCompany;0)
	//ARRAY TEXT(SD2_at_FoundNameCode;0)
	//ARRAY TEXT(Sd2_at_FoundNameCompany;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_InviteeEmailOption;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(SD2_at_PerEmailAfterAt;0)
	//ARRAY TEXT(SD2_at_PerEmailBeforeAt;0)
	//ARRAY TEXT(SD2_at_PerFirstNames;0)
	//ARRAY TEXT(SD2_at_perLastNames;0)
	//ARRAY TEXT(SD2_at_PerNames;0)
	C_BOOLEAN:C305($_bo_GetOut; $_bo_itsanemailaddress; $_bo_OK; $_bo_ReadOnlyState)
	C_LONGINT:C283($_l_ArraySize; $_l_AtPosition; $_l_CharacterPosition; $_l_Delay; $_l_Element; $_l_event; $_l_FieldNumber; $_l_Index; $_l_NameIndex; $_l_ObjectBottom; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_Repeats; $_l_Retries; $_l_RowBottom; $_l_RowHeight; $_l_SelectedColumn; $_l_SelectedRow; $_l_SourceProcess; $_l_SourceRow; $_l_StatusRow)
	C_LONGINT:C283($_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DOC_l_CallEvent; SD_l_InviteeContext; SD2_l_EditingRow; SD2_l_EmailChoiceProc; SD2_l_Onetime; SD2_l_ProcessReady)
	C_LONGINT:C283(SD2_l_SelectedAdressee; SD2_l_StillLoading; SD2_l_SubSelectionProcess)
	C_POINTER:C301($_ptr_ListboxArea; $_ptr_ListboxSetup; $_ptr_SourceObject)
	C_TEXT:C284($_t_AddressType; $_t_AfterEditText; $_t_AfterEmail; $_t_BeforeEmail; $_t_EmailAddress; $_t_Entry; $_t_LastName; $_t_oldMethodName; $_t_VariableName; SD2_t_AfterEditText; SD2_t_BeforeEditText)
	C_TEXT:C284(SD2_t_ContactFirstnames; SD2_t_ContactSurname; SD2_t_ContactTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oInvitees"; Form event code:C388)

$_l_event:=Form event code:C388


$_ptr_ListboxSetup:=->SD_lb_People
SD2_l_StillLoading:=0
If (SD2_l_StillLoading=0)
	
	
	Case of 
		: ($_l_event=On Clicked:K2:4)
			SD2_l_SelectedAdressee:=LB_GetRow(->SD_lb_EventInvites)
			SD2_t_BeforeEditText:=""
		: ($_l_event=On Before Keystroke:K2:6)
			$_l_SelectedRow:=Self:C308->
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			Case of 
				: ($_t_VariableName="SD2_at_InviteeEmailAddress")
					//SD2_t_BeforeEditText:=Get edited text(SD2_at_InviteeEmailAddress{$_l_SelectedRow})
					SD2_t_AfterEditText:=""
				: ($_t_VariableName="SD2_at_InviteeEmailOption")
					$_t_AfterEditText:=Get edited text:C655
					If (Position:C15(Keystroke:C390; Char:C90(Tab:K15:37)+Char:C90(Backspace:K15:36)+Char:C90(Left arrow key:K12:16)+Char:C90(Right arrow key:K12:17)+Char:C90(Up arrow key:K12:18)+Char:C90(Down arrow key:K12:19))=0)
						FILTER KEYSTROKE:C389("")
					End if 
					SD2_at_InviteeEmailOption{SD2_l_SelectedAdressee}:=$_t_AfterEditText
					
			End case 
		: ($_l_event=On After Keystroke:K2:26)
			$_l_SelectedRow:=Self:C308->
			SD2_l_EditingRow:=$_l_SelectedRow
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			Case of 
				: ($_t_VariableName="SD2_at_InviteeEmailAddress")
					$_t_AfterEditText:=Get edited text:C655  //t(SD2_at_InviteeEmailAddress{$_l_SelectedRow})
					If ($_t_AfterEditText#"")
						$_bo_itsanemailaddress:=False:C215
						For ($_l_Index; 1; Length:C16($_t_AfterEditText))
							If (Character code:C91($_t_AfterEditText[[$_l_Index]])=64)
								$_t_BeforeEmail:=Substring:C12($_t_AfterEditText; 1; $_l_Index-1)
								If ($_l_Index<Length:C16($_t_AfterEditText))
									$_t_AfterEmail:=Substring:C12($_t_AfterEditText; $_l_Index+1; Length:C16($_t_AfterEditText))
								Else 
									$_t_AfterEmail:=""
								End if 
								$_bo_itsanemailaddress:=True:C214
							End if 
						End for 
						If ($_bo_itsanemailaddress=False:C215)
							AA_LoadNameArrays
							SD2_t_ContactSurname:=""
							SD2_t_ContactFirstnames:=""
							SD2_t_ContactTitle:=""
							ARRAY TEXT:C222(SD2_at_ContactsSelect; 0)
							ARRAY TEXT:C222(SD2_at_ContactNamesSelect; 0)
							ARRAY TEXT:C222(SD2_at_ContactEmailSelect; 0)
							ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; 0)
							CREATE EMPTY SET:C140([CONTACTS:1]; "FirstNameMatch")
							CREATE EMPTY SET:C140([CONTACTS:1]; "LastNameMatch")
							
							AA_ParseName($_t_AfterEditText; 0; ->SD2_t_ContactTitle; ->SD2_t_ContactFirstnames; ->SD2_t_ContactSurname; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
							If (SD2_t_ContactFirstnames#"")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=SD2_t_ContactFirstnames+"@")
								If (Records in selection:C76([CONTACTS:1])>0)
									CREATE SET:C116([CONTACTS:1]; "FirstNameMatch")
								End if 
							End if 
							If (SD2_t_ContactSurname#"")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=SD2_t_ContactSurname+"@")
								If (Records in selection:C76([CONTACTS:1])>0)
									CREATE SET:C116([CONTACTS:1]; "LastNameMatch")
								End if 
							End if 
							INTERSECTION:C121("LastNameMatch"; "FirstNameMatch"; "LastNameMatch")
							CLEAR SET:C117("FirstNameMatch")
							If (Records in set:C195("LastNameMatch")<20) & (Records in set:C195("LastNameMatch")>0)
								If (Records in set:C195("LastNameMatch")>1)
									USE SET:C118("LastNameMatch")
									ARRAY TEXT:C222($_at_ContactCompanyCode; 0)
									
									SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; SD2_at_ContactsSelect; [CONTACTS:1]Contact_Name:31; SD2_at_ContactNamesSelect; [CONTACTS:1]Email_Address:35; SD2_at_ContactEmailSelect; [CONTACTS:1]Company_Code:1; $_at_ContactCompanyCode)
									SORT ARRAY:C229(SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; $_at_ContactCompanyCode)
									ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; Size of array:C274(SD2_at_ContactsSelect))
									$_t_LastName:=""
									For ($_l_Index; 1; Size of array:C274(SD2_al_ContactTypeSelect))
										SD2_al_ContactTypeSelect{$_l_Index}:=1
										If ($_t_LastName=SD2_at_ContactNamesSelect{$_l_Index})
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_ContactCompanyCode{$_l_Index})
											If ([COMPANIES:2]Company_Name:2="")
												$_t_AddressType:="Home Address"
											Else 
												$_t_AddressType:=[COMPANIES:2]Company_Name:2
											End if 
											SD2_at_ContactNamesSelect{$_l_Index}:=SD2_at_ContactNamesSelect{$_l_Index}+"("+$_t_AddressType+", "+[COMPANIES:2]Company_Code:1+")"
											If ($_l_Index>1)
												If (SD2_at_ContactNamesSelect{$_l_Index-1}=$_t_LastName)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_ContactCompanyCode{$_l_Index-1})
													If ([COMPANIES:2]Company_Name:2#"")
														$_t_AddressType:="Home Address"
													Else 
														$_t_AddressType:=[COMPANIES:2]Company_Name:2
													End if 
													SD2_at_ContactNamesSelect{$_l_Index-1}:=SD2_at_ContactNamesSelect{$_l_Index-1}+"("+$_t_AddressType+", "+[COMPANIES:2]Company_Code:1+")"
												End if 
											End if 
											
										Else 
											$_t_LastName:=SD2_at_ContactNamesSelect{$_l_Index}
										End if 
										If (SD2_at_ContactEmailSelect{$_l_Index}="")
											SD2_at_ContactEmailSelect{$_l_Index}:="NO EMAIL"
										End if 
										
									End for 
									ARRAY TEXT:C222($_at_PersonnelNames; 0)
									For ($_l_NameIndex; 1; Size of array:C274(SD2_at_PerFirstNames))
										If (Position:C15(SD2_t_ContactFirstnames; SD2_at_PerFirstNames{$_l_NameIndex})>0)
											If (Position:C15(SD2_t_ContactSurname; SD2_at_perLastNames{$_l_NameIndex})>0)
												APPEND TO ARRAY:C911($_at_PersonnelNames; SD2_at_PerNames{$_l_NameIndex})
											End if 
										End if 
									End for 
									If (Size of array:C274($_at_PersonnelNames)>0)
										QUERY WITH ARRAY:C644([PERSONNEL:11]Name:2; $_at_PersonnelNames)
										//QUERY([PERSONNEL];[PERSONNEL]Name=$_t_AfterEditText+"@")
										If (Records in selection:C76([PERSONNEL:11])>0)
											SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_Idents; [PERSONNEL:11]Name:2; $_at_PersonNames; [PERSONNEL:11]Email_Address:36; $_at_PersonEmailAddresses)
											For ($_l_Index; 1; Size of array:C274($_at_Idents))
												APPEND TO ARRAY:C911(SD2_at_ContactsSelect; $_at_Idents{$_l_Index})
												APPEND TO ARRAY:C911(SD2_at_ContactNamesSelect; $_at_PersonNames{$_l_Index}+"("+"Internal"+")")
												If ($_at_PersonEmailAddresses{$_l_Index}#"")
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												Else 
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												End if 
												APPEND TO ARRAY:C911(SD2_al_ContactTypeSelect; 2)  //so we know this is a personnel record
												
											End for 
											
										End if 
									End if 
									SORT ARRAY:C229(SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect)
									
									CLEAR SET:C117("LastNameMatch")
									
									If (SD2_l_EmailChoiceProc=0)
										$_l_RowHeight:=LISTBOX Get rows height:C836(SD_lb_EventInvites)
										$_l_RowBottom:=$_l_RowHeight*$_l_SelectedRow
										GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
										OBJECT GET COORDINATES:C663(SD_lb_EventInvites; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
										If ($_l_RowBottom>(($_l_ObjectBottom-$_l_ObjectTop)-10))
											$_l_RowBottom:=($_l_ObjectBottom-$_l_ObjectTop)-10
										End if 
										
										SD2_l_ProcessReady:=0
										SD2_l_EmailChoiceProc:=New process:C317("SD2_ContactChoice"; 32000; "EmailNames"; $_l_WindowLeft+$_l_ObjectLeft; ($_l_WindowTop+$_l_ObjectTop+$_l_RowBottom+$_l_RowHeight); ($_l_WindowLeft+$_l_ObjectRight); Current process:C322; *)
										//WS_KEEPFOCUS
										DelayTicks(2)
										$_l_Retries:=0
										While (Semaphore:C143("$SD2NamesCall"))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_ProcessReady)
										If (SD2_l_ProcessReady=0)
											$_l_Retries:=0
											While (SD2_l_ProcessReady=0)
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*$_l_Retries)
												GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_ProcessReady)
											End while 
										End if 
										VARIABLE TO VARIABLE:C635(SD2_l_EmailChoiceProc; SD2_at_ContactNamesSelect; SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect; SD2_al_ContactTypeSelect)
										SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; -1)
										CLEAR SEMAPHORE:C144("$SD2NamesCall")
										BRING TO FRONT:C326(Current process:C322)
										SET TIMER:C645(2)
										SD2_l_Onetime:=3
									Else 
										
										If (SD2_l_EmailChoiceProc>0)
											$_l_Retries:=0
											While (Semaphore:C143("$SD2NamesCall"))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*$_l_Retries)
											End while 
											
											PAUSE PROCESS:C319(SD2_l_EmailChoiceProc)
											VARIABLE TO VARIABLE:C635(SD2_l_EmailChoiceProc; SD2_at_ContactNamesSelect; SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect; SD2_al_ContactTypeSelect)
											RESUME PROCESS:C320(SD2_l_EmailChoiceProc)
											BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
											POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
											CLEAR SEMAPHORE:C144("$SD2NamesCall")
											BRING TO FRONT:C326(Current process:C322)
										End if 
										
										
									End if 
									
								Else 
									//Only one contact match
									//SD2_at_InviteeEmailAddress;->SD2_at_Invitees;->SD2_at_InviteeStatus;->SD2_al_InviteeStatus;->SD2_al_InviteeClass;->SD2_at_inviteeClass;->SD2_al_RecordID
									SD2_at_InviteeEmailAddress{$_l_SelectedRow}:=[CONTACTS:1]Email_Address:35
									SD2_at_Invitees{$_l_SelectedRow}:=[CONTACTS:1]Contact_Name:31
									SD2_al_InviteeClass{$_l_SelectedRow}:=1
									SD2_at_inviteeClass{$_l_SelectedRow}:="Contact"
									
									If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
										$_l_Retries:=0
										While (Semaphore:C143("$SD2NamesCall"))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
										BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
										POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
										CLEAR SEMAPHORE:C144("$SD2NamesCall")
										SET TIMER:C645(0)
									End if 
									
									SD2_l_EmailChoiceProc:=0
									
									SD2_al_RecordID{$_l_SelectedRow}:=[CONTACTS:1]x_ID:33  //added 11/07/08 - kmw (previously it was left set at 0 which meant it wasn't always copying over the addresses to the main window. This is because SD2_EmailEntry makes SURE the last item in the recordf id array is a NON-ZERO record id before it will add ANY of the contacts to the main email window's email address arrays)
									
								End if 
							Else 
								If (Records in set:C195("LastNameMatch")=0)  //& (False)
									ARRAY TEXT:C222($_at_PersonnelNames; 0)
									For ($_l_NameIndex; 1; Size of array:C274(SD2_at_PerFirstNames))
										If (Position:C15(SD2_t_ContactFirstnames; SD2_at_PerFirstNames{$_l_NameIndex})>0)
											If (Position:C15(SD2_t_ContactSurname; SD2_at_perLastNames{$_l_NameIndex})>0)
												APPEND TO ARRAY:C911($_at_PersonnelNames; SD2_at_PerNames{$_l_NameIndex})
											End if 
										End if 
									End for 
									If (Size of array:C274($_at_PersonnelNames)>0)
										QUERY WITH ARRAY:C644([PERSONNEL:11]Name:2; $_at_PersonnelNames)
										If (Records in selection:C76([PERSONNEL:11])>0) & (Records in selection:C76([PERSONNEL:11])<5)
											If (Records in selection:C76([PERSONNEL:11])>1)
												SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_Idents; [PERSONNEL:11]Name:2; $_at_PersonNames; [PERSONNEL:11]Email_Address:36; $_at_PersonEmailAddresses)
												For ($_l_Index; 1; Size of array:C274($_at_Idents))
													APPEND TO ARRAY:C911(SD2_at_ContactsSelect; $_at_Idents{$_l_Index})
													APPEND TO ARRAY:C911(SD2_at_ContactNamesSelect; $_at_PersonNames{$_l_Index}+"("+"Internal"+")")
													If ($_at_PersonEmailAddresses{$_l_Index}#"")
														APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
													Else 
														APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
													End if 
													APPEND TO ARRAY:C911(SD2_al_ContactTypeSelect; 2)  //so we know this is a personnel record
													
												End for 
											Else 
												// one personnel record
												SD2_at_InviteeEmailAddress{$_l_SelectedRow}:=[PERSONNEL:11]Email_Address:36
												SD2_at_Invitees{$_l_SelectedRow}:=[PERSONNEL:11]Name:2
												SD2_al_InviteeClass{$_l_SelectedRow}:=2
												SD2_at_inviteeClass{$_l_SelectedRow}:="Internal Contact"
												
												SD2_al_RecordID{$_l_SelectedRow}:=[PERSONNEL:11]Personnel_ID:48  //added 11/07/08 - kmw (previously it was left set at 0 which meant it wasn't always copying over the addresses to the main window. This is because SD2_EmailEntry makes SURE the last item in the recordf id array is a NON-ZERO record id before it will add ANY of the contacts to the main email window's email address arrays)
												
												
											End if 
											
										End if 
									Else 
										If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
											While (Semaphore:C143("$SD2NamesCall"))
												DelayTicks(1)
											End while 
											SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
											BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
											POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
											CLEAR SEMAPHORE:C144("$SD2NamesCall")
											SD2_l_EmailChoiceProc:=0
										End if 
										
										
									End if 
								Else 
									If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
										$_l_Retries:=0
										While (Semaphore:C143("$SD2NamesCall"))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
										BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
										POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
										CLEAR SEMAPHORE:C144("$SD2NamesCall")
										SD2_l_EmailChoiceProc:=0
									End if 
									
								End if 
							End if 
						Else 
							
							//it is an email address to search
							ARRAY TEXT:C222(SD2_at_ContactsSelect; 0)
							ARRAY TEXT:C222(SD2_at_ContactNamesSelect; 0)
							ARRAY TEXT:C222(SD2_at_ContactEmailSelect; 0)
							ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; 0)
							CREATE EMPTY SET:C140([CONTACTS:1]; "BeforeNameMatch")
							CREATE EMPTY SET:C140([CONTACTS:1]; "AfterNameMatch")
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_BeforeEmail; *)
							If ($_t_AfterEmail#"")
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_AfterEmail+"@")
							Else 
								QUERY:C277([CONTACTS:1])
							End if 
							If (Records in selection:C76([CONTACTS:1])>0)
								If (Records in selection:C76([CONTACTS:1])>1)
									SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; SD2_at_ContactsSelect; [CONTACTS:1]Contact_Name:31; SD2_at_ContactNamesSelect; [CONTACTS:1]Email_Address:35; SD2_at_ContactEmailSelect; [CONTACTS:1]Company_Code:1; $_at_ContactCompanyCode)
									SORT ARRAY:C229(SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; $_at_ContactCompanyCode)
									ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; Size of array:C274(SD2_at_ContactsSelect))
									$_t_LastName:=""
									For ($_l_Index; 1; Size of array:C274(SD2_al_ContactTypeSelect))
										SD2_al_ContactTypeSelect{$_l_Index}:=1
										If ($_t_LastName=SD2_at_ContactNamesSelect{$_l_Index})
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_ContactCompanyCode{$_l_Index})
											If ([COMPANIES:2]Company_Name:2="")
												$_t_AddressType:="Home Address"
											Else 
												$_t_AddressType:=[COMPANIES:2]Company_Name:2
											End if 
											SD2_at_ContactNamesSelect{$_l_Index}:=SD2_at_ContactNamesSelect{$_l_Index}+"("+$_t_AddressType+", "+[COMPANIES:2]Company_Code:1+")"
											If ($_l_Index>1)
												If (SD2_at_ContactNamesSelect{$_l_Index-1}=$_t_LastName)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_ContactCompanyCode{$_l_Index-1})
													If ([COMPANIES:2]Company_Name:2#"")
														$_t_AddressType:="Home Address"
													Else 
														$_t_AddressType:=[COMPANIES:2]Company_Name:2
													End if 
													SD2_at_ContactNamesSelect{$_l_Index-1}:=SD2_at_ContactNamesSelect{$_l_Index-1}+"("+$_t_AddressType+", "+[COMPANIES:2]Company_Code:1+")"
												End if 
											End if 
											
										Else 
											$_t_LastName:=SD2_at_ContactNamesSelect{$_l_Index}
										End if 
										If (SD2_at_ContactEmailSelect{$_l_Index}="")
											SD2_at_ContactEmailSelect{$_l_Index}:="NO EMAIL"
										End if 
										
									End for 
									ARRAY TEXT:C222($_at_PersonnelNames; 0)
									For ($_l_NameIndex; 1; Size of array:C274(SD2_at_PerFirstNames))
										If (SD2_at_PerEmailBeforeAt{$_l_NameIndex}=$_t_BeforeEmail)
											If (Position:C15($_t_BeforeEmail; SD2_at_PerEmailAfterAt{$_l_NameIndex})>0)
												APPEND TO ARRAY:C911($_at_PersonnelNames; SD2_at_PerNames{$_l_NameIndex})
											End if 
										End if 
									End for 
									If (Size of array:C274($_at_PersonnelNames)>0)
										QUERY WITH ARRAY:C644([PERSONNEL:11]Name:2; $_at_PersonnelNames)
										//QUERY([PERSONNEL];[PERSONNEL]Name=$_t_AfterEditText+"@")
										If (Records in selection:C76([PERSONNEL:11])>0)
											SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_Idents; [PERSONNEL:11]Name:2; $_at_PersonNames; [PERSONNEL:11]Email_Address:36; $_at_PersonEmailAddresses)
											For ($_l_Index; 1; Size of array:C274($_at_Idents))
												APPEND TO ARRAY:C911(SD2_at_ContactsSelect; $_at_Idents{$_l_Index})
												APPEND TO ARRAY:C911(SD2_at_ContactNamesSelect; $_at_PersonNames{$_l_Index}+"("+"Internal"+")")
												If ($_at_PersonEmailAddresses{$_l_Index}#"")
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												Else 
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												End if 
												APPEND TO ARRAY:C911(SD2_al_ContactTypeSelect; 2)  //so we know this is a personnel record
												
											End for 
											
										End if 
									End if 
									SORT ARRAY:C229(SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect)
									
									CLEAR SET:C117("LastNameMatch")
									
									If (SD2_l_EmailChoiceProc=0)
										$_l_RowHeight:=LISTBOX Get rows height:C836(SD_lb_EventInvites)
										$_l_RowBottom:=$_l_RowHeight*$_l_SelectedRow
										GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
										OBJECT GET COORDINATES:C663(SD_lb_EventInvites; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
										SD2_l_ProcessReady:=0
										
										SD2_l_EmailChoiceProc:=New process:C317("SD2_ContactChoice"; 32000; "EmailNames"; $_l_WindowLeft+$_l_ObjectLeft; ($_l_WindowTop+$_l_ObjectTop+$_l_RowBottom+$_l_RowHeight); ($_l_WindowLeft+$_l_ObjectRight); Current process:C322; *)
										//WS_KEEPFOCUS
										DelayTicks(2)
										$_l_Retries:=0
										While (Semaphore:C143("$SD2NamesCall"))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										
										GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_ProcessReady)
										If (SD2_l_ProcessReady=0)
											$_l_Retries:=0
											While (SD2_l_ProcessReady=0)
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*$_l_Retries)
												GET PROCESS VARIABLE:C371(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_ProcessReady)
											End while 
										End if 
										VARIABLE TO VARIABLE:C635(SD2_l_EmailChoiceProc; SD2_at_ContactNamesSelect; SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect; SD2_al_ContactTypeSelect)
										SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; SD2_l_ProcessReady; -1)
										CLEAR SEMAPHORE:C144("$SD2NamesCall")
										SET TIMER:C645(2)
										SD2_l_Onetime:=3
									Else 
										If (SD2_l_EmailChoiceProc>0)
											$_l_Retries:=0
											
											While (Semaphore:C143("$SD2NamesCall"))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*$_l_Retries)
											End while 
											
											PAUSE PROCESS:C319(SD2_l_EmailChoiceProc)
											VARIABLE TO VARIABLE:C635(SD2_l_EmailChoiceProc; SD2_at_ContactNamesSelect; SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect; SD2_al_ContactTypeSelect)
											RESUME PROCESS:C320(SD2_l_EmailChoiceProc)
											BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
											POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
											CLEAR SEMAPHORE:C144("$SD2NamesCall")
										End if 
										
									End if 
									
								Else 
									//one contact
									SD2_at_InviteeEmailAddress{$_l_SelectedRow}:=[CONTACTS:1]Email_Address:35
									SD2_at_Invitees{$_l_SelectedRow}:=[CONTACTS:1]Contact_Name:31
									SD2_al_InviteeClass{$_l_SelectedRow}:=1
									SD2_at_inviteeClass{$_l_SelectedRow}:="Contact"
									If (SD2_l_EmailChoiceProc>0)  //Tell the process to end
										$_l_Retries:=0
										While (Semaphore:C143("$SD2NamesCall"))
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										SET PROCESS VARIABLE:C370(SD2_l_EmailChoiceProc; DOC_l_CallEvent; 1)
										
										BRING TO FRONT:C326(SD2_l_EmailChoiceProc)
										POST OUTSIDE CALL:C329(SD2_l_EmailChoiceProc)
										CLEAR SEMAPHORE:C144("$SD2NamesCall")
										SET TIMER:C645(0)
									End if 
									SD2_l_EmailChoiceProc:=0
									
									SD2_al_RecordID{$_l_SelectedRow}:=[CONTACTS:1]x_ID:33  //added 11/07/08 - kmw (previously it was left set at 0 which meant it wasn't always copying over the addresses to the main window. This is because SD2_EmailEntry makes SURE the last item in the recordf id array is a NON-ZERO record id before it will add ANY of the contacts to the main email window's email address arrays)
									
									
								End if 
							Else 
								//no contacts but what about personnel
								ARRAY TEXT:C222($_at_PersonnelNames; 0)
								For ($_l_NameIndex; 1; Size of array:C274(SD2_at_PerFirstNames))
									If (SD2_at_PerEmailBeforeAt{$_l_NameIndex}=$_t_BeforeEmail)
										If (Position:C15($_t_BeforeEmail; SD2_at_PerEmailAfterAt{$_l_NameIndex})>0)
											APPEND TO ARRAY:C911($_at_PersonnelNames; SD2_at_PerNames{$_l_NameIndex})
										End if 
									End if 
								End for 
								If (Size of array:C274($_at_PersonnelNames)>0)
									QUERY WITH ARRAY:C644([PERSONNEL:11]Name:2; $_at_PersonnelNames)
									If (Records in selection:C76([PERSONNEL:11])>0) & (Records in selection:C76([PERSONNEL:11])<5)
										If (Records in selection:C76([PERSONNEL:11])>1)
											SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_Idents; [PERSONNEL:11]Name:2; $_at_PersonNames; [PERSONNEL:11]Email_Address:36; $_at_PersonEmailAddresses)
											For ($_l_Index; 1; Size of array:C274($_at_Idents))
												APPEND TO ARRAY:C911(SD2_at_ContactsSelect; $_at_Idents{$_l_Index})
												APPEND TO ARRAY:C911(SD2_at_ContactNamesSelect; $_at_PersonNames{$_l_Index}+"("+"Internal"+")")
												If ($_at_PersonEmailAddresses{$_l_Index}#"")
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												Else 
													APPEND TO ARRAY:C911(SD2_at_ContactEmailSelect; $_at_PersonEmailAddresses{$_l_Index})
												End if 
												APPEND TO ARRAY:C911(SD2_al_ContactTypeSelect; 2)  //so we know this is a personnel record
												
											End for 
										Else 
											// one personnel record
											SD2_at_InviteeEmailAddress{$_l_SelectedRow}:=[PERSONNEL:11]Email_Address:36
											SD2_at_Invitees{$_l_SelectedRow}:=[PERSONNEL:11]Name:2
											SD2_al_InviteeClass{$_l_SelectedRow}:=2
											SD2_at_inviteeClass{$_l_SelectedRow}:="Internal Contact"
											
											SD2_al_RecordID{$_l_SelectedRow}:=[PERSONNEL:11]Personnel_ID:48  //added 11/07/08 - kmw (previously it was left set at 0 which meant it wasn't always copying over the addresses to the main window. This is because SD2_EmailEntry makes SURE the last item in the recordf id array is a NON-ZERO record id before it will add ANY of the contacts to the main email window's email address arrays)
											
											
										End if 
										
									End if 
								End if 
								
							End if 
							
						End if 
						
					End if 
			End case 
			
		: ($_l_event=On Data Change:K2:15)  //Look up the email address in contacts
			//$_t_Entry:=""
			$_l_AtPosition:=Position:C15(Char:C90(64); $_t_Entry)
			If ($_l_AtPosition>0)
				$_t_BeforeEmail:=Substring:C12($_t_Entry; 1; $_l_AtPosition-1)
				$_t_AfterEmail:=Substring:C12($_t_Entry; $_l_AtPosition+1)
			End if 
			$_l_SelectedRow:=Self:C308->
			//SD2_l_EditingRow:=$_l_SelectedRow
			//RESOLVE POINTER(Self;$_t_VariableName;$_l_TableNumber;$_l_FieldNumber)
			LISTBOX GET CELL POSITION:C971(SD2_lb_StatusSettings; $_l_SelectedColumn; $_l_SelectedRow)
			Case of 
				: ($_l_SelectedColumn=3)
					If (SD2_al_InviteeStatus{$_l_SelectedRow}>1)  //its alread actioned cant change
						$_l_StatusRow:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{$_l_SelectedRow})
						SD2_at_InviteeStatus{$_l_SelectedRow}:=SD2_at_InviteStati{$_l_StatusRow}
					Else 
						If (SD2_at_InviteeStatus{$_l_SelectedRow}="Do Not Send")
							SD2_al_InviteeStatus{$_l_SelectedRow}:=0
						Else 
							SD2_al_InviteeStatus{$_l_SelectedRow}:=1
						End if 
					End if 
			End case 
			
		: ($_l_event=On Drop:K2:12)
			$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
			_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
			If ($_l_SourceProcess=Current process:C322)
				If ($_ptr_SourceObject=$_ptr_ListboxArea)
					If (SD2_at_InviteeEmailAddress{Size of array:C274(SD2_at_InviteeEmailAddress)}#"")
						$_l_Element:=Size of array:C274(SD2_at_InviteeEmailAddress)+1
					Else 
						If (Size of array:C274(SD2_at_InviteeEmailAddress)>0)
							$_l_Element:=Size of array:C274(SD2_at_InviteeEmailAddress)
						Else 
							$_l_Element:=1
						End if 
					End if 
					If ($_l_Element>Size of array:C274(SD2_at_InviteeEmailAddress))
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_SourceRow})
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
											$_bo_GetOut:=False:C215
											Repeat 
												$_l_Repeats:=$_l_Repeats+1
												$_bo_OK:=Check_Locked(->[CONTACTS:1]; 1)
												If (Not:C34($_bo_OK))
													If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
														//only increase every 10 tries
														Gen_Alert("Record is locked and cannot be updated at the moment")
														$_bo_GetOut:=True:C214
														$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
													End if 
													DelayTicks(2*$_l_Delay)
												End if 
											Until ($_bo_OK=True:C214) | ($_bo_GetOut)
											If (Not:C34($_bo_GetOut))
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
								$_l_StatusRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_StatusRow<0)
									APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
									APPEND TO ARRAY:C911(SD2_at_Invitees; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_at_InviteeStatus; "Not Sent")
									APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
									APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
									APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
									APPEND TO ARRAY:C911(SD2_al_RecordID; [CONTACTS:1]x_ID:33)
									APPEND TO ARRAY:C911(SD2_at_ContCompany; Sd2_at_FoundNameCompany{$_l_SourceRow})
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
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_FoundNameCode{$_l_SourceRow})
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
											$_bo_GetOut:=False:C215
											Repeat 
												$_l_Repeats:=$_l_Repeats+1
												$_bo_OK:=Check_Locked(->[CONTACTS:1]; 1)
												If (Not:C34($_bo_OK))
													If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
														//only increase every 10 tries
														Gen_Alert("Record is locked and cannot be updated at the moment")
														$_bo_GetOut:=True:C214
														$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
													End if 
													DelayTicks(2*$_l_Delay)
												End if 
											Until ($_bo_OK=True:C214) | ($_bo_GetOut)
											If (Not:C34($_bo_GetOut))
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
								$_l_StatusRow:=Find in array:C230(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								If ($_l_StatusRow<0)
									SD2_at_InviteeEmailAddress{$_l_Element}:=$_t_EmailAddress
									SD2_at_Invitees{$_l_Element}:=[CONTACTS:1]Contact_Name:31
									SD2_at_InviteeStatus{$_l_Element}:="Not Sent"
									SD2_al_InviteeStatus{$_l_Element}:=0
									SD2_al_InviteeClass{$_l_Element}:=1
									SD2_at_inviteeClass{$_l_Element}:="Contact"
									SD2_al_RecordID{$_l_Element}:=[CONTACTS:1]x_ID:33
									SD2_at_ContCompany{$_l_Element}:=Sd2_at_FoundNameCompany{$_l_SourceRow}
									
									LBI_Scrollonresize(->SD_lb_EventInvites)
									LB_SetScroll(->SD_lb_EventInvites; $_l_Element; -1)
								End if 
							End if 
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					End if 
				End if 
			End if 
			
			
			
			
	End case 
Else 
	//NG this is to work around some wierdness where the cursor jumps to a differnt field
	SD2_l_StillLoading:=0
	If (Size of array:C274(SD2_at_InviteeEmailAddress)>0)
		EDIT ITEM:C870(SD2_at_InviteeEmailAddress; 1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oInvitees"; $_t_oldMethodName)
