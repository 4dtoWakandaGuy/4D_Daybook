//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BuildSelectionsMenuitems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2012 23:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY LONGINT(SM_al_SetClassID;0)
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
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SelectionsSubMenus;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(SM_at_SetClass;0)
	//ARRAY TEXT(SM_at_SetClassChar;0)
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
	C_BOOLEAN:C305($_bo_ArrayNUL; $_bo_BreakInserted; $_bo_ContextsNul; $_bo_LoadMenu; $_bo_Modified; $_bo_OK; $4; DB_bo_SelectionsSubMenusInited)
	C_LONGINT:C283($_l_BlobVarOffset; $_l_ContextRow; $_l_Delay; $_l_Icon; $_l_Index; $_l_Index2; $_l_ItemID; $_l_ItemRow; $_l_ItemsAdded; $_l_Repeats; $_l_SetIDRow)
	C_LONGINT:C283($_l_SetItemsCount; $_l_SetTableNumber; $_l_SubContext; $_l_SubItemsCount; $_l_SubMenuCount; $_l_TableNumber)
	C_PICTURE:C286($_Pic_Icon; $NUL; DB_pic_BuiltSet; DB_pic_GroupedSetList; DB_pic_SelectedPlusSet; DB_pic_SelectedSet)
	C_REAL:C285($2)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_MenuReference; $_t_oldMethodName; $_t_SubMenuReference; $_t_UserID; $1; $3; SM_PersonGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BuildSelectionsMenuitems")
COPY NAMED SELECTION:C331([PERSONNEL:11]; "$CurPersons")
COPY NAMED SELECTION:C331([PERSONNEL_GROUPS:92]; "$CurGroups")

ARRAY TEXT:C222(SM_at_SetUNIContexts; 0)
ARRAY LONGINT:C221(SM_al_SetUNIContextIDs; 0)
ARRAY TEXT:C222(SM_at_SetUNIitemsName; 0)
ARRAY LONGINT:C221(SM_al_SetUNIitemcontextID; 0)
ARRAY LONGINT:C221(SM_al_SetUNIitemsID; 0)
ARRAY TEXT:C222(SM_at_SetUNIitemClassName; 0)
ARRAY LONGINT:C221(SM_al_SetUNIitemClassID; 0)
ARRAY TEXT:C222(SM_at_SetUNIitemOwnerID; 0)
ARRAY TEXT:C222(SM_at_SetUNIitemSharesList; 0)

//``
//Group
ARRAY TEXT:C222(SM_at_SetGroupContexts; 0)
ARRAY LONGINT:C221(SM_al_SetGroupContextsIDs; 0)

ARRAY TEXT:C222(SM_at_SetGroupItemNames; 0)
ARRAY LONGINT:C221(SM_al_SetGroupItemContextIDs; 0)
ARRAY LONGINT:C221(SM_al_SetGroupItemIDs; 0)
ARRAY TEXT:C222(SM_at_SetGroupItemClassNames; 0)
ARRAY LONGINT:C221(SM_al_SetGroupItemClassIDs; 0)
ARRAY TEXT:C222(SM_at_SetGroupItemOwnerIDs; 0)
ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; 0)
//personal)
ARRAY TEXT:C222(SM_at_SetContexts; 0)
ARRAY LONGINT:C221(SM_al_SetContextIDs; 0)
ARRAY TEXT:C222(SM_at_SetItemsName; 0)
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; 0)
ARRAY LONGINT:C221(SM_al_SetitemsID; 0)
ARRAY TEXT:C222(SM_at_SetitemsClassName; 0)
ARRAY LONGINT:C221(SM_al_SetitemsClassID; 0)
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; 0)
ARRAY TEXT:C222(SM_at_SetitemSharesList; 0)

ARRAY TEXT:C222(SM_at_SetClass; 4)
ARRAY TEXT:C222(SM_at_SetClassChar; 4)
ARRAY LONGINT:C221(SM_al_SetClassID; 4)
SM_at_SetClass{1}:="Fixed List"
//SM_at_SetClassChar{1}
SM_at_SetClass{2}:="Dynamic List"
SM_at_SetClass{3}:="Fixed List with Dynamic Query"
SM_at_SetClass{4}:="Group"
SM_al_SetClassID{1}:=853
SM_al_SetClassID{2}:=854
SM_al_SetClassID{3}:=852
SM_al_SetClassID{4}:=855
//the class IDs here correspond with pics in the
//picture library that will be used for ICONS
READ ONLY:C145([USER:15])
FIRST RECORD:C50([USER:15])
If (Count parameters:C259>=3)
	$_t_UserID:=$3
