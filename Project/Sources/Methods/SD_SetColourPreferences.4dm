//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetColourPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_UpdatesMade;0)
	//ARRAY LONGINT(SD_al_ColourUsers;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserBluesFill;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserGreensFill;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsAccent;0;0)
	//ARRAY LONGINT(SD_al_CurrentUserRedsFill;0;0)
	//ARRAY LONGINT(SD_al_UpdatedUsers;0)
	//ARRAY TEXT(SD_at_AllDiaryActions;0)
	C_BOOLEAN:C305($_bo_UpdatesMade; $2; SD_bo_AgendaPrefsLoaded; SD_bo_AGLoadUserNames; SD_bo_DefaultToCurrentUser; SD_bo_SavePrefChanges)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_Index2; $_l_ItemID; $_l_offset; $_l_Process; $_l_ProcessState; $1; SD_l_AgendaDefaults; SD_l_CurrentRandomColour; SD_l_CurrentUserID)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetColourPreferences")
READ ONLY:C145([PREFERENCES:116])
While (Semaphore:C143("Loading Colour Preferences"))
	DelayTicks(2)
End while 
If (Count parameters:C259>=1)
	SD_l_CurrentUserID:=$1
End if 

If (Count parameters:C259>=2)
	//needed so if called from personnel record not reset current record pointer
	SD_bo_AGLoadUserNames:=$2
Else 
	SD_bo_AGLoadUserNames:=True:C214
End if 
If (Count parameters:C259>=3)
	//This is only required so administrators get their own settings rather that default settings, but can still switch to other users
	//it is only used in the section defaulting the pop-up when it is an administrator
	SD_bo_DefaultToCurrentUser:=True:C214
Else 
	SD_bo_DefaultToCurrentUser:=True:C214
End if 

While (Semaphore:C143("LoadingPrefsAGcol3"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Agenda Colour Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsAGcol3")

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
	//SD_AgendaSetDefaultColours
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
Else 
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
	
End if 
//Here we set up this user
SD_bo_SavePrefChanges:=False:C215
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
DIALOG:C40([USER:15]; "SD_ColourSettings")
If (SD_bo_SavePrefChanges)
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	
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
	//````
End if 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
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

CLEAR SEMAPHORE:C144("Loading Colour Preferences")
$_bo_UpdatesMade:=False:C215
For ($_l_Index; 1; Size of array:C274(SD_al_UpdatedUsers))
	If (SD_abo_UpdatesMade{$_l_Index})
		$_bo_UpdatesMade:=True:C214
	End if 
End for 
If ($_bo_UpdatesMade)
	Gen_Confirm("You have changed Colours, do you wish to update existing diary records to this sc"+"hema?"; "Yes"; "No")
	If (OK=1)
		For ($_l_Index; 1; Size of array:C274(SD_al_UpdatedUsers))
			If (SD_abo_UpdatesMade{$_l_Index})
				For ($_l_Index2; 1; Size of array:C274(SD_al_UpdatedUsers))
					$_l_Process:=New process:C317("SD_AgendaDiaryReset"; 64000; "Update Diary"+String:C10(SD_al_UpdatedUsers); SD_al_UpdatedUsers{$_l_Index2})
				End for 
			End if 
			
		End for 
		
	End if 
End if 
//````
ERR_MethodTrackerReturn("SD_SetColourPreferences"; $_t_oldMethodName)
