//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_FieldMapPrefsSave
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
	ARRAY LONGINT:C221($_al_TempArray; 0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	ARRAY TEXT:C222($_at_TempArray; 0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_LONGINT:C283($_l_index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_FieldMapPrefsSave")
// EW_FieldMapPrefsSave
// 01/09/03 pb

READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-3)
//this will be ONE record
SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
ARRAY TEXT:C222($_at_TempArray; 0)
ARRAY LONGINT:C221($_al_TempArray; 0)
For ($_l_index; 1; Size of array:C274(DM_at_BKModelNames))
	If (DM_at_BKModelNames{$_l_index}#"-") & (DM_at_BKModelNames{$_l_index}#"new entry")
		INSERT IN ARRAY:C227($_at_TempArray; 1)
		INSERT IN ARRAY:C227($_al_TempArray; 1)
		$_at_TempArray{1}:=DM_at_BKModelNames{$_l_index}
		$_al_TempArray{1}:=DM_al_BKModelIDS{$_l_index}
	End if 
End for 
SORT ARRAY:C229($_at_TempArray; $_al_TempArray)

VARIABLE TO BLOB:C532($_at_TempArray; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532($_al_TempArray; [PREFERENCES:116]DataBlob:2; *)
DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
ERR_MethodTrackerReturn("EW_FieldMapPrefsSave"; $_t_oldMethodName)