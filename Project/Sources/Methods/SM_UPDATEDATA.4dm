//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_UPDATEDATA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/01/2011 17:14 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SetContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetContextIDs2; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID2; 0)
	ARRAY LONGINT:C221($_al_SetGroupContextsIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
	ARRAY LONGINT:C221($_al_SetitemsClassID; 0)
	ARRAY LONGINT:C221($_al_SetItemsClassID2; 0)
	ARRAY LONGINT:C221($_al_SetitemsID; 0)
	ARRAY LONGINT:C221($_al_SetitemsID2; 0)
	ARRAY LONGINT:C221($_al_SetUNIContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemClassID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemcontextID; 0)
	ARRAY LONGINT:C221($_al_SetUNIitemsID; 0)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetGroupItemIDs;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY LONGINT(SM_al_SetUNIitemClassID;0)
	ARRAY TEXT:C222($_at_OwnerIDstoUpdate; 0)
	ARRAY TEXT:C222($_at_SetContextitemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetContextitemOwnerIDs2; 0)
	ARRAY TEXT:C222($_at_SetContextItems2; 0)
	ARRAY TEXT:C222($_at_SetContextitemSharesGRPID; 0)
	ARRAY TEXT:C222($_at_SetContexts; 0)
	ARRAY TEXT:C222($_at_SetContexts2; 0)
	ARRAY TEXT:C222($_at_SetGroupContexts; 0)
	ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
	ARRAY TEXT:C222($_at_SetGroupItemNames; 0)
	ARRAY TEXT:C222($_at_SetGroupItemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetitemsClassName; 0)
	ARRAY TEXT:C222($_at_SetitemsClassName2; 0)
	ARRAY TEXT:C222($_at_SetitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetitemSharesList2; 0)
	ARRAY TEXT:C222($_at_SetItemsName; 0)
	ARRAY TEXT:C222($_at_SetUNIContexts; 0)
	ARRAY TEXT:C222($_at_SetUNIitemClassName; 0)
	ARRAY TEXT:C222($_at_SetUNIitemOwnerID; 0)
	ARRAY TEXT:C222($_at_SetUNIitemSharesList; 0)
	ARRAY TEXT:C222($_at_SetUNIitemsName; 0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetContexts;0)
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	//ARRAY TEXT(SM_at_SetitemSharesList;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	//ARRAY TEXT(SM_at_SetUNIitemSharesList;0)
	C_BOOLEAN:C305($_bo_CallReload; $_bo_Delete; $_bo_Modified; $_bo_OK; $1; $2; SM_bo_AdminOverRide)
	C_LONGINT:C283($_l_BLOBOffset; $_l_BlobSize; $_l_BLOBVarOffset; $_l_CurrentRow; $_l_Delay; $_l_GroupPosition; $_l_Index; $_l_ItemID; $_l_ItemPosition; $_l_OwnerIndex; $_l_OwnerLength)
	C_LONGINT:C283($_l_OwnertPosition; $_l_Repeats; $_l_SetManagerReload)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Group; $_t_oldMethodName; $_t_Owner)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_UPDATEDATA")

//this method is called when the set manager is closed
//usually when we quit the database
//here we write back to the blobs the data in the arrays
//sets are already saved
//TRACE
If (Count parameters:C259=2)
	$_bo_CallReload:=$2
Else 
	$_bo_CallReload:=True:C214
End if 

While (Semaphore:C143("LoadingPrefsSM"))
	DelayTicks(2)
End while 


