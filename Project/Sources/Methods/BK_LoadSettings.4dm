//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_LoadSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BKSettingsRecordNumber; 0)
	//ARRAY LONGINT(BK_al_BKSettingsID;0)
	//ARRAY TEXT(BK_at_BKSettingsNames;0)
	C_BOOLEAN:C305(DSS_bo_Enabled)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_offset; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_LoadSettings")
//this method will get a list of ALL the business Kit settings
$_l_Retries:=0
While (Semaphore:C143("LoadingBusinessKitPrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
READ ONLY:C145([PREFERENCES:116])
ARRAY LONGINT:C221($_al_BKSettingsRecordNumber; 0)

$_l_ItemID:=PREF_GetPreferenceID("Business Kit Connections")
DSS_bo_Enabled:=False:C215
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=0)

ARRAY LONGINT:C221(BK_al_BKSettingsID; 0)
ARRAY TEXT:C222(BK_at_BKSettingsNames; 0)
SELECTION TO ARRAY:C260([PREFERENCES:116]; $_al_BKSettingsRecordNumber)
ARRAY TEXT:C222(BK_at_BKSettingsNames; Size of array:C274($_al_BKSettingsRecordNumber))
ARRAY LONGINT:C221(BK_al_BKSettingsID; Size of array:C274($_al_BKSettingsRecordNumber))
FIRST RECORD:C50([PREFERENCES:116])
For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BK_al_BKSettingsID{$_l_Index}; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BK_at_BKSettingsNames{$_l_Index}; $_l_offset)
	NEXT RECORD:C51([PREFERENCES:116])
End for 

CLEAR SEMAPHORE:C144("LoadingBusinessKitPrefs")
ERR_MethodTrackerReturn("BK_LoadSettings"; $_t_oldMethodName)
