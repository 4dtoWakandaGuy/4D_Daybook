//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_SavePrefs2
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
	C_BOOLEAN:C305(JC_bo_ActivateProcessServices; JC_bo_SpareBool2; JC_bo_SpareBool3; JC_bo_SpareBool4)
	C_LONGINT:C283($_l_ItemID; $_l_offset; JC_l_SpareLongInt1; JC_l_SpareLongInt2; JC_l_SpareLongInt3; JC_l_SpareLongInt4)
	C_REAL:C285(JC_R_SpareReal1; JC_R_SpareReal2; JC_R_SpareReal3; JC_R_SpareReal4)
	C_TEXT:C284($_t_oldMethodName; JC_T_SpareText1; JC_T_SpareText2; JC_T_SpareText3; JC_T_SpareText4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_SavePrefs2")

// JC_SavePrefs2
//this method saves the prefs (preference table prefs not user table prefs) for Job Costing
// 23/02/2007 -kmw

//NOTE: if more prefs added later - doesn't yet take into account and check for old data that had less prefs in it



$_t_oldMethodName:=ERR_MethodTracker("JC_SavePrefs2")




$_l_ItemID:=PREF_GetPreferenceID("Job Costing Prefs2")

READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(JC_bo_ActivateProcessServices; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_T_SpareText1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_R_SpareReal1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal4; [PREFERENCES:116]DataBlob:2; *)
	
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(JC_bo_ActivateProcessServices; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_bo_SpareBool4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_l_SpareLongInt4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_T_SpareText1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_T_SpareText4; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(JC_R_SpareReal1; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal2; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal3; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JC_R_SpareReal4; [PREFERENCES:116]DataBlob:2; *)
	
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
End if 
ERR_MethodTrackerReturn("JC_SavePrefs2"; $_t_oldMethodName)