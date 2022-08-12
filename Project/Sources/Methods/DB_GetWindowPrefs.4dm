//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetWindowPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2011 05:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($_bo_FailureToLoad; $_bo_SetInputOpeninNewWindow; $_bo_SetOpenInNewWindow)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ItemID; $_l_Offset)
	C_OBJECT:C1216($_obj_Preference; $_obj_Preferences; $_Obj_Settings)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_WindowPrefs")



While (Semaphore:C143("FormWindowPrefs"))
	DelayTicks(2)
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Window Handling Settings")
$_obj_Preferences:=ds:C1482.PREFERENCES.query("IDNumber =:1 and Pref_OwnerID =:2"; $_l_ItemID; <>PER_l_CurrentUserID)


//QUERY([PREFERENCES]; [PREFERENCES]IDNumber=$_l_ItemID; *)
//QUERY([PREFERENCES];  & ; [PREFERENCES]Pref_OwnerID=<>PER_l_CurrentUserID)
If ($_obj_Preferences.length=0)
	$_obj_Preference:=ds:C1482.PREFERENCES.new()
	$_obj_Preference.IDNumber:=$_l_ItemID
	$_obj_Preference.Pref_OwnerID:=<>PER_l_CurrentUserID
	//C_BLOB($_blb_Data)
	VARIABLE TO BLOB:C532($_bo_SetOpenInNewWindow; $_obj_Preference.DataBlob)
	VARIABLE TO BLOB:C532($_bo_SetInputOpeninNewWindow; $_obj_Preference.DataBlob; *)
	//$_obj_Preference.DataBlob:=$_blb_Data
	DB_SaveEntity($_obj_Preference)
	If (False:C215)
		If (Records in selection:C76([PREFERENCES:116])=0)
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
			VARIABLE TO BLOB:C532($_bo_SetOpenInNewWindow; [PREFERENCES:116]DataBlob:2)
			VARIABLE TO BLOB:C532($_bo_SetInputOpeninNewWindow; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		Else 
			
			$_l_Offset:=0
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_bo_SetOpenInNewWindow; $_l_Offset)
			If ($_l_Offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_bo_SetInputOpeninNewWindow; $_l_Offset)
			End if 
			UNLOAD RECORD:C212([PREFERENCES:116])
			
		End if 
	End if 
Else 
	$_obj_Preference:=$_obj_Preferences[0]
End if 
$_l_Offset:=0
If (Not:C34($_obj_Preference.DataBlob=Null:C1517)
	BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_SetOpenInNewWindow; $_l_Offset)
	If ($_l_Offset<BLOB size:C605($_obj_Preference.DataBlob))
		BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_SetInputOpeninNewWindow; $_l_Offset)
	End if 
Else 
	$_bo_SetOpenInNewWindow:=False:C215
	$_bo_SetInputOpeninNewWindow:=False:C215
End if 

$_Obj_Settings:=New object:C1471("SetOpenInNewWindow"; $_bo_SetOpenInNewWindow; "SetInputOpeninNewWindow"; $_bo_SetInputOpeninNewWindow)
$0:=$_Obj_Settings

CLEAR SEMAPHORE:C144("FormWindowPrefs")
ERR_MethodTrackerReturn("DB_WindowPrefs"; $_t_oldMethodName)
