//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadConfigurationPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FromTransaction; $_bo_SavePreference; $_bo_Unload; $1; $2)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_BasicUserData; $_l_offset; $_l_Process; $3; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; DM_T_AdminName; DM_T_UserAddress1; DM_T_UserAddress2; DM_T_UserCountry; DM_T_UserCounty; DM_T_UserFAX; DM_T_UserName; DM_t_UserOfficeCode; DM_T_UserPostCode; DM_t_UserScreenTitle)
	C_TEXT:C284(DM_T_UserTelephone; DM_T_UserTown; DM_T_Uservat; DM_T_UservatPrefix)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadConfigurationPrefs")
$_bo_FromTransaction:=False:C215
If (Count parameters:C259>=2)
	$_bo_FromTransaction:=$2
End if 
If (Not:C34($_bo_FromTransaction))
	While (Semaphore:C143("LockConfigPreferences"))
		DelayTicks(2)
	End while 
End if 
If (Count parameters:C259>=1)
	$_bo_SavePreference:=$1
Else 
	$_bo_SavePreference:=False:C215
End if 
If (Count parameters:C259>=3)
	DB_l_CurrentOwnerRequest:=$3
End if 
If (Not:C34($_bo_SavePreference))  //note to save they must be loaded!!
	If (Application type:C494=4D Server:K5:6)
		
		If (DB_l_CurrentOwnerRequest>0)
			$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; DB_l_CurrentOwnerRequest)
		Else 
			$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	End if 
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_BasicUserData)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		If (In transaction:C397)
			//If we are in a transaction and creating this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; False:C215; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; False:C215; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
			
		Else 
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (Records in table:C83([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				ALL RECORDS:C47([USER:15])
				
			End if 
			DM_T_AdminName:=[USER:15]Name:38
			DM_T_UserName:=[USER:15]Organisation:1
			DM_T_UserAddress1:=[USER:15]Add1:2
			DM_T_UserAddress2:=[USER:15]Add2:3
			DM_T_UserTown:=[USER:15]Town:4
			DM_T_UserCounty:=[USER:15]County:5
			DM_T_UserPostCode:=[USER:15]Postcode:6
			DM_T_UserCountry:=[USER:15]Country:7
			DM_T_UserTelephone:=[USER:15]Telephone:8
			DM_T_UserFAX:=[USER:15]Fax:9
			DM_T_UservatPrefix:=[USER:15]VAT Prefix:70
			DM_T_Uservat:=[USER:15]VAT Reg No:11
			DM_t_UserScreenTitle:=[USER:15]TScreen_Title:25
			DM_t_UserOfficeCode:=[USER:15]Office Code:13
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_BasicUserData
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				
				[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			End if 
			VARIABLE TO BLOB:C532(DM_T_UserName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserAddress1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserAddress2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserTown; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserPostCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserCounty; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserCountry; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserTelephone; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserFAX; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UservatPrefix; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_Uservat; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_UserScreenTitle; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_UserOfficeCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_AdminName; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
		End if 
		
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserName; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserAddress1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserAddress2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserTown; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserPostCode; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserCounty; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserCountry; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserTelephone; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UserFAX; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_UservatPrefix; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_Uservat; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_UserScreenTitle; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_UserOfficeCode; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_AdminName; $_l_offset)
		Else 
			$_bo_Unload:=False:C215
			If (Records in selection:C76([USER:15])=0)
				$_bo_Unload:=True:C214
			End if 
			If (Records in selection:C76([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				ALL RECORDS:C47([USER:15])
				
			End if 
			
			DM_T_AdminName:=[USER:15]Name:38
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			
			
		End if 
		
	End if 
Else 
	If ($_bo_SavePreference)
		//note they must be loaded to save them
		If (In transaction:C397)
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; True:C214; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; True:C214; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadConfigurationPrefs"; 128000; "Load Config Preferences"; True:C214; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
		Else 
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				$_l_BasicUserData:=PREF_GetPreferenceID("Configuration Owner"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
			
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_BasicUserData)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_BasicUserData
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
			VARIABLE TO BLOB:C532(DM_T_UserName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserAddress1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserAddress2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserTown; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserPostCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserCounty; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserCountry; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserTelephone; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UserFAX; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_UservatPrefix; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_Uservat; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_UserScreenTitle; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_UserOfficeCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_AdminName; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
		
	End if 
End if 
If (Not:C34($_bo_FromTransaction))
	CLEAR SEMAPHORE:C144("LockConfigPreferences")
End if 
ERR_MethodTrackerReturn("DB_LoadConfigurationPrefs"; $_t_oldMethodName)