Else 
	$_t_UserID:=<>PER_t_CurrentUserInitials
End if 
If (Count parameters:C259>=4)
	$_bo_LoadMenu:=$4
	
Else 
	$_bo_LoadMenu:=True:C214
	
End if 
$_t_MenuReference:=$1
$_l_TableNumber:=$2

While (Semaphore:C143("LoadingPrefsUS"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("Universal Sets"; False:C215)

If ($_l_ItemID>0)
	$_bo_ArrayNUL:=True:C214
	$_bo_ContextsNul:=True:C214
	//the universal sets have been updated load from there
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	$_l_BlobVarOffset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIContexts; $_l_BlobVarOffset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIContextIDs; $_l_BlobVarOffset)
		$_bo_ContextsNul:=False:C215
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemsName; $_l_BlobVarOffset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemcontextID; $_l_BlobVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemsID; $_l_BlobVarOffset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemClassName; $_l_BlobVarOffset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemClassID; $_l_BlobVarOffset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemOwnerID; $_l_BlobVarOffset)
								//This array contains the ICON to use for the set(this indicated which type of set
								$_bo_ArrayNUL:=False:C215
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemSharesList; $_l_BlobVarOffset)
								Else 
									ARRAY TEXT:C222(SM_at_SetUNIitemSharesList; Size of array:C274(SM_al_SetUNIitemClassID))
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	Else 
		
	End if 
	If ($_bo_ContextsNul)
		$_l_SetItemsCount:=0
	Else 
		$_l_SetItemsCount:=Size of array:C274(SM_at_SetUNIContexts)
	End if 
	ARRAY TEXT:C222(SM_at_SetUNIContexts; $_l_SetItemsCount)
	ARRAY LONGINT:C221(SM_al_SetUNIContextIDs; $_l_SetItemsCount)
	If ($_bo_ArrayNUL)
		$_l_SetItemsCount:=0
		
	Else 
		$_l_SetItemsCount:=Size of array:C274(SM_at_SetUNIitemsName)
		
	End if 
	ARRAY TEXT:C222(SM_at_SetUNIitemsName; $_l_SetItemsCount)
	ARRAY LONGINT:C221(SM_al_SetUNIitemcontextID; $_l_SetItemsCount)
	ARRAY LONGINT:C221(SM_al_SetUNIitemsID; $_l_SetItemsCount)
	ARRAY TEXT:C222(SM_at_SetUNIitemClassName; $_l_SetItemsCount)
	ARRAY LONGINT:C221(SM_al_SetUNIitemClassID; $_l_SetItemsCount)
	ARRAY TEXT:C222(SM_at_SetUNIitemOwnerID; $_l_SetItemsCount)
	ARRAY TEXT:C222(SM_at_SetUNIitemSharesList; $_l_SetItemsCount)
	//we have to put the "GRP" in because the GROUP COULD have the same code as a pers
	For ($_l_Index; 1; Size of array:C274(SM_al_SetUNIitemClassID))
		If (SM_at_SetUNIitemOwnerID{$_l_Index}="")
			SM_at_SetUNIitemOwnerID{$_l_Index}:="UNI"
		End if 
	End for 
End if 
CLEAR SEMAPHORE:C144("LoadingPrefsUS")

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_UserID)
SM_PersonGroup:=[PERSONNEL:11]Group_Code:28

