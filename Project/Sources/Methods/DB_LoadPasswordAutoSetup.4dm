//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadPasswordAutoSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2009 14:20`Method: DB_LoadPasswordAutoSetup
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PW_bo_PasswordExpires; <>PW_Bo_WindowsAutoLogin; $_bo_Save; $1)
	C_LONGINT:C283(<>PW_l_ExpiryDays; $_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_LoadPasswordAutoSetup")
//NG January 2008 this method will load/save the preference to by-pass the login screen if the user is on windows and the Windows login name is stored in Daybook
$_bo_Save:=False:C215
If (Count parameters:C259>=1)
	$_bo_Save:=$1
End if 
While (Semaphore:C143("$PWAutoLoginPrefs"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Windows User Auto Login")
If ($_l_ItemID>0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
	If (Records in selection:C76([PREFERENCES:116])=0) | ($_bo_Save)
		While (Semaphore:C143("PWAutoLoginPrefs"))  // Lock everyone as we may create a record
			DelayTicks(2)
		End while 
	End if 
	If (Records in selection:C76([PREFERENCES:116])=0)
		//add the the preferences list here
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		DB_SaveRecord(->[PREFERENCES:116])
	End if 
	
	
	
	If ($_bo_Save)
		//we are saving
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(<>PW_Bo_WindowsAutoLogin; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>PW_bo_PasswordExpires; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>PW_l_ExpiryDays; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		CLEAR SEMAPHORE:C144("PWAutoLoginPrefs")  // Clear locking everyone as we have now created the record
	Else 
		CLEAR SEMAPHORE:C144("PWAutoLoginPrefs")  // Clear locking everyone as we have now created the record
		//we are just reading
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>PW_Bo_WindowsAutoLogin; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>PW_bo_PasswordExpires; $_l_offset)
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>PW_l_ExpiryDays; $_l_offset)
			End if 
		End if 
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("$PWAutoLoginPrefs")
ERR_MethodTrackerReturn("DB_LoadPasswordAutoSetup"; $_t_oldMethodName)