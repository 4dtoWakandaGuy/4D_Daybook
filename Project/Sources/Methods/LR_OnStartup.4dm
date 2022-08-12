//%attributes = {}

If (False:C215)
	//Project Method Name:      LR_OnStartup
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
	C_LONGINT:C283($_l_ItemID; $_l_offset; LR_l_LicencePortNumber)
	C_TEXT:C284(<>KeyDelim; <>LR_t_User; $_t_oldMethodName; LR_t_LicenceHost; LR_T_WebserviceName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_OnStartup")

//check if this is a new data file and if so set up default Licensing record
$_t_oldMethodName:=ERR_MethodTracker("LR_Onstartup")

//
<>KeyDelim:="Wp4=md%y'Aoh8}#f$4he*6R1qL"
<>LR_t_User:="DEFAULTUSER"  //if app using the licensing system has users this can be set to whoever is logged in
While (Semaphore:C143("LoadingLicencingPrefs"))
	DelayTicks(2)
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Licencing")
If ($_l_ItemID>0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		//add the the preferences list here
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		DB_SaveRecord(->[PREFERENCES:116])
	End if   //this will be ONE record
	If (Count parameters:C259=0)
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_t_LicenceHost; $_l_offset)
			
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_l_LicencePortNumber; $_l_offset)
				
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_T_WebserviceName; $_l_offset)
					
				End if 
			End if 
		End if 
		
		//NG December 2007...when we are ready we can insert in here default settings for the above which will turn this on automatically
	Else 
		READ WRITE:C146([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(LR_t_LicenceHost; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(LR_l_LicencePortNumber; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(LR_T_WebserviceName; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
		
	End if 
End if 
CLEAR SEMAPHORE:C144("LoadingLicencingPrefs")
ERR_MethodTrackerReturn("LR_OnStartup"; $_t_oldMethodName)