SM_PersonGroup:=[PERSONNEL:11]Group_Code:28
If ([PERSONNEL:11]Group_Code:28#"")
	$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL:11]Group_Code:28+" Sets"; False:C215)
	
	// READ WRITE([PERSONNEL])
	If ($_l_ItemID>0)
		//Sets updated
		$_l_BlobVarOffset:=0
		$_bo_ArrayNUL:=True:C214
		$_bo_ContextsNul:=True:C214
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupContexts; $_l_BlobVarOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupContextsIDs; $_l_BlobVarOffset)
			$_bo_ContextsNul:=False:C215
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemNames; $_l_BlobVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemContextIDs; $_l_BlobVarOffset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemIDs; $_l_BlobVarOffset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemClassNames; $_l_BlobVarOffset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemClassIDs; $_l_BlobVarOffset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemOwnerIDs; $_l_BlobVarOffset)
									$_bo_ArrayNUL:=False:C215
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupitemSharesList; $_l_BlobVarOffset)
									Else 
										ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; Size of array:C274(SM_al_SetGroupItemClassIDs))
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		If ($_bo_ContextsNul)
			$_l_SetItemsCount:=0
		Else 
			$_l_SetItemsCount:=Size of array:C274(SM_al_SetGroupContextsIDs)
		End if 
		ARRAY TEXT:C222(SM_at_SetGroupContexts; $_l_SetItemsCount)
		If ($_bo_ArrayNUL)
			$_l_SetItemsCount:=0
		Else 
			$_l_SetItemsCount:=Size of array:C274(SM_at_SetGroupItemNames)
		End if 
		ARRAY TEXT:C222(SM_at_SetGroupItemNames; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetGroupItemContextIDs; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetGroupItemIDs; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetGroupItemClassNames; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetGroupItemClassIDs; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetGroupItemOwnerIDs; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; $_l_SetItemsCount)
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			READ WRITE:C146([PREFERENCES:116])
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				SAVE RECORD:C53([PREFERENCES:116])
			End if 
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
					IDLE:C311
					DELAY PROCESS:C323(Current process:C322; 2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
			
			ARRAY TEXT:C222(SM_at_SetGroupContexts; 3)
			ARRAY LONGINT:C221(SM_al_SetGroupContextsIDs; 3)
			SM_at_SetGroupContexts{1}:="Companies"
			SM_at_SetGroupContexts{2}:="Contacts"
			SM_at_SetGroupContexts{3}:="Diary"
			SM_al_SetGroupContextsIDs{1}:=10000+(Table:C252(->[COMPANIES:2]))
			SM_al_SetGroupContextsIDs{2}:=10000+(Table:C252(->[CONTACTS:1]))
			SM_al_SetGroupContextsIDs{3}:=10000+(Table:C252(->[DIARY:12]))
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
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
		End if 
		
		
	End if 
End if 
$_l_SetItemsCount:=Size of array:C274(SM_at_SetGroupContexts)
If (Size of array:C274(SM_al_SetGroupContextsIDs)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_al_SetGroupContextsIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemNames)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_at_SetGroupItemNames)
End if 
If (Size of array:C274(SM_al_SetGroupItemContextIDs)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_al_SetGroupItemContextIDs)
End if 
If (Size of array:C274(SM_al_SetGroupItemIDs)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_al_SetGroupItemIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemClassNames)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_at_SetGroupItemClassNames)
End if 
If (Size of array:C274(SM_al_SetGroupItemClassIDs)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_al_SetGroupItemClassIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemOwnerIDs)>$_l_SetItemsCount)
	$_l_SetItemsCount:=Size of array:C274(SM_at_SetGroupItemOwnerIDs)
