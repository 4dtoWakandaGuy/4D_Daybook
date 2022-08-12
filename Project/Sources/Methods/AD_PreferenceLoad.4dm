//%attributes = {}
If (False:C215)
	//Project Method Name:      AD_PreferenceLoad
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
	C_BOOLEAN:C305($_bo_FailureToLoad; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_LONGINT:C283($_l_Item; $_l_Offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AD_PreferenceLoad")

While (Semaphore:C143("ADprefs"))
	DelayTicks(2)
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_Item:=PREF_GetPreferenceID("Aged Debtor Settings")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_Item)

If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_Item
	
	VARIABLE TO BLOB:C532(CB_bo_ConvertAtOldRate; [PREFERENCES:116]DataBlob:2)
	VARIABLE TO BLOB:C532(CB_bo_ConvertAtOlderRate; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	
	$_l_Offset:=0
	$_bo_FailureToLoad:=True:C214
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_bo_ConvertAtOldRate; $_l_Offset)
	If ($_l_Offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_bo_ConvertAtOlderRate; $_l_Offset)
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	
End if 

CLEAR SEMAPHORE:C144("ADprefs")
ERR_MethodTrackerReturn("AD_PreferenceLoad"; $_t_oldMethodName)