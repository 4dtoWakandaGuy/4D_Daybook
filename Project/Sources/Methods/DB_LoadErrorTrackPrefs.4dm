//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_LoadErrorTrackPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>DM_ai_UserTrackActive;0)
	ARRAY INTEGER:C220($_ai_UserTrackActive; 0)
	//ARRAY INTEGER(DM_ai_UserTrackActive;0)
	ARRAY LONGINT:C221($_al_ListProcs; 0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(<>DB_at_UserInitials;0)
	//ARRAY TEXT(<>DM_at_UserNames;0)
	ARRAY TEXT:C222($_at_ClientList; 0)
	ARRAY TEXT:C222($_at_UserInitials; 0)
	ARRAY TEXT:C222($_at_UserNames; 0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(DB_at_UserInitials;0)
	//ARRAY TEXT(DM_at_UserNames;0)
	C_BOOLEAN:C305(<>DB_bo_PrefsLoaded; $_bo_PrefsLoaded; $_bo_Setting; $1; AA_bo_ListsInited; DB_bo_PrefsLoaded)
	C_LONGINT:C283(<>DB_l_GenerateLogOnServer; <>DB_l_LocalLog; <>DB_l_TrackPath; $_l_index; $_l_indextemID; $_l_offset; $_l_PersonRow; DB_l_GenerateLogOnServer; DB_l_LocalLog; DB_l_MyLocalLog; DB_l_myTrackPath)
	C_LONGINT:C283(DB_l_TrackPath)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentClient; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadErrorTrackPrefs")
If (Count parameters:C259>0)
	<>DB_bo_PrefsLoaded:=$1
End if 

If (Count parameters:C259>1)
	$_t_CurrentClient:=$2
End if 



If (Not:C34(AA_bo_ListsInited))
	While (Semaphore:C143("$LoadingListofLists"))
		DelayTicks(6)
	End while 
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	//ARRAY STRING(55;AA_at_aallListNames;0)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	//On THIS FORM we do need all the list IDs
	//ALL RECORDS([x_Lists])
	//SELECTION TO ARRAY([x_Lists]x_ID;AA_al_aallListIDs;[x_Lists]x_ListName;AA_at_aallListNames)
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 


//$_t_oldMethodName:=ERR_MethodTracker ("DB_LoadErrorTrackPrefs")
//this method loads the prefs for a pipeline

$_bo_PrefsLoaded:=<>DB_bo_PrefsLoaded
START_SEMAPHORE("$LoadingPreferences")
If (Not:C34(<>DB_bo_PrefsLoaded))
	ARRAY TEXT:C222(<>DB_at_UserInitials; 0)
	ARRAY INTEGER:C220(<>DM_ai_UserTrackActive; 0)
	ARRAY TEXT:C222(<>DM_at_UserNames; 0)
	ARRAY TEXT:C222(DB_at_UserInitials; 0)
	ARRAY INTEGER:C220(DM_ai_UserTrackActive; 0)
	ARRAY TEXT:C222(DM_at_UserNames; 0)
	While (Semaphore:C143("LoadingErrortrackPrefs"))
		DelayTicks(2)
	End while 
	$_l_indextemID:=PREF_GetPreferenceID("Error Tracking Preferences")
	DB_l_TrackPath:=0
	DB_l_LocalLog:=0
	DB_l_GenerateLogOnServer:=0
	READ ONLY:C145([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_indextemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_indexTEMID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(DB_l_TrackPath; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_l_LocalLog; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_l_GenerateLogOnServer; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_TrackPath; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_LocalLog; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_GenerateLogOnServer; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //individual settings
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>DM_ai_UserTrackActive; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>DB_at_UserInitials; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>DM_at_UserNames; $_l_offset)
		End if 
	End if 
	CLEAR SEMAPHORE:C144("LoadingErrortrackPrefs")
	
	DB_bo_PrefsLoaded:=True:C214
Else 
	DB_l_TrackPath:=<>DB_l_TrackPath
	DB_l_LocalLog:=<>DB_l_TrackPath
	DB_bo_PrefsLoaded:=<>DB_bo_PrefsLoaded
	DB_l_GenerateLogOnServer:=<>DB_l_GenerateLogOnServer
End if 
Stop_Semaphore("$LoadingPreferences")
If (DB_l_TrackPath=0)
	DB_l_LocalLog:=0
End if 
While (Semaphore:C143("$LoadingDmuserNames"))
	DelayTicks(2)
End while 
If (Size of array:C274(<>DM_at_UserNames)=0)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; <>DM_at_UserNames; [PERSONNEL:11]Initials:1; <>DB_at_UserInitials)
	ARRAY INTEGER:C220(<>DM_ai_UserTrackActive; Size of array:C274(<>DB_at_UserInitials))
	For ($_l_index; 1; Size of array:C274(<>DM_ai_UserTrackActive))
		<>DM_ai_UserTrackActive{$_l_index}:=DB_l_TrackPath
	End for 
Else 
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; $_at_UserNames; [PERSONNEL:11]Initials:1; $_at_UserInitials)
	ARRAY INTEGER:C220($_ai_UserTrackActive; Size of array:C274(<>DB_at_UserInitials))
	//bsw 28/11/03
	For ($_l_index; 1; Size of array:C274($_at_UserInitials))
		$_l_PersonRow:=Find in array:C230(<>DB_at_UserInitials; $_at_UserInitials{$_l_index})
		If ($_l_PersonRow<0)
			INSERT IN ARRAY:C227(<>DB_at_UserInitials; Size of array:C274(<>DB_at_UserInitials)+1; 1)
			INSERT IN ARRAY:C227(<>DM_at_UserNames; Size of array:C274(<>DM_at_UserNames)+1; 1)
			INSERT IN ARRAY:C227(<>DM_ai_UserTrackActive; Size of array:C274(<>DM_ai_UserTrackActive)+1; 1)
			<>DB_at_UserInitials{Size of array:C274(<>DB_at_UserInitials)}:=$_at_UserInitials{$_l_index}
			<>DM_at_UserNames{Size of array:C274(<>DM_at_UserNames)}:=$_at_UserNames{$_l_index}
		End if 
	End for 
	For ($_l_index; Size of array:C274(<>DB_at_UserInitials); 1; -1)
		$_l_PersonRow:=Find in array:C230($_at_UserInitials; <>DB_at_UserInitials{$_l_index})
		If ($_l_PersonRow<0)
			DELETE FROM ARRAY:C228(<>DB_at_UserInitials; $_l_index; 1)
			DELETE FROM ARRAY:C228(<>DM_at_UserNames; $_l_index; 1)
			DELETE FROM ARRAY:C228(<>DM_ai_UserTrackActive; $_l_index; 1)
		End if 
	End for 
End if 
COPY ARRAY:C226(<>DB_at_UserInitials; DB_at_UserInitials)
COPY ARRAY:C226(<>DM_at_UserNames; DM_at_UserNames)
COPY ARRAY:C226(<>DM_ai_UserTrackActive; DM_ai_UserTrackActive)
DB_l_myTrackPath:=DB_l_TrackPath
DB_l_MyLocalLog:=DB_l_LocalLog
If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
	$_l_PersonRow:=Find in array:C230(DB_at_UserInitials; <>PER_t_CurrentUserInitials)
	If ($_l_PersonRow>0)
		DB_l_MyTrackPath:=DM_ai_UserTrackActive{$_l_PersonRow}
		If (DB_l_MyTrackPath=0)
			DB_l_MyLocalLog:=0
		End if 
	End if 
End if 
CLEAR SEMAPHORE:C144("$LoadingDmuserNames")
If (<>DB_l_GenerateLogOnServer#DB_l_GenerateLogOnServer) | (<>DB_l_TrackPath#DB_l_MyTrackPath) | (<>DB_l_LocalLog#DB_l_MyLocalLog)
	
	If ((Application type:C494=4D Server:K5:6) & (DB_l_GenerateLogOnServer=1))
		
	Else 
		If (DB_l_LocalLog=1) & (Not:C34($_bo_PrefsLoaded))
			//setting has ben turned on
			Gen_Alert("If your system should crash. Please locate Object_access_Log.txt and mail it"+" to nigel.greenlee@daybook.co.uk"+" before you log back into the system. Thankyou")
		End if 
	End if 
	
End if 

<>DB_l_GenerateLogOnServer:=DB_l_GenerateLogOnServer
<>DB_l_TrackPath:=DB_l_MyTrackPath
<>DB_l_LocalLog:=DB_l_MyLocalLog
<>DB_bo_PrefsLoaded:=DB_bo_PrefsLoaded



If (Application type:C494=4D Server:K5:6)
	
	ARRAY TEXT:C222($_at_ClientList; 0)
	ARRAY LONGINT:C221($_al_ListProcs; 0)
	GET REGISTERED CLIENTS:C650($_at_ClientList; $_al_ListProcs)
	For ($_l_index; 1; Size of array:C274($_at_ClientList))
		If ($_t_CurrentClient#$_at_ClientList{$_l_index})
			$_bo_Setting:=False:C215
			EXECUTE ON CLIENT:C651($_at_ClientList{$_l_index}; "DB_LoadErrorTrackPrefs"; $_bo_Setting)
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("DB_LoadErrorTrackPrefs"; $_t_oldMethodName)