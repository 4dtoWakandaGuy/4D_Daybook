//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetDefaultFilters
	//------------------ Method Notes ------------------
	//This method will ask  the user which of their default filters
	
	//------------------ Revision Control ----------------
	//Date Created: 09/05/2011 06:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ContextIDS; 0)
	ARRAY LONGINT:C221($_al_DefaultFilterIDs; 0)
	//ARRAY LONGINT(DB_al_FilterIDs;0)
	//ARRAY TEXT(DB_at_FilterNames;0)
	//ARRAY TEXT(DB_at_SelectFilterNames;0)
	C_BOOLEAN:C305($_bo_HasFilters; DB_aB_FiltersInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DefaultFilterID; $_l_DefaultID; $_l_Index; $_l_ItemID; $_l_offset; $_l_Table; $_l_TableRow; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; $_t_RequestedFilter; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetDefaultFilters")
$_l_Table:=DB_l_CurrentDisplayedForm
//Remember to set the above to false when switching table
If (Not:C34(DB_aB_FiltersInited))
	DB_LoadFilters($_l_Table)
End if 
$_l_DefaultFilterID:=DB_GetdefaultFilterID($_l_Table)
ARRAY TEXT:C222(DB_at_SelectFilterNames; 0)
If (Size of array:C274(DB_at_FilterNames)>0)
	$_bo_HasFilters:=False:C215
	For ($_l_Index; 1; Size of array:C274(DB_at_FilterNames))
		If (DB_al_FilterIDs{$_l_Index}<0)  //The list of filters also includes the save filter etc
			
			$_bo_HasFilters:=True:C214
			APPEND TO ARRAY:C911(DB_at_SelectFilterNames; DB_at_FilterNames{$_l_Index})
			
		End if 
	End for 
	If ($_l_DefaultFilterID#0)
		APPEND TO ARRAY:C911(DB_at_SelectFilterNames; "-")
		APPEND TO ARRAY:C911(DB_al_FilterIDs; 0)
		APPEND TO ARRAY:C911(DB_at_SelectFilterNames; "Clear Default Filter")
		APPEND TO ARRAY:C911(DB_al_FilterIDs; 0)
		If (Find in array:C230(DB_al_FilterIDs; $_l_DefaultFilterID)>0)
			DB_al_FilterIDs{0}:=DB_al_FilterIDs{Find in array:C230(DB_al_FilterIDs; $_l_DefaultFilterID)}
		Else 
			DB_al_FilterIDs{0}:=0
		End if 
		
	Else 
		DB_al_FilterIDs{0}:=0
	End if 
Else 
	$_bo_HasFilters:=False:C215
End if 
If ($_bo_HasFilters)
	$_t_RequestedFilter:=Gen_RequestWithList("Please Select the default filter to use"; ""; "Save"; "Cancel"; 0; 0; "Default Filter Selection"; 0; ""; "DB_at_SelectFilterNames")
	If ($_t_RequestedFilter#"") & (OK=1)
		$_l_TableRow:=Find in array:C230(DB_at_FilterNames; $_t_RequestedFilter)
		If ($_l_TableRow>0)
			$_l_DefaultID:=DB_al_FilterIDs{$_l_TableRow}
			If ($_l_DefaultID#0)
				ARRAY LONGINT:C221($_al_ContextIDS; 0)
				ARRAY LONGINT:C221($_al_DefaultFilterIDs; 0)
				
				While (Semaphore:C143("DefaultFiltersSettings"))
					DelayTicks(2)
				End while 
				$_l_ItemID:=PREF_GetPreferenceID("Defaults Filter Settings")
				If ($_l_ItemID>0)
					READ WRITE:C146([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						CREATE RECORD:C68([PREFERENCES:116])
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
						[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
						DB_SaveRecord(->[PREFERENCES:116])
						
					End if 
					$_l_offset:=0
					
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_ContextIDS; $_l_offset)
						If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_DefaultFilterIDs; $_l_offset)
						End if 
					End if 
					$_l_TableRow:=Find in array:C230($_al_ContextIDS; $_l_Table)
					If ($_l_TableRow>0)
						$_al_DefaultFilterIDs{$_l_TableRow}:=$_l_DefaultID
					Else 
						APPEND TO ARRAY:C911($_al_ContextIDS; $_l_Table)
						APPEND TO ARRAY:C911($_al_DefaultFilterIDs; $_l_DefaultID)
						
					End if 
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					VARIABLE TO BLOB:C532($_al_ContextIDS; [PREFERENCES:116]DataBlob:2; *)
					
					VARIABLE TO BLOB:C532($_al_DefaultFilterIDs; [PREFERENCES:116]DataBlob:2; *)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					//and change the menu
				End if 
				CLEAR SEMAPHORE:C144("DefaultFiltersSettings")
				DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			Else 
				
			End if 
		Else 
			If ($_t_RequestedFilter="Clear Default Filter")
				ARRAY LONGINT:C221($_al_ContextIDS; 0)
				ARRAY LONGINT:C221($_al_DefaultFilterIDs; 0)
				
				While (Semaphore:C143("DefaultFiltersSettings"))
					DelayTicks(2)
				End while 
				$_l_ItemID:=PREF_GetPreferenceID("Defaults Filter Settings")
				If ($_l_ItemID>0)
					READ WRITE:C146([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
					If (Records in selection:C76([PREFERENCES:116])=0)
						CREATE RECORD:C68([PREFERENCES:116])
						[PREFERENCES:116]IDNumber:1:=$_l_ItemID
						[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
						DB_SaveRecord(->[PREFERENCES:116])
						
					End if 
					$_l_offset:=0
					
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_ContextIDS; $_l_offset)
						If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_DefaultFilterIDs; $_l_offset)
						End if 
					End if 
					$_l_TableRow:=Find in array:C230($_al_ContextIDS; $_l_Table)
					If ($_l_TableRow>0)
						$_al_DefaultFilterIDs{$_l_TableRow}:=0
					Else 
						//APPEND TO ARRAY($_al_ContextIDS;$_l_Table)
						//APPEND TO ARRAY($_al_DefaultFilterIDs;$_l_DefaultID)
						
					End if 
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					VARIABLE TO BLOB:C532($_al_ContextIDS; [PREFERENCES:116]DataBlob:2; *)
					
					VARIABLE TO BLOB:C532($_al_DefaultFilterIDs; [PREFERENCES:116]DataBlob:2; *)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					//and change the menu
				End if 
				CLEAR SEMAPHORE:C144("DefaultFiltersSettings")
				Gen_Alert("Close form and re-open to view updated settings"; "OK")
				DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
			
		End if 
		
	End if 
Else 
	DB_al_FilterIDs{0}:=0
	
End if 
ERR_MethodTrackerReturn("DB_SetDefaultFilters"; $_t_oldMethodName)