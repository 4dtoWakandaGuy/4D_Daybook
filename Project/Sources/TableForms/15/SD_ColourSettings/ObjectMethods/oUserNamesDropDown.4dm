If (False:C215)
	//object Name: [USER]SD_ColourSettings.Variable259
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_UpdatesMade;0)
	//ARRAY LONGINT(SD_al_ColourUsers;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesFill;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensFill;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsFill;0)
	//ARRAY LONGINT(SD_al_SettingsPeopleIDs;0)
	//ARRAY LONGINT(SD_al_UpdatedUsers;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	//ARRAY TEXT(SD_at_ColourActionCode;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_SettingsPeopleNames;0)
	C_LONGINT:C283($_l_ActionRow; $_l_ActionsIndex; $_l_Blue; $_l_ColourUserRow; $_l_event; $_l_Green; $_l_Red; $_l_UpdatedUserRow; SD_l_CurrentSelectedUser)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentActionCode; SD_t_CurrentSelectedActionCode; SD_t_CurrentUserName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_ColourSettings.Variable259"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD_at_SettingsPeopleNames>0)
			//Save any currently selected
			If (SD_t_CurrentSelectedActionCode#"")
				//save the actions colours to the array
				$_l_ColourUserRow:=Find in array:C230(SD_al_ColourUsers; SD_l_CurrentSelectedUser)
				If ($_l_ColourUserRow>0)
					$_l_ActionRow:=Find in array:C230(SD_at_AllDiaryActions; SD_t_CurrentSelectedActionCode)
					If ($_l_ActionRow>0)
						//CW Get rgb color (SD_l_AgendaColourWell;$_l_Red;$_l_Green;$_l_Blue)
						If (SD_al_CurrentUserRedsFill{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Red) | (SD_al_CurrentUserGreensFill{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Green) | (SD_al_CurrentUserBluesFill{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Blue)
							$_l_UpdatedUserRow:=Find in array:C230(SD_al_UpdatedUsers; SD_l_CurrentSelectedUser)
							If ($_l_UpdatedUserRow>0)  //it should be
								SD_abo_UpdatesMade{$_l_UpdatedUserRow}:=True:C214
							End if 
						End if 
						
						SD_al_CurrentUserRedsFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Red
						SD_al_CurrentUserGreensFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Green
						SD_al_CurrentUserBluesFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Blue
						//CW Get rgb color (SD_l_AgendaColourWell2;$_l_Red;$_l_Green;$_l_Blue)
						If (SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Red) | (SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Green) | (SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}{$_l_ActionRow}#$_l_Blue)
							$_l_UpdatedUserRow:=Find in array:C230(SD_al_UpdatedUsers; SD_l_CurrentSelectedUser)
							If ($_l_UpdatedUserRow>0)  //it should be
								SD_abo_UpdatesMade{$_l_UpdatedUserRow}:=True:C214
							End if 
						End if 
						SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Red
						SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Green
						SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Blue
						
					End if 
				End if 
				
			End if 
			//``
			//Load this user
			SD_t_CurrentUserName:=SD_at_SettingsPeopleNames{SD_at_SettingsPeopleNames}
			$_l_ColourUserRow:=Find in array:C230(SD_al_UpdatedUsers; SD_al_SettingsPeopleIDs{SD_at_SettingsPeopleNames})
			If ($_l_UpdatedUserRow<0)
				INSERT IN ARRAY:C227(SD_al_UpdatedUsers; Size of array:C274(SD_al_UpdatedUsers)+1; 1)
				INSERT IN ARRAY:C227(SD_abo_UpdatesMade; Size of array:C274(SD_abo_UpdatesMade)+1; 1)
				SD_al_UpdatedUsers{Size of array:C274(SD_al_UpdatedUsers)}:=SD_al_SettingsPeopleIDs{SD_at_SettingsPeopleNames}
				
			End if 
			
			SD_at_ActionCodes:=0
			SD_l_CurrentSelectedUser:=SD_al_SettingsPeopleIDs{SD_at_SettingsPeopleNames}
			SD_t_CurrentSelectedActionCode:=""
			SD_t_CurrentActionCode:=""
			SD_LoadPrefs(SD_al_SettingsPeopleIDs{SD_at_SettingsPeopleNames})
			//SD_at_ActionCodes
			//SD_at_DiaryActionNames
			ARRAY TEXT:C222(SD_at_ColourActionCode; Size of array:C274(SD_at_ActionCodes))
			ARRAY TEXT:C222(SD_at_ActionCodes; Size of array:C274(SD_at_ActionCodes))
			For ($_l_ActionsIndex; 1; Size of array:C274(SD_at_ActionCodes))
				SD_at_ColourActionCode{$_l_ActionsIndex}:=SD_at_ActionCodes{$_l_ActionsIndex}
				SD_at_ActionCodes{$_l_ActionsIndex}:=SD_at_DiaryActionNames{$_l_ActionsIndex}
			End for 
			SORT ARRAY:C229(SD_at_ActionCodes; SD_at_ColourActionCode; >)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD_ColourSettings.Variable259"; $_t_oldMethodName)
