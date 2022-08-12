//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_LoadDatacheckPrefs
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
	//ARRAY INTEGER(DB_aI_ActiveTables;0)
	//ARRAY INTEGER(DB_aI_TableIndexer;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(DB_at_TableNames;0)
	C_BOOLEAN:C305(<>DB_bo_DatacheckLoaded; <>DB_bo_ReloadPrefs; $_bo_DataCheckLoaded; $_bo_invisible; $1; AA_bo_ListsInited; DB_bo_DataCheckLoaded)
	C_LONGINT:C283($_l_CurrentRow; $_l_ItemID; $_l_offset; $_l_TableIndex; $_l_TableRow; DB_cb_IndexerActive; DB_l_cbdatacheckActive; DB_l_CurrentField; DB_l_CurrentTable)
	C_TEXT:C284($_t_CurrentClient; $_t_oldMethodName; $2)
	C_TIME:C306(DB_ti_cTImeEnd; DB_ti_cTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadDatacheckPrefs")

If (Count parameters:C259>0)
	<>DB_bo_DatacheckLoaded:=$1
End if 

If (Count parameters:C259>1)
	$_t_CurrentClient:=$2
End if 
//this method loads the prefs for a datacheck

If (Not:C34(AA_bo_ListsInited))
	While (Semaphore:C143("$LoadingListofLists"))
		DelayTicks(6)
	End while 
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	//ARRAY STRING(55;AA_at_aallListNames;0)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	//On THIS FORM we do need all the list IDs
	//ALL RECORDS([x_Lists])
	//SELECTION TO ARRAY([x_Lists]x_ID;AA_al_aallListIDs;[x_Lists]x_ListName;AA_at_aallListNames)
	
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 




START_SEMAPHORE("$LoadingPreferences")
While (Semaphore:C143("LoadingDataChecktPrefs"))
	DelayTicks(2)
End while 
$_bo_DataCheckLoaded:=<>DB_bo_DatacheckLoaded
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Data Check Preferences")
DB_l_cbdatacheckActive:=0
DB_cb_IndexerActive:=0
DB_l_CurrentTable:=0
DB_l_CurrentField:=0
DB_ti_cTimeStart:=?00:00:00?
DB_ti_cTImeEnd:=?00:00:00?
ARRAY INTEGER:C220(DB_aI_ActiveTables; Get last table number:C254)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
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
Else 
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_cbdatacheckActive; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_cb_IndexerActive; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_ti_cTimeStart; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_ti_cTimeEnd; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_CurrentTable; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_l_CurrentField; $_l_offset)
	
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_aI_ActiveTables; $_l_offset)
End if 
CLEAR SEMAPHORE:C144("LoadingDataChecktPrefs")


Stop_Semaphore("$LoadingPreferences")
DB_bo_DataCheckLoaded:=True:C214
ARRAY TEXT:C222(DB_at_TableNames; Get last table number:C254)
ARRAY LONGINT:C221(DB_al_TableNumbers; Get last table number:C254)
$_l_CurrentRow:=0
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		$_l_CurrentRow:=$_l_CurrentRow+1
		DB_al_TableNumbers{$_l_CurrentRow}:=$_l_TableIndex
		DB_at_TableNames{$_l_CurrentRow}:=Table name:C256($_l_TableIndex)
	End if 
End for 
ARRAY TEXT:C222(DB_at_TableNames; $_l_CurrentRow)
ARRAY LONGINT:C221(DB_al_TableNumbers; $_l_CurrentRow)
ARRAY INTEGER:C220(DB_aI_TableIndexer; 0)
COPY ARRAY:C226(DB_aI_ActiveTables; DB_aI_TableIndexer)
If (Size of array:C274(DB_aI_TableIndexer)#Size of array:C274(DB_at_TableNames))
	ARRAY INTEGER:C220(DB_aI_TableIndexer; Size of array:C274(DB_at_TableNames))
End if 
//NOTE
//ACTIVE TABLES, the 'hidden' tables are not updated

If (Current user:C182#"Designer")
	For ($_l_TableIndex; Get last table number:C254; 1; -1)
		If (Is table number valid:C999($_l_TableIndex))
			$_l_TableRow:=Find in array:C230(DB_al_TableNumbers; $_l_TableIndex)
			If ($_l_TableRow>0)
				GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_invisible)
				If ($_bo_invisible)
					DELETE FROM ARRAY:C228(DB_at_TableNames; $_l_TableRow)
					DELETE FROM ARRAY:C228(DB_al_TableNumbers; $_l_TableRow)
					DELETE FROM ARRAY:C228(DB_aI_TableIndexer; $_l_TableRow)
				End if 
			End if 
		Else 
			$_l_TableRow:=Find in array:C230(DB_al_TableNumbers; $_l_TableIndex)
			If ($_l_TableRow>0)
				//Table is deleted remove it
				DELETE FROM ARRAY:C228(DB_at_TableNames; $_l_TableIndex)
				DELETE FROM ARRAY:C228(DB_al_TableNumbers; $_l_TableIndex)
				DELETE FROM ARRAY:C228(DB_aI_TableIndexer; $_l_TableIndex)
			End if 
		End if 
		
	End for 
End if 

If (DB_l_CurrentTable=0)
	DB_l_CurrentTable:=1
End if 
If (DB_l_CurrentField=0)
	DB_l_CurrentField:=1
End if 

If (DB_l_CurrentTable>Get last table number:C254)
	DB_l_CurrentTable:=1
End if 
If (DB_l_CurrentField>Get last field number:C255(DB_l_CurrentTable))
	DB_l_CurrentField:=1
End if 
<>DB_bo_ReloadPrefs:=False:C215
ERR_MethodTrackerReturn("DB_LoadDatacheckPrefs"; $_t_oldMethodName)