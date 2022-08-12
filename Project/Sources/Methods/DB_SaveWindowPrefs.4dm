//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveWindowPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/04/2011 05:29 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_SetInputOpeninNewWindow; $_bo_SetOpeninNewWindow; DB_bo_SETINPUTPREF; DB_bo_SetOpeninNewWindow)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ItemID; $_l_offset)
	C_OBJECT:C1216($_obj_Preference; $_obj_Preferences; $_obj_SetValues; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveWindowPrefs")
$_obj_SetValues:=$1
While (Semaphore:C143("FormWindowPrefs"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Window Handling Settings")

If ($_l_ItemID>0)
	$_obj_Preferences:=ds:C1482.PREFERENCES.query("IDNumber =:1 and Pref_OwnerID =:2"; $_l_ItemID; <>PER_l_CurrentUserID)
	
	//READ WRITE([PREFERENCES])
	//QUERY([PREFERENCES]; [PREFERENCES]IDNumber=$_l_ItemID; *)
	//QUERY([PREFERENCES];  & ; [PREFERENCES]Pref_OwnerID=<>PER_l_CurrentUserID)
	If ($_obj_Preferences.length=0)
		//If (Records in selection([PREFERENCES])=0)
		//CREATE RECORD([PREFERENCES])
		//[PREFERENCES]IDNumber:=$_l_ItemID
		//[PREFERENCES]Pref_OwnerID:=<>PER_l_CurrentUserID
		//End if 
		$_obj_Preference:=ds:C1482.PREFERENCES.new()
		$_obj_Preference.IDNumber:=$_l_ItemID
		$_obj_Preference.Pref_OwnerID:=<>PER_l_CurrentUserID
		//C_BLOB($_blb_Data)
		VARIABLE TO BLOB:C532(False:C215; $_obj_Preference.DataBlob)
		VARIABLE TO BLOB:C532(False:C215; $_obj_Preference.DataBlob; *)
		//$_obj_Preference.DataBlob:=$_blb_Data
		DB_SaveEntity($_obj_Preference)
	Else 
		$_obj_Preference:=$_obj_Preferences[0]
	End if 
	$_l_Offset:=0
	BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_SetOpenInNewWindow; $_l_Offset)
	If ($_l_Offset<BLOB size:C605($_obj_Preference.DataBlob))
		BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_SetInputOpeninNewWindow; $_l_Offset)
	End if 
	//$_l_offset:=0
	//If ($_l_offset<BLOB size([PREFERENCES]DataBlob))
	//BLOB TO VARIABLE([PREFERENCES]DataBlob; $_bo_SetOpeninNewWindow; $_l_offset)
	//If ($_l_offset<BLOB size([PREFERENCES]DataBlob))
	//BLOB TO VARIABLE([PREFERENCES]DataBlob; $_bo_SetInputOpeninNewWindow; $_l_offset)
	//End if 
	
	SET BLOB SIZE:C606($_obj_Preference.DataBlob; 0)
	If (Not:C34($_obj_SetValues.SetOpenInNewWindow=Null:C1517))
		VARIABLE TO BLOB:C532($_obj_SetValues.SetOpenInNewWindow; $_obj_Preference.DataBlob)
		
	Else 
		VARIABLE TO BLOB:C532($_bo_SetOpeninNewWindow; $_obj_Preference.DataBlob)
		
	End if 
	If (Not:C34($_obj_SetValues.SetInputOpeninNewWindow=Null:C1517))
		VARIABLE TO BLOB:C532($_obj_SetValues.SetInputOpeninNewWindow; $_obj_Preference.DataBlob)
		
	Else 
		VARIABLE TO BLOB:C532($_bo_SetInputOpeninNewWindow; $_obj_Preference.DataBlob)
		
	End if 
	
	//If (DB_bo_SETINPUTPREF)
	//VARIABLE TO BLOB($_bo_SetOpeninNewWindow; [PREFERENCES]DataBlob)
	//VARIABLE TO BLOB(DB_SetInputOpeninNewWindow; [PREFERENCES]DataBlob; *)
	//Else 
	//VARIABLE TO BLOB(DB_bo_SetOpeninNewWindow; [PREFERENCES]DataBlob)
	//VARIABLE TO BLOB($_bo_SetInputOpeninNewWindow; [PREFERENCES]DataBlob; *)
	//End if 
	DB_SaveEntity($_obj_Preference)
	//DB_SaveRecord(->[PREFERENCES])
	//UNLOAD RECORD([PREFERENCES])
	//READ ONLY([PREFERENCES])
	
End if 
CLEAR SEMAPHORE:C144("FormWindowPrefs")
ERR_MethodTrackerReturn("DB_SaveWindowPrefs"; $_t_oldMethodName)
