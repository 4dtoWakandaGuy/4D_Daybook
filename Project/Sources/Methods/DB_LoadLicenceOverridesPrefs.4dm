//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadLicenceOverridesPrefs
	//------------------ Method Notes ------------------
	//Licence override preferences all the administrator to turn of unused modules.
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 10:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DM_abo_DisableModule;0)
	//ARRAY LONGINT(DM_al_ModuleNumbers;0)
	C_BOOLEAN:C305($_bo_FromTransaction; $_bo_SavePreferences; $1; $2)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_offset; $_l_OverridesData; $_l_Process; $3; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; DM_T_Uservat)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadLicenceOverridesPrefs")

$_bo_FromTransaction:=False:C215
If (Count parameters:C259>=2)
	$_bo_FromTransaction:=$2
End if 
If (Not:C34($_bo_FromTransaction))
	While (Semaphore:C143("LockOverridePreferences"))
		DelayTicks(2)
	End while 
End if 
If (Count parameters:C259>=1)
	$_bo_SavePreferences:=$1
Else 
	$_bo_SavePreferences:=False:C215
End if 
If (Count parameters:C259>=3)
	DB_l_CurrentOwnerRequest:=$3
End if 
If (Not:C34($_bo_SavePreferences))  //note to save they must be loaded!!
	If (Application type:C494=4D Server:K5:6)
		If (DB_l_CurrentOwnerRequest>0)
			$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; DB_l_CurrentOwnerRequest)
		Else 
			$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	End if 
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_OverridesData)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		If (In transaction:C397)
			//If we are in a transaction and creating this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; False:C215; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; False:C215; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
			
		Else 
			ARRAY LONGINT:C221(DM_al_ModuleNumbers; 0)
			ARRAY BOOLEAN:C223(DM_abo_DisableModule; 0)  //ability to set to read only
			CREATE RECORD:C68([PREFERENCES:116])
			
			[PREFERENCES:116]IDNumber:1:=$_l_OverridesData
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				
				[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			End if 
			VARIABLE TO BLOB:C532(DM_al_ModuleNumbers; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_abo_DisableModule; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
		End if 
		
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_ModuleNumbers; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_abo_DisableModule; $_l_offset)
		
	End if 
Else 
	If ($_bo_SavePreferences)
		//note they must be loaded to save them
		If (In transaction:C397)
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; True:C214; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; True:C214; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadLicenceOverridesPrefs"; 128000; "Load override Preferences"; True:C214; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
		Else 
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				$_l_OverridesData:=PREF_GetPreferenceID("Licence Overrides"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
			
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_OverridesData)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_OverridesData
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
					Else 
						[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
					End if 
				Else 
					
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			End if 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_ModuleNumbers; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_abo_DisableModule; $_l_offset)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
		
	End if 
End if 
If (Not:C34($_bo_FromTransaction))
	CLEAR SEMAPHORE:C144("LockOverridePreferences")
End if 
ERR_MethodTrackerReturn("DB_LoadLicenceOverridesPrefs"; $_t_oldMethodName)