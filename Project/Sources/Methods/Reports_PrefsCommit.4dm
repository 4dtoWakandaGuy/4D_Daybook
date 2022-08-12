//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsCommit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsCommit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_PreferencesName;0)
	//ARRAY TEXT(SR_at_TempTextOfBLOB;0)
	C_BOOLEAN:C305(SR_bo_ReportPrefsDirty)
	C_LONGINT:C283($_l_Index; $_l_PreferencesID; $_l_SIzeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsCommit")

//Added 01/12/08 v631b120i -kmw

Reports_PrefsDeclareTemps



If (SR_bo_ReportPrefsDirty)  //Added 01/12/08 v631b120i -kmw
	
	$_l_SIzeofArray:=Size of array:C274(SR_at_PreferencesName)
	//
	For ($_l_Index; 1; $_l_SIzeofArray)
		$_l_PreferencesID:=PREF_GetPreferenceID(SR_at_PreferencesName{$_l_Index})
		
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_PreferencesID
		Else 
			LOAD RECORD:C52([PREFERENCES:116])
		End if 
		
		TEXT TO BLOB:C554(SR_at_TempTextOfBLOB{$_l_Index}; [PREFERENCES:116]DataBlob:2; Mac text without length:K22:10)
		//[Preferences]DataBlob:=SR_at_TempTextOfBLOB{$_l_Index}
		
		DB_SaveRecord(->[PREFERENCES:116])
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
	End for 
	
	
	SR_bo_ReportPrefsDirty:=False:C215
	
End if   // end if dirty report prefs

Reports_PrefsInitTemps
ERR_MethodTrackerReturn("Reports_PrefsCommit"; $_t_oldMethodName)