End if 
$_l_BlobVarOffset:=0
If ($_t_UserID#"") & ($_t_UserID#"~SV")
	$_l_ItemID:=PREF_GetPreferenceID($_t_UserID+" Sets"; False:C215)
	
	If ($_l_ItemID>0)
		//the user sets are updated
		//These arrays correspond to the UNI arrays
		$_l_BlobVarOffset:=0
		$_bo_ArrayNUL:=True:C214
		$_bo_ContextsNul:=True:C214
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetContexts; $_l_BlobVarOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetContextIDs; $_l_BlobVarOffset)
			$_bo_ContextsNul:=False:C215
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetItemsName; $_l_BlobVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetContextItemContextID; $_l_BlobVarOffset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetitemsID; $_l_BlobVarOffset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetitemsClassName; $_l_BlobVarOffset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetitemsClassID; $_l_BlobVarOffset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetContextitemOwnerIDs; $_l_BlobVarOffset)
									$_bo_ArrayNUL:=False:C215
									
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_BlobVarOffset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetitemSharesList; $_l_BlobVarOffset)
									Else 
										ARRAY TEXT:C222(SM_at_SetitemSharesList; Size of array:C274(SM_at_SetContexts))
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		If ($_bo_ContextsNul)
			$_l_SetItemsCount:=0
		Else 
			$_l_SetItemsCount:=Size of array:C274(SM_at_SetContexts)
		End if 
		ARRAY TEXT:C222(SM_at_SetContexts; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SetItemsCount)
		If ($_bo_ArrayNUL)
			$_l_SetItemsCount:=0
		Else 
			$_l_SetItemsCount:=Size of array:C274(SM_at_SetItemsName)
		End if 
		
		ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SetItemsCount)
		ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SetItemsCount)
		ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SetItemsCount)
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_UserID)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			If ([PERSONNEL:11]Group_Code:28#"")
				$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL:11]Group_Code:28+" Sets"; False:C215)
				
				// READ WRITE([PERSONNEL])
				If ($_l_ItemID>0)
					//Sets updated
					$_l_BlobVarOffset:=0
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					READ WRITE:C146([PREFERENCES:116])
					If (Records in selection:C76([PREFERENCES:116])=0)
						CREATE RECORD:C68([PREFERENCES:116])
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
						SAVE RECORD:C53([PREFERENCES:116])
						
					End if 
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
							IDLE:C311
							DELAY PROCESS:C323(Current process:C322; 2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					ARRAY TEXT:C222(SM_at_SetGroupContexts; 3)
					ARRAY LONGINT:C221(SM_al_SetGroupContextsIDs; 3)
					SM_at_SetGroupContexts{1}:="Companies"
					SM_at_SetGroupContexts{2}:="Contacts"
					SM_at_SetGroupContexts{3}:="Diary"
					SM_al_SetGroupContextsIDs{1}:=10000+(Table:C252(->[COMPANIES:2]))
					SM_al_SetGroupContextsIDs{2}:=10000+(Table:C252(->[CONTACTS:1]))
					SM_al_SetGroupContextsIDs{3}:=10000+(Table:C252(->[DIARY:12]))
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
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
				End if 
			End if 
		End if 
		ARRAY TEXT:C222(SM_at_SetGroupItemOwnerIDs; Size of array:C274(SM_al_SetGroupItemClassIDs))
		//we have to put the "GRP" in because the GROUP COULD have the same code as a pers
		For ($_l_Index; 1; Size of array:C274(SM_al_SetGroupItemClassIDs))
			If (SM_at_SetGroupItemOwnerIDs{$_l_Index}="")
				SM_at_SetGroupItemOwnerIDs{$_l_Index}:="GRP_"+[PERSONNEL_GROUPS:92]Group_Code:1
			End if 
		End for 
		If (Size of array:C274(SM_at_SetContexts)=0)
			
			$_l_BlobVarOffset:=0
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			READ WRITE:C146([PREFERENCES:116])
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			End if 
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
					IDLE:C311
					DELAY PROCESS:C323(Current process:C322; 2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
			ARRAY TEXT:C222(SM_at_SetContexts; 3)
			ARRAY LONGINT:C221(SM_al_SetContextIDs; 3)
			SM_at_SetContexts{1}:="Companies"
			SM_at_SetContexts{2}:="Contacts"
			SM_at_SetContexts{3}:="Diary"
			SM_al_SetContextIDs{1}:=10000+(Table:C252(->[COMPANIES:2]))
			SM_al_SetContextIDs{2}:=10000+(Table:C252(->[CONTACTS:1]))
			SM_al_SetContextIDs{3}:=10000+(Table:C252(->[DIARY:12]))
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
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
		End if 
	End if 
	ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; Size of array:C274(SM_al_SetitemsClassID))
	For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsClassID))
		If (SM_at_SetContextitemOwnerIDs{$_l_Index}="")
			SM_at_SetContextitemOwnerIDs{$_l_Index}:=$_t_UserID
		End if 
	End for 
End if 

//UPDATE THE CONTEXTS
//Now add to the personal contexts any group contexts
$_l_SetItemsCount:=Size of array:C274(SM_at_SetContexts)
$_bo_Modified:=False:C215
ARRAY TEXT:C222(SM_at_SetContexts; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupContexts))
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupContexts))
For ($_l_Index; 1; Size of array:C274(SM_at_SetGroupContexts))
	$_l_ContextRow:=Find in array:C230(SM_al_SetContextIDs; SM_al_SetGroupContextsIDs{$_l_Index})
	If ($_l_ContextRow<0)
		//the personal group does not have the universal context
		$_l_SetItemsCount:=$_l_SetItemsCount+1
		$_bo_Modified:=False:C215
		SM_at_SetContexts{$_l_SetItemsCount}:=SM_at_SetGroupContexts{$_l_Index}
		SM_al_SetContextIDs{$_l_SetItemsCount}:=SM_al_SetGroupContextsIDs{$_l_Index}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetContexts; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SetItemsCount)