CLEAR SEMAPHORE:C144("LoadingPrefsSM")
If (True:C214)
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
	//because I have now made changes to this so we can 'send' a set to other users
	//this needs to update the correct [personnel] or [group]
	ARRAY TEXT:C222($_at_OwnerIDstoUpdate; Size of array:C274(SM_at_SetContextitemOwnerIDs))
	$_l_CurrentRow:=0
	For ($_l_Index; 1; Size of array:C274(SM_at_SetContextitemOwnerIDs))
		$_l_OwnertPosition:=Find in array:C230($_at_OwnerIDstoUpdate; SM_at_SetContextitemOwnerIDs{$_l_Index})
		If ($_l_OwnertPosition<0)
			$_l_CurrentRow:=$_l_CurrentRow+1
			$_at_OwnerIDstoUpdate{$_l_CurrentRow}:=SM_at_SetContextitemOwnerIDs{$_l_Index}
		End if 
	End for 
	ARRAY TEXT:C222($_at_OwnerIDstoUpdate; $_l_CurrentRow)
	
	
	//Group
	ARRAY TEXT:C222($_at_SetGroupContexts; 0)
	ARRAY LONGINT:C221($_al_SetGroupContextsIDs; 0)
	ARRAY TEXT:C222($_at_SetGroupItemNames; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemIDs; 0)
	ARRAY TEXT:C222($_at_SetGroupItemClassNames; 0)
	ARRAY LONGINT:C221($_al_SetGroupItemClassIDs; 0)
	ARRAY TEXT:C222($_at_SetGroupItemOwnerIDs; 0)
	ARRAY TEXT:C222($_at_SetContextitemSharesGRPID; 0)
	//``
	ARRAY TEXT:C222($_at_SetContexts2; 0)
	ARRAY LONGINT:C221($_al_SetContextIDs2; 0)
	ARRAY TEXT:C222($_at_SetContextItems2; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID2; 0)
	ARRAY LONGINT:C221($_al_SetitemsID2; 0)
	ARRAY TEXT:C222($_at_SetitemsClassName2; 0)
	ARRAY LONGINT:C221($_al_SetItemsClassID2; 0)
	ARRAY TEXT:C222($_at_SetContextitemOwnerIDs2; 0)
	ARRAY TEXT:C222($_at_SetitemSharesList2; 0)
	COPY ARRAY:C226(SM_at_SetContexts; $_at_SetContexts2)
	COPY ARRAY:C226(SM_al_SetContextIDs; $_al_SetContextIDs2)
	COPY ARRAY:C226(SM_at_SetItemsName; $_at_SetContextItems2)
	COPY ARRAY:C226(SM_al_SetContextItemContextID; $_al_SetContextItemContextID2)
	COPY ARRAY:C226(SM_al_SetitemsID; $_al_SetitemsID2)
	COPY ARRAY:C226(SM_at_SetitemsClassName; $_at_SetitemsClassName2)
	COPY ARRAY:C226(SM_al_SetitemsClassID; $_al_SetItemsClassID2)
	COPY ARRAY:C226(SM_at_SetContextitemOwnerIDs; $_at_SetContextitemOwnerIDs2)
	COPY ARRAY:C226(SM_at_SetitemSharesList; $_at_SetitemSharesList)
	For ($_l_OwnerIndex; 1; Size of array:C274($_at_OwnerIDstoUpdate))
		//who is this owner
		$_t_Owner:=$_at_OwnerIDstoUpdate{$_l_OwnerIndex}
		Case of 
			: (Position:C15("GRP_"; $_t_Owner)>0)
				READ ONLY:C145([PERSONNEL_GROUPS:92])
				$_l_GroupPosition:=Position:C15("GRP_"; $_t_Owner)
				If ($_l_GroupPosition>0)
					//it is a Group-so get the group
					$_l_GroupPosition:=Position:C15(":"; $_t_Owner)
					If ($_l_GroupPosition>0)
						$_t_Group:=Substring:C12($_t_Owner; $_l_GroupPosition+1; Length:C16($_t_Owner))
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=$_t_Group)
					Else 
						//we were not putting a delimeter in till now
						
						$_l_OwnerLength:=Length:C16($_t_Owner)
						$_t_Group:=""
						Repeat 
							$_t_Group:=$_t_Owner[[$_l_OwnerLength]]+$_t_Group
							$_l_OwnerLength:=$_l_OwnerLength-1
							QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=$_t_Group)
						Until (Records in selection:C76([PERSONNEL_GROUPS:92])=1) | ($_l_OwnerLength=0)
						$_t_Group:=[PERSONNEL_GROUPS:92]Group_Code:1
					End if 
					$_l_ItemID:=PREF_GetPreferenceID($_t_Group+" Sets")
					
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						READ WRITE:C146([PREFERENCES:116])
						$_l_BLOBVarOffset:=0
						CREATE RECORD:C68([PREFERENCES:116])
						$_l_BlobSize:=BLOB size:C605([PERSONNEL_GROUPS:92]SM_Contexts:11)
						COPY BLOB:C558([PERSONNEL_GROUPS:92]SM_Contexts:11; [PREFERENCES:116]DataBlob:2; $_l_BLOBVarOffset; $_l_BLOBVarOffset; $_l_BlobSize)
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
						DB_SaveRecord(->[PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					End if 
					
					
					$_l_BLOBVarOffset:=0
					//These arrays correspond to the GRP arrays
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetGroupContexts; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetGroupContextsIDs; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetGroupItemNames; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetGroupItemContextIDs; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetGroupItemIDs; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetGroupItemClassNames; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetGroupItemClassIDs; $_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetGroupItemOwnerIDs; $_l_BLOBVarOffset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BLOBVarOffset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetContextitemSharesGRPID; $_l_BLOBVarOffset)
					Else 
						ARRAY TEXT:C222($_at_SetContextitemSharesGRPID; Size of array:C274($_at_SetGroupItemOwnerIDs))
					End if 
					$_bo_Modified:=False:C215
					For ($_l_Index; 1; Size of array:C274(SM_at_SetContextitemOwnerIDs))
						If ($_at_OwnerIDstoUpdate{$_l_OwnerIndex}=SM_at_SetContextitemOwnerIDs{$_l_Index})
							If (Position:C15("GRP"; SM_at_SetContextitemOwnerIDs{$_l_Index})>0)
								$_l_ItemPosition:=Find in array:C230($_al_SetGroupItemIDs; SM_al_SetitemsID{$_l_Index})
								If ($_l_ItemPosition<0)  //this does not already exist
									
									$_bo_Modified:=True:C214
									INSERT IN ARRAY:C227($_at_SetGroupItemNames; 99999; 1)
									INSERT IN ARRAY:C227($_al_SetGroupItemContextIDs; 99999; 1)
									INSERT IN ARRAY:C227($_al_SetGroupItemIDs; 99999; 1)
									INSERT IN ARRAY:C227($_at_SetGroupItemClassNames; 99999; 1)
									INSERT IN ARRAY:C227($_al_SetGroupItemClassIDs; 99999; 1)
									INSERT IN ARRAY:C227($_at_SetGroupItemOwnerIDs; 99999; 1)
									INSERT IN ARRAY:C227($_at_SetContextitemSharesGRPID; 99999; 1)
									$_l_ItemPosition:=Size of array:C274($_at_SetGroupItemOwnerIDs)
									$_at_SetGroupItemNames{$_l_ItemPosition}:=SM_at_SetItemsName{$_l_Index}
									$_al_SetGroupItemContextIDs{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
									$_al_SetGroupItemIDs{$_l_ItemPosition}:=SM_al_SetitemsID{$_l_Index}
									$_at_SetGroupItemClassNames{$_l_ItemPosition}:=SM_at_SetitemsClassName{$_l_Index}
									$_al_SetGroupItemClassIDs{$_l_ItemPosition}:=SM_al_SetitemsClassID{$_l_Index}
									$_at_SetGroupItemOwnerIDs{$_l_ItemPosition}:=SM_at_SetContextitemOwnerIDs{$_l_Index}
									$_at_SetContextitemSharesGRPID{$_l_ItemPosition}:=SM_at_SetitemSharesList{$_l_Index}
								Else 
									If ($_al_SetGroupItemContextIDs{$_l_ItemPosition}#SM_al_SetContextItemContextID{$_l_Index})
										$_bo_Modified:=True:C214
										$_al_SetGroupItemContextIDs{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
									End if 
									
								End if 
							End if 
						End if 
						
					End for 
					//now write that to the group if modified
					If (Count parameters:C259>=1)
						$_bo_Delete:=$1
					Else 
						$_bo_Delete:=True:C214
					End if 
					//TRACE
					If ($_bo_Delete)
						For ($_l_Index; Size of array:C274($_at_SetGroupItemNames); 1; -1)
							If (Size of array:C274($_at_SetGroupItemOwnerIDs)>=$_l_Index)
								
								If ($_at_SetGroupItemOwnerIDs{$_l_Index}=<>PER_t_CurrentUserInitials) | ($_at_SetGroupItemOwnerIDs{$_l_Index}=("GRP_"+<>PER_t_CurrentUserInitials+"@")) | (SM_bo_AdminOverRide)
									If ($_l_Index<=Size of array:C274($_at_SetGroupItemOwnerIDs))
										If ($_at_SetGroupItemOwnerIDs{$_l_Index}=$_at_OwnerIDstoUpdate{$_l_OwnerIndex})
											$_l_ItemPosition:=Find in array:C230(SM_al_SetGroupItemIDs; $_al_SetitemsID{$_l_Index})
											If ($_l_ItemPosition<0)  //this no longer exist
												
												$_bo_Modified:=True:C214
												
												DELETE FROM ARRAY:C228($_at_SetGroupItemNames; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_al_SetGroupItemContextIDs; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_al_SetGroupItemIDs; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_at_SetGroupItemClassNames; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_al_SetGroupItemClassIDs; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_at_SetGroupItemOwnerIDs; $_l_Index; 1)
												DELETE FROM ARRAY:C228($_at_SetContextitemSharesGRPID; $_l_Index; 1)
												
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End for 
					End if 
					
					
					If ($_bo_Modified)
						$_l_BLOBVarOffset:=0
						//  READ WRITE([PERSON GROUPS])
						$_l_ItemID:=PREF_GetPreferenceID($_t_Group+" Sets")
						READ WRITE:C146([PREFERENCES:116])
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
						If (Records in selection:C76([PREFERENCES:116])=0)
							CREATE RECORD:C68([PREFERENCES:116])
							[PREFERENCES:116]IDNumber:1:=$_l_ItemID
						Else 
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214)
							
						End if 
						
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						VARIABLE TO BLOB:C532($_at_SetGroupContexts; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_al_SetGroupContextsIDs; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_at_SetGroupItemNames; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_al_SetGroupItemContextIDs; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_al_SetGroupItemIDs; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_at_SetGroupItemClassNames; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_al_SetGroupItemClassIDs; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_at_SetGroupItemOwnerIDs; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532($_at_SetContextitemSharesGRPID; [PREFERENCES:116]DataBlob:2; *)
						DB_SaveRecord(->[PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
					End if 
				End if 
				If ($_bo_CallReload)
					If (Application type:C494=4D Remote mode:K5:5)
						
						$_l_SetManagerReload:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
					Else 
						
						
					End if 
					
				End if 
			: ($_t_Owner="UNI")
				
				While (Semaphore:C143("LoadingPrefsSM"))
					DelayTicks(2)
				End while 
				
				$_l_BLOBVarOffset:=0
				$_l_ItemID:=PREF_GetPreferenceID("Universal Sets")
				CLEAR SEMAPHORE:C144("LoadingPrefsSM")
				
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				If (Records in selection:C76([PREFERENCES:116])=0)
					READ WRITE:C146([PREFERENCES:116])
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				End if 
				
				//These arrays correspond to the UNI arrays
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetUNIContexts; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetUNIContextIDs; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetUNIitemsName; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetUNIitemcontextID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetUNIitemsID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetUNIitemClassName; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetUNIitemClassID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetUNIitemOwnerID; $_l_BLOBVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetUNIitemSharesList; $_l_BLOBVarOffset)
				Else 
					ARRAY TEXT:C222($_at_SetUNIitemSharesList; Size of array:C274(SM_al_SetUNIitemClassID))
				End if 
				$_bo_Modified:=False:C215
				For ($_l_Index; 1; Size of array:C274(SM_at_SetContextitemOwnerIDs))
					If (SM_at_SetContextitemOwnerIDs{$_l_Index}="UNI")
						$_l_ItemPosition:=Find in array:C230($_al_SetUNIitemsID; SM_al_SetitemsID{$_l_Index})
						If ($_l_ItemPosition<0)  //this does not already exist
							
							$_bo_Modified:=True:C214
							INSERT IN ARRAY:C227($_at_SetUNIitemsName; 99999; 1)
							INSERT IN ARRAY:C227($_al_SetUNIitemcontextID; 99999; 1)
							INSERT IN ARRAY:C227($_al_SetUNIitemsID; 99999; 1)
							INSERT IN ARRAY:C227($_at_SetUNIitemClassName; 99999; 1)
							INSERT IN ARRAY:C227($_al_SetUNIitemClassID; 99999; 1)
							INSERT IN ARRAY:C227($_at_SetUNIitemOwnerID; 99999; 1)
							INSERT IN ARRAY:C227($_at_SetUNIitemSharesList; 99999; 1)
							$_l_ItemPosition:=Size of array:C274($_at_SetUNIitemOwnerID)
							$_at_SetUNIitemsName{$_l_ItemPosition}:=SM_at_SetItemsName{$_l_Index}
							$_al_SetUNIitemcontextID{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
							$_al_SetUNIitemsID{$_l_ItemPosition}:=SM_al_SetitemsID{$_l_Index}
							$_at_SetUNIitemClassName{$_l_ItemPosition}:=SM_at_SetitemsClassName{$_l_Index}
							$_al_SetUNIitemClassID{$_l_ItemPosition}:=SM_al_SetitemsClassID{$_l_Index}
							$_at_SetUNIitemOwnerID{$_l_ItemPosition}:=SM_at_SetContextitemOwnerIDs{$_l_Index}
							$_at_SetUNIitemSharesList{$_l_ItemPosition}:=SM_at_SetUNIitemSharesList{$_l_Index}
						Else 
							If ($_al_SetUNIitemcontextID{$_l_ItemPosition}#SM_al_SetContextItemContextID{$_l_Index})
								$_bo_Modified:=True:C214
								$_al_SetUNIitemcontextID{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
							End if 
						End if 
					End if 
				End for 
				//now write that to the group if modified
				If ($_bo_Modified)
					
					While (Semaphore:C143("LoadingPrefsSM"))
						DelayTicks(2)
					End while 
					$_l_BLOBVarOffset:=0
					$_l_ItemID:=PREF_GetPreferenceID("Universal Sets")
					CLEAR SEMAPHORE:C144("LoadingPrefsSM")
					READ WRITE:C146([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						CREATE RECORD:C68([PREFERENCES:116])
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					Else 
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						
					End if 
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					VARIABLE TO BLOB:C532($_at_SetUNIContexts; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetUNIContextIDs; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetUNIitemsName; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetUNIitemcontextID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetUNIitemsID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetUNIitemClassName; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetUNIitemClassID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetUNIitemOwnerID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetUNIitemSharesList; [PREFERENCES:116]DataBlob:2; *)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					// If (False)
					If (Application type:C494=4D Remote mode:K5:5)
						
						If ($_bo_CallReload)
							$_l_SetManagerReload:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
						End if 
					End if 
				End if 
			Else 
				
				While (Semaphore:C143("LoadingPrefsSM"))
					DelayTicks(2)
				End while 
				$_l_BLOBVarOffset:=0
				$_l_ItemID:=PREF_GetPreferenceID($_t_Owner+" Sets")
				CLEAR SEMAPHORE:C144("LoadingPrefsSM")
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				If (Records in selection:C76([PREFERENCES:116])=0)
					READ WRITE:C146([PREFERENCES:116])
					//here need to check in the personnel record
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Owner)
					$_l_BLOBVarOffset:=0
					CREATE RECORD:C68([PREFERENCES:116])
					$_l_BlobSize:=BLOB size:C605([PERSONNEL:11]SM_SetNames:45)
					COPY BLOB:C558([PERSONNEL:11]SM_SetNames:45; [PREFERENCES:116]DataBlob:2; $_l_BLOBVarOffset; $_l_BLOBVarOffset; $_l_BlobSize)
					
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				End if 
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetContexts; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetContextIDs; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetItemsName; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetContextItemContextID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetitemsID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetitemsClassName; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SetitemsClassID; $_l_BLOBVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetContextitemOwnerIDs; $_l_BLOBVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BLOBVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_SetitemSharesList; $_l_BLOBVarOffset)
				Else 
					ARRAY TEXT:C222($_at_SetitemSharesList; Size of array:C274($_at_SetContextitemOwnerIDs))
				End if 
				$_bo_Modified:=False:C215
				For ($_l_Index; 1; Size of array:C274(SM_at_SetContexts))
					If (Find in array:C230($_al_SetContextIDs; SM_al_SetContextIDs{$_l_Index})<0)
						$_bo_Modified:=True:C214
						INSERT IN ARRAY:C227($_al_SetContextIDs; 9999; 1)
						INSERT IN ARRAY:C227($_at_SetContexts; 9999; 1)
						$_al_SetContextIDs{Size of array:C274($_al_SetContextIDs)}:=SM_al_SetContextIDs{$_l_Index}
						$_at_SetContexts{Size of array:C274($_at_SetContexts)}:=SM_at_SetContexts{$_l_Index}
					End if 
					
				End for 
				
				For ($_l_Index; 1; Size of array:C274(SM_at_SetContextitemOwnerIDs))
					//If (SM_at_SetContextitemOwnerIDs{$_l_Index}=$_at_OwnerIDstoUpdate{$_l_OwnerIndex})
					$_l_ItemPosition:=Find in array:C230($_al_SetitemsID; SM_al_SetitemsID{$_l_Index})
					If ($_l_ItemPosition<0)  //this does not already exist
						
						$_bo_Modified:=True:C214
						INSERT IN ARRAY:C227($_at_SetItemsName; 99999; 1)
						INSERT IN ARRAY:C227($_al_SetContextItemContextID; 99999; 1)
						INSERT IN ARRAY:C227($_al_SetitemsID; 99999; 1)
						INSERT IN ARRAY:C227($_at_SetitemsClassName; 99999; 1)
						INSERT IN ARRAY:C227($_al_SetitemsClassID; 99999; 1)
						INSERT IN ARRAY:C227($_at_SetContextitemOwnerIDs; 99999; 1)
						INSERT IN ARRAY:C227($_at_SetitemSharesList; 99999; 1)
						$_l_ItemPosition:=Size of array:C274($_at_SetContextitemOwnerIDs)
						$_at_SetItemsName{$_l_ItemPosition}:=SM_at_SetItemsName{$_l_Index}
						$_al_SetContextItemContextID{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
						$_al_SetitemsID{$_l_ItemPosition}:=SM_al_SetitemsID{$_l_Index}
						$_at_SetitemsClassName{$_l_ItemPosition}:=SM_at_SetitemsClassName{$_l_Index}
						$_al_SetitemsClassID{$_l_ItemPosition}:=SM_al_SetitemsClassID{$_l_Index}
						$_at_SetContextitemOwnerIDs{$_l_ItemPosition}:=SM_at_SetContextitemOwnerIDs{$_l_Index}
						$_at_SetitemSharesList{$_l_ItemPosition}:=SM_at_SetitemSharesList{$_l_Index}
					Else 
						
						If ($_al_SetContextItemContextID{$_l_ItemPosition}#SM_al_SetContextItemContextID{$_l_Index})
							$_bo_Modified:=True:C214
							$_al_SetContextItemContextID{$_l_ItemPosition}:=SM_al_SetContextItemContextID{$_l_Index}
						End if 
					End if 
					//End if
				End for 
				//this is so
				//another computer can update my SAVED lists(send me a list)
				//and then tell my comp to refresh-we need to save my local lists but not
				//delete the ones they sent me
				
				If (Count parameters:C259>=1)
					$_bo_Delete:=$1
				Else 
					$_bo_Delete:=True:C214
				End if 
				
				
				If ($_bo_Delete)
					For ($_l_Index; Size of array:C274($_at_SetItemsName); 1; -1)
						If (Size of array:C274($_at_SetContextitemOwnerIDs)>=$_l_Index)
							If (Position:C15("GRP"; $_at_SetContextitemOwnerIDs{$_l_Index})>0)
								//TRACE
							End if 
							If ($_at_SetContextitemOwnerIDs{$_l_Index}=<>PER_t_CurrentUserInitials) | ($_at_SetContextitemOwnerIDs{$_l_Index}=("GRP_"+<>PER_t_CurrentUserInitials+"@")) | (SM_bo_AdminOverRide)
								
								If ($_l_Index<=Size of array:C274($_at_SetContextitemOwnerIDs))
									If ($_at_SetContextitemOwnerIDs{$_l_Index}=$_at_OwnerIDstoUpdate{$_l_OwnerIndex}) | ($_at_SetContextitemOwnerIDs{$_l_Index}=("GRP_"+$_at_OwnerIDstoUpdate{$_l_OwnerIndex}+"@"))
										//TRACE
										$_l_ItemPosition:=Find in array:C230(SM_al_SetitemsID; $_al_SetitemsID{$_l_Index})
										If ($_l_ItemPosition<0)  //this no longer exist
											
											$_bo_Modified:=True:C214
											DELETE FROM ARRAY:C228($_at_SetItemsName; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_al_SetContextItemContextID; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_al_SetitemsID; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_at_SetitemsClassName; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_al_SetitemsClassID; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_at_SetContextitemOwnerIDs; $_l_Index; 1)
											DELETE FROM ARRAY:C228($_at_SetitemSharesList; $_l_Index; 1)
										End if 
									End if 
								End if 
							End if 
						End if 
					End for 
				End if 
				
				
				
				If ($_bo_Modified)
					
					While (Semaphore:C143("LoadingPrefsSM"))
						DelayTicks(2)
					End while 
					$_l_ItemID:=PREF_GetPreferenceID($_t_Owner+" Sets")
					CLEAR SEMAPHORE:C144("LoadingPrefsSM")
					READ WRITE:C146([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Owner)
						$_l_BLOBVarOffset:=0
						CREATE RECORD:C68([PREFERENCES:116])
						$_l_BlobSize:=BLOB size:C605([PERSONNEL:11]SM_SetNames:45)
						COPY BLOB:C558([PERSONNEL:11]SM_SetNames:45; [PREFERENCES:116]DataBlob:2; $_l_BLOBVarOffset; $_l_BLOBVarOffset; $_l_BlobSize)
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					Else 
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
					End if 
					
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					$_l_BLOBOffset:=0
					
					VARIABLE TO BLOB:C532($_at_SetContexts; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetContextIDs; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetItemsName; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetContextItemContextID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetitemsID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetitemsClassName; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_al_SetitemsClassID; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetContextitemOwnerIDs; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_at_SetitemSharesList; [PREFERENCES:116]DataBlob:2; *)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					If ($_bo_CallReload)
						If (Application type:C494=4D Remote mode:K5:5)
							
							$_l_SetManagerReload:=Execute on server:C373("SM_CallReload"; DB_ProcessMemoryinit(1); "Set manager reload")
						End if 
					End if 
					
				End if 
				
				
		End case 
	End for 
End if 
SM_bo_AdminOverRide:=False:C215  //ALWAYS reset this to false
ERR_MethodTrackerReturn("SM_UPDATEDATA"; $_t_oldMethodName)
