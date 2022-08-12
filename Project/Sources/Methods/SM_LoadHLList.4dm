//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_LoadHLList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:          22/01/2011 22:22 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DeleteElements; 0)
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
	//ARRAY TEXT(SM_at_SetClass;0)
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
	C_BOOLEAN:C305($_bo_Modified; $_bo_OK)
	C_LONGINT:C283($_HL_SubList; $_l_ClassIndex; $_l_ContextRow; $_l_Count; $_l_Delay; $_l_DeleteElementIndex; $_l_DeleteIndex; $_l_GroupsIndex; $_l_Icon; $_l_ItemID; $_l_ItemRow)
	C_LONGINT:C283($_l_ItemsIndex; $_l_PictureIcon; $_l_Repeats; $_l_SizeofArray; $_l_TableNumber; $_l_VarOffset; SM_HL_l_SETMANAGER)
	C_PICTURE:C286(DB_pic_BuiltSet; DB_pic_SelectedPlusSet; DB_pic_SelectedSet)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SM_PersonGroup)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_LoadHLList")
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
ARRAY LONGINT:C221(SM_al_SetClassID; 4)
SM_at_SetClass{1}:="Fixed List"
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

While (Semaphore:C143("LoadingPrefsUS"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("Universal Sets"; False:C215)

If ($_l_ItemID>0)
	//the universal sets have been updated load from there
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIContexts; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIContextIDs; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemsName; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemcontextID; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemsID; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemClassName; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetUNIitemClassID; $_l_VarOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemOwnerID; $_l_VarOffset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetUNIitemSharesList; $_l_VarOffset)
	Else 
		ARRAY TEXT:C222(SM_at_SetUNIitemSharesList; Size of array:C274(SM_al_SetUNIitemClassID))
	End if 
	ARRAY TEXT:C222(SM_at_SetUNIitemOwnerID; Size of array:C274(SM_al_SetUNIitemClassID))
	//we have to put the "GRP" in because the GROUP COULD have the same code as a pers
	For ($_l_ClassIndex; 1; Size of array:C274(SM_al_SetUNIitemClassID))
		If (SM_at_SetUNIitemOwnerID{$_l_ClassIndex}="")
			SM_at_SetUNIitemOwnerID{$_l_ClassIndex}:="UNI"
		End if 
	End for 
	
Else 
	//not updated
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_at_SetUNIContexts; $_l_VarOffset)
	//The Above array contains the contexts(related to tables)
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_al_SetUNIContextIDs; $_l_VarOffset)
	//The Above array contains a unique ID for the contexts-`
	//Related to the TABLE numbers(+10000 +11000 etc)
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_at_SetUNIitemsName; $_l_VarOffset)
	//The above array contains the 'set' names which will appear in Contexts
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_al_SetUNIitemcontextID; $_l_VarOffset)
	//The above array contains the Context IDs for each set in SM_at_SetUNIitemsName
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_al_SetUNIitemsID; $_l_VarOffset)
	//The above array contains the Set IDs held in [USER_SETS]SET_ID( a unique value )
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_at_SetUNIitemClassName; $_l_VarOffset)
	//The above array contains the class of each set-this is used to determine the
	//action the set is selected(see the array 'SM_at_SetClass'
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_al_SetUNIitemClassID; $_l_VarOffset)
	BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_at_SetUNIitemOwnerID; $_l_VarOffset)
	If (BLOB size:C605([USER:15]SM_SetNames:240)>$_l_VarOffset)
		BLOB TO VARIABLE:C533([USER:15]SM_SetNames:240; SM_at_SetGroupitemSharesList; $_l_VarOffset)
	Else 
		ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; Size of array:C274(SM_al_SetGroupItemClassIDs))
	End if 
	//This array contains the ICON to use for the set(this indicated which type of set
	
	ARRAY TEXT:C222(SM_at_SetUNIitemOwnerID; Size of array:C274(SM_al_SetUNIitemClassID))
	//we have to put the "GRP" in because the GROUP COULD have the same code as a pers
	For ($_l_ClassIndex; 1; Size of array:C274(SM_al_SetUNIitemClassID))
		If (SM_at_SetUNIitemOwnerID{$_l_ClassIndex}="")
			SM_at_SetUNIitemOwnerID{$_l_ClassIndex}:="UNI"
		End if 
		
	End for 
