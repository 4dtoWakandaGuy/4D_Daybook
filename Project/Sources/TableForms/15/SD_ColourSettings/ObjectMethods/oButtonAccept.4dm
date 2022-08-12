If (False:C215)
	//object Name: [USER]SD_ColourSettings.Variable261
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:54
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
	//ARRAY LONGINT(SD_al_UpdatedUsers;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	C_BOOLEAN:C305($_bo_UpdatesMade; SD_bo_SavePrefChanges)
	C_LONGINT:C283($_l_ActionRow; $_l_Blue; $_l_ColourUserRow; $_l_Green; $_l_Red; $_l_UpdatedUserRow; $_l_UserIndex; SD_l_CurrentSelectedUser)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentSelectedActionCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_ColourSettings.Variable261"; Form event code:C388)
$_bo_UpdatesMade:=False:C215
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

For ($_l_UserIndex; 1; Size of array:C274(SD_al_UpdatedUsers))
	If (SD_abo_UpdatesMade{$_l_UserIndex})
		$_bo_UpdatesMade:=True:C214
	End if 
End for 
If ($_bo_UpdatesMade)
	Gen_Confirm("Save Colour Settings?"; "Yes"; "No")
	If (OK=1)
		//Save preference
		SD_bo_SavePrefChanges:=True:C214
	Else 
		//just reload
		SD_bo_SavePrefChanges:=False:C215
	End if 
	
	CANCEL:C270
Else 
	SD_bo_SavePrefChanges:=False:C215
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD_ColourSettings.Variable261"; $_t_oldMethodName)
