//%attributes = {}
If (False:C215)
	//Project Method Name:      AG_SetDiaryColours
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ColourUsers;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesFill;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensFill;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsAccent;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsFill;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	C_BOOLEAN:C305($_bo_UseRandomColour; SD_bo_AgendaPrefsLoaded)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ActionPosition; $_l_BlueAccent; $_l_BlueFill; $_l_GreenAccent; $_l_GreenFill; $_l_PersonPosition; $_l_RedAccent; $_l_RedFill; $SD_l_CurrentRandomColour; SD_l_CurrentRandomColour)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AG_SetDiaryColours")
//This method will set the diary colours on the record-this is called when saving a diary record
$_bo_UseRandomColour:=False:C215

If (Not:C34(SD_bo_AgendaPrefsLoaded))
	SD_GetColourPreferences
End if 
//QUERY([PERSONNEL];[PERSONNEL]Initials=◊UserID)
$_l_PersonPosition:=Find in array:C230(SD_al_ColourUsers; <>PER_l_CurrentUserID)
If ($_l_PersonPosition<0)
	//get the default
	$_l_PersonPosition:=Find in array:C230(SD_al_ColourUsers; 0)
	If ($_l_PersonPosition<0)
		//use the randomiser
		$_bo_UseRandomColour:=True:C214
	Else 
		$_l_ActionPosition:=Find in array:C230(SD_at_AllDiaryActions; [DIARY:12]Action_Code:9)
		If ($_l_ActionPosition<0)  //use the randomiser
			$_bo_UseRandomColour:=True:C214
		Else 
			If (Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_PersonPosition})>=$_l_ActionPosition)
				$_l_RedFill:=SD_al_CurrentUserRedsFill{$_l_PersonPosition}{$_l_ActionPosition}
				$_l_GreenFill:=SD_al_CurrentUserGreensFill{$_l_PersonPosition}{$_l_ActionPosition}
				$_l_BlueFill:=SD_al_CurrentUserBluesFill{$_l_PersonPosition}{$_l_ActionPosition}
				$_l_RedAccent:=SD_al_CurrentUserRedsAccent{$_l_PersonPosition}{$_l_ActionPosition}
				$_l_GreenAccent:=SD_al_CurrentUserGreensAccent{$_l_PersonPosition}{$_l_ActionPosition}
				$_l_BlueAccent:=SD_al_CurrentUserBluesAccent{$_l_PersonPosition}{$_l_ActionPosition}
				
			Else 
				//use the randomiser
				$_bo_UseRandomColour:=True:C214
			End if 
			
		End if 
	End if 
	
Else 
	
	$_l_ActionPosition:=Find in array:C230(SD_at_AllDiaryActions; [DIARY:12]Action_Code:9)
	If ($_l_ActionPosition<0)  //use the randomiser
		$_bo_UseRandomColour:=True:C214
	Else 
		If (Size of array:C274(SD_al_CurrentUserRedsAccent{$_l_PersonPosition})>=$_l_ActionPosition)
			$_l_RedFill:=SD_al_CurrentUserRedsFill{$_l_PersonPosition}{$_l_ActionPosition}
			$_l_GreenFill:=SD_al_CurrentUserGreensFill{$_l_PersonPosition}{$_l_ActionPosition}
			$_l_BlueFill:=SD_al_CurrentUserBluesFill{$_l_PersonPosition}{$_l_ActionPosition}
			$_l_RedAccent:=SD_al_CurrentUserRedsAccent{$_l_PersonPosition}{$_l_ActionPosition}
			$_l_GreenAccent:=SD_al_CurrentUserGreensAccent{$_l_PersonPosition}{$_l_ActionPosition}
			$_l_BlueAccent:=SD_al_CurrentUserBluesAccent{$_l_PersonPosition}{$_l_ActionPosition}
		Else 
			//use the randomiser
			$_bo_UseRandomColour:=True:C214
		End if 
		
	End if 
	
End if 
If ($_bo_UseRandomColour)
	$SD_l_CurrentRandomColour:=SD_l_CurrentRandomColour+16
	If ($SD_l_CurrentRandomColour>255)
		$SD_l_CurrentRandomColour:=($SD_l_CurrentRandomColour-255)
	End if 
	SD_l_CurrentRandomColour:=$SD_l_CurrentRandomColour
	//AG 4DCOLOR TO RGB (SD_l_CurrentRandomColour;$_l_RedAccent;$_l_GreenAccent;$_l_BlueAccent) AGENDA OUT
	If ($SD_l_CurrentRandomColour<=8)
		$SD_l_CurrentRandomColour:=$SD_l_CurrentRandomColour+8
	Else 
		$SD_l_CurrentRandomColour:=$SD_l_CurrentRandomColour-8
	End if 
	//AG 4DCOLOR TO RGB ($SD_l_CurrentRandomColour;$_l_RedFill;$_l_GreenFill;$_l_BlueFill) AGENDA OUT
End if 
If (False:C215)
	[DIARY:12]AGFillColourBlue:59:=$_l_BlueFill
	[DIARY:12]AGFillColourGreen:58:=$_l_GreenFill
	[DIARY:12]AGFillColourRed:57:=$_l_RedFill
	[DIARY:12]AGAccentColourBlue:62:=$_l_BlueAccent
	[DIARY:12]AGAccentColourGreen:61:=$_l_GreenAccent
	[DIARY:12]AGAccentColourRed:60:=$_l_RedAccent
End if 
ERR_MethodTrackerReturn("AG_SetDiaryColours"; $_t_oldMethodName)