End if 

CLEAR SEMAPHORE:C144("LoadingPrefsUS")

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
SM_PersonGroup:=[PERSONNEL:11]Group_Code:28
If ([PERSONNEL:11]Group_Code:28#"")
	$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL:11]Group_Code:28+" Sets"; False:C215)
	
	// READ WRITE([PERSONNEL])
	If ($_l_ItemID>0)
		//Sets updated
		$_l_VarOffset:=0
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupContexts; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupContextsIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemNames; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemContextIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemClassNames; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetGroupItemClassIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupItemOwnerIDs; $_l_VarOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_VarOffset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetGroupitemSharesList; $_l_VarOffset)
		Else 
			ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; Size of array:C274(SM_al_SetGroupItemClassIDs))
		End if 
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			READ WRITE:C146([PREFERENCES:116])
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
		
	Else 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
		SM_PersonGroup:=[PERSONNEL:11]Group_Code:28
		$_bo_OK:=False:C215
		$_l_Repeats:=0
		$_l_Delay:=1
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[PERSONNEL_GROUPS:92]; 1)
			If (Not:C34($_bo_OK))
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
				End if 
				IDLE:C311
				DELAY PROCESS:C323(Current process:C322; 2*$_l_Delay)
			End if 
		Until ($_bo_OK=True:C214)
		$_l_VarOffset:=0
		//These arrays correspond to the UNI arrays
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_at_SetGroupContexts; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_al_SetGroupContextsIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_at_SetGroupItemNames; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_al_SetGroupItemContextIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_al_SetGroupItemIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_at_SetGroupItemClassNames; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_al_SetGroupItemClassIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_at_SetGroupItemOwnerIDs; $_l_VarOffset)
		If (BLOB size:C605([PERSONNEL_GROUPS:92]SM_Contexts:11)>$_l_VarOffset)
			BLOB TO VARIABLE:C533([PERSONNEL_GROUPS:92]SM_Contexts:11; SM_at_SetGroupitemSharesList; $_l_VarOffset)
		Else 
			ARRAY TEXT:C222(SM_at_SetGroupitemSharesList; Size of array:C274(SM_al_SetGroupItemClassIDs))
		End if 
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			READ WRITE:C146([PERSONNEL_GROUPS:92])
			LOAD RECORD:C52([PERSONNEL_GROUPS:92])
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[PERSONNEL_GROUPS:92]; 1)
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
			SET BLOB SIZE:C606([PERSONNEL_GROUPS:92]SM_Contexts:11; 0)
			VARIABLE TO BLOB:C532(SM_at_SetGroupContexts; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_al_SetGroupContextsIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_at_SetGroupItemNames; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_al_SetGroupItemContextIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_al_SetGroupItemIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_at_SetGroupItemClassNames; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_al_SetGroupItemClassIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_at_SetGroupItemOwnerIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			VARIABLE TO BLOB:C532(SM_at_SetGroupitemSharesList; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
			DB_SaveRecord(->[PERSONNEL_GROUPS:92])
			AA_CheckFileUnlocked(->[PERSONNEL_GROUPS:92]x_ID:12)
			UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
			READ ONLY:C145([PERSONNEL_GROUPS:92])
		End if 
		//else
		//no Groups being used
	End if 
End if 

$_l_SizeofArray:=Size of array:C274(SM_at_SetGroupContexts)
If (Size of array:C274(SM_al_SetGroupContextsIDs)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_al_SetGroupContextsIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemNames)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_at_SetGroupItemNames)
End if 
If (Size of array:C274(SM_al_SetGroupItemContextIDs)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_al_SetGroupItemContextIDs)
End if 
If (Size of array:C274(SM_al_SetGroupItemIDs)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_al_SetGroupItemIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemClassNames)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_at_SetGroupItemClassNames)
End if 
If (Size of array:C274(SM_al_SetGroupItemClassIDs)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_al_SetGroupItemClassIDs)
End if 
If (Size of array:C274(SM_at_SetGroupItemOwnerIDs)>$_l_SizeofArray)
	$_l_SizeofArray:=Size of array:C274(SM_at_SetGroupItemOwnerIDs)
