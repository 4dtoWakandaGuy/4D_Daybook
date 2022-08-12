
If (False:C215)
	//Object Name:      [USER].SD_ColourSettings.oActionCodesListbox
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/04/2022
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
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
	//ARRAY LONGINT(SD_al_NormalColours;0)
	//ARRAY LONGINT(SD_al_UpdatedUsers;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	//ARRAY TEXT(SD_at_ColourActionCode;0)
	C_BOOLEAN:C305($_bo_UseRandom)
	C_LONGINT:C283($_l_ActionRow; $_l_Blue; $_l_ColourUserRow; $_l_CurrentRandomColour; $_l_event; $_l_Green; $_l_Insert; $_l_Red; $_l_Row; $_l_Selected; $_l_TestColourRow)
	C_LONGINT:C283($_l_UpdatedActionRow; $_l_UpdatedUserRow; SD_l_BlackFont; SD_l_CurrentRandomColour; SD_l_CurrentSelectedUser; SD_l_WhiteFont)
	C_TEXT:C284(SD_t_CurrentActionCode; SD_t_CurrentSelectedActionCode)
End if 
//Code Starts Here
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		///$_l_Row:=0
		LISTBOX SELECT ROW:C912(*; "oActionCodesListbox"; $_l_Row)
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
		If ($_l_Selected>0)
			SD_t_CurrentActionCode:=SD_at_ActionCodes{$_l_Selected}
			$_l_ColourUserRow:=Find in array:C230(SD_al_ColourUsers; SD_l_CurrentSelectedUser)
			If ($_l_ColourUserRow<0)
				INSERT IN ARRAY:C227(SD_al_ColourUsers; Size of array:C274(SD_al_ColourUsers)+1; 1)
				SD_al_ColourUsers{Size of array:C274(SD_al_ColourUsers)}:=SD_l_CurrentSelectedUser
				$_l_ColourUserRow:=Size of array:C274(SD_al_ColourUsers)
			End if 
			
			SD_t_CurrentSelectedActionCode:=SD_at_ColourActionCode{$_l_Selected}
			$_l_ActionRow:=Find in array:C230(SD_at_AllDiaryActions; SD_t_CurrentSelectedActionCode)
			If ($_l_ActionRow<0)
				INSERT IN ARRAY:C227(SD_at_AllDiaryActions; Size of array:C274(SD_at_AllDiaryActions)+1; 1)
				SD_at_AllDiaryActions{Size of array:C274(SD_at_AllDiaryActions)}:=SD_t_CurrentSelectedActionCode
				$_l_ActionRow:=Size of array:C274(SD_at_AllDiaryActions)
			End if 
			If (Size of array:C274(SD_al_CurrentUserRedsAccent)<$_l_ColourUserRow)
				$_l_Insert:=$_l_ColourUserRow-(Size of array:C274(SD_al_CurrentUserRedsAccent))
				INSERT IN ARRAY:C227(SD_al_CurrentUserRedsAccent; Size of array:C274(SD_al_CurrentUserRedsAccent)+1; 1)
				INSERT IN ARRAY:C227(SD_al_CurrentUserGreensAccent; Size of array:C274(SD_al_CurrentUserGreensAccent)+1; 1)
				INSERT IN ARRAY:C227(SD_al_CurrentUserBluesAccent; Size of array:C274(SD_al_CurrentUserBluesAccent)+1; 1)
				INSERT IN ARRAY:C227(SD_al_CurrentUserRedsFill; Size of array:C274(SD_al_CurrentUserRedsFill)+1; 1)
				INSERT IN ARRAY:C227(SD_al_CurrentUserGreensFill; Size of array:C274(SD_al_CurrentUserGreensFill)+1; 1)
				INSERT IN ARRAY:C227(SD_al_CurrentUserBluesFill; Size of array:C274(SD_al_CurrentUserBluesFill)+1; 1)
				//INSERT ELEMENT(SD_l_CurrentUserWhiteFont;Size of array(SD_l_CurrentUserWhiteFont)+1;1)
				
			End if 
			If (Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_ColourUserRow})<$_l_ActionRow)
				$_l_Insert:=$_l_ActionRow-(Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}))
				INSERT IN ARRAY:C227(SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_ColourUserRow})+1; $_l_Insert)
				INSERT IN ARRAY:C227(SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserGreensAccent{$_l_ColourUserRow})+1; $_l_Insert)
				INSERT IN ARRAY:C227(SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserBluesAccent{$_l_ColourUserRow})+1; $_l_Insert)
				INSERT IN ARRAY:C227(SD_al_CurrentUserRedsFill{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserRedsFill{$_l_ColourUserRow})+1; $_l_Insert)
				INSERT IN ARRAY:C227(SD_al_CurrentUserGreensFill{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserGreensFill{$_l_ColourUserRow})+1; $_l_Insert)
				INSERT IN ARRAY:C227(SD_al_CurrentUserBluesFill{$_l_ColourUserRow}; Size of array:C274(SD_al_CurrentUserBluesFill{$_l_ColourUserRow})+1; $_l_Insert)
				//INSERT ELEMENT(SD_l_CurrentUserWhiteFont{$_l_ColourUserRow};Size of array(SD_l_CurrentUserWhiteFont{$_l_ColourUserRow})+1;$_l_Insert)
				$_bo_UseRandom:=False:C215
				If (SD_l_CurrentSelectedUser>0)
					$_l_UpdatedUserRow:=Find in array:C230(SD_al_ColourUsers; 0)
					If ($_l_UpdatedUserRow>0)
						$_l_UpdatedActionRow:=Find in array:C230(SD_at_AllDiaryActions; SD_t_CurrentSelectedActionCode)
						If ($_l_UpdatedActionRow>0)
							If (Size of array:C274(SD_al_CurrentUserRedsAccent)>=$_l_UpdatedUserRow)
								If (Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_UpdatedUserRow})>=$_l_UpdatedActionRow)
									SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserRedsAccent{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserGreensAccent{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserBluesAccent{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									SD_al_CurrentUserRedsFill{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserRedsFill{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									SD_al_CurrentUserGreensFill{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserGreensFill{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									SD_al_CurrentUserBluesFill{$_l_ColourUserRow}{$_l_ActionRow}:=SD_al_CurrentUserBluesFill{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									//SD_l_CurrentUserWhiteFont{$_l_ColourUserRow}{$_l_ActionRow}:=SD_l_CurrentUserWhiteFont{$_l_UpdatedUserRow}{$_l_UpdatedActionRow}
									
								Else 
									$_bo_UseRandom:=True:C214
									//use next random
								End if 
								
							Else 
								//use next random
								$_bo_UseRandom:=True:C214
							End if 
						Else 
							//use next random
							$_bo_UseRandom:=True:C214
						End if 
						
						
					Else 
						//next random colour
						$_bo_UseRandom:=True:C214
					End if 
				Else 
					$_bo_UseRandom:=True:C214
					
				End if 
				If ($_bo_UseRandom)
					$_l_CurrentRandomColour:=SD_l_CurrentRandomColour+1
					If ($_l_CurrentRandomColour>255)
						$_l_CurrentRandomColour:=($_l_CurrentRandomColour-255)
					End if 
					$_l_TestColourRow:=Find in array:C230(SD_al_NormalColours; $_l_CurrentRandomColour)
					If ($_l_TestColourRow<0)
						Repeat 
							If ($_l_CurrentRandomColour>255)
								$_l_CurrentRandomColour:=($_l_CurrentRandomColour-255)
							Else 
								$_l_CurrentRandomColour:=$_l_CurrentRandomColour+1
							End if 
							$_l_TestColourRow:=Find in array:C230(SD_al_NormalColours; $_l_CurrentRandomColour)
						Until ($_l_TestColourRow>0)
					End if 
					
					SD_l_CurrentRandomColour:=$_l_CurrentRandomColour
					
					//AG 4DCOLOR TO RGB ((SD_l_CurrentRandomColour);$_l_Red;$_l_Green;$_l_Blue)
					SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Red
					SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Green
					SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Blue
					
					If ($_l_CurrentRandomColour<=8)
						$_l_CurrentRandomColour:=$_l_CurrentRandomColour+8
						
					Else 
						$_l_CurrentRandomColour:=$_l_CurrentRandomColour-((7*16)-1)
					End if 
					//AG 4DCOLOR TO RGB ($_l_CurrentRandomColour;$_l_Red;$_l_Green;$_l_Blue)
					SD_al_CurrentUserRedsFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Red
					SD_al_CurrentUserGreensFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Green
					SD_al_CurrentUserBluesFill{$_l_ColourUserRow}{$_l_ActionRow}:=$_l_Blue
					
					
				End if 
				
				
			End if 
			//CW SET RGB COLOR (SD_l_AgendaColourWell;SD_al_CurrentUserRedsFill{$_l_ColourUserRow}{$_l_ActionRow};SD_al_CurrentUserGreensFill{$_l_ColourUserRow}{$_l_ActionRow};SD_al_CurrentUserBluesFill{$_l_ColourUserRow}{$_l_ActionRow})
			//CW SET RGB COLOR (SD_l_AgendaColourWell2;SD_al_CurrentUserRedsAccent{$_l_ColourUserRow}{$_l_ActionRow};SD_al_CurrentUserGreensAccent{$_l_ColourUserRow}{$_l_ActionRow};SD_al_CurrentUserBluesAccent{$_l_ColourUserRow}{$_l_ActionRow})
			If (False:C215)
				//If (SD_l_CurrentUserWhiteFont{$_l_ColourUserRow}{$_l_ActionRow}=1)
				SD_l_WhiteFont:=1
				SD_l_BlackFont:=0
				//Else
				SD_l_WhiteFont:=0
				SD_l_BlackFont:=1
				//End if
			End if 
			
		End if 
		
End case 
