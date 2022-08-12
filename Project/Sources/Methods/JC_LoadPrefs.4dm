//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_LoadPrefs
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
	C_BOOLEAN:C305(JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP; JC_bo_PrefsLoaded)
	C_LONGINT:C283($_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_LoadPrefs")

// JC_LoadPrefs
//this method loads the prefs (preference table prefs not user table prefs) for Job Costing
// 23/02/2007 -kmw

//NOTE: if more prefs added later it doesn't yet take this into account and check for old data that had less prefs in it


$_t_oldMethodName:=ERR_MethodTracker("JC_LoadPrefs")






If (Not:C34(JC_bo_PrefsLoaded))
	READ ONLY:C145([PREFERENCES:116])
	
	$_l_ItemID:=PREF_GetPreferenceID("Job Costing Preferences")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(JC_bo_PostBudgetTime; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(JC_bo_PostActualTime; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(JC_bo_PostWIP; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_PostBudgetTime; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_PostActualTime; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_PostWIP; $_l_offset)
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	JC_bo_PrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("JC_LoadPrefs"; $_t_oldMethodName)