End if 
$_l_VarOffset:=0
If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
	$_l_ItemID:=PREF_GetPreferenceID(<>PER_t_CurrentUserInitials+" Sets"; False:C215)
	
	If ($_l_ItemID>0)
		//the user sets are updated
		//These arrays correspond to the UNI arrays
		$_l_VarOffset:=0
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetContexts; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetContextIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetItemsName; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetContextItemContextID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetitemsID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetitemsClassName; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_al_SetitemsClassID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetContextitemOwnerIDs; $_l_VarOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_VarOffset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_SetitemSharesList; $_l_VarOffset)
		Else 
			ARRAY TEXT:C222(SM_at_SetitemSharesList; Size of array:C274(SM_at_SetContexts))
		End if 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			If ([PERSONNEL:11]Group_Code:28#"")
				$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL:11]Group_Code:28+" Sets"; False:C215)
				
				// READ WRITE([PERSONNEL])
				If ($_l_ItemID>0)
					//Sets updated
					$_l_VarOffset:=0
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
					READ WRITE:C146([PREFERENCES:116])
					
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
		For ($_l_ClassIndex; 1; Size of array:C274(SM_al_SetGroupItemClassIDs))
			If (SM_at_SetGroupItemOwnerIDs{$_l_ClassIndex}="")
				SM_at_SetGroupItemOwnerIDs{$_l_ClassIndex}:="GRP_"+[PERSONNEL_GROUPS:92]Group_Code:1
			End if 
		End for 
		If (Size of array:C274(SM_at_SetContexts)=0)
			
			$_l_VarOffset:=0
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			READ WRITE:C146([PREFERENCES:116])
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
	Else 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_at_SetContexts; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_al_SetContextIDs; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_at_SetItemsName; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_al_SetContextItemContextID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_al_SetitemsID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_at_SetitemsClassName; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_al_SetitemsClassID; $_l_VarOffset)
		BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_at_SetContextitemOwnerIDs; $_l_VarOffset)
		If (BLOB size:C605([PERSONNEL:11]SM_SetNames:45)>$_l_VarOffset)
			BLOB TO VARIABLE:C533([PERSONNEL:11]SM_SetNames:45; SM_at_SetitemSharesList; $_l_VarOffset)
		Else 
			ARRAY TEXT:C222(SM_at_SetitemSharesList; Size of array:C274(SM_at_SetContexts))
		End if 
		//if the above are blank we must create the default CONTEXTs NOW
		If (Size of array:C274(SM_at_SetGroupContexts)=0)
			If ([PERSONNEL:11]Group_Code:28#"")
				READ WRITE:C146([PERSONNEL_GROUPS:92])
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PERSONNEL_GROUPS:92]; 1)
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
				SET BLOB SIZE:C606([PERSONNEL_GROUPS:92]SM_Contexts:11; 0)
				VARIABLE TO BLOB:C532(SM_at_SetGroupContexts; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_al_SetGroupContextsIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_at_SetGroupItemNames; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(SM_al_SetGroupItemContextIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_al_SetGroupItemIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_at_SetGroupItemClassNames; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_al_SetGroupItemClassIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_at_SetGroupItemOwnerIDs; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				VARIABLE TO BLOB:C532(SM_at_SetGroupitemSharesList; [PERSONNEL_GROUPS:92]SM_Contexts:11; *)
				DB_SaveRecord(->[PERSONNEL_GROUPS:92])
				AA_CheckFileUnlocked(->[PERSONNEL_GROUPS:92]x_ID:12)
				UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
				READ ONLY:C145([PERSONNEL_GROUPS:92])
			End if 
			ARRAY TEXT:C222(SM_at_SetGroupItemOwnerIDs; Size of array:C274(SM_al_SetGroupItemClassIDs))
			//we have to put the "GRP" in because the GROUP COULD have the same code as a pers
			For ($_l_ClassIndex; 1; Size of array:C274(SM_al_SetGroupItemClassIDs))
				If (SM_at_SetGroupItemOwnerIDs{$_l_ClassIndex}="")
					SM_at_SetGroupItemOwnerIDs{$_l_ClassIndex}:="GRP_"+[PERSONNEL_GROUPS:92]Group_Code:1
				End if 
			End for 
		End if 
		
		If (Size of array:C274(SM_at_SetContexts)=0)
			READ WRITE:C146([PERSONNEL:11])
			If ([PERSONNEL:11]Initials:1#<>PER_t_CurrentUserInitials)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			End if 
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
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
			SET BLOB SIZE:C606([PERSONNEL:11]SM_SetNames:45; 0)
			VARIABLE TO BLOB:C532(SM_at_SetContexts; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_al_SetContextIDs; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_at_SetItemsName; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_al_SetContextItemContextID; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_al_SetitemsID; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_at_SetitemsClassName; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_al_SetitemsClassID; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_at_SetContextitemOwnerIDs; [PERSONNEL:11]SM_SetNames:45; *)
			VARIABLE TO BLOB:C532(SM_at_SetitemSharesList; [PERSONNEL:11]SM_SetNames:45; *)
			
			DB_SaveRecord(->[PERSONNEL:11])
			AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
			UNLOAD RECORD:C212([PERSONNEL:11])
			READ ONLY:C145([PERSONNEL:11])
		End if 
	End if 
	ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; Size of array:C274(SM_al_SetitemsClassID))
	For ($_l_ClassIndex; 1; Size of array:C274(SM_al_SetitemsClassID))
		If (SM_at_SetContextitemOwnerIDs{$_l_ClassIndex}="")
			SM_at_SetContextitemOwnerIDs{$_l_ClassIndex}:=<>PER_t_CurrentUserInitials
		End if 
	End for 
End if 

//UPDATE THE CONTEXTS
//Now add to the personal contexts any group contexts
$_l_SizeofArray:=Size of array:C274(SM_at_SetContexts)
$_bo_Modified:=False:C215
ARRAY TEXT:C222(SM_at_SetContexts; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupContexts))
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupContexts))
For ($_l_GroupsIndex; 1; Size of array:C274(SM_at_SetGroupContexts))
	$_l_ContextRow:=Find in array:C230(SM_al_SetContextIDs; SM_al_SetGroupContextsIDs{$_l_GroupsIndex})
	If ($_l_ContextRow<0)
		//the personal group does not have the universal context
		$_l_SizeofArray:=$_l_SizeofArray+1
		$_bo_Modified:=False:C215
		SM_at_SetContexts{$_l_SizeofArray}:=SM_at_SetGroupContexts{$_l_GroupsIndex}
		SM_al_SetContextIDs{$_l_SizeofArray}:=SM_al_SetGroupContextsIDs{$_l_GroupsIndex}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetContexts; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SizeofArray)
