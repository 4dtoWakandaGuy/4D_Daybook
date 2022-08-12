//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_LoadPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_BOOLEAN:C305(USR_bo_EWEnabled; EW_bo_PrefsLoaded)
	C_LONGINT:C283($_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_LoadPrefs")
// EW_LoadPrefs
//this method load the prefs for the Ecommerce system (business Kit)
// 29/10/02 pb

If (Not:C34(EW_bo_PrefsLoaded))
	While (Semaphore:C143("LoadingEWPrefs"))
		DelayTicks(2)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Export Wizard Preferences")
	USR_bo_EWEnabled:=False:C215
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(USR_bo_EWEnabled; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; USR_bo_EWEnabled; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingEWPrefs")
	EW_bo_PrefsLoaded:=True:C214
End if 
EW_BKGetModelPrefs  // 23/09/03 pb
INSERT IN ARRAY:C227(DM_at_BKModelNames; 99999999; 2)
INSERT IN ARRAY:C227(DM_al_BKModelIDS; 99999999; 2)
DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)-1}:="-"
DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)}:="New Entry"
ERR_MethodTrackerReturn("EW_LoadPrefs"; $_t_oldMethodName)