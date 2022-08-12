//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadViewPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: DB_LoadViewPreference`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Save; $1)
	C_LONGINT:C283(<>DB_l_CBShowLinkedRecord; $_l_ItemID; $_l_offset; DB_l_CBShowLinkedRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadViewPreference")



//this method load the prefs for a pipeline
While (Semaphore:C143("DBPrefLoad"))
	DelayTicks(10)
End while 
// ----------------------------------------------------

//
// Parameters
// ----------------------------------------------------


READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Open Linked Record")


QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)

If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(DB_l_CBShowLinkedRecord; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
End if 
If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
If ($_bo_Save)
	READ WRITE:C146([PREFERENCES:116])
	LOAD RECORD:C52([PREFERENCES:116])
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	$_l_offset:=0
	VARIABLE TO BLOB:C532(DB_l_CBShowLinkedRecord; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_CBShowLinkedRecord; $_l_offset)
End if 
<>DB_l_CBShowLinkedRecord:=DB_l_CBShowLinkedRecord
CLEAR SEMAPHORE:C144("DBPrefLoad")
ERR_MethodTrackerReturn("DB_LoadViewPreference"; $_t_oldMethodName)