//Now add to the personal contexts any Universal contexts
$_l_SetItemsCount:=Size of array:C274(SM_at_SetContexts)

ARRAY TEXT:C222(SM_at_SetContexts; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIContexts))
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIContexts))
For ($_l_Index; 1; Size of array:C274(SM_at_SetUNIContexts))
	$_l_ContextRow:=Find in array:C230(SM_al_SetContextIDs; SM_al_SetUNIContextIDs{$_l_Index})
	If ($_l_ContextRow<0)
		//the personal group does not have the universal context
		$_l_SetItemsCount:=$_l_SetItemsCount+1
		$_bo_Modified:=True:C214
		SM_at_SetContexts{$_l_SetItemsCount}:=SM_at_SetUNIContexts{$_l_Index}
		SM_al_SetContextIDs{$_l_SetItemsCount}:=SM_al_SetUNIContextIDs{$_l_Index}
	End if 
End for 


//COMPLETED UPDATE OF CONTEXTS

//Now add to the personal SETS any group SETS
$_l_SetItemsCount:=Size of array:C274(SM_at_SetItemsName)

ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SetItemsCount+Size of array:C274(SM_at_SetGroupItemNames))
For ($_l_Index; 1; Size of array:C274(SM_at_SetGroupItemNames))
	$_l_ItemRow:=Find in array:C230(SM_al_SetitemsID; SM_al_SetGroupItemIDs{$_l_Index})
	If ($_l_ItemRow<0)  //the personal group does not have the universal Set
		$_l_SetItemsCount:=$_l_SetItemsCount+1
		$_bo_Modified:=True:C214
		SM_at_SetItemsName{$_l_SetItemsCount}:=SM_at_SetGroupItemNames{$_l_Index}
		SM_al_SetitemsID{$_l_SetItemsCount}:=SM_al_SetGroupItemIDs{$_l_Index}
		SM_al_SetContextItemContextID{$_l_SetItemsCount}:=SM_al_SetGroupItemContextIDs{$_l_Index}
		SM_at_SetitemsClassName{$_l_SetItemsCount}:=SM_at_SetGroupItemClassNames{$_l_Index}
		SM_al_SetitemsClassID{$_l_SetItemsCount}:=SM_al_SetGroupItemClassIDs{$_l_Index}
		SM_at_SetContextitemOwnerIDs{$_l_SetItemsCount}:=SM_at_SetGroupItemOwnerIDs{$_l_Index}
		SM_at_SetitemSharesList{$_l_SetItemsCount}:=SM_at_SetGroupitemSharesList{$_l_Index}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SetItemsCount)
