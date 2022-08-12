//%attributes = {}
If (False:C215)
	//Project Method Name:      DSS_LoadPrefs
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
	C_BOOLEAN:C305(DSS_bo_Enabled; DSS_bo_PrefsLoaded)
	C_LONGINT:C283($_l_ItemID; $_l_offset; DSS_l_SendContractCustomers; DSS_l_SendContractData; DSS_l_SendCustomers)
	C_TEXT:C284($_t_oldMethodName; DSS_t_ServerIPaddress)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DSS_LoadPrefs")
// DSS_LoadPrefs
//this method load the prefs for the Data Synchro(Service module)
// 5/11/2002


If (Not:C34(DSS_bo_PrefsLoaded))
	While (Semaphore:C143("LoadingServicePrefs"))
		DelayTicks(2)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Service Preferences")
	DSS_bo_Enabled:=False:C215
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(DSS_bo_Enabled; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSS_t_ServerIPaddress; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSS_l_SendCustomers; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSS_l_SendContractCustomers; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DSS_l_SendContractData; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSS_bo_Enabled; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSS_t_ServerIPaddress; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSS_l_SendCustomers; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSS_l_SendContractCustomers; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DSS_l_SendContractData; $_l_offset)
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingServicePrefs")
	
	DSS_bo_PrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("DSS_LoadPrefs"; $_t_oldMethodName)