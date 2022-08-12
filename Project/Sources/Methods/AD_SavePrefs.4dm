//%attributes = {}
If (False:C215)
	//Project Method Name:      AD_SavePrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/04/2011 05:29 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_LONGINT:C283($_l_ItemID; BP_l_DeleteArchives; BP_l_NumOfFile)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AD_SavePrefs")
While (Semaphore:C143("ADprefs"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Aged Debtor Settings")

If ($_l_ItemID>0)
	READ WRITE:C146([PREFERENCES:116])
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	End if 
	
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	
	VARIABLE TO BLOB:C532(CB_bo_ConvertAtOldRate; [PREFERENCES:116]DataBlob:2)
	VARIABLE TO BLOB:C532(CB_bo_ConvertAtOlderRate; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
End if 
CLEAR SEMAPHORE:C144("ADprefs")
ERR_MethodTrackerReturn("AD_SavePrefs"; $_t_oldMethodName)