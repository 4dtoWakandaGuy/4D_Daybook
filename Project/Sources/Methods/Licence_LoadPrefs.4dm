//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_LoadPrefs
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
	C_BOOLEAN:C305(USR_bo_ECEnabled; Lic_bo_Accepted; Lic_bo_NotifiedToUs)
	C_DATE:C307(Lic_d_LicenceDate)
	C_LONGINT:C283($_l_ItemID; $_l_Offset; Lic_l_Version)
	C_TEXT:C284($_t_oldMethodName; Lic_t_LicenceNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_LoadPrefs")
// Licence_Load PRefs
// 22/03/03 pb

While (Semaphore:C143("$AddingPrefs1"))
	DelayTicks(20)
End while 
READ ONLY:C145([PREFERENCES:116])
While (Semaphore:C143("LoadingPrefsLicence"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Licence Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsLicence")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	DB_SaveRecord(->[PREFERENCES:116])
	Lic_t_LicenceNumber:=""
	Lic_d_LicenceDate:=!00-00-00!
	Lic_bo_Accepted:=False:C215
	Lic_bo_NotifiedToUs:=False:C215
	Lic_l_Version:=0  // 19/06/03 pb
	Licence_SaveVariables
Else 
	$_l_Offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Lic_t_LicenceNumber; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Lic_d_LicenceDate; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Lic_bo_Accepted; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Lic_bo_NotifiedToUs; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Lic_l_Version; $_l_Offset)
	UNLOAD RECORD:C212([PREFERENCES:116])
End if 
CLEAR SEMAPHORE:C144("$AddingPrefs1")
ERR_MethodTrackerReturn("Licence_LoadPrefs"; $_t_oldMethodName)