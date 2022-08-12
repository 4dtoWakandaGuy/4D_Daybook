//%attributes = {}
If (False:C215)
	//Project Method Name:      Ecommerce_LoadPrefs
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
	C_BOOLEAN:C305(USR_bo_ECEnabled; EC_bo_PrefsLoaded)
	C_LONGINT:C283($_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ecommerce_LoadPrefs")
// Ecommerce_LoadPrefs
//this method load the prefs for the Ecommerce system (business Kit)
// 29/10/02 pb

If (Not:C34(EC_bo_PrefsLoaded))
	While (Semaphore:C143("LoadingEcommercePrefs"))
		DelayTicks(2)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Ecommerce Preferences")
	USR_bo_ECEnabled:=False:C215
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(USR_bo_ECEnabled; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; USR_bo_ECEnabled; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingEcommercePrefs")
	
	EC_bo_PrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("Ecommerce_LoadPrefs"; $_t_oldMethodName)