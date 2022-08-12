//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetColourPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	C_BOOLEAN:C305(SD_bo_AgendaPrefsLoaded)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_offset; $_l_ProcessState; SD_l_AgendaDefaults; SD_l_CurrentRandomColour)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetColourPreferences")
READ ONLY:C145([PREFERENCES:116])

While (Semaphore:C143("Loading Colour Preferences"))
	DelayTicks(2)
End while 

While (Semaphore:C143("LoadingPrefsAGCol2"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Agenda Colour Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsAGCol2")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
SD_bo_AgendaPrefsLoaded:=True:C214

ARRAY LONGINT:C221(SD_al_ColourUsers; 0)
ARRAY TEXT:C222(SD_at_AllDiaryActions; 0)

ARRAY LONGINT:C221(SD_al_CurrentUserRedsAccent; 0; 0)
ARRAY LONGINT:C221(SD_al_CurrentUserGreensAccent; 0; 0)
ARRAY LONGINT:C221(SD_al_CurrentUserBluesAccent; 0; 0)
ARRAY LONGINT:C221(SD_al_CurrentUserRedsFill; 0; 0)
ARRAY LONGINT:C221(SD_al_CurrentUserGreensFill; 0; 0)
ARRAY LONGINT:C221(SD_al_CurrentUserBluesFill; 0; 0)
//ARRAY LONGINT(SD_l_CurrentUserWhiteFont;0;0)

If (Records in selection:C76([PREFERENCES:116])=0)
	//Here we set up this user
	//Open window(40;80;600;600;4)
	//DIALOG([USER];"SD_l_ColourSettings")
	SD_AgendaSetDefaultColours
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
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
	SD_l_AgendaDefaults:=New process:C317("SD_AgendaSetDefaultColours"; 64000; "Set Default agenda colours")
	Repeat 
		$_l_ProcessState:=Process state:C330(SD_l_AgendaDefaults)
		If ($_l_ProcessState>=0)
			DelayTicks(2)
		End if 
	Until ($_l_ProcessState<0)
	
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
End if 
$_l_offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_l_CurrentRandomColour; $_l_offset)
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_ColourUsers; $_l_offset)
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_AllDiaryActions; $_l_offset)
ARRAY LONGINT:C221(SD_al_CurrentUserRedsAccent; Size of array:C274(SD_al_ColourUsers); 0)
ARRAY LONGINT:C221(SD_al_CurrentUserGreensAccent; Size of array:C274(SD_al_ColourUsers); 0)
ARRAY LONGINT:C221(SD_al_CurrentUserBluesAccent; Size of array:C274(SD_al_ColourUsers); 0)
ARRAY LONGINT:C221(SD_al_CurrentUserRedsFill; Size of array:C274(SD_al_ColourUsers); 0)
ARRAY LONGINT:C221(SD_al_CurrentUserGreensFill; Size of array:C274(SD_al_ColourUsers); 0)
ARRAY LONGINT:C221(SD_al_CurrentUserBluesFill; Size of array:C274(SD_al_ColourUsers); 0)
//ARRAY LONGINT(SD_l_CurrentUserWhiteFont;Size of array(SD_al_ColourUsers);0)
For ($_l_Index; 1; Size of array:C274(SD_al_ColourUsers))
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserRedsAccent{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserGreensAccent{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserBluesAccent{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserRedsFill{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserGreensFill{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_CurrentUserBluesFill{$_l_Index}; $_l_offset)
	//BLOB TO VARIABLE([Preferences]DataBlob;SD_l_CurrentUserWhiteFont{$_l_Index};$_l_offset)
End for 
//````
CLEAR SEMAPHORE:C144("Loading Colour Preferences")

//````
ERR_MethodTrackerReturn("SD_GetColourPreferences"; $_t_oldMethodName)