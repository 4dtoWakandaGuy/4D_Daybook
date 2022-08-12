If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsconfig
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2013 12:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	ARRAY LONGINT:C221($_al_SetClassID; 0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	ARRAY TEXT:C222($_at_ConfigureOptions; 0)
	ARRAY TEXT:C222($_at_GroupShares; 0)
	ARRAY TEXT:C222($_at_SetClass; 0)
	ARRAY TEXT:C222($_at_ShareIDS; 0)
	ARRAY TEXT:C222($_at_UserShares; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetitemSharesList;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_AutoScript; $_bo_New; $_bo_NewSetName; $_bo_OK2; $_bo_SelfOwned; $_bo_Shared; DB_bo_GroupReady)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharacterPosition2; $_l_ClassRow; $_l_Column; $_l_ContextID; $_l_event; $_l_Index; $_l_ItemParent; $_l_ItemReference; $_l_MouseButton; $_l_MouseX)
	C_LONGINT:C283($_l_MouseY; $_l_OK; $_l_Process; $_l_Retries; $_l_Row; $_l_SetID; $_l_SetRow; $_l_UserChoice; DB_l_CurrentDisplayedForm; DB_l_MyTempMacro; Sel_ConfigSelection)
	C_LONGINT:C283(SM_l_ContextItemID)
	C_REAL:C285(DB_l_newSetClass)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_MenuString; $_t_NewSetName; $_t_oldMethodName; $_t_Owner; $_t_ProcessName; $_t_ScriptCode; $_t_ScriptName; $_t_Share; $_t_ShareID; $_t_SharesLIst)
	C_TEXT:C284($_t_ShareType; DB_t_CurrentUserGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oSelectionsconfig"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Alternative Click:K2:36)
		
		If (Size of array:C274(DB_at_ConfigureOptions)>0)
			COPY ARRAY:C226(DB_at_ConfigureOptions; $_at_ConfigureOptions)
			$_l_UserChoice:=0
			If (Size of array:C274($_at_ConfigureOptions)>1)
				GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
				For ($_l_Index; 1; Size of array:C274($_at_ConfigureOptions))
					If ($_l_Index=1)
						$_t_MenuString:=$_at_ConfigureOptions{$_l_Index}
					Else 
						$_t_MenuString:=$_t_MenuString+";"+$_at_ConfigureOptions{$_l_Index}
					End if 
				End for 
				
				$_l_UserChoice:=Pop up menu:C542($_t_MenuString; 1; $_l_MouseX; $_l_MouseY)
			Else 
				$_l_UserChoice:=1
			End if 
			If ($_l_UserChoice>0)
				If ($_l_UserChoice<=Size of array:C274($_at_ConfigureOptions))
					Case of 
						: ($_at_ConfigureOptions{$_l_UserChoice}="Edit Sharing")
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)
								$_l_SetID:=DB_al_SetID{$_l_Row}
								If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
									If ($_l_SetID#999999)
										If ($_l_SetID#9999998)
											$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
											$_l_ContextID:=10000+DB_l_CurrentDisplayedForm
											$_t_Owner:=SM_at_SetContextitemOwnerIDs{$_l_SetRow}
											$_bo_Shared:=(SM_at_SetitemSharesList{$_l_SetRow}#"")
											$_bo_SelfOwned:=False:C215
											Case of 
												: ($_t_Owner="UNI")  //this was being used to designate a list as shared with everyone..so there was no owner(this will not be the case from now on)
													If (User in group:C338(Current user:C182; "Administrators"))
														$_bo_SelfOwned:=True:C214
													End if 
												: (Position:C15("GRP_"; $_t_Owner)>0)  //this was being used to designate a list as shared with everyone in a group..so there was no owner(this will not be the case from now on)
													DB_bo_GroupReady:=False:C215
													DB_t_CurrentUserGroup:=""
													$_l_Process:=New process:C317("Get_UserGroup"; DB_ProcessMemoryinit(4); "User Group"; Current process:C322; <>PER_t_CurrentUserInitials)
													$_l_Retries:=0
													While (Not:C34(DB_bo_GroupReady))
														$_l_Retries:=$_l_Retries+1
														DelayTicks($_l_Retries*2)
													End while 
													If (DB_t_CurrentUserGroup=Substring:C12($_t_Owner; 5))
														$_bo_SelfOwned:=True:C214
													End if 
													
												Else   //owned by a person. is the person the current user.
													If ($_t_Owner=<>PER_t_CurrentUserInitials)
														$_bo_SelfOwned:=True:C214
													End if 
													
											End case 
											If ($_bo_SelfOwned)  //this user owns the list so it can have its shares edited-note that if the owner is group or uni that will be overwritten now
												//get the current shares list
												ARRAY TEXT:C222($_at_UserShares; 0)
												ARRAY TEXT:C222($_at_GroupShares; 0)
												If ($_bo_Shared)
													$_t_SharesLIst:=SM_at_SetitemSharesList{$_l_SetRow}
													
													
													$_t_SharesLIst:=SM_at_SetitemSharesList{$_l_SetRow}
													Repeat 
														
														
														$_l_CharacterPosition:=Position:C15(":"; $_t_SharesLIst)
														If ($_l_CharacterPosition>0)
															$_t_Share:=Substring:C12($_t_SharesLIst; 1; $_l_CharacterPosition-1)
															$_t_SharesLIst:=Substring:C12($_t_SharesLIst; $_l_CharacterPosition+1)
															
															$_l_CharacterPosition2:=Position:C15(","; $_t_Share)
															If ($_l_CharacterPosition2>0)  //it should be
																$_t_ShareType:=Substring:C12($_t_Share; 1; $_l_CharacterPosition2-1)
																$_t_ShareID:=Substring:C12($_t_Share; $_l_CharacterPosition2+1)
																Case of 
																	: ($_t_ShareType="PER")
																		APPEND TO ARRAY:C911($_at_UserShares; $_t_ShareID)
																		
																	Else 
																		APPEND TO ARRAY:C911($_at_GroupShares; $_t_ShareID)
																		
																End case 
															End if 
														Else 
															If ($_t_SharesLIst#"")
																$_t_Share:=$_t_SharesLIst
																$_l_CharacterPosition2:=Position:C15(","; $_t_Share)
																If ($_l_CharacterPosition2>0)  //it should be
																	$_t_ShareType:=Substring:C12($_t_Share; 1; $_l_CharacterPosition2-1)
																	$_t_ShareID:=Substring:C12($_t_Share; $_l_CharacterPosition2+1)
																	Case of 
																		: ($_t_ShareType="PER")
																			APPEND TO ARRAY:C911($_at_UserShares; $_t_ShareID)
																			
																		Else 
																			APPEND TO ARRAY:C911($_at_GroupShares; $_t_ShareID)
																			
																	End case 
																End if 
															End if 
														End if 
													Until ($_l_CharacterPosition=0)
												End if 
												//here open the users list window with the current shares ticked...
												//on closing the window edit any sharing
												$_bo_OK2:=SM_SendSetSelection(DB_at_SetName{$_l_Row}; $_l_SetID; $_l_ContextID; <>PER_t_CurrentUserInitials; ->$_at_UserShares; ->$_at_GroupShares)
											End if 
										End if 
									Else 
										//it is self owned and not shared-should not be able to be here
									End if 
								End if 
								
							End if 
							
						: ($_at_ConfigureOptions{$_l_UserChoice}="Edit Query")
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)
								$_l_SetID:=DB_al_SetID{$_l_Row}
								If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
									If ($_l_SetID#999999)
										If ($_l_SetID#9999998)
											$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
											
											$_t_ScriptCode:=String:C10($_l_SetID)
											$_t_ScriptName:="Data Query "+SM_at_SetItemsName{$_l_SetRow}
											If ($_l_SetRow>0)
												READ WRITE:C146([SCRIPTS:80])
												QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
												If (Records in selection:C76([SCRIPTS:80])=0)
													If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers"))
														//$_l_OK:=0
														Gen_Confirm("Create Query using query wizard or create your own script?"; "Wizard"; "Own")
														If (OK=0)
															$_bo_AutoScript:=False:C215
															CREATE RECORD:C68([SCRIPTS:80])
															[SCRIPTS:80]Script_Code:1:=$_t_ScriptCode
															[SCRIPTS:80]Script_Name:2:="LM "+$_t_ScriptName
															[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
															[SCRIPTS:80]Table_Number:8:=DB_l_CurrentDisplayedForm
															[SCRIPTS:80]Script_Class:11:=SM Macro
															DB_SaveRecord(->[SCRIPTS:80])
															UNLOAD RECORD:C212([SCRIPTS:80])
															$_bo_New:=True:C214
														Else 
															$_bo_New:=True:C214
															$_bo_AutoScript:=True:C214
															//HIDE PROCESS(Current process)
															//Create Macro
														End if 
													Else 
														$_bo_New:=True:C214
														$_bo_AutoScript:=True:C214
														$_l_OK:=1
													End if 
												Else 
													$_bo_New:=False:C215
													If ([SCRIPTS:80]Script_Class:11=0)
														//AutoSearch
														[SCRIPTS:80]Script_Class:11:=SM Macro
														DB_SaveRecord(->[SCRIPTS:80])
													End if 
													$_bo_AutoScript:=([SCRIPTS:80]Script_Class:11=SM AutoSearch)
													UNLOAD RECORD:C212([SCRIPTS:80])
												End if 
												If ($_bo_AutoScript)  //show search boxes
													If ($_bo_New=False:C215)
														//$_t_ScriptCode:=[MACROS]Macro Code
														//$_t_ScriptName:=[MACROS]Macro Name
														//◊User:=[MACROS]Person
														//$_l_TableNumber:=[MACROS]File No
														//UNLOAD RECORD([MACROS])
														//READ ONLY([MACROS])
														
													Else 
													End if 
													$_l_Process:=New process:C317("SM_EditMacro"; DB_ProcessMemoryinit(1); "Query WIzard"; Current process:C322; $_t_ScriptCode; $_t_ScriptName; <>PER_t_CurrentUserInitials; DB_l_CurrentDisplayedForm)
													
												Else 
													$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Macro")
													$_l_Process:=New process:C317("DBI_DisplayRecord"; DB_ProcessMemoryinit(2); $_t_ProcessName; Current process:C322; Table:C252(->[SCRIPTS:80]); ""; $_t_ScriptCode)
													//here we need to wait for that edit to complete or do we?..
													
													
													//open macro editor window
												End if 
												
											End if 
										End if 
									Else 
										//new set
										If (DB_l_MyTempMacro=0)
											DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
										End if 
										$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
										$_t_ScriptName:="Data Query "+"Temp"
										READ WRITE:C146([SCRIPTS:80])
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
										If (Records in selection:C76([SCRIPTS:80])=0)
											If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers"))
												//$_l_OK:=0
												Gen_Confirm("Create Query using query wizard or create your own script?"; "Wizard"; "Own")
												If (OK=0)
													$_bo_AutoScript:=False:C215
													CREATE RECORD:C68([SCRIPTS:80])
													[SCRIPTS:80]Script_Code:1:=$_t_ScriptCode
													[SCRIPTS:80]Script_Name:2:="LM "+$_t_ScriptName
													[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
													[SCRIPTS:80]Table_Number:8:=DB_l_CurrentDisplayedForm
													[SCRIPTS:80]Script_Class:11:=SM Macro
													DB_SaveRecord(->[SCRIPTS:80])
													UNLOAD RECORD:C212([SCRIPTS:80])
													$_bo_New:=True:C214
												Else 
													$_bo_New:=True:C214
													$_bo_AutoScript:=True:C214
													//HIDE PROCESS(Current process)
													//Create Macro
												End if 
											Else 
												$_bo_New:=True:C214
												$_bo_AutoScript:=True:C214
												$_l_OK:=1
											End if 
										Else 
											$_bo_New:=False:C215
											If ([SCRIPTS:80]Script_Class:11=0)
												//AutoSearch
												[SCRIPTS:80]Script_Class:11:=SM Macro
												DB_SaveRecord(->[SCRIPTS:80])
											End if 
											$_bo_AutoScript:=([SCRIPTS:80]Script_Class:11=SM AutoSearch)
											UNLOAD RECORD:C212([SCRIPTS:80])
										End if 
										If ($_bo_AutoScript)  //show search boxes
											If ($_bo_New=False:C215)
												
											Else 
											End if 
											$_l_Process:=New process:C317("SM_EditMacro"; DB_ProcessMemoryinit(1); "Query WIzard"; Current process:C322; $_t_ScriptCode; $_t_ScriptName; <>PER_t_CurrentUserInitials; DB_l_CurrentDisplayedForm)
											
										Else 
											$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Macro")
											$_l_Process:=New process:C317("DBI_DisplayRecord"; DB_ProcessMemoryinit(2); $_t_ProcessName; Current process:C322; Table:C252(->[SCRIPTS:80]); ""; $_t_ScriptCode)
											//here we need to wait for that edit to complete or do we?..
											
											
											//open macro editor window
										End if 
										
										
									End if 
								End if 
							End if 
						: ($_at_ConfigureOptions{$_l_UserChoice}="Save Set")
							//this option only if a new set
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)
								$_l_SetID:=DB_al_SetID{$_l_Row}
								If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
									If ($_l_SetID=999999)
										//TRACE
										Case of 
											: (DB_at_SetName{$_l_Row}="New Set")
												$_t_NewSetName:=Gen_Request("Enter Name for the new set"; "New Set")
												If (OK=1)
													DB_at_SetName{$_l_Row}:=$_t_NewSetName
												End if 
											: (DB_at_SetName{$_l_Row}="New Group")
												$_t_NewSetName:=Gen_Request("Enter Name for the new group"; "New Group")
												If (OK=1)
													DB_at_SetName{$_l_Row}:=$_t_NewSetName
												End if 
										End case 
										ARRAY TEXT:C222($_at_SetClass; 4)
										ARRAY LONGINT:C221($_al_SetClassID; 4)
										$_at_SetClass{1}:="Fixed List"
										$_at_SetClass{2}:="Dynamic List"
										$_at_SetClass{3}:="Fixed List with Dynamic Query"
										$_at_SetClass{4}:="Group"
										$_al_SetClassID{1}:=853
										$_al_SetClassID{2}:=854
										$_al_SetClassID{3}:=852
										$_al_SetClassID{4}:=855
										$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
										$_l_ItemReference:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
										DB_al_SetID{$_l_Row}:=$_l_ItemReference
										DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
										DB_at_MethodParameters{$_l_Row}:=String:C10($_l_ItemReference)
										If (DB_l_newSetClass=0)
											DB_l_newSetClass:=853
										End if 
										$_l_ClassRow:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
										SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_ItemReference; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ClassRow}; $_al_SetClassID{$_l_ClassRow})
										Case of 
											: (DB_l_newSetClass=853)
												SM_saveSet("DB_NewSet"; $_l_ItemReference)
											: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
												If (DB_l_MyTempMacro=0)
													DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
												End if 
												$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
												$_t_ScriptName:="Data Query "+"Temp"
												READ WRITE:C146([SCRIPTS:80])
												QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
												If (Records in selection:C76([SCRIPTS:80])=1)
													[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_Row})
													[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_Row}
													DB_SaveRecord(->[SCRIPTS:80])
													
												End if 
										End case 
										//the above saves the data to the arrays. now save the arrays.
										//START TRANSACTION
										SM_UPDATEDATA
										LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
										GOTO OBJECT:C206(Sel_ConfigSelection)
										
										//CANCEL TRANSACTION
									End if 
								End if 
							End if 
						: ($_at_ConfigureOptions{$_l_UserChoice}="Delete List")  //NG actually this is not here-its a seperate button
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)
								$_l_SetID:=DB_al_SetID{$_l_Row}
								If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
									$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
									$_t_Owner:=SM_at_SetContextitemOwnerIDs{$_l_SetRow}
									$_bo_Shared:=(SM_at_SetitemSharesList{$_l_SetRow}#"")
									$_bo_SelfOwned:=False:C215
									//if we are not the owner of this list then we may just be trying to remove ourselves from the shares....
									//if that is the case we only need to delete from our list and change the shares on the owners list(the others dont actually matter)
									//because as long as they are not the owner and the list is shared it is shared with at least one other person-the owner
									Case of 
										: ($_t_Owner="UNI")  //this was being used to designate a list as shared with everyone..so there was no owner(this will not be the case from now on)
											If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers"))
												$_bo_SelfOwned:=True:C214
											End if 
										: (Position:C15("GRP_"; $_t_Owner)>0)  //this was being used to designate a list as shared with everyone in a group..so there was no owner(this will not be the case from now on)
											DB_bo_GroupReady:=False:C215
											DB_t_CurrentUserGroup:=""
											$_l_Process:=New process:C317("Get_UserGroup"; DB_ProcessMemoryinit(4); "User Group"; Current process:C322; <>PER_t_CurrentUserInitials)
											$_l_Retries:=0
											While (Not:C34(DB_bo_GroupReady))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*(1+$_l_Retries))
											End while 
											If (DB_t_CurrentUserGroup=Substring:C12($_t_Owner; 5))
												$_bo_SelfOwned:=True:C214
											End if 
											
										Else   //owned by a person. is the person the current user.
											If ($_t_Owner=<>PER_t_CurrentUserInitials)
												$_bo_SelfOwned:=True:C214
											End if 
											
									End case 
									If ($_bo_SelfOwned)
										If ($_bo_Shared)
											Gen_Confirm("This list is shared with other users or groups. Do you wish to remove this list from those users as well"; "Yes"; "No")
											If (OK=1)  //undo shares first
												$_t_SharesLIst:=SM_at_SetitemSharesList{$_l_SetRow}
												ARRAY TEXT:C222($_at_ShareIDS; 0)
												Repeat 
													$_l_CharacterPosition:=Position:C15(":"; $_t_SharesLIst)
													$_t_ShareID:=""
													If ($_l_CharacterPosition>0)
														$_t_ShareID:=Substring:C12($_t_SharesLIst; 1; $_l_CharacterPosition-1)
														$_t_SharesLIst:=Substring:C12($_t_SharesLIst; $_l_CharacterPosition+1)
														
													Else 
														If ($_t_SharesLIst#"")
															$_t_ShareID:=$_t_SharesLIst
															$_t_SharesLIst:=""
														End if 
													End if 
													If ($_t_ShareID#"")
														APPEND TO ARRAY:C911($_at_ShareIDS; $_t_ShareID)
													End if 
												Until ($_l_CharacterPosition=0) | ($_t_SharesLIst="")
												//HERE UPDATE THOSE USERS LIST TO TAKE OUT THIS LIST FROM IT-REFRESHING ON SCREEN IF NECCASSERY.
											Else 
												//'ownership of the list needs to be transferred in which case select the person who should now own the list
												//update their list AND all the other users lists to reflect the new owner.
											End if 
											
										End if 
									Else 
										If ($_bo_Shared)
											//this users does not 'own' the list-they cant delete the list from other users-which is handy.
											//in this case they need to update the owners shared list and remove the list from their settings.
										End if 
										
									End if 
								End if 
							End if 
					End case 
				End if 
			End if 
			
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsconfig"; $_t_oldMethodName)
