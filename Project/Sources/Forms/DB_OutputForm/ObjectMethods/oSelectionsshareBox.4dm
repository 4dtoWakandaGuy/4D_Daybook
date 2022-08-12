If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsshareBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	ARRAY LONGINT:C221($_al_SetContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
	ARRAY LONGINT:C221($_al_SetGroupContextsIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
	ARRAY LONGINT:C221($_al_SetitemsClassID; 0)
	ARRAY LONGINT:C221($_al_SetitemsID; 0)
	ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetGroupContextsIDs;0)
	//ARRAY LONGINT(SM_al_SetGroupItemClassIDs;0)
	//ARRAY LONGINT(SM_al_SetGroupItemContextIDs;0)
	//ARRAY LONGINT(SM_al_SetGroupItemIDs;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY LONGINT(SM_al_SetUNIContextIDs;0)
	//ARRAY LONGINT(SM_al_SetUNIitemClassID;0)
	//ARRAY LONGINT(SM_al_SetUNIitemcontextID;0)
	//ARRAY LONGINT(SM_al_SetUNIitemsID;0)
	ARRAY TEXT:C222($_at_CurrentShares; 0)
	ARRAY TEXT:C222($_at_GroupShares; 0)
	ARRAY TEXT:C222($_at_SetContextitemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetContexts; 0)
	ARRAY TEXT:C222($_at_SetGroupContexts; 0)
	ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
	ARRAY TEXT:C222($_at_SetGroupItemNames; 0)
	ARRAY TEXT:C222($_at_SetGroupItemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetitemsClassName; 0)
	ARRAY TEXT:C222($_at_SetitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetItemsName; 0)
	ARRAY TEXT:C222($_at_SetUNIContexts; 0)
	ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
	ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
	ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetUNIitemsName; 0)
	ARRAY TEXT:C222($_at_ShareIDS; 0)
	ARRAY TEXT:C222($_at_UserShares; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetContexts;0)
	//ARRAY TEXT(SM_at_SetGroupContexts;0)
	//ARRAY TEXT(SM_at_SetGroupItemClassNames;0)
	//ARRAY TEXT(SM_at_SetGroupItemNames;0)
	//ARRAY TEXT(SM_at_SetGroupItemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetGroupitemSharesList;0)
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	//ARRAY TEXT(SM_at_SetitemSharesList;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	//ARRAY TEXT(SM_at_SetUNIContexts;0)
	//ARRAY TEXT(SM_at_SetUNIitemClassName;0)
	//ARRAY TEXT(SM_at_SetUNIitemOwnerID;0)
	//ARRAY TEXT(SM_at_SetUNIitemSharesList;0)
	//ARRAY TEXT(SM_at_SetUNIitemsName;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_SelfOwned; $_bo_Shared; $_bo_TurnOff; DB_bo_GroupReady; SEL_SelectionsShare)
	C_LONGINT:C283($_l_ActionProcess; $_l_BlobOffset; $_l_BlobVarOffset; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_Column; $_l_CommaPosition; $_l_ContextID; $_l_event; $_l_Index; $_l_ItemID)
	C_LONGINT:C283($_l_Process; $_l_Retries; $_l_Row; $_l_SetGroupRow; $_l_SetID; $_l_SetRow; $_l_SharingRow; DB_l_CurrentDisplayedForm; SEL_configselection)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_UserGroup; $_t_oldMethodName; $_t_Owner; $_t_ShareID; $_t_ShareName; $_t_SharesList; $_t_ShareType; DB_t_CurrentUserGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSelectionsshareBox"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SEL_SelectionsShare)  //share it
			$_l_SharingRow:=Find in array:C230(DB_at_ConfigureOptions; "Edit Sharing")
			If ($_l_SharingRow<0)
				APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Sharing")
			End if 
			OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
			LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
			If ($_l_Row>0)
				$_l_SetID:=DB_al_SetID{$_l_Row}
				If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
					If ($_l_SetID#999999)
						If ($_l_SetID#9999998)
							
							$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
							$_l_ContextID:=10000+DB_l_CurrentDisplayedForm
							//$_l_ContextID:=SM_al_SetContextItemContextID{$ref}
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
								ARRAY TEXT:C222($_at_ShareIDS; 0)
								If ($_bo_Shared)  //Here dont do anything it is is shared
									
								Else 
									ARRAY TEXT:C222($_at_CurrentShares; 0)
									APPEND TO ARRAY:C911($_at_CurrentShares; <>PER_t_CurrentUserInitials)
									
									//Bring up the shares window and set the shares-
									$_bo_OK:=SM_SendSetSelection(DB_at_SetName{$_l_Row}; $_l_SetID; $_l_ContextID; <>PER_t_CurrentUserInitials; ->$_at_CurrentShares)
									
								End if 
								//here open the users list window with the current shares ticked...
								//on closing the window edit any sharing
								
							End if 
						End if 
					Else 
						//it is a new unsave set
					End if 
				End if 
				
			End if 
		Else 
			LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
			If ($_l_Row>0)
				$_l_SetID:=DB_al_SetID{$_l_Row}
				If ($_l_SetID#0)  //if the set ID=0 this is a built in set so cant be edited
					If ($_l_SetID#999999)
						If ($_l_SetID#999998)
							$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
							$_l_ContextID:=10000+DB_l_CurrentDisplayedForm
							//$_l_ContextID:=SM_al_SetContextItemContextID{$_l_SetRow}
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
								$_bo_TurnOff:=False:C215
								If ($_bo_Shared)
									Gen_Confirm("This selection is shared with others, if you turn off sharing the set will be removed from their selections "; "Cancel"; "Unshare")
									If (OK=0)
										//Get the shares. and remove them.
										$_bo_TurnOff:=True:C214
										ARRAY TEXT:C222($_at_UserShares; 0)
										ARRAY TEXT:C222($_at_GroupShares; 0)
										$_t_SharesList:=SM_at_SetitemSharesList{$_l_SetRow}
										Repeat 
											
											
											$_l_CharacterPosition:=Position:C15(":"; $_t_SharesList)
											If ($_l_CharacterPosition>0)
												$_t_ShareName:=Substring:C12($_t_SharesList; 1; $_l_CharacterPosition-1)
												$_t_SharesList:=Substring:C12($_t_SharesList; $_l_CharacterPosition+1)
												
												$_l_CharacterPosition2:=Position:C15(","; $_t_ShareName)
												If ($_l_CharacterPosition2>0)  //it should be
													$_t_ShareType:=Substring:C12($_t_ShareName; 1; $_l_CharacterPosition2-1)
													$_t_ShareID:=Substring:C12($_t_ShareName; $_l_CharacterPosition2+1)
													Case of 
														: ($_t_ShareType="PER")
															APPEND TO ARRAY:C911($_at_UserShares; $_t_ShareID)
															
														Else 
															APPEND TO ARRAY:C911($_at_GroupShares; $_t_ShareID)
															
													End case 
												End if 
											Else 
												If ($_t_SharesList#"")
													$_t_ShareName:=$_t_SharesList
													$_l_CommaPosition:=Position:C15(","; $_t_ShareName)
													If ($_l_CommaPosition>0)  //it should be
														$_t_ShareType:=Substring:C12($_t_ShareName; 1; $_l_CommaPosition-1)
														$_t_ShareID:=Substring:C12($_t_ShareName; $_l_CommaPosition+1)
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
										If (Size of array:C274($_at_UserShares)>0)
											For ($_l_Index; 1; Size of array:C274($_at_UserShares))
												If ($_at_UserShares{$_l_Index}#<>PER_t_CurrentUserInitials)
													//First we have to preserve the setting currently loaded UNLESS they are the current user(the current user taking the set off them selves
													
													ARRAY TEXT:C222($_at_SetContexts; 0)
													ARRAY LONGINT:C221($_al_SetContextIDs; 0)
													ARRAY TEXT:C222($_at_SetItemsName; 0)
													ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
													ARRAY LONGINT:C221($_al_SetitemsID; 0)
													ARRAY TEXT:C222($_at_SetitemsClassName; 0)
													ARRAY LONGINT:C221($_al_SetitemsClassID; 0)
													ARRAY TEXT:C222($_at_SetContextitemOwnerIDs; 0)
													ARRAY TEXT:C222($_at_SetitemSharesList; 0)
													
													ARRAY TEXT:C222($_at_SetUNIContexts; 0)
													ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
													ARRAY TEXT:C222($_at_SetUNIitemsName; 0)
													ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
													ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
													ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
													ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
													ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
													ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
													
													//``
													//Group
													ARRAY TEXT:C222($_at_SetGroupContexts; 0)
													ARRAY LONGINT:C221($_al_SetGroupContextsIDs; 0)
													ARRAY TEXT:C222($_at_SetGroupItemNames; 0)
													ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
													ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
													ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
													ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
													ARRAY TEXT:C222($_at_SetGroupItemOwnerIDs; 0)
													ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
													
													COPY ARRAY:C226(SM_at_SetContexts; $_at_SetContexts)
													COPY ARRAY:C226(SM_al_SetContextIDs; $_al_SetContextIDs)
													COPY ARRAY:C226(SM_at_SetItemsName; $_at_SetItemsName)
													COPY ARRAY:C226(SM_al_SetContextItemContextID; $_al_SetContextItemContextID)
													COPY ARRAY:C226(SM_al_SetitemsID; $_al_SetitemsID)
													COPY ARRAY:C226(SM_at_SetitemsClassName; $_at_SetitemsClassName)
													COPY ARRAY:C226(SM_al_SetitemsClassID; $_al_SetitemsClassID)
													COPY ARRAY:C226(SM_at_SetContextitemOwnerIDs; $_at_SetContextitemOwnerIDs)
													COPY ARRAY:C226(SM_at_SetitemSharesList; $_at_SetitemSharesList)
													
													COPY ARRAY:C226(SM_at_SetUNIContexts; $_at_SetUNIContexts)
													COPY ARRAY:C226(SM_al_SetUNIContextIDs; $_al_SetUNIContextIDs)
													COPY ARRAY:C226(SM_at_SetUNIitemsName; $_at_SetUNIitemsName)
													COPY ARRAY:C226(SM_al_SetUNIitemcontextID; $_al_SetUNIitemcontextID)
													COPY ARRAY:C226(SM_al_SetUNIitemsID; $_al_SetUNIitemsID)
													COPY ARRAY:C226(SM_at_SetUNIitemClassName; $_at_SetUNIitemClassName)
													COPY ARRAY:C226(SM_al_SetUNIitemClassID; $_al_SetUNIitemClassID)
													COPY ARRAY:C226(SM_at_SetUNIitemOwnerID; $_at_SetUNIitemOwnerID)
													COPY ARRAY:C226(SM_at_SetUNIitemSharesList; $_at_SetUNIitemSharesList)
													
													//``
													//Group
													COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContexts)
													COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextsIDs)
													COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupItemNames)
													COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
													COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
													COPY ARRAY:C226(SM_at_SetGroupItemClassNames; SM_at_SetGroupItemClassNames)
													COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
													COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupItemOwnerIDs)
													COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
													$_l_Retries:=0
													While (Semaphore:C143("◊UpdateSets"))
														$_l_Retries:=$_l_Retries+1
														DelayTicks($_l_Retries*2)
													End while 
													DB_BuildSelectionsMenuitems(""; 0; $_at_UserShares{$_l_Index}; False:C215)
													//That loads the sets for that user.
													SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_SetID; $_l_ContextID; ""; 0; ""; 0; $_t_Owner; ""; True:C214)
													SM_UPDATEDATA
													//Restore the local arrays
													CLEAR SEMAPHORE:C144("◊UpdateSets")
													COPY ARRAY:C226($_at_SetContexts; SM_at_SetContexts)
													COPY ARRAY:C226($_al_SetContextIDs; SM_al_SetContextIDs)
													COPY ARRAY:C226($_at_SetItemsName; SM_at_SetItemsName)
													COPY ARRAY:C226($_al_SetContextItemContextID; SM_al_SetContextItemContextID)
													COPY ARRAY:C226($_al_SetitemsID; SM_al_SetitemsID)
													COPY ARRAY:C226($_at_SetitemsClassName; SM_at_SetitemsClassName)
													COPY ARRAY:C226($_al_SetitemsClassID; SM_al_SetitemsClassID)
													COPY ARRAY:C226($_at_SetContextitemOwnerIDs; SM_at_SetContextitemOwnerIDs)
													COPY ARRAY:C226($_at_SetitemSharesList; SM_at_SetitemSharesList)
													
													COPY ARRAY:C226($_at_SetUNIContexts; SM_at_SetUNIContexts)
													COPY ARRAY:C226($_al_SetUNIContextIDs; SM_al_SetUNIContextIDs)
													COPY ARRAY:C226($_at_SetUNIitemsName; SM_at_SetUNIitemsName)
													COPY ARRAY:C226($_al_SetUNIitemcontextID; SM_al_SetUNIitemcontextID)
													COPY ARRAY:C226($_al_SetUNIitemsID; SM_al_SetUNIitemsID)
													COPY ARRAY:C226($_at_SetUNIitemClassName; SM_at_SetUNIitemClassName)
													COPY ARRAY:C226($_al_SetUNIitemClassID; SM_al_SetUNIitemClassID)
													COPY ARRAY:C226($_at_SetUNIitemOwnerID; SM_at_SetUNIitemOwnerID)
													COPY ARRAY:C226($_at_SetUNIitemSharesList; SM_at_SetUNIitemSharesList)
													
													//``
													//Group
													COPY ARRAY:C226($_at_SetGroupContexts; SM_at_SetGroupContexts)
													COPY ARRAY:C226($_al_SetGroupContextsIDs; SM_al_SetGroupContextsIDs)
													COPY ARRAY:C226($_at_SetGroupItemNames; SM_at_SetGroupItemNames)
													COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
													COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
													COPY ARRAY:C226($_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
													COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
													COPY ARRAY:C226($_at_SetGroupItemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
													COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
													
												End if 
											End for 
										End if 
										If (Size of array:C274($_at_GroupShares)>0)
											For ($_l_Index; 1; Size of array:C274($_at_GroupShares))
												
												
												
												//``
												//Group
												ARRAY TEXT:C222($_at_SetGroupContexts; 0)
												ARRAY LONGINT:C221($_al_SetGroupContextsIDs; 0)
												ARRAY TEXT:C222($_at_SetGroupItemNames; 0)
												ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
												ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
												ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
												ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
												ARRAY TEXT:C222($_at_SetGroupItemOwnerIDs; 0)
												ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
												
												
												//``
												//Group
												COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContexts)
												COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextsIDs)
												COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupItemNames)
												COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
												COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
												COPY ARRAY:C226(SM_at_SetGroupItemClassNames; SM_at_SetGroupItemClassNames)
												COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
												COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupItemOwnerIDs)
												COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
												$_l_Retries:=0
												While (Semaphore:C143("◊UpdateSets"))
													$_l_Retries:=$_l_Retries+1
													DelayTicks($_l_Retries*2)
												End while 
												$_l_ItemID:=PREF_GetPreferenceID($_at_GroupShares{$_l_Index}+" Sets"; False:C215)
												If ($_l_ItemID>0)
													//here we only load the shares for the group.
													ARRAY TEXT:C222(SM_at_SetGroupContexts; 0)
													ARRAY LONGINT:C221(SM_al_SetGroupContextsIDs; 0)
													ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
													ARRAY LONGINT:C221(SM_al_SetGroupItemContextIDs; 0)
													ARRAY LONGINT:C221(SM_al_SetGroupItemIDs; 0)
													ARRAY TEXT:C222(SM_at_SetGroupItemClassNames; 0)
													ARRAY LONGINT:C221(SM_al_SetGroupItemClassIDs; 0)
													ARRAY TEXT:C222(SM_at_SetGroupItemOwnerIDs; 0)
													ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; 0)
													
													//Sets updated
													$_l_BlobVarOffset:=0
													READ WRITE:C146([PREFERENCES:116])
													QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
													If (Records in selection:C76([PREFERENCES:116])=1)  //Be inference this MUST exist or we could not be deleting something from it
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupContexts; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupContextsIDs; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemNames; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemContextIDs; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemIDs; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemClassNames; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemClassIDs; $_l_BlobVarOffset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemOwnerIDs; $_l_BlobVarOffset)
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupitemSharesList; $_l_BlobVarOffset)
														Else 
															ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; Size of array:C274(SM_al_SetGroupItemClassIDs))
														End if 
														$_l_SetGroupRow:=Find in array:C230(SM_al_SetGroupItemIDs; $_l_SetID)
														If ($_l_SetGroupRow>0)
															DELETE FROM ARRAY:C228(SM_at_SetGroupItemNames; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_al_SetGroupItemContextIDs; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_al_SetGroupItemIDs; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_al_SetGroupItemClassIDs; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_at_SetGroupItemClassNames; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_at_SetGroupItemOwnerIDs; $_l_SetGroupRow; 1)
															DELETE FROM ARRAY:C228(SM_at_SetGroupitemSharesList; $_l_SetGroupRow; 1)
														End if 
														SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
														$_l_BlobOffset:=0
														VARIABLE TO BLOB:C532(SM_at_SetContexts; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_al_SetContextIDs; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_at_SetItemsName; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_al_SetContextItemContextID; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_al_SetitemsID; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_at_SetitemsClassName; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_al_SetitemsClassID; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_at_SetContextitemOwnerIDs; [PREFERENCES:116]DataBlob:2; *)
														VARIABLE TO BLOB:C532(SM_at_SetitemSharesList; [PREFERENCES:116]DataBlob:2; *)
														DB_SaveRecord(->[PREFERENCES:116])
														UNLOAD RECORD:C212([PREFERENCES:116])
														READ ONLY:C145([PREFERENCES:116])
														If (Application type:C494=4D Remote mode:K5:5)
															$_l_ActionProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
														End if 
														
														
													End if 
													
													//DB_BuildSelectionsMenuitems (0;0;WS_at_DiaryOwnersPersonInitials{$ref};False)
													//That loads the sets for that user.
													//SM_UpdateArrays ("PER";$1;$2;$3;"";0;"";0;$4;$_t_SharesList;True)
													
													If ($_at_GroupShares{$_l_Index}=<>PER_t_UserGroup)  //This person is in that group so update the data
														SM_UPDATEDATA
													Else 
														//Restore the local arrays
														If (Application type:C494=4D Remote mode:K5:5)
															$_l_ActionProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
														End if 
														//"now do we need to tell peoples sets to reload"
														//``
														//Group
														COPY ARRAY:C226($_at_SetGroupContexts; SM_at_SetGroupContexts)
														COPY ARRAY:C226($_al_SetGroupContextsIDs; SM_al_SetGroupContextsIDs)
														COPY ARRAY:C226($_at_SetGroupItemNames; SM_at_SetGroupItemNames)
														COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
														COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
														COPY ARRAY:C226($_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
														COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
														COPY ARRAY:C226($_at_SetGroupItemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
														COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
													End if 
													
												End if 
												CLEAR SEMAPHORE:C144("◊UpdateSets")
												
											End for 
										End if 
										$_l_SetRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
										SM_at_SetitemSharesList{$_l_SetRow}:=""
										SM_UPDATEDATA
									End if 
									
								Else 
									//its not actually shared just turn off
									$_bo_TurnOff:=True:C214
								End if 
								If ($_bo_TurnOff)
									$_l_SharingRow:=Find in array:C230(DB_at_ConfigureOptions; "Edit Sharing")
									If ($_l_SharingRow>0)
										DELETE FROM ARRAY:C228(DB_at_ConfigureOptions; $_l_SharingRow)
									End if 
									If (Size of array:C274(DB_at_ConfigureOptions)=0)
										OBJECT SET VISIBLE:C603(SEL_configselection; False:C215)
									End if 
								Else 
									SEL_SelectionsShare:=True:C214
								End if 
							Else 
								Gen_Alert("Sorry you do not own this selection so may not edit the sharing(Selection owned by user with initials "+$_t_Owner+")")
								If ($_bo_Shared)
									SEL_SelectionsShare:=True:C214
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsshareBox"; $_t_oldMethodName)
