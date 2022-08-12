If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2012 16:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_ActionInclude;0)
	//ARRAY LONGINT(SD_al_ActionID;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_FormID;0)
	//ARRAY LONGINT(SD_al_TabIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD2_at_DisplayedFormNames;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305($_bo_Save; SD_bo_TabitemsModified; SD2_bo_SaveWindow; SD2_bo_SettingsChanges)
	C_LONGINT:C283($_l_Column; $_l_DeleteRows; $_l_index; $_l_sizeofArray; CB_IncludeDocument; SD_l_CurrentTab; SD_l_CurrentTable)
	C_TEXT:C284($_t_oldMethodName; SD2_t_TabName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.Variable8"; Form event code:C388)
If (SD_l_CurrentTab#0)
	Case of 
		: (SD_l_CurrentTab<0)
			//It is a new tab
			If (SD_bo_TabitemsModified)
				$_bo_Save:=True:C214
			Else 
				$_bo_Save:=False:C215
				Gen_Confirm("You did not set any actions/groups to be included in this Tab("+SD2_t_TabName+")"; "Cancel"; "Save")
				If (OK=0)
					$_bo_Save:=True:C214
				End if 
			End if 
			If ($_bo_Save)
				SD2_bo_SaveWindow:=True:C214
				$_l_sizeofArray:=Size of array:C274(SD2_al_TabIncludes)
				
				SD_al_DocIncludes{$_l_sizeofArray}:=CB_IncludeDocument
				For ($_l_index; 1; Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
					SD2_al_TabIncludes{$_l_sizeofArray}{$_l_index}:=0
				End for 
				$_l_Column:=0
				For ($_l_index; 1; Size of array:C274(SD_al_ActionID))
					
					If (SD_al_ActionInclude{$_l_index}=1)
						$_l_Column:=$_l_Column+1
						If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
							INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_sizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray})+1; 1)
						End if 
						SD2_al_TabIncludes{$_l_sizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_index}
					End if 
				End for 
				If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
					$_l_DeleteRows:=(Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))-$_l_Column
					DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_sizeofArray}; $_l_Column+1; $_l_DeleteRows)
				End if 
			Else 
				DELETE FROM ARRAY:C228(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs); 1)
				DELETE FROM ARRAY:C228(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames); 1)
				DELETE FROM ARRAY:C228(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes); 1)
				DELETE FROM ARRAY:C228(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes); 1)
			End if 
			
		: (SD_l_CurrentTab>0)
			//update the tab
			If (SD_bo_TabItemsModified)
				SD2_bo_SaveWindow:=True:C214
				$_l_sizeofArray:=SD_l_CurrentTab
				SD_al_DocIncludes{$_l_sizeofArray}:=CB_IncludeDocument
				For ($_l_index; 1; Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
					SD2_al_TabIncludes{$_l_sizeofArray}{$_l_index}:=0
				End for 
				$_l_Column:=0
				For ($_l_index; 1; Size of array:C274(SD_al_ActionID))
					If (SD_al_ActionInclude{$_l_index}=1)
						$_l_Column:=$_l_Column+1
						If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
							INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_sizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray})+1; 1)
						End if 
						SD2_al_TabIncludes{$_l_sizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_index}
					End if 
				End for 
				If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))
					$_l_DeleteRows:=(Size of array:C274(SD2_al_TabIncludes{$_l_sizeofArray}))-$_l_Column
					DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_sizeofArray}; $_l_Column+1; $_l_DeleteRows)
				End if 
				
				
			End if 
	End case 
	SD_l_CurrentTab:=0
	
	OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; False:C215)
	SD2_at_DisplayedFormNames:=0
	CB_IncludeDocument:=0
	For ($_l_index; 1; Size of array:C274(SD_al_ActionInclude))
		SD_al_ActionInclude{$_l_index}:=0
		SD_abo_ActionInclude{$_l_index}:=False:C215
	End for 
	
	
End if 
If (SD2_bo_SaveWindow)  //changes were made
	Gen_Confirm("Save Changes to Tabs?"; "Yes"; "No")
	If (OK=1)
		SD2_bo_SettingsChanges:=True:C214
		SD2_LoadTabSetting(False:C215; SD_l_CurrentTable; ->SD2_at_TabNames; ->SD2_al_TabIncludes; ->SD_al_DocIncludes; ->SD_al_TabIDs; ->SD_al_FormID)
		SD2_LoadActionGroups(False:C215)
		
	Else 
		SD2_bo_SettingsChanges:=False:C215
	End if 
Else 
	SD2_bo_SettingsChanges:=False:C215
	
End if 
SD2_bo_SaveWindow:=False:C215
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.Variable8"; $_t_oldMethodName)
