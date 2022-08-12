//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SendSetSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SetContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
	ARRAY LONGINT:C221($_al_SetGroupContextID; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
	ARRAY LONGINT:C221($_al_SetItemClassIDs; 0)
	ARRAY LONGINT:C221($_al_SetitemsID; 0)
	ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
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
	//ARRAY LONGINT(WS_aI_SelectedSetGroups;0)
	//ARRAY LONGINT(WS_al_SelectedSetGroups;0)
	ARRAY TEXT:C222($_at_SetContextItemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetContexts; 0)
	ARRAY TEXT:C222($_at_SetGroupContext; 0)
	ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
	ARRAY TEXT:C222($_at_SetGroupitemNames; 0)
	ARRAY TEXT:C222($_at_SetGroupitemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetItemNames; 0)
	ARRAY TEXT:C222($_at_SetitemsClassName; 0)
	ARRAY TEXT:C222($_at_SetitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetUNIContexts; 0)
	ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
	ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
	ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetUNIItemsName; 0)
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
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(WS_at_DiaryOwnersPersonInitials;0)
	//ARRAY TEXT(WS_at_PersonellGroupCode;0)
	//ARRAY TEXT(WS_at_PersonellGroupName;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_BlobOffset; $_l_BlobVarOffset; $_l_ContextID; $_l_ContextPosition; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_GroupCodePosition; $_l_GroupContextPosition; $_l_GroupItemPosition; $_l_index; $_l_ItemClassID)
	C_LONGINT:C283($_l_ItemID; $_l_itemPosition; $_l_ItemPosition2; $_l_PersonPosition; $_l_UpdateSetsProcess; SM_CB_l_RetainList; SM_HL_l_SETMANAGER; SM_l_SetSend; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_UPDATEOWNERS)
	C_POINTER:C301($5; $6)
	C_REAL:C285($2; $3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_UserGroup; $_t_ContextName; $_t_ItemClassName; $_t_oldMethodName; $_t_SetOwner; $_t_SharesList; $1; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SendSetSelection")
If (Count parameters:C259>=4)
	$_t_SetOwner:=$4
	READ ONLY:C145([PERSONNEL_GROUPS:92])
	ALL RECORDS:C47([PERSONNEL_GROUPS:92])
	
	ARRAY TEXT:C222(WS_at_PersonellGroupCode; 0)
	ARRAY TEXT:C222(WS_at_PersonellGroupName; 0)
	ARRAY LONGINT:C221(WS_al_SelectedSetGroups; 0)
	If (Count parameters:C259>=3)
		If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
			
			SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Code:1; WS_at_PersonellGroupCode; [PERSONNEL_GROUPS:92]Group_Name:2; WS_at_PersonellGroupName)
		End if 
		ARRAY LONGINT:C221(WS_aI_SelectedSetGroups; Size of array:C274(WS_at_PersonellGroupName))
		
		READ ONLY:C145([PERSONNEL:11])
		//QUERY([PERSONNEL];[PERSONNEL]Personnel_ID#$2;*) `$2 is the set ID so this cant work
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1#$_t_SetOwner; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1; *)
		
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD3_al_DiaryOwnersPersonIDS; [PERSONNEL:11]Name:2; WS_at_DiaryOwnersPeople; [PERSONNEL:11]Initials:1; WS_at_DiaryOwnersPersonInitials)
		ARRAY LONGINT:C221(SD3_al_SelectedDiaryOwners; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
		For ($_l_index; 1; Size of array:C274(SD3_al_SelectedDiaryOwners))
			SD3_al_SelectedDiaryOwners{$_l_index}:=0
		End for 
		
		
		SORT ARRAY:C229(WS_at_DiaryOwnersPeople; SD3_al_DiaryOwnersPersonIDS; SD3_al_SelectedDiaryOwners; WS_at_DiaryOwnersPersonInitials)
		SORT ARRAY:C229(WS_at_PersonellGroupName; WS_at_PersonellGroupCode; WS_aI_SelectedSetGroups)
		If (Count parameters:C259>=4)
			//shared
			For ($_l_index; 1; Size of array:C274($5->))
				$_l_PersonPosition:=Find in array:C230(WS_at_DiaryOwnersPersonInitials; $5->{$_l_index})
				If ($_l_PersonPosition>0)
					SD3_al_SelectedDiaryOwners{$_l_PersonPosition}:=1
				End if 
			End for 
			
			
		End if 
		If (Count parameters:C259>=6)  //share groups
			For ($_l_index; 1; Size of array:C274($6->))
				$_l_GroupCodePosition:=Find in array:C230(WS_at_PersonellGroupCode; $6->{$_l_index})
				If ($_l_GroupCodePosition>0)
					WS_aI_SelectedSetGroups{$_l_PersonPosition}:=1
				End if 
			End for 
		End if 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
		
		$0:=False:C215
		If (Size of array:C274(WS_aI_SelectedSetGroups)=0)
			//no groups so no point in showing them-so just show people
			//reusing same dialog as personnell Diary_Modifier
			SM_l_SetSend:=0
			DIALOG:C40([USER:15]; "Diary_AccessSelector")
		Else 
			//form has multi pages
			SM_l_SetSend:=1
			DIALOG:C40([USER:15]; "Diary_AccessSelector")
		End if 
		
		
		
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (WS_l_UpdateOwners=1)  //save updates
			$0:=True:C214
			$_t_SharesList:=""
			For ($_l_index; 1; Size of array:C274(SD3_al_SelectedDiaryOwners))
				If (SD3_al_SelectedDiaryOwners{$_l_index}=1)
					If ($_t_SharesList="")
						$_t_SharesList:="PER,"+(WS_at_DiaryOwnersPersonInitials{$_l_index})
					Else 
						$_t_SharesList:=$_t_SharesList+":"+"PER,"+(WS_at_DiaryOwnersPersonInitials{$_l_index})
					End if 
					//NG well this was pants..because the parameter it was passing the initials in iis wrong.
					//and this only updates the arrays currently loaded on this machine.
					//SM_UpdateArrays ("PER";$1;$2;$3;"";0;"";0;$WS_at_DiaryOwnersPersonInitials{$_l_index})
					//SM_UPDATEDATA
				End if 
			End for 
			
			
			For ($_l_index; 1; Size of array:C274(WS_aI_SelectedSetGroups))
				If (WS_aI_SelectedSetGroups{$_l_index}=1)
					If ($_t_SharesList="")
						$_t_SharesList:="GRP,"+String:C10(WS_at_PersonellGroupCode{$_l_index})
					Else 
						$_t_SharesList:=$_t_SharesList+":"+"GRP,"+String:C10(WS_at_PersonellGroupCode{$_l_index})
					End if 
					//SM_UpdateArrays ("GRP";$1;$2;$3;"";0;"";0;WS_at_PersonellGroupCode{$_l_index})
					//SM_UPDATEDATA
				End if 
			End for 
			If (SM_CB_l_RetainList=1)
				If ($_t_SharesList="")
					//$_t_SharesList:="PER,"+$4
				Else 
					$_t_SharesList:=$_t_SharesList+":"+"PER,"+$4
				End if 
			End if 
			
			//Go through the shares when you came in here.
			If (Count parameters:C259>=5)
				
				If (Size of array:C274($5->)>0)
					For ($_l_index; 1; Size of array:C274($5->))
						$_l_PersonPosition:=Find in array:C230(WS_at_DiaryOwnersPersonInitials; $5->{$_l_index})
						If ($_l_PersonPosition>0)
							If (SD3_al_SelectedDiaryOwners{$_l_PersonPosition}=0)
								If (WS_at_DiaryOwnersPersonInitials{$_l_PersonPosition}#<>PER_t_CurrentUserInitials)
									//First we have to preserve the setting currently loaded UNLESS they are the current user(the current user taking the set off them selves
									
									ARRAY TEXT:C222($_at_SetContexts; 0)
									ARRAY LONGINT:C221($_al_SetContextIDs; 0)
									ARRAY TEXT:C222($_at_SetItemNames; 0)
									ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
									ARRAY LONGINT:C221($_al_SetitemsID; 0)
									ARRAY TEXT:C222($_at_SetitemsClassName; 0)
									ARRAY LONGINT:C221($_al_SetItemClassIDs; 0)
									ARRAY TEXT:C222($_at_SetContextItemOwnerIDs; 0)
									ARRAY TEXT:C222($_at_SetitemSharesList; 0)
									
									ARRAY TEXT:C222($_at_SetUNIContexts; 0)
									ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
									ARRAY TEXT:C222($_at_SetUNIItemsName; 0)
									ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
									ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
									ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
									ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
									ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
									ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
									
									//``
									//Group
									ARRAY TEXT:C222($_at_SetGroupContext; 0)
									ARRAY LONGINT:C221($_al_SetGroupContextID; 0)
									ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
									ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
									ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
									ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
									ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
									ARRAY TEXT:C222($_at_SetGroupitemOwnerIDs; 0)
									ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
									
									COPY ARRAY:C226(SM_at_SetContexts; $_at_SetContexts)
									COPY ARRAY:C226(SM_al_SetContextIDs; $_al_SetContextIDs)
									COPY ARRAY:C226(SM_at_SetItemsName; $_at_SetItemNames)
									COPY ARRAY:C226(SM_al_SetContextItemContextID; $_al_SetContextItemContextID)
									COPY ARRAY:C226(SM_al_SetitemsID; $_al_SetitemsID)
									COPY ARRAY:C226(SM_at_SetitemsClassName; $_at_SetitemsClassName)
									COPY ARRAY:C226(SM_al_SetitemsClassID; $_al_SetItemClassIDs)
									COPY ARRAY:C226(SM_at_SetContextitemOwnerIDs; $_at_SetContextItemOwnerIDs)
									COPY ARRAY:C226(SM_at_SetitemSharesList; $_at_SetitemSharesList)
									
									COPY ARRAY:C226(SM_at_SetUNIContexts; $_at_SetUNIContexts)
									COPY ARRAY:C226(SM_al_SetUNIContextIDs; $_al_SetUNIContextIDs)
									COPY ARRAY:C226(SM_at_SetUNIitemsName; $_at_SetUNIItemsName)
									COPY ARRAY:C226(SM_al_SetUNIitemcontextID; $_al_SetUNIitemcontextID)
									COPY ARRAY:C226(SM_al_SetUNIitemsID; $_al_SetUNIitemsID)
									COPY ARRAY:C226(SM_at_SetUNIitemClassName; $_at_SetUNIitemClassName)
									COPY ARRAY:C226(SM_al_SetUNIitemClassID; $_al_SetUNIitemClassID)
									COPY ARRAY:C226(SM_at_SetUNIitemOwnerID; $_at_SetUNIitemOwnerID)
									COPY ARRAY:C226(SM_at_SetUNIitemSharesList; $_at_SetUNIitemSharesList)
									
									//``
									//Group
									COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContext)
									COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextID)
									COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupitemNames)
									COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
									COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
									COPY ARRAY:C226(SM_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
									COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
									COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupitemOwnerIDs)
									COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
									While (Semaphore:C143("◊UpdateSets"))
										DelayTicks(2)
									End while 
									DB_BuildSelectionsMenuitems(""; 0; WS_at_DiaryOwnersPersonInitials{$_l_PersonPosition}; False:C215)
									//That loads the sets for that user.
									SM_UpdateArrays("PER"; $1; $2; $3; ""; 0; ""; 0; $4; $_t_SharesList; True:C214)
									SM_UPDATEDATA
									//Restore the local arrays
									CLEAR SEMAPHORE:C144("◊UpdateSets")
									COPY ARRAY:C226($_at_SetContexts; SM_at_SetContexts)
									COPY ARRAY:C226($_al_SetContextIDs; SM_al_SetContextIDs)
									COPY ARRAY:C226($_at_SetItemNames; SM_at_SetItemsName)
									COPY ARRAY:C226($_al_SetContextItemContextID; SM_al_SetContextItemContextID)
									COPY ARRAY:C226($_al_SetitemsID; SM_al_SetitemsID)
									COPY ARRAY:C226($_at_SetitemsClassName; SM_at_SetitemsClassName)
									COPY ARRAY:C226($_al_SetItemClassIDs; SM_al_SetitemsClassID)
									COPY ARRAY:C226($_at_SetContextItemOwnerIDs; SM_at_SetContextitemOwnerIDs)
									COPY ARRAY:C226($_at_SetitemSharesList; SM_at_SetitemSharesList)
									
									COPY ARRAY:C226($_at_SetUNIContexts; SM_at_SetUNIContexts)
									COPY ARRAY:C226($_al_SetUNIContextIDs; SM_al_SetUNIContextIDs)
									COPY ARRAY:C226($_at_SetUNIItemsName; SM_at_SetUNIitemsName)
									COPY ARRAY:C226($_al_SetUNIitemcontextID; SM_al_SetUNIitemcontextID)
									COPY ARRAY:C226($_al_SetUNIitemsID; SM_al_SetUNIitemsID)
									COPY ARRAY:C226($_at_SetUNIitemClassName; SM_at_SetUNIitemClassName)
									COPY ARRAY:C226($_al_SetUNIitemClassID; SM_al_SetUNIitemClassID)
									COPY ARRAY:C226($_at_SetUNIitemOwnerID; SM_at_SetUNIitemOwnerID)
									COPY ARRAY:C226($_at_SetUNIitemSharesList; SM_at_SetUNIitemSharesList)
									
									//``
									//Group
									COPY ARRAY:C226($_at_SetGroupContext; SM_at_SetGroupContexts)
									COPY ARRAY:C226($_al_SetGroupContextID; SM_al_SetGroupContextsIDs)
									COPY ARRAY:C226($_at_SetGroupitemNames; SM_at_SetGroupItemNames)
									COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
									COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
									COPY ARRAY:C226($_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
									COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
									COPY ARRAY:C226($_at_SetGroupitemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
									COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
									
								Else 
									SM_UpdateArrays("PER"; $1; $2; $3; ""; 0; ""; 0; $4; $_t_SharesList; True:C214)
									SM_UPDATEDATA
									
								End if 
								
								
								
								
								
								//Take this out of the sets for that user.
							End if 
						End if 
					End for 
				End if 
			End if 
			If (Count parameters:C259>=6)
				If (Size of array:C274($6->)>0)
					For ($_l_index; 1; Size of array:C274($6->))
						$_l_PersonPosition:=Find in array:C230(WS_at_PersonellGroupCode; $6->{$_l_index})
						
						If ($_l_PersonPosition>0)
							If (WS_aI_SelectedSetGroups{$_l_PersonPosition}=0)
								//Take this out of the sets for that user.
								
								
								
								//``
								//Group
								ARRAY TEXT:C222($_at_SetGroupContext; 0)
								ARRAY LONGINT:C221($_al_SetGroupContextID; 0)
								ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
								ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
								ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
								ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
								ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
								ARRAY TEXT:C222($_at_SetGroupitemOwnerIDs; 0)
								ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
								
								
								//``
								//Group
								COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContext)
								COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextID)
								COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupitemNames)
								COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
								COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
								COPY ARRAY:C226(SM_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
								COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
								COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupitemOwnerIDs)
								COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
								While (Semaphore:C143("◊UpdateSets"))
									DelayTicks(2)
								End while 
								$_l_ItemID:=PREF_GetPreferenceID(WS_at_PersonellGroupCode{$_l_PersonPosition}+" Sets"; False:C215)
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
										$_l_GroupItemPosition:=Find in array:C230(SM_al_SetGroupItemIDs; $2)
										If ($_l_GroupItemPosition>0)
											DELETE FROM ARRAY:C228(SM_at_SetGroupItemNames; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_al_SetGroupItemContextIDs; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_al_SetGroupItemIDs; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_al_SetGroupItemClassIDs; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_at_SetGroupItemClassNames; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_at_SetGroupItemOwnerIDs; $_l_GroupItemPosition; 1)
											DELETE FROM ARRAY:C228(SM_at_SetGroupitemSharesList; $_l_GroupItemPosition; 1)
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
											$_l_UpdateSetsProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
										End if 
										
										
									End if 
									
									//DB_BuildSelectionsMenuitems (0;0;WS_at_DiaryOwnersPersonInitials{$ref};False)
									//That loads the sets for that user.
									//SM_UpdateArrays ("PER";$1;$2;$3;"";0;"";0;$4;$_t_SharesList;True)
									
									If (WS_at_PersonellGroupCode{$_l_PersonPosition}=<>PER_t_UserGroup)  //This person is in that group so update the data
										SM_UPDATEDATA
									Else 
										//Restore the local arrays
										If (Application type:C494=4D Remote mode:K5:5)
											$_l_UpdateSetsProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
										End if 
										//"now do we need to tell peoples sets to reload"
										//``
										//Group
										COPY ARRAY:C226($_at_SetGroupContext; SM_at_SetGroupContexts)
										COPY ARRAY:C226($_al_SetGroupContextID; SM_al_SetGroupContextsIDs)
										COPY ARRAY:C226($_at_SetGroupitemNames; SM_at_SetGroupItemNames)
										COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
										COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
										COPY ARRAY:C226($_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
										COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
										COPY ARRAY:C226($_at_SetGroupitemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
										COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
									End if 
									
								End if 
								CLEAR SEMAPHORE:C144("◊UpdateSets")
							End if 
						End if 
					End for 
				End if 
			End if 
			
			If ($_t_SharesList#"")
				//There are shares
				For ($_l_index; 1; Size of array:C274(SD3_al_SelectedDiaryOwners))
					If (SD3_al_SelectedDiaryOwners{$_l_index}=1)
						$_l_CurrentRow:=$_l_index
						
						
						If (WS_at_DiaryOwnersPersonInitials{$_l_CurrentRow}#<>PER_t_CurrentUserInitials)
							//First we have to preserve the setting currently loaded UNLESS they are the current user(the current user add  set to them selves
							
							ARRAY TEXT:C222($_at_SetContexts; 0)
							ARRAY LONGINT:C221($_al_SetContextIDs; 0)
							ARRAY TEXT:C222($_at_SetItemNames; 0)
							ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
							ARRAY LONGINT:C221($_al_SetitemsID; 0)
							ARRAY TEXT:C222($_at_SetitemsClassName; 0)
							ARRAY LONGINT:C221($_al_SetItemClassIDs; 0)
							ARRAY TEXT:C222($_at_SetContextItemOwnerIDs; 0)
							ARRAY TEXT:C222($_at_SetitemSharesList; 0)
							
							ARRAY TEXT:C222($_at_SetUNIContexts; 0)
							ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
							ARRAY TEXT:C222($_at_SetUNIItemsName; 0)
							ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
							ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
							ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
							ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
							ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
							ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
							
							//``
							//Group
							ARRAY TEXT:C222($_at_SetGroupContext; 0)
							ARRAY LONGINT:C221($_al_SetGroupContextID; 0)
							ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
							ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
							ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
							ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
							ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
							ARRAY TEXT:C222($_at_SetGroupitemOwnerIDs; 0)
							ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
							
							COPY ARRAY:C226(SM_at_SetContexts; $_at_SetContexts)
							COPY ARRAY:C226(SM_al_SetContextIDs; $_al_SetContextIDs)
							COPY ARRAY:C226(SM_at_SetItemsName; $_at_SetItemNames)
							COPY ARRAY:C226(SM_al_SetContextItemContextID; $_al_SetContextItemContextID)
							COPY ARRAY:C226(SM_al_SetitemsID; $_al_SetitemsID)
							COPY ARRAY:C226(SM_at_SetitemsClassName; $_at_SetitemsClassName)
							COPY ARRAY:C226(SM_al_SetitemsClassID; $_al_SetItemClassIDs)
							COPY ARRAY:C226(SM_at_SetContextitemOwnerIDs; $_at_SetContextItemOwnerIDs)
							COPY ARRAY:C226(SM_at_SetitemSharesList; $_at_SetitemSharesList)
							
							COPY ARRAY:C226(SM_at_SetUNIContexts; $_at_SetUNIContexts)
							COPY ARRAY:C226(SM_al_SetUNIContextIDs; $_al_SetUNIContextIDs)
							COPY ARRAY:C226(SM_at_SetUNIitemsName; $_at_SetUNIItemsName)
							COPY ARRAY:C226(SM_al_SetUNIitemcontextID; $_al_SetUNIitemcontextID)
							COPY ARRAY:C226(SM_al_SetUNIitemsID; $_al_SetUNIitemsID)
							COPY ARRAY:C226(SM_at_SetUNIitemClassName; $_at_SetUNIitemClassName)
							COPY ARRAY:C226(SM_al_SetUNIitemClassID; $_al_SetUNIitemClassID)
							COPY ARRAY:C226(SM_at_SetUNIitemOwnerID; $_at_SetUNIitemOwnerID)
							COPY ARRAY:C226(SM_at_SetUNIitemSharesList; $_at_SetUNIitemSharesList)
							
							//``
							//Group
							COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContext)
							COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextID)
							COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupitemNames)
							COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
							COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
							COPY ARRAY:C226(SM_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
							COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
							COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupitemOwnerIDs)
							COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
							While (Semaphore:C143("◊UpdateSets"))
								DelayTicks(2)
							End while 
							//ARRAY STRING(55;$_at_SetContexts;0)
							//ARRAY LONGINT($_al_SetContextIDs;0)
							//ARRAY STRING(55;$_at_SetItemNames;0)
							//ARRAY LONGINT($_al_SetContextItemContextID;0)
							//ARRAY LONGINT($_al_SetitemsID;0)
							//ARRAY STRING(55;$_at_SetitemsClassName;0)
							//ARRAY LONGINT($_al_SetItemClassIDs;0)
							//ARRAY STRING(55;$_at_SetContextItemOwnerIDs;0)
							//ARRAY TEXT($_at_SetitemSharesList;0)
							$_l_itemPosition:=Find in array:C230($_al_SetitemsID; $2)
							$_l_ItemClassID:=$_al_SetItemClassIDs{$_l_itemPosition}
							$_t_ItemClassName:=$_at_SetitemsClassName{$_l_itemPosition}
							$_l_ContextID:=$_al_SetContextItemContextID{$_l_itemPosition}
							$_l_ContextPosition:=Find in array:C230($_al_SetContextIDs; $_l_ContextID)
							If ($_l_ContextPosition>0)
								$_t_ContextName:=$_at_SetContexts{$_l_ContextPosition}
							Else 
								$_t_ContextName:=""
							End if 
							DB_BuildSelectionsMenuitems(""; 0; WS_at_DiaryOwnersPersonInitials{$_l_CurrentRow}; False:C215)
							//That loads the sets for that user.
							SM_UpdateArrays("PER"; $1; $2; $3; $_t_ContextName; $_l_ContextID; $_t_ItemClassName; $_l_ItemClassID; $4; $_t_SharesList)
							SM_UPDATEDATA
							//Restore the local arrays
							CLEAR SEMAPHORE:C144("◊UpdateSets")
							COPY ARRAY:C226($_at_SetContexts; SM_at_SetContexts)
							COPY ARRAY:C226($_al_SetContextIDs; SM_al_SetContextIDs)
							COPY ARRAY:C226($_at_SetItemNames; SM_at_SetItemsName)
							COPY ARRAY:C226($_al_SetContextItemContextID; SM_al_SetContextItemContextID)
							COPY ARRAY:C226($_al_SetitemsID; SM_al_SetitemsID)
							COPY ARRAY:C226($_at_SetitemsClassName; SM_at_SetitemsClassName)
							COPY ARRAY:C226($_al_SetItemClassIDs; SM_al_SetitemsClassID)
							COPY ARRAY:C226($_at_SetContextItemOwnerIDs; SM_at_SetContextitemOwnerIDs)
							COPY ARRAY:C226($_at_SetitemSharesList; SM_at_SetitemSharesList)
							
							COPY ARRAY:C226($_at_SetUNIContexts; SM_at_SetUNIContexts)
							COPY ARRAY:C226($_al_SetUNIContextIDs; SM_al_SetUNIContextIDs)
							COPY ARRAY:C226($_at_SetUNIItemsName; SM_at_SetUNIitemsName)
							COPY ARRAY:C226($_al_SetUNIitemcontextID; SM_al_SetUNIitemcontextID)
							COPY ARRAY:C226($_al_SetUNIitemsID; SM_al_SetUNIitemsID)
							COPY ARRAY:C226($_at_SetUNIitemClassName; SM_at_SetUNIitemClassName)
							COPY ARRAY:C226($_al_SetUNIitemClassID; SM_al_SetUNIitemClassID)
							COPY ARRAY:C226($_at_SetUNIitemOwnerID; SM_at_SetUNIitemOwnerID)
							COPY ARRAY:C226($_at_SetUNIitemSharesList; SM_at_SetUNIitemSharesList)
							
							//``
							//Group
							COPY ARRAY:C226($_at_SetGroupContext; SM_at_SetGroupContexts)
							COPY ARRAY:C226($_al_SetGroupContextID; SM_al_SetGroupContextsIDs)
							COPY ARRAY:C226($_at_SetGroupitemNames; SM_at_SetGroupItemNames)
							COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
							COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
							COPY ARRAY:C226($_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
							COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
							COPY ARRAY:C226($_at_SetGroupitemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
							COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
							
						Else 
							SM_UpdateArrays("PER"; $1; $2; $3; ""; 0; ""; 0; $4; $_t_SharesList)
							SM_UPDATEDATA
							
						End if 
						
						
						
						
						
						
					End if 
					
					
				End for 
				
				
				
				
				
				For ($_l_index; 1; Size of array:C274(WS_aI_SelectedSetGroups))
					If (WS_aI_SelectedSetGroups{$_l_index}=1)
						$_l_CurrentRow:=$_l_index
						
						
						
						//Take this out of the sets for that user.
						
						
						
						//``
						//Group
						ARRAY TEXT:C222($_at_SetGroupContext; 0)
						ARRAY LONGINT:C221($_al_SetGroupContextID; 0)
						ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
						ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
						ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
						ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
						ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
						ARRAY TEXT:C222($_at_SetGroupitemOwnerIDs; 0)
						ARRAY TEXT:C222($_at_SetGroupitemSharesList; 0)
						
						
						//``
						//Group
						COPY ARRAY:C226(SM_at_SetGroupContexts; $_at_SetGroupContext)
						COPY ARRAY:C226(SM_al_SetGroupContextsIDs; $_al_SetGroupContextID)
						COPY ARRAY:C226(SM_at_SetGroupItemNames; $_at_SetGroupitemNames)
						COPY ARRAY:C226(SM_al_SetGroupItemContextIDs; $_al_SetGroupItemContextIDs)
						COPY ARRAY:C226(SM_al_SetGroupItemIDs; $_al_SetGroupItemIDs)
						COPY ARRAY:C226(SM_at_SetGroupItemClassNames; $_at_SetGroupItemClassNames)
						COPY ARRAY:C226(SM_al_SetGroupItemClassIDs; $_al_SetGroupItemClassIDs)
						COPY ARRAY:C226(SM_at_SetGroupItemOwnerIDs; $_at_SetGroupitemOwnerIDs)
						COPY ARRAY:C226(SM_at_SetGroupitemSharesList; $_at_SetGroupitemSharesList)
						While (Semaphore:C143("◊UpdateSets"))
							DelayTicks(2)
						End while 
						$_l_ItemID:=PREF_GetPreferenceID(WS_at_PersonellGroupCode{$_l_CurrentRow}+" Sets"; False:C215)
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
								
								$_l_ItemPosition:=Find in array:C230(SM_al_SetGroupItemIDs; $2)
								If ($_l_ItemPosition<0)
									//$_at_SetItemNames:=$1  `Name
									$_al_SetitemsID:=$2  //Aset id
									$_al_SetContextItemContextID:=$3
									$_l_GroupContextPosition:=Find in array:C230(SM_al_SetGroupContextsIDs; $_al_SetContextItemContextID)
									
									$_l_ItemPosition2:=Find in array:C230(SM_al_SetitemsID; $2)
									If ($_l_ItemPosition2>0)
										$_t_ContextName:=""
										//$_t_ContextName:=SM_al_SetContextItemContextID{$_l_ItemPosition2}
										$_t_ItemClassName:=SM_at_SetitemsClassName{$_l_ItemPosition2}
										$_l_ItemClassID:=SM_al_SetitemsClassID{$_l_ItemPosition2}
										
										APPEND TO ARRAY:C911(SM_at_SetGroupItemNames; $1)
										APPEND TO ARRAY:C911(SM_al_SetGroupItemContextIDs; $3)
										APPEND TO ARRAY:C911(SM_al_SetGroupItemIDs; $2)
										APPEND TO ARRAY:C911(SM_al_SetGroupItemClassIDs; $_l_ItemClassID)
										APPEND TO ARRAY:C911(SM_at_SetGroupItemClassNames; $_t_ItemClassName)
										APPEND TO ARRAY:C911(SM_at_SetGroupItemOwnerIDs; $4)
										APPEND TO ARRAY:C911(SM_at_SetGroupitemSharesList; $_t_SharesList)
										$_l_GroupContextPosition:=Find in array:C230(SM_al_SetGroupContextsIDs; $_al_SetContextItemContextID)
										If ($_l_GroupContextPosition<0)
											APPEND TO ARRAY:C911(SM_at_SetGroupContexts; $_t_ContextName)
											APPEND TO ARRAY:C911(SM_al_SetGroupContextsIDs; $_al_SetContextItemContextID)
										End if 
										
									End if 
									
								End if 
							End if 
							SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
							$_l_BlobOffset:=0
							
							VARIABLE TO BLOB:C532(SM_at_SetGroupContexts; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_al_SetGroupContextsIDs; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_at_SetGroupItemNames; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_al_SetGroupItemContextIDs; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_al_SetGroupItemIDs; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_at_SetGroupItemClassNames; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_al_SetGroupItemClassIDs; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_at_SetGroupItemOwnerIDs; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(SM_at_SetGroupitemSharesList; [PREFERENCES:116]DataBlob:2; *)
							DB_SaveRecord(->[PREFERENCES:116])
							UNLOAD RECORD:C212([PREFERENCES:116])
							READ ONLY:C145([PREFERENCES:116])
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_UpdateSetsProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
							End if 
							
							
						End if 
						
						//DB_BuildSelectionsMenuitems (0;0;WS_at_DiaryOwnersPersonInitials{$ref};False)
						//That loads the sets for that user.
						//SM_UpdateArrays ("PER";$1;$2;$3;"";0;"";0;$4;$_t_SharesList;True)
						
						If (WS_at_PersonellGroupCode{$_l_PersonPosition}=<>PER_t_UserGroup)  //This person is in that group so update the data
							SM_UPDATEDATA
						Else 
							//Restore the local arrays
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_UpdateSetsProcess:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
							End if 
							//"now do we need to tell peoples sets to reload"
							//``
							//Group
							COPY ARRAY:C226($_at_SetGroupContext; SM_at_SetGroupContexts)
							COPY ARRAY:C226($_al_SetGroupContextID; SM_al_SetGroupContextsIDs)
							COPY ARRAY:C226($_at_SetGroupitemNames; SM_at_SetGroupItemNames)
							COPY ARRAY:C226($_al_SetGroupItemContextIDs; SM_al_SetGroupItemContextIDs)
							COPY ARRAY:C226($_al_SetGroupItemIDs; SM_al_SetGroupItemIDs)
							COPY ARRAY:C226($_at_SetGroupItemClassNames; SM_at_SetGroupItemClassNames)
							COPY ARRAY:C226($_al_SetGroupItemClassIDs; SM_al_SetGroupItemClassIDs)
							COPY ARRAY:C226($_at_SetGroupitemOwnerIDs; SM_at_SetGroupItemOwnerIDs)
							COPY ARRAY:C226($_at_SetGroupitemSharesList; SM_at_SetGroupitemSharesList)
							
						End if 
						
					End if 
					CLEAR SEMAPHORE:C144("◊UpdateSets")
					
					
				End for 
				
				If (SM_CB_l_RetainList=1)
					SM_UpdateArrays("PER"; $1; $2; $3; ""; 0; ""; 0; $4; $_t_SharesList)
					SM_UPDATEDATA
				Else 
					SM_UpdateArrays("PER"; $1; $2; $3; ""; 0; ""; 0; $4; $_t_SharesList; True:C214)
					SM_UPDATEDATA
					
				End if 
			End if 
			
			
			
		Else 
			$0:=False:C215
		End if 
		
		
		////////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
	Else 
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("SM_SendSetSelection"; $_t_oldMethodName)
