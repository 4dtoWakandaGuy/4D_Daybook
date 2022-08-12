//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKGetModelPrefs
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
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_LONGINT:C283($_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKGetModelPrefs")
// EW_BKGetModelPrefs
// 23/09/03 PB

ARRAY TEXT:C222(DM_at_BKModelNames; 0)
ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-3)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
	[PREFERENCES:116]Pref_OwnerID:4:=-3
	VARIABLE TO BLOB:C532(DM_at_BKModelNames; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_al_BKModelIDS; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
End if 
//this will be ONE record
$_l_offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKModelNames; $_l_offset)
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKModelIDS; $_l_offset)
UNLOAD RECORD:C212([PREFERENCES:116])
SORT ARRAY:C229(DM_at_BKModelNames; DM_al_BKModelIDS)
ERR_MethodTrackerReturn("EW_BKGetModelPrefs"; $_t_oldMethodName)