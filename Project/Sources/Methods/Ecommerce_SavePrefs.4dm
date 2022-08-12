//%attributes = {}
If (False:C215)
	//Project Method Name:      Ecommerce_SavePrefs
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
	C_BOOLEAN:C305(USR_bo_ECEnabled)
	C_LONGINT:C283($_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ecommerce_SavePrefs")
// Ecommerce_SavePrefs
While (Semaphore:C143("LoadingEcommercePrefs"))
	DelayTicks(2)
End while 

$_l_ItemID:=PREF_GetPreferenceID("Ecommerce Preferences")
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(USR_bo_ECEnabled; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(USR_bo_ECEnabled; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	
End if 
CLEAR SEMAPHORE:C144("LoadingEcommercePrefs")
ERR_MethodTrackerReturn("Ecommerce_SavePrefs"; $_t_oldMethodName)