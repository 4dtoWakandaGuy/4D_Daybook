//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SavePrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>DM_ai_UserTrackActive;0)
	//ARRAY INTEGER(DM_ai_UserTrackActive;0)
	//ARRAY TEXT(DB_at_UserInitials;0)
	//ARRAY TEXT(DM_at_UserNames;0)
	C_BOOLEAN:C305(<>DB_bo_PrefsLoaded; $_bo_Setting; $_bo_UsersChanged)
	C_LONGINT:C283(<>DB_l_GenerateLogOnServer; <>DB_l_LocalLog; <>DB_l_TrackPath; $_l_GenerateLogOnServer; $_l_Index; $_l_ItemID; $_l_LocalLog; $_l_offset; $_l_TrackPath; $_l_TrackProcess; DB_l_GenerateLogOnServer)
	C_LONGINT:C283(DB_l_LocalLog; DB_l_TrackPath)
	C_TEXT:C284($_t_CurrentUser; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SavePrefs")
// DB_SavePrefs
$_l_TrackPath:=<>DB_l_TrackPath
$_l_LocalLog:=<>DB_l_LocalLog
$_l_GenerateLogOnServer:=<>DB_l_GenerateLogOnServer
$_bo_UsersChanged:=False:C215
If (Size of array:C274(DM_ai_UserTrackActive)=Size of array:C274(<>DM_ai_UserTrackActive))
	For ($_l_Index; 1; Size of array:C274(DM_ai_UserTrackActive))
		If (DM_ai_UserTrackActive{$_l_Index}#<>DM_ai_UserTrackActive{$_l_Index})
			$_bo_UsersChanged:=True:C214
		End if 
	End for 
Else 
	$_bo_UsersChanged:=True:C214
End if 
While (Semaphore:C143("LoadingErrortrackPrefs"))
	DelayTicks(2)
End while 
<>DB_bo_PrefsLoaded:=False:C215
$_l_ItemID:=PREF_GetPreferenceID("Error Tracking Preferences")
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(DB_l_TrackPath; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_l_LocalLog; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_l_GenerateLogOnServer; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_ai_UserTrackActive; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_at_UserInitials; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_at_UserNames; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(DB_l_TrackPath; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_l_LocalLog; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_l_GenerateLogOnServer; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_ai_UserTrackActive; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DB_at_UserInitials; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_at_UserNames; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
End if 
CLEAR SEMAPHORE:C144("LoadingErrortrackPrefs")

If ($_l_TrackPath#DB_l_TrackPath) | ($_l_LocalLog#DB_l_LocalLog) | ($_l_GenerateLogOnServer#DB_l_GenerateLogOnServer) | ($_bo_UsersChanged)
	
	<>DB_l_TrackPath:=0
	<>DB_l_LocalLog:=0
	<>DB_l_GenerateLogOnServer:=0
	<>DB_bo_PrefsLoaded:=False:C215
	//reload the settings
	
	DB_LoadErrorTrackPrefs
	
	If (Application type:C494=4D Remote mode:K5:5)
		$_bo_Setting:=False:C215
		$_t_CurrentUser:=Current system user:C484
		$_l_TrackProcess:=Execute on server:C373("DB_LoadErrorTrackPrefs"; 64000; "Reload Err prefs"; $_bo_Setting; $_t_CurrentUser)
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SavePrefs"; $_t_oldMethodName)