//Now add to the personal contexts any Universal contexts
$_l_SizeofArray:=Size of array:C274(SM_at_SetContexts)

ARRAY TEXT:C222(SM_at_SetContexts; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIContexts))
ARRAY LONGINT:C221(SM_al_SetContextIDs; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIContexts))
For ($_l_GroupsIndex; 1; Size of array:C274(SM_at_SetUNIContexts))
	$_l_ContextRow:=Find in array:C230(SM_al_SetContextIDs; SM_al_SetUNIContextIDs{$_l_GroupsIndex})
	If ($_l_ContextRow<0)
		//the personal group does not have the universal context
		$_l_SizeofArray:=$_l_SizeofArray+1
		$_bo_Modified:=True:C214
		SM_at_SetContexts{$_l_SizeofArray}:=SM_at_SetUNIContexts{$_l_GroupsIndex}
		SM_al_SetContextIDs{$_l_SizeofArray}:=SM_al_SetUNIContextIDs{$_l_GroupsIndex}
	End if 
End for 


//COMPLETED UPDATE OF CONTEXTS

//Now add to the personal SETS any group SETS
$_l_SizeofArray:=Size of array:C274(SM_at_SetItemsName)
//TRACE
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SizeofArray+Size of array:C274(SM_at_SetGroupItemNames))
For ($_l_GroupsIndex; 1; Size of array:C274(SM_at_SetGroupItemNames))
	$_l_ItemRow:=Find in array:C230(SM_al_SetitemsID; SM_al_SetGroupItemIDs{$_l_GroupsIndex})
	If ($_l_ItemRow<0)  //the personal group does not have the universal Set
		$_l_SizeofArray:=$_l_SizeofArray+1
		$_bo_Modified:=True:C214
		SM_at_SetItemsName{$_l_SizeofArray}:=SM_at_SetGroupItemNames{$_l_GroupsIndex}
		SM_al_SetitemsID{$_l_SizeofArray}:=SM_al_SetGroupItemIDs{$_l_GroupsIndex}
		SM_al_SetContextItemContextID{$_l_SizeofArray}:=SM_al_SetGroupItemContextIDs{$_l_GroupsIndex}
		SM_at_SetitemsClassName{$_l_SizeofArray}:=SM_at_SetGroupItemClassNames{$_l_GroupsIndex}
		SM_al_SetitemsClassID{$_l_SizeofArray}:=SM_al_SetGroupItemClassIDs{$_l_GroupsIndex}
		SM_at_SetContextitemOwnerIDs{$_l_SizeofArray}:=SM_at_SetGroupItemOwnerIDs{$_l_GroupsIndex}
		SM_at_SetitemSharesList{$_l_SizeofArray}:=SM_at_SetGroupitemSharesList{$_l_GroupsIndex}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SizeofArray)
