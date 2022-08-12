If (False:C215)
	//Table Form Method Name: [USER]SD_ColourSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 12:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_UpdatesMade;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY LONGINT(SD_al_NormalColours;0)
	//ARRAY LONGINT(SD_al_SettingsPeopleIDs;0)
	//ARRAY LONGINT(SD_al_UpdatedUsers;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ColourActionCode;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_SettingsPeopleNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bo_AGLoadUserNames; SD_bo_DefaultToCurrentUser)
	C_LONGINT:C283($_l_Colour; $_l_CurrentRow; $_l_event; $_l_Index; $_l_PersonRow; $_l_Skipper; SD_l_CurrentRandomColour; SD_l_CurrentSelectedUser; SD_l_CurrentUserID)
	C_POINTER:C301($_ptr_Picture)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentSelectedActionCode; SD_t_CurrentUserName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD_ColourSettings"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SD_ColourSettings")
		WS_AutoscreenSize(3; 470; 560)
		INT_SetDialog
		//Get a list of user
		
		SD_t_CurrentSelectedActionCode:=""
		ARRAY LONGINT:C221(SD_al_NormalColours; 256)
		$_l_CurrentRow:=0
		$_l_Skipper:=0
		//Default colour cut down to 1 colour a blue
		For ($_l_Index; 211; 211)  //(was 145-256)
			$_l_Skipper:=$_l_Skipper+1
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD_al_NormalColours{$_l_CurrentRow}:=$_l_Index
			If ($_l_Skipper=6)
				$_l_Index:=$_l_Index+9
			End if 
		End for 
		ARRAY LONGINT:C221(SD_al_NormalColours; $_l_CurrentRow)
		TRACE:C157
		
		For ($_l_Index; 1; 256)
			//$_l_Colour:=-(0+(256*($_l_Index-1)))
			//Color:=–(Foreground+(256 * Background))
			$_ptr_Picture:=Get pointer:C304("SD_pic_FillColorPicture"+String:C10($_l_Index))
			
			//_O_OBJECT SET COLOR($_ptr_Picture->;$_l_Colour)
			//$_l_ForegroundColour:=UTIL_4DColorToRGB (9)
			//$_l_BackgroundColour:=UTIL_4DColorToRGB (61952/256)
			OBJECT SET RGB COLORS:C628($_ptr_Picture->; UTIL_4DColorToRGB(0); UTIL_4DColorToRGB($_l_Index-1))
			
			$_ptr_Picture:=Get pointer:C304("SD_pic_AccentColorPicture"+String:C10($_l_Index))
			//_O_OBJECT SET COLOR($_ptr_Picture->;$_l_Colour)
			OBJECT SET RGB COLORS:C628($_ptr_Picture->; UTIL_4DColorToRGB(0); UTIL_4DColorToRGB($_l_Index-1))
			
		End for 
		ARRAY LONGINT:C221(SD_al_UpdatedUsers; 1)
		ARRAY BOOLEAN:C223(SD_abo_UpdatesMade; 1)
		SD_abo_UpdatesMade{1}:=False:C215
		ARRAY LONGINT:C221(SD_al_SettingsPeopleIDs; 0)
		ARRAY TEXT:C222(SD_at_SettingsPeopleNames; 0)
		If (SD_bo_AGLoadUserNames)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD_al_SettingsPeopleIDs; [PERSONNEL:11]Name:2; SD_at_SettingsPeopleNames)
			SORT ARRAY:C229(SD_at_SettingsPeopleNames; SD_al_SettingsPeopleIDs)
			INSERT IN ARRAY:C227(SD_at_SettingsPeopleNames; Size of array:C274(SD_at_SettingsPeopleNames)+1; 2)
			SD_at_SettingsPeopleNames{Size of array:C274(SD_at_SettingsPeopleNames)-1}:="-"
			SD_at_SettingsPeopleNames{Size of array:C274(SD_at_SettingsPeopleNames)}:="Default Settings"
			SD_al_UpdatedUsers{1}:=0
		End if 
		
		Case of 
			: ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator"))) & ((SD_bo_AGLoadUserNames))
				//Load All The actions
				ALL RECORDS:C47([ACTIONS:13])
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_ColourActionCode; [ACTIONS:13]Action_Name:2; SD_at_ActionCodes)
				SORT ARRAY:C229(SD_at_ActionCodes; SD_at_ColourActionCode; >)
				If (SD_bo_DefaultToCurrentUser=True:C214)
					SD_LoadPrefs(SD_l_CurrentUserID)
					$_l_PersonRow:=Find in array:C230(SD_al_SettingsPeopleIDs; SD_l_CurrentUserID)
					SD_t_CurrentUserName:=SD_at_SettingsPeopleNames{$_l_PersonRow}
					SD_l_CurrentSelectedUser:=SD_l_CurrentUserID
				Else 
					
					SD_t_CurrentUserName:="DefaultSettings"
					SD_at_ActionCodes:=0
					SD_l_CurrentSelectedUser:=0
				End if 
				
				OBJECT SET VISIBLE:C603(SD_at_SettingsPeopleNames; True:C214)
				
			Else 
				SD_al_UpdatedUsers{1}:=SD_l_CurrentUserID
				If (SD_bo_AGLoadUserNames)
					$_l_PersonRow:=Find in array:C230(SD_al_SettingsPeopleIDs; SD_l_CurrentUserID)
				Else 
					$_l_PersonRow:=1
				End if 
				
				If ($_l_PersonRow>0)
					SD_LoadPrefs(SD_l_CurrentUserID)
					
					ARRAY TEXT:C222(SD_at_ColourActionCode; Size of array:C274(SD_ai_ActionCodes))
					ARRAY TEXT:C222(SD_at_ActionCodes; Size of array:C274(SD_ai_ActionCodes))
					$_l_CurrentRow:=0
					For ($_l_Index; 1; Size of array:C274(SD_at_ActionCodes))
						If (SD_ai_ActionCodes{$_l_Index}>0)
							$_l_CurrentRow:=$_l_CurrentRow+1
							SD_at_ColourActionCode{$_l_CurrentRow}:=SD_at_ActionCodes{$_l_Index}
							SD_at_ActionCodes{$_l_CurrentRow}:=SD_at_DiaryActionNames{$_l_Index}
						End if 
					End for 
					ARRAY TEXT:C222(SD_at_ColourActionCode; $_l_CurrentRow)
					ARRAY TEXT:C222(SD_at_ActionCodes; $_l_CurrentRow)
					SORT ARRAY:C229(SD_at_ActionCodes; SD_at_ColourActionCode; >)
					If (SD_bo_AGLoadUserNames)
						SD_t_CurrentUserName:=SD_at_SettingsPeopleNames{$_l_PersonRow}
					Else 
						SD_t_CurrentUserName:=[PERSONNEL:11]Name:2
					End if 
					
					SD_l_CurrentSelectedUser:=SD_l_CurrentUserID
					If (User in group:C338(Current user:C182; "Administrator"))
						OBJECT SET VISIBLE:C603(SD_at_SettingsPeopleNames; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(SD_at_SettingsPeopleNames; False:C215)
					End if 
				Else 
					//?
					CANCEL:C270  //?
				End if 
				
		End case 
		
		//if the user is in group administrators or Designer `
		//default to showing default settings
		//if the user is not then show their setting(copy default to their settings if first time)
End case 
ERR_MethodTrackerReturn("FM [USER].SD_ColourSettings"; $_t_oldMethodName)
