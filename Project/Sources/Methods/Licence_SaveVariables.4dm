//%attributes = {}

If (False:C215)
	//Project Method Name:      Licence_SaveVariables
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
	C_BOOLEAN:C305(Lic_bo_Accepted; Lic_bo_NotifiedToUs)
	C_DATE:C307(Lic_d_LicenceDate)
	C_LONGINT:C283($_l_ItemID; Lic_l_Version)
	C_TEXT:C284($_t_oldMethodName; Lic_t_LicenceNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_SaveVariables")

// Lic_SaveVariables
// 24/03/03 pb

$_t_oldMethodName:=ERR_MethodTracker("Licence_SaveVariables")

READ WRITE:C146([PREFERENCES:116])
While (Semaphore:C143("$AddingPrefs1"))
	DelayTicks(20)
End while 
While (Semaphore:C143("LoadingPrefsLicence"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Licence Preferences")

CLEAR SEMAPHORE:C144("LoadingPrefsLicence")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
VARIABLE TO BLOB:C532(Lic_t_LicenceNumber; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(Lic_d_LicenceDate; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(Lic_bo_Accepted; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(Lic_bo_NotifiedToUs; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(Lic_l_Version; [PREFERENCES:116]DataBlob:2; *)
DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("$AddingPrefs1")
ERR_MethodTrackerReturn("Licence_SaveVariables"; $_t_oldMethodName)