$_l_SizeofArray:=Size of array:C274(SM_at_SetItemsName)
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SizeofArray+Size of array:C274(SM_at_SetUNIitemsName))
For ($_l_GroupsIndex; 1; Size of array:C274(SM_at_SetUNIitemsName))
	$_l_ItemRow:=Find in array:C230(SM_al_SetitemsID; SM_al_SetUNIitemsID{$_l_GroupsIndex})
	If ($_l_ItemRow<0)
		//the personal group does not have the universal Set
		$_l_SizeofArray:=$_l_SizeofArray+1
		$_bo_Modified:=True:C214
		SM_at_SetItemsName{$_l_SizeofArray}:=SM_at_SetUNIitemsName{$_l_GroupsIndex}
		SM_al_SetitemsID{$_l_SizeofArray}:=SM_al_SetUNIitemsID{$_l_GroupsIndex}
		SM_al_SetContextItemContextID{$_l_SizeofArray}:=SM_al_SetUNIitemcontextID{$_l_GroupsIndex}
		SM_at_SetContextitemOwnerIDs{$_l_SizeofArray}:=SM_at_SetUNIitemOwnerID{$_l_GroupsIndex}
		SM_at_SetitemSharesList{$_l_SizeofArray}:=SM_at_SetUNIitemSharesList{$_l_GroupsIndex}
	End if 
