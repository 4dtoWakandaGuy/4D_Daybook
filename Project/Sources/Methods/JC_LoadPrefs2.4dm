//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_LoadPrefs2
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
	C_BOOLEAN:C305(JC_bo_ActivateProcessServices; JC_bo_Prefs2Loaded; JC_bo_SpareBool2; JC_bo_SpareBool3; JC_bo_SpareBool4)
	C_LONGINT:C283($_l_ItemID; $_l_offset; JC_l_SpareLongInt1; JC_l_SpareLongInt2; JC_l_SpareLongInt3; JC_l_SpareLongInt4)
	C_REAL:C285(JC_R_SpareReal1; JC_R_SpareReal2; JC_R_SpareReal3; JC_R_SpareReal4)
	C_TEXT:C284($_t_oldMethodName; JC_T_SpareText1; JC_T_SpareText2; JC_T_SpareText3; JC_T_SpareText4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_LoadPrefs2")

// JC_LoadPrefs2
//this method loads any further prefs (not already loaded by JC_LoadPrefs) (preference table prefs not user table prefs) for Job Costing
// 12/04/2007 -kmw

//NOTE: if more prefs added later it doesn't yet take this into account and check for old data that had less prefs in it...
//...However, it does have a few "spares"


$_t_oldMethodName:=ERR_MethodTracker("JC_LoadPrefs2")









If (Not:C34(JC_bo_Prefs2Loaded))
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Job Costing Prefs2")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
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
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_ActivateProcessServices; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_SpareBool2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_SpareBool3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_bo_SpareBool4; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_l_SpareLongInt1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_l_SpareLongInt2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_l_SpareLongInt3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_l_SpareLongInt4; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_T_SpareText1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_T_SpareText2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_T_SpareText3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_T_SpareText4; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_R_SpareReal1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_R_SpareReal2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_R_SpareReal3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JC_R_SpareReal4; $_l_offset)
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	If (Not:C34(DB_GetModuleSettingByNUM(Module_JobCosting)>2))
		JC_bo_ActivateProcessServices:=False:C215
	End if 
	JC_bo_Prefs2Loaded:=True:C214
End if 
ERR_MethodTrackerReturn("JC_LoadPrefs2"; $_t_oldMethodName)