//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveDataCheckPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_ActiveTables;0)
	//ARRAY INTEGER(DB_aI_TableIndexer;0)
	//ARRAY INTEGER(DB_l_ActiveTables;0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	C_BOOLEAN:C305(<>DB_bo_ReloadPrefs; DB_bo_ReloadPrefs)
	C_LONGINT:C283(<>DB_l_DATACHECKER; $_l_Index; $_l_ItemID; $_l_Process; DB_cb_IndexerActive; DB_l_cbdatacheckActive; DB_l_CurrentField; DB_l_CurrentTable; DB_l_DATACHECKER)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(DB_ti_cTImeEnd; DB_ti_cTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveDataCheckPrefs")
//this method load the prefs for a backup synchronization
READ WRITE:C146([PREFERENCES:116])

While (Semaphore:C143("LoadingDataChecktPrefs"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Data Check Preferences")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
End if 
SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)

For ($_l_Index; 1; Size of array:C274(DB_aI_TableIndexer))
	If (DB_aI_TableIndexer{$_l_Index}=1)
		If (DB_al_TableNumbers{$_l_Index}<=Size of array:C274(DB_aI_ActiveTables))  //an error can occour when we are swapping structure files
			DB_aI_ActiveTables{DB_al_TableNumbers{$_l_Index}}:=1
		End if 
		
	Else 
		If (DB_al_TableNumbers{$_l_Index}<=Size of array:C274(DB_aI_ActiveTables))
			DB_aI_ActiveTables{DB_al_TableNumbers{$_l_Index}}:=0
		End if 
		
	End if 
End for 


ARRAY INTEGER:C220(DB_l_ActiveTables; Get last table number:C254)


VARIABLE TO BLOB:C532(DB_l_cbdatacheckActive; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DB_cb_IndexerActive; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DB_ti_cTimeStart; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DB_ti_cTImeEnd; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DB_l_CurrentTable; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DB_l_CurrentField; [PREFERENCES:116]DataBlob:2; *)

VARIABLE TO BLOB:C532(DB_aI_ActiveTables; [PREFERENCES:116]DataBlob:2; *)

DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingDataChecktPrefs")

If (Application type:C494=4D Remote mode:K5:5)
	DB_l_DATACHECKER:=0
	GET PROCESS VARIABLE:C371(-1; <>DB_l_DATACHECKER; DB_l_DATACHECKER)
	If (DB_l_DATACHECKER>0)
		DB_bo_ReloadPrefs:=True:C214
		SET PROCESS VARIABLE:C370(-1; <>DB_bo_ReloadPrefs; DB_bo_ReloadPrefs)
	Else 
		$_l_Process:=Execute on server:C373("DB_DATACHECKER"; 128000; "Data Index Checker")
	End if 
Else 
	If (<>DB_l_DATACHECKER>0)
		DB_bo_ReloadPrefs:=True:C214
		SET PROCESS VARIABLE:C370(<>DB_l_DATACHECKER; <>DB_bo_ReloadPrefs; DB_bo_ReloadPrefs)
	Else 
		$_l_Process:=New process:C317("DB_DATACHECKER"; 128000; "Data Index Checker")
	End if 
End if 
ERR_MethodTrackerReturn("DB_SaveDataCheckPrefs"; $_t_oldMethodName)