End for 
ARRAY TEXT:C222(SM_at_SetItemsName; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetitemsID; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetContextItemContextID; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetitemsClassName; $_l_SizeofArray)
ARRAY LONGINT:C221(SM_al_SetitemsClassID; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetContextitemOwnerIDs; $_l_SizeofArray)
ARRAY TEXT:C222(SM_at_SetitemSharesList; $_l_SizeofArray)
If ($_bo_Modified)
	//the personal sets have been modified so write back to the blob
	READ WRITE:C146([PERSONNEL:11])
	If ([PERSONNEL:11]Initials:1#<>PER_t_CurrentUserInitials)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	End if 
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			IDLE:C311
			DELAY PROCESS:C323(Current process:C322; 2*$_l_Delay)
		End if 
	Until ($_bo_OK=True:C214)
	$_l_VarOffset:=0
	VARIABLE TO BLOB:C532(SM_at_SetContexts; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_al_SetContextIDs; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_at_SetItemsName; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_al_SetContextItemContextID; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_al_SetitemsID; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_at_SetitemsClassName; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_al_SetitemsClassID; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_at_SetContextitemOwnerIDs; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	VARIABLE TO BLOB:C532(SM_at_SetitemSharesList; [PERSONNEL:11]SM_SetNames:45; $_l_VarOffset)
	DB_SaveRecord(->[PERSONNEL:11])
	AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
	UNLOAD RECORD:C212([PERSONNEL:11])
	READ ONLY:C145([PERSONNEL:11])
	
End if 

//contexts added to this screen will be personal
//to add a universal context add it in the data manager
//and remember only sets in a universal context
//can be made visible to other users


//now we can create the Heirarchical list for these
SM_HL_l_SETMANAGER:=New list:C375
ARRAY LONGINT:C221($_al_DeleteElements; Size of array:C274(SM_at_SetContexts))
$_l_DeleteElementIndex:=0
SET LIST PROPERTIES:C387(SM_HL_l_SETMANAGER; 1; 0; 18)
For ($_l_GroupsIndex; 1; Size of array:C274(SM_at_SetContexts))
	If ((SM_al_SetContextIDs{$_l_GroupsIndex}-10000)>0) & ((SM_al_SetContextIDs{$_l_GroupsIndex}-10000)<Get last table number:C254)
		$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_GroupsIndex})
		If (Is table number valid:C999($_l_TableNumber))
			//build the sublist items
			$_HL_SubList:=New list:C375
			$_l_Count:=0
			//GET PICTURE FROM LIBRARY(22549; DB_pic_SelectedSet)
			DB_pic_SelectedSet:=Get_Picture(22549)
			
			//GET PICTURE FROM LIBRARY(22548; DB_pic_BuiltSet)
			DB_pic_BuiltSet:=Get_Picture(22548)
			
			//GET PICTURE FROM LIBRARY(22549; DB_pic_SelectedPlusSet)
			DB_pic_SelectedPlusSet:=Get_Picture(22549)
			
			For ($_l_ItemsIndex; 1; Size of array:C274(SM_at_SetItemsName))
				If (SM_al_SetContextItemContextID{$_l_ItemsIndex}=SM_al_SetContextIDs{$_l_GroupsIndex})
					$_l_Count:=$_l_Count+1
					APPEND TO LIST:C376($_HL_SubList; SM_at_SetItemsName{$_l_ItemsIndex}; SM_al_SetitemsID{$_l_ItemsIndex})
					$_l_Icon:=SM_al_SetitemsClassID{$_l_ItemsIndex}
					Case of 
						: ($_l_Icon=853)
							$_l_PictureIcon:=22549
						: ($_l_Icon=854)
							$_l_PictureIcon:=22548
						: ($_l_Icon=852)
							$_l_PictureIcon:=22549
						Else 
							$_l_PictureIcon:=22549
					End case 
					SET LIST ITEM PROPERTIES:C386($_HL_SubList; SM_al_SetitemsID{$_l_ItemsIndex}; True:C214; Plain:K14:1; 131072+$_l_PictureIcon)
				End if 
			End for 
			If (SM_at_SetContexts{$_l_GroupsIndex}="")
				//context has no name so put default name on it!@
				$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_GroupsIndex})
				SM_at_SetContexts{$_l_GroupsIndex}:=Table name:C256(Table:C252($_l_TableNumber))
			End if 
			
			If ($_l_Count>0)
				APPEND TO LIST:C376(SM_HL_l_SETMANAGER; SM_at_SetContexts{$_l_GroupsIndex}; SM_al_SetContextIDs{$_l_GroupsIndex}; $_HL_SubList; True:C214)
			Else 
				APPEND TO LIST:C376(SM_HL_l_SETMANAGER; SM_at_SetContexts{$_l_GroupsIndex}; SM_al_SetContextIDs{$_l_GroupsIndex})
			End if 
			SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; SM_al_SetContextIDs{$_l_GroupsIndex}; True:C214; Bold:K14:2; 0)
		End if 
	Else 
		//this is a faulty one
		$_l_DeleteElementIndex:=$_l_DeleteElementIndex+1
		$_al_DeleteElements{$_l_DeleteElementIndex}:=$_l_GroupsIndex
	End if 
	
	
End for 
ARRAY LONGINT:C221($_al_DeleteElements; $_l_DeleteElementIndex)
For ($_l_DeleteIndex; Size of array:C274($_al_DeleteElements); 1; -1)
	DELETE FROM ARRAY:C228(SM_al_SetContextIDs; $_al_DeleteElements{$_l_DeleteIndex})
	DELETE FROM ARRAY:C228(SM_at_SetContexts; $_al_DeleteElements{$_l_DeleteIndex})
	
End for 
ERR_MethodTrackerReturn("SM_LoadHLList"; $_t_oldMethodName)
