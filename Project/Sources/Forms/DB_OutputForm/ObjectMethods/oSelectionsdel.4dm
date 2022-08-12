If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsdel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/07/2013 12:51
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
	//ARRAY PICTURE(DB_apic_SetPicture;0)
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
	ARRAY TEXT:C222($_at_UserShares; 0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
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
	C_BOOLEAN:C305($_bo_SelfOwned; $_bo_Shared; DB_bo_GroupReady; SM_bo_AdminOverRide)
	C_LONGINT:C283($_l_ActionProcess; $_l_BlobOffset; $_l_BlobVarOffset; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_Column; $_l_ContextID; $_l_GroupRow; $_l_Index; $_l_ItemID; $_l_ItemRow)
	C_LONGINT:C283($_l_Process; $_l_Retries; $_l_Row; $_l_SetIT; $_l_SIzeofArray)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_UserGroup; $_t_oldMethodName; $_t_OwnerName; $_t_Share; $_t_ShareID; $_t_Sharelist; $_t_ShareType; DB_t_CurrentUserGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSelectionsdel"; Form event code:C388)

LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
If ($_l_Row>0)
	$_l_SetIT:=DB_al_SetID{$_l_Row}
	If ($_l_SetIT#0)  //if the set ID=0 this is a built in set so cant be deleted
		If ($_l_SetIT#999999)
			If ($_l_SetIT#9999998)  // blank line
				$_l_ItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetIT)
				If ($_l_ItemRow>0)
					$_t_OwnerName:=SM_at_SetContextitemOwnerIDs{$_l_ItemRow}
					$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ItemRow}
					$_bo_Shared:=(SM_at_SetitemSharesList{$_l_ItemRow}#"")
					$_bo_SelfOwned:=False:C215
					//if we are not the owner of this list then we may just be trying to remove ourselves from the shares....
					//if that is the case we only need to delete from our list and change the shares on the owners list(the others dont actually matter)
					//because as long as they are not the owner and the list is shared it is shared with at least one other person-the owner
					Case of 
						: ($_t_OwnerName="UNI")  //this was being used to designate a list as shared with everyone..so there was no owner(this will not be the case from now on)
							If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers"))
								$_bo_SelfOwned:=True:C214
							End if 
						: (Position:C15("GRP_"; $_t_OwnerName)>0)  //this was being used to designate a list as shared with everyone in a group..so there was no owner(this will not be the case from now on)
							DB_bo_GroupReady:=False:C215
							DB_t_CurrentUserGroup:=""
							$_l_Process:=New process:C317("Get_UserGroup"; DB_ProcessMemoryinit(4); "User Group"; Current process:C322; <>PER_t_CurrentUserInitials)
							$_l_Retries:=0
							While (Not:C34(DB_bo_GroupReady))
								$_l_Retries:=$_l_Retries+1
								DelayTicks($_l_Retries*2)
							End while 
							If (DB_t_CurrentUserGroup=Substring:C12($_t_OwnerName; 5+Length:C16(<>PER_t_CurrentUserInitials)+1)) & (Position:C15(("_"+<>PER_t_CurrentUserInitials+":"); $_t_OwnerName)>0)
								
								$_bo_SelfOwned:=True:C214
							Else 
								If (User in group:C338(Current user:C182; "Administrator"))
									Gen_Confirm("You are not the owner of this selection do you still which to delete it?"; "No"; "Yes")
									If (OK=0)
										SM_bo_AdminOverRide:=True:C214
										$_bo_SelfOwned:=True:C214
									End if 
									OK:=1
								End if 
								
							End if 
							
						Else   //owned by a person. is the person the current user.
							If ($_t_OwnerName=<>PER_t_CurrentUserInitials)
								$_bo_SelfOwned:=True:C214
							Else 
								If (User in group:C338(Current user:C182; "Administrator"))
									Gen_Confirm("You are not the owner of this selection do you still which to delete it?"; "No"; "Yes")
									If (OK=0)
										SM_bo_AdminOverRide:=True:C214
										$_bo_SelfOwned:=True:C214
									End if 
									OK:=1
								End if 
								
							End if 
							
					End case 
					If ($_bo_SelfOwned)
						If ($_bo_Shared)
							Gen_Confirm("This list is shared with other users or groups. Do you wish to remove this list from those users as well"; "Yes"; "No")
							If (OK=1)  //undo shares first
								ARRAY TEXT:C222($_at_UserShares; 0)
								ARRAY TEXT:C222($_at_GroupShares; 0)
								$_t_Sharelist:=SM_at_SetitemSharesList{$_l_ItemRow}
								Repeat 
									
									
									$_l_CharacterPosition:=Position:C15(":"; $_t_Sharelist)
									If ($_l_CharacterPosition>0)
										$_t_Share:=Substring:C12($_t_Sharelist; 1; $_l_CharacterPosition-1)
										$_t_Sharelist:=Substring:C12($_t_Sharelist; $_l_CharacterPosition+1)
										
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
										If ($_t_Sharelist#"")
											$_t_Share:=$_t_Sharelist
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
											SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_SetIT; $_l_ContextID; ""; 0; ""; 0; $_t_OwnerName; ""; True:C214)
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
											DelayTicks(2*(1+$_l_Retries))
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
												$_l_GroupRow:=Find in array:C230(SM_al_SetGroupItemIDs; $_l_SetIT)
												If ($_l_GroupRow>0)
													DELETE FROM ARRAY:C228(SM_at_SetGroupItemNames; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_al_SetGroupItemContextIDs; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_al_SetGroupItemIDs; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_al_SetGroupItemClassIDs; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_at_SetGroupItemClassNames; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_at_SetGroupItemOwnerIDs; $_l_GroupRow; 1)
													DELETE FROM ARRAY:C228(SM_at_SetGroupitemSharesList; $_l_GroupRow; 1)
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
											//SM_UpdateArrays ("PER";$1;$2;$3;"";0;"";0;$4;$_t_Sharelist;True)
											
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
								$_l_ItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_SetIT)
								SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_SetIT; $_l_ContextID; ""; 0; ""; 0; $_t_OwnerName; ""; True:C214)
								SM_UPDATEDATA
								DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_Row; 1)
								DELETE FROM ARRAY:C228(DB_at_SetName; $_l_Row; 1)
								DELETE FROM ARRAY:C228(DB_al_SetID; $_l_Row; 1)
								DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_Row; 1)
								DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_Row; 1)
								
							Else 
								//'ownership of the list needs to be transferred in which case select the person who should now own the list
								//update their list AND all the other users lists to reflect the new owner.
								
							End if 
						Else 
							//it is not shared so just delete it.
							//TRACE
							SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_SetIT; $_l_ContextID; ""; 0; ""; 0; $_t_OwnerName; ""; True:C214)
							SM_UPDATEDATA
							DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_SetName; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_al_SetID; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_Row; 1)
							
						End if 
					Else 
						If (False:C215)
							SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_SetIT; $_l_ContextID; ""; 0; ""; 0; $_t_OwnerName; ""; True:C214)
							SM_UPDATEDATA
							DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_SetName; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_al_SetID; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_Row; 1)
							DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_Row; 1)
						End if 
						
						
					End if 
				End if 
			End if 
		Else 
			//its not save just remove it from the arrays.
			$_l_SIzeofArray:=Size of array:C274(DB_apic_SetPicture)
			DELETE FROM ARRAY:C228(DB_at_SetName; $_l_SIzeofArray; 1)
			DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_SIzeofArray; 1)
			DELETE FROM ARRAY:C228(DB_al_SetID; $_l_SIzeofArray; 1)
			DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_SIzeofArray; 1)
			DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_SIzeofArray; 1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsdel"; $_t_oldMethodName)
