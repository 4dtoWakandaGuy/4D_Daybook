//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AgendaSetDefaultColours
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ColourUsers;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesFill;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensFill;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsFill;0;0)
	//ARRAY LONGINT(SD_al_NormalColours;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	//ARRAY TEXT(SD_at_ColourActionCode;0)
	C_LONGINT:C283($_l_Blue; $_l_ColourRow; $_l_CurrentRandomColour; $_l_CurrentRow; $_l_Green; $_l_Index; $_l_ItemID; $_l_Red; $_l_Skipper; SD_l_CurrentRandomColour)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AgendaSetDefaultColours")
//NG October 2004
//this method is caled by SD_GetColourPreferences
//it should only be called once, when the system is initialised
//it will set default colours for different actions.
// note that it is called as a process because we do not want to change the selection of actions in the diary process
ARRAY TEXT:C222(SD_at_ColourActionCode; 0)



While (Semaphore:C143("LoadingPrefsAGCol"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Agenda Colour Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsAGCol")

ARRAY LONGINT:C221(SD_al_ColourUsers; 1)
ARRAY TEXT:C222(SD_at_AllDiaryActions; 0)
ALL RECORDS:C47([ACTIONS:13])
SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD_at_ColourActionCode)
ARRAY TEXT:C222(SD_at_AllDiaryActions; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserRedsAccent; 1; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserGreensAccent; 1; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserBluesAccent; 1; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserRedsFill; 1; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserGreensFill; 1; Size of array:C274(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_CurrentUserBluesFill; 1; Size of array:C274(SD_at_ColourActionCode))
//ARRAY LONGINT(SD_l_CurrentUserWhiteFont;1;Size of array(SD_at_ColourActionCode))
ARRAY LONGINT:C221(SD_al_NormalColours; 256)
$_l_CurrentRow:=0
$_l_Skipper:=0
For ($_l_Index; 145; 256)
	$_l_Skipper:=$_l_Skipper+1
	$_l_CurrentRow:=$_l_CurrentRow+1
	SD_al_NormalColours{$_l_CurrentRow}:=$_l_Index
	If ($_l_Skipper=6)
		$_l_Index:=$_l_Index+9
	End if 
End for 
ARRAY LONGINT:C221(SD_al_NormalColours; $_l_CurrentRow)

For ($_l_Index; 1; Size of array:C274(SD_at_ColourActionCode))
	SD_at_AllDiaryActions{$_l_Index}:=SD_at_ColourActionCode{$_l_Index}
	$_l_CurrentRandomColour:=SD_l_CurrentRandomColour+16
	If ($_l_CurrentRandomColour>255)
		$_l_CurrentRandomColour:=($_l_CurrentRandomColour-255)
	End if 
	$_l_ColourRow:=Find in array:C230(SD_al_NormalColours; $_l_CurrentRandomColour)
	If ($_l_ColourRow<0)
		Repeat 
			If ($_l_CurrentRandomColour>255)
				$_l_CurrentRandomColour:=($_l_CurrentRandomColour-255)
			Else 
				$_l_CurrentRandomColour:=$_l_CurrentRandomColour+1
			End if 
			$_l_ColourRow:=Find in array:C230(SD_al_NormalColours; $_l_CurrentRandomColour)
		Until ($_l_ColourRow>0)
	End if 
	SD_l_CurrentRandomColour:=$_l_CurrentRandomColour
	//AG 4DCOLOR TO RGB ((SD_l_CurrentRandomColour);$_l_Red;$_l_Green;$_l_Blue)
	SD_al_CurrentUserRedsAccent{1}{$_l_Index}:=$_l_Red
	SD_al_CurrentUserGreensAccent{1}{$_l_Index}:=$_l_Green
	SD_al_CurrentUserBluesAccent{1}{$_l_Index}:=$_l_Blue
	
	If ($_l_CurrentRandomColour<=8)
		$_l_CurrentRandomColour:=$_l_CurrentRandomColour+8
		
	Else 
		$_l_CurrentRandomColour:=$_l_CurrentRandomColour-8
	End if 
	//AG 4DCOLOR TO RGB ($_l_CurrentRandomColour;$_l_Red;$_l_Green;$_l_Blue)AGENDA OUT
	SD_al_CurrentUserRedsFill{1}{$_l_Index}:=$_l_Red
	SD_al_CurrentUserGreensFill{1}{$_l_Index}:=$_l_Green
	SD_al_CurrentUserBluesFill{1}{$_l_Index}:=$_l_Blue
	//SD_l_CurrentUserWhiteFont{1}{$_l_Index}:=0
	
End for 
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
VARIABLE TO BLOB:C532(SD_l_CurrentRandomColour; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SD_al_ColourUsers; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(SD_at_AllDiaryActions; [PREFERENCES:116]DataBlob:2; *)
For ($_l_Index; 1; Size of array:C274(SD_al_CurrentUserRedsAccent))
	VARIABLE TO BLOB:C532(SD_al_CurrentUserRedsAccent{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD_al_CurrentUserGreensAccent{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD_al_CurrentUserBluesAccent{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD_al_CurrentUserRedsFill{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD_al_CurrentUserGreensFill{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD_al_CurrentUserBluesFill{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	//VARIABLE TO BLOB(SD_l_CurrentUserWhiteFont{$_l_Index};[Preferences]DataBlob;*)
End for 
DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
ERR_MethodTrackerReturn("SD_AgendaSetDefaultColours"; $_t_oldMethodName)
