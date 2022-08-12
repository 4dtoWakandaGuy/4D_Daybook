//%attributes = {}
If (False:C215)
	//Project Method Name:      PREF_GetPreferenceName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2009 20:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_GeneralPreferences; 0)
	ARRAY TEXT:C222($_at_GeneralPreferences; 0)
	C_BOOLEAN:C305(DSS_bo_Enabled)
	C_LONGINT:C283($_l_ListID; $_l_PreferencePosition; $_l_PrefernenceID; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ReturnName; $0; AA_t_CallingMethod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PREF_GetPreferenceName")


If (Count parameters:C259>=1)
	$_l_PrefernenceID:=$1
	
	While (Semaphore:C143("LoadingPrefs"))
		DelayTicks(2)
	End while 
	ARRAY TEXT:C222($_at_GeneralPreferences; 0)
	ARRAY LONGINT:C221($_al_GeneralPreferences; 0)
	
	AA_t_CallingMethod:="PREF_Getpreferencename"
	$_l_ListID:=AA_LoadListByName("Preferences"; ->$_at_GeneralPreferences; ->$_al_GeneralPreferences)
	//new record
	$_l_PreferencePosition:=Find in array:C230($_al_GeneralPreferences; $_l_PrefernenceID)
	DSS_bo_Enabled:=False:C215
	If ($_l_PreferencePosition<0)
		$_t_ReturnName:=""  //cant add an item because name is unknown
	Else 
		$_t_ReturnName:=$_at_GeneralPreferences{$_l_PreferencePosition}
	End if 
	CLEAR SEMAPHORE:C144("LoadingPrefs")
	$0:=$_t_ReturnName
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("PREF_GetPreferenceName"; $_t_oldMethodName)
