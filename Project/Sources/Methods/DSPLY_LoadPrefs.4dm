//%attributes = {}
If (False:C215)
	//Project Method Name:      DSPLY_LoadPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars; DSPLY_bo_PrefsLoaded; DSPLY_bo_SpareBool2; DSPLY_bo_SpareBool3; DSPLY_bo_SpareBool4; DSPLY_bo_SpareBool5; DSPLY_bo_SpareBool6)
	C_LONGINT:C283($_l_ItemID; $_l_offset; DSPLY_l_SpareLongInt1; DSPLY_l_SpareLongInt2; DSPLY_l_SpareLongInt3; DSPLY_l_SpareLongInt4; DSPLY_l_SpareLongInt5; DSPLY_l_SpareLongInt6)
	C_REAL:C285(DSPLY_R_SpareReal1; DSPLY_R_SpareReal2; DSPLY_R_SpareReal3; DSPLY_R_SpareReal4; DSPLY_R_SpareReal5; DSPLY_R_SpareReal6)
	C_TEXT:C284($_t_oldMethodName; DSPLY_T_SpareText1; DSPLY_T_SpareText2; DSPLY_T_SpareText3; DSPLY_T_SpareText4; DSPLY_T_SpareText5; DSPLY_T_SpareText6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DSPLY_LoadPrefs")









If (Not:C34(DSPLY_bo_PrefsLoaded))
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Display Prefs")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(DSPLY_bo_DisplayProgressBars; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_bo_SpareBool2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_bo_SpareBool3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_bo_SpareBool4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_bo_SpareBool5; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_bo_SpareBool6; [PREFERENCES:116]DataBlob:2; *)
		
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt5; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_l_SpareLongInt6; [PREFERENCES:116]DataBlob:2; *)
		
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText5; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_T_SpareText6; [PREFERENCES:116]DataBlob:2; *)
		
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal5; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSPLY_R_SpareReal6; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_DisplayProgressBars; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_SpareBool2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_SpareBool3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_SpareBool4; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_SpareBool5; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_bo_SpareBool6; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt4; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt5; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_l_SpareLongInt6; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText4; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText5; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_T_SpareText6; $_l_offset)
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal4; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal5; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSPLY_R_SpareReal6; $_l_offset)
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	DSPLY_bo_PrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("DSPLY_LoadPrefs"; $_t_oldMethodName)