$_l_SetItemsCount:=Size of array:C274(SM_at_SetItemsName)
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SetItemsCount+Size of array:C274(SM_at_SetUNIitemsName))
For ($_l_Index; 1; Size of array:C274(SM_at_SetUNIitemsName))
	$_l_SetIDRow:=Find in array:C230(SM_al_SetitemsID; SM_al_SetUNIitemsID{$_l_Index})
	If ($_l_SetIDRow<0)
		//the personal group does not have the universal Set
		$_l_SetItemsCount:=$_l_SetItemsCount+1
		$_bo_Modified:=True:C214
		SM_at_SetItemsName{$_l_SetItemsCount}:=SM_at_SetUNIitemsName{$_l_Index}
		SM_al_SetitemsID{$_l_SetItemsCount}:=SM_al_SetUNIitemsID{$_l_Index}
		SM_al_SetContextItemContextID{$_l_SetItemsCount}:=SM_al_SetUNIitemcontextID{$_l_Index}
		SM_at_SetContextitemOwnerIDs{$_l_SetItemsCount}:=SM_at_SetUNIitemOwnerID{$_l_Index}
		SM_at_SetitemSharesList{$_l_SetItemsCount}:=SM_at_SetUNIitemSharesList{$_l_Index}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SetItemsCount)
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SetItemsCount)
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SetItemsCount)
If ($_bo_LoadMenu)
	$_bo_BreakInserted:=False:C215
	$_l_ItemsAdded:=0
	//GET PICTURE FROM LIBRARY(22549; DB_pic_SelectedSet)
	DB_pic_SelectedSet:=Get_Picture(22549)
	//GET PICTURE FROM LIBRARY(22548; DB_pic_BuiltSet)
	DB_pic_BuiltSet:=Get_Picture(22548)
	//GET PICTURE FROM LIBRARY(22549; DB_pic_SelectedPlusSet)
	DB_pic_SelectedPlusSet:=Get_Picture(22549)
	///GET PICTURE FROM LIBRARY(22551; DB_pic_GroupedSetList)
	DB_pic_GroupedSetList:=Get_Picture(22551)
	For ($_l_Index; 1; Size of array:C274(SM_at_SetContexts))
		If ((SM_al_SetContextIDs{$_l_Index}-10000)>0) & ((SM_al_SetContextIDs{$_l_Index}-10000)<Get last table number:C254)
			$_l_SetTableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_Index})
			If ($_l_SetTableNumber=$_l_TableNumber)
				$_l_SubMenuCount:=1
				For ($_l_Index2; 1; Size of array:C274(SM_at_SetItemsName))
					If (SM_al_SetContextItemContextID{$_l_Index2}=SM_al_SetContextIDs{$_l_Index})
						
						If ($_bo_BreakInserted=False:C215)
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
							$_bo_BreakInserted:=True:C214
						End if 
						SM_at_SetItemsName{$_l_Index2}:=Uppers2(SM_at_SetItemsName{$_l_Index2}; 0; 1)
						If (SM_al_SetitemsClassID{$_l_Index2}#855)
							INSERT MENU ITEM:C412($_t_MenuReference; -1; SM_at_SetItemsName{$_l_Index2})
							
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_SelectSet")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10(SM_al_SetitemsID{$_l_Index2}))
							$_l_Icon:=SM_al_SetitemsClassID{$_l_Index2}
							If ($_l_Icon=0)
								$_l_Icon:=853
							End if 
							Case of 
								: ($_l_Icon=853)
									$_Pic_Icon:=DB_pic_SelectedSet
									SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
								: ($_l_Icon=854)
									$_Pic_Icon:=DB_pic_BuiltSet
									SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22548)
								: ($_l_Icon=852)
									$_Pic_Icon:=DB_pic_SelectedPlusSet
									SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
								: ($_l_Icon=855)
									$_Pic_Icon:=DB_pic_GroupedSetList
									SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22551)
								Else 
									$_Pic_Icon:=DB_pic_SelectedSet
									SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
							End case 
							
						Else 
							
							//This is a grouped item so we need to attach a submenu the item
							$_l_SubContext:=SM_al_SetitemsID{$_l_Index2}*SM_al_SetContextItemContextID{$_l_Index2}
							If (Not:C34(DB_bo_SelectionsSubMenusInited))
								ARRAY TEXT:C222(DB_at_SelectionsSubMenus; 0)
								DB_bo_SelectionsSubMenusInited:=True:C214
							End if 
							If (Size of array:C274(DB_at_SelectionsSubMenus)>=$_l_SubMenuCount)
								If (DB_at_SelectionsSubMenus{$_l_SubMenuCount}#"")
									RELEASE MENU:C978(DB_at_SelectionsSubMenus{$_l_SubMenuCount})
								End if 
								$_t_SubMenuReference:=Create menu:C408
								DB_at_SelectionsSubMenus{$_l_SubMenuCount}:=$_t_SubMenuReference
							Else 
								$_t_SubMenuReference:=Create menu:C408
								APPEND TO ARRAY:C911(DB_at_SelectionsSubMenus; $_t_SubMenuReference)
							End if 
							$_l_SubItemsCount:=0
							For ($_l_Index2; 1; Size of array:C274(SM_at_SetItemsName))
								If (SM_al_SetContextItemContextID{$_l_Index2}=$_l_SubContext)
									SM_at_SetItemsName{$_l_Index2}:=Uppers2(SM_at_SetItemsName{$_l_Index2}; 0; 1)
									
									INSERT MENU ITEM:C412($_t_SubMenuReference; -1; SM_at_SetItemsName{$_l_Index2})
									SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; "DB_SelectSet")
									SET MENU ITEM PARAMETER:C1004($_t_SubMenuReference; -1; String:C10(SM_al_SetitemsID{$_l_Index2}))
									$_l_SubItemsCount:=$_l_SubItemsCount+1
									$_l_Icon:=SM_al_SetitemsClassID{$_l_Index2}
									If ($_l_Icon=0)
										$_l_Icon:=853
									End if 
									
									Case of 
										: ($_l_Icon=853)
											$_Pic_Icon:=DB_pic_SelectedSet
											SET MENU ITEM ICON:C984($_t_SubMenuReference; -1; 22549)
										: ($_l_Icon=854)
											$_Pic_Icon:=DB_pic_BuiltSet
											SET MENU ITEM ICON:C984($_t_SubMenuReference; -1; 22548)
										: ($_l_Icon=852)
											$_Pic_Icon:=DB_pic_SelectedPlusSet
											SET MENU ITEM ICON:C984($_t_SubMenuReference; -1; 22549)
										: ($_l_Icon=855)
											$_Pic_Icon:=DB_pic_GroupedSetList
											SET MENU ITEM ICON:C984($_t_SubMenuReference; -1; 22551)
										Else 
											$_Pic_Icon:=DB_pic_SelectedSet
											SET MENU ITEM ICON:C984($_t_SubMenuReference; -1; 22549)
									End case 
								End if 
							End for 
							If ($_l_SubItemsCount>0)
								INSERT MENU ITEM:C412($_t_MenuReference; -1; SM_at_SetItemsName{$_l_Index2}; $_t_SubMenuReference)
								$_l_SubMenuCount:=$_l_SubMenuCount+1
								$_l_Icon:=SM_al_SetitemsClassID{$_l_Index2}
								If ($_l_Icon=0)
									$_l_Icon:=853
								End if 
								Case of 
									: ($_l_Icon=853)
										$_Pic_Icon:=DB_pic_SelectedSet
										SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
									: ($_l_Icon=854)
										$_Pic_Icon:=DB_pic_BuiltSet
										SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22548)
									: ($_l_Icon=852)
										$_Pic_Icon:=DB_pic_SelectedPlusSet
										SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
									: ($_l_Icon=855)
										$_Pic_Icon:=DB_pic_GroupedSetList
										SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22551)
									Else 
										$_Pic_Icon:=DB_pic_SelectedSet
										SET MENU ITEM ICON:C984($_t_MenuReference; -1; 22549)
								End case 
								
							End if 
							//SET MENU ITEM METHOD($_t_MenuReference;-1;"")
							//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String(SM_al_SetitemsID{$_l_Index2}))
						End if 
						If (Size of array:C274(DB_at_SetName)>0) & ($_l_ItemsAdded=0)
							APPEND TO ARRAY:C911(DB_at_SetName; "")
							APPEND TO ARRAY:C911(DB_apic_SetPicture; $NUL)
							APPEND TO ARRAY:C911(DB_al_SetID; -9999998)
							APPEND TO ARRAY:C911(DB_at_SetMethod; "")
							APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
						End if 
						$_l_Icon:=SM_al_SetitemsClassID{$_l_Index2}
						If ($_l_Icon=0)
							$_l_Icon:=853
						End if 
						
						Case of 
							: ($_l_Icon=853)
								$_Pic_Icon:=DB_pic_SelectedSet
								
							: ($_l_Icon=854)
								$_Pic_Icon:=DB_pic_BuiltSet
								
							: ($_l_Icon=852)
								$_Pic_Icon:=DB_pic_SelectedPlusSet
								
							: ($_l_Icon=855)
								$_Pic_Icon:=DB_pic_GroupedSetList
								
							Else 
								$_Pic_Icon:=DB_pic_SelectedSet
								
						End case 
						$_l_ItemsAdded:=$_l_ItemsAdded+1
						APPEND TO ARRAY:C911(DB_at_SetName; SM_at_SetItemsName{$_l_Index2})
						APPEND TO ARRAY:C911(DB_apic_SetPicture; $_Pic_Icon)
						APPEND TO ARRAY:C911(DB_al_SetID; SM_al_SetitemsID{$_l_Index2})
						APPEND TO ARRAY:C911(DB_at_SetMethod; "DB_SelectSet")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; String:C10(SM_al_SetitemsID{$_l_Index2}))
						
						
					End if 
				End for 
				
			End if 
		Else 
			//this is a faulty one
			
		End if 
		
		
	End for 
	//when we share a list we add the list to that user including the shares list BUT the owner of the list remains the current owner.
	//if we edit the sharing we have to edit all the shares.
	//if the user is logged in they will need to have their list automatically updated
End if 

USE NAMED SELECTION:C332("$CurPersons")
USE NAMED SELECTION:C332("$CurGroups")
ERR_MethodTrackerReturn("DB_BuildSelectionsMenuitems"; $_t_oldMethodName)
