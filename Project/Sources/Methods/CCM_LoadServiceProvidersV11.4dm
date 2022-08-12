//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadServiceProvidersV11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 13:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_AuthActive; 0)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	ARRAY LONGINT:C221($_al_AuthProvidorID; 0)
	ARRAY LONGINT:C221($_al_reconcileTime; 0)
	ARRAY LONGINT:C221($_al_Services; 0)
	ARRAY LONGINT:C221($_al_TestMode; 0)
	//ARRAY LONGINT(CCM_al_AuthProvidorID;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	ARRAY TEXT:C222($_at_AuthIDs; 0)
	ARRAY TEXT:C222($_at_AuthLogins; 0)
	ARRAY TEXT:C222($_at_AuthNames; 0)
	ARRAY TEXT:C222($_at_AuthPasswords; 0)
	ARRAY TEXT:C222($_at_AuthProviderName; 0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_BLOB:C604($_blb_NameInBlob; $_blb_PublicKey; CCM_blb_NameInBlob; CCM_blb_NameInBlob2; CCM_blb_PublicKey)
	C_BOOLEAN:C305($_bo_CardDecode; $_bo_CardLog; $_bo_CompanyCards; $_bo_OK; $_bo_useAVS; $_bo_UseCoRef; $_bo_useCV2; $1; CCM_bo_CardDecode; CCM_bo_CardLog; CCM_bo_CompanyCards)
	C_BOOLEAN:C305(CCM_bo_IsLicenced; CCM_bo_OfflineHandling; CCM_bo_useAVS; CCM_bo_UseCoRef; CCM_bo_useCV2; CCM_bo_userAVS)
	C_COLLECTION:C1488($_Col_AuthActive; $_col_AuthIDS; $_Col_AuthLogins; $_Col_AuthNames; $_Col_AuthPasswords; $_col_ProviderIDS; $_Col_ProviderNames; $_col_ReconcileTIme; $_Col_Services; $_Col_TestMode)
	C_LONGINT:C283($_l_Delay; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Retries; $_l_SizeofArray; ACC_l_YearID)
	C_OBJECT:C1216($_obj_Data; $_obj_Preference; $_obj_Preferences; $2)
	C_TEXT:C284($_t_EmailAddress; $_t_oldMethodName; CCM_t_EmailAddress)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadServiceProvidersV11")
//NG Feb 2005 New method to load/Save Authorization Service Provider data
CCM_bo_OfflineHandling:=False:C215

//there will a licence issuer for the module.
$_l_Retries:=0
While (Semaphore:C143("LoadingAuthServices"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Auth ServicesV11")

//QUERY([PREFERENCES]; [PREFERENCES]IDNumber=$_l_ItemID)  //One record for the database
$_obj_Preferences:=ds:C1482.PREFERENCES.query("IDNumber =:1"; $_l_ItemID)
//here use a Check_Locked
If ($_obj_Preferences.length=0)
	$_obj_Preference:=ds:C1482.PREFERENCES.new()
	$_obj_Preference.IDNumber:=$_l_ItemID
	DB_SaveEntity($_obj_Preference)
Else 
	$_obj_Preference:=$_obj_Preferences[0]
End if 
Case of 
	: (Count parameters:C259>=2)
		$_obj_Data:=$2
		ARRAY LONGINT:C221($_al_Services; 0)
		ARRAY TEXT:C222($_at_AuthNames; 0)
		ARRAY TEXT:C222($_at_AuthProviderName; 0)
		ARRAY LONGINT:C221($_al_AuthProvidorID; 0)  //from the list item id
		ARRAY TEXT:C222($_at_AuthLogins; 0)  //Not used with all providers
		ARRAY TEXT:C222($_at_AuthPasswords; 0)  //Not used with all providers
		ARRAY TEXT:C222($_at_AuthIDs; 0)  //Not used with all providers
		ARRAY LONGINT:C221($_al_reconcileTime; 0)
		ARRAY LONGINT:C221($_al_TestMode; 0)
		ARRAY BOOLEAN:C223($_abo_AuthActive; 0)
		$_l_Offset:=0
		If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
			BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_al_Services; $_l_offset)
			If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
				BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_at_AuthNames; $_l_offset)  //The' local' name of the service
				If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_at_AuthProviderName; $_l_offset)
					If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
						BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_al_AuthProvidorID; $_l_offset)
						If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
							BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_at_AuthLogins; $_l_offset)
							If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
								BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_at_AuthPasswords; $_l_offset)
								If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
									BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_at_AuthIDs; $_l_offset)
									If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
										BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_abo_AuthActive; $_l_offset)
										If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
											BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_blb_NameInBlob; $_l_offset)
											If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
												BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_useCV2; $_l_offset)
												If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
													BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_useAVS; $_l_offset)
													If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
														BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_blb_PublicKey; $_l_offset)
														If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
															BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_al_TestMode; $_l_offset)
															If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_CompanyCards; $_l_offset)
																If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																	BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_UseCoRef; $_l_offset)
																	
																	If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																		BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_CardDecode; $_l_offset)
																		
																		
																		If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																			BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_bo_CardLog; $_l_offset)
																			
																			
																			If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																				BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_t_EmailAddress; $_l_offset)
																				If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
																					BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; $_al_reconcileTime; $_l_offset)
																				End if 
																				
																				
																			End if 
																			
																		End if 
																	End if 
																End if 
															End if 
														End if 
														
													End if 
													
												End if 
												
											End if 
											
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		$_Col_Services:=New collection:C1472
		$_Col_AuthNames:=New collection:C1472
		$_Col_ProviderNames:=New collection:C1472
		$_col_ProviderIDS:=New collection:C1472
		$_Col_AuthLogins:=New collection:C1472
		$_Col_AuthPasswords:=New collection:C1472
		$_col_AuthIDS:=New collection:C1472
		$_col_ReconcileTIme:=New collection:C1472
		$_Col_TestMode:=New collection:C1472
		$_Col_AuthActive:=New collection:C1472
		ARRAY TO COLLECTION:C1563($_Col_Services; $_al_Services)
		ARRAY TO COLLECTION:C1563($_Col_AuthNames; $_at_AuthNames)
		ARRAY TO COLLECTION:C1563($_Col_ProviderNames; $_at_AuthProviderName)
		ARRAY TO COLLECTION:C1563($_col_ProviderIDS; $_al_AuthProvidorID)
		ARRAY TO COLLECTION:C1563($_Col_AuthLogins; $_at_AuthLogins)
		ARRAY TO COLLECTION:C1563($_Col_AuthPasswords; $_at_AuthPasswords)
		ARRAY TO COLLECTION:C1563($_col_AuthIDS; $_at_AuthIDs)
		ARRAY TO COLLECTION:C1563($_col_ReconcileTIme; $_al_reconcileTime)
		ARRAY TO COLLECTION:C1563($_Col_TestMode; $_al_TestMode)
		ARRAY TO COLLECTION:C1563($_Col_AuthActive; $_abo_AuthActive)
		$_obj_Data.Services:=$_Col_Services
		$_obj_Data.AuthNames:=$_Col_AuthNames
		$_obj_Data.ProviderNames:=$_Col_ProviderNames
		$_obj_Data.ProviderIDS:=$_col_ProviderIDS
		$_obj_Data.AuthLogins:=$_Col_AuthLogins
		$_obj_Data.AuthPasswords:=$_Col_AuthPasswords
		$_obj_Data.AuthIDS:=$_col_AuthIDS
		$_obj_Data.ReconcileTime:=$_col_ReconcileTime
		$_obj_Data.TestMode:=$_Col_TestMode
		$_obj_Data.AuthActive:=$_Col_AuthActive
		If (BLOB size:C605(CCM_blb_NameInBlob)>0)
			
			
			$_obj_Data.IsLicenced:=CCM_VerifyLicence(CCM_blb_NameInBlob)
			
			
			
			
		Else 
			$_obj_Data.IsLicenced:=False:C215
		End if 
		If (Not:C34($_obj_Data.IsLicenced))
			If (Not:C34(Is compiled mode:C492))
				$_obj_Data.OfflineHandling:=True:C214
			End if 
		End if 
	Else 
		
		If (Records in selection:C76([PREFERENCES:116])>0)
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
			
		End if 
		
		If (Records in selection:C76([PREFERENCES:116])=0)  //add the the preferences list here
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			DB_SaveRecord(->[PREFERENCES:116])
		End if   //this will be ONE record
		$_l_offset:=0
		If (Count parameters:C259=1)
			ARRAY LONGINT:C221(CCM_al_Services; 0)
			ARRAY TEXT:C222(CCM_at_AuthNames; 0)
			ARRAY TEXT:C222(CCM_at_AuthProviderName; 0)
			ARRAY LONGINT:C221(CCM_al_AuthProvidorID; 0)  //from the list item id
			ARRAY TEXT:C222(CCM_at_AuthLogins; 0)  //Not used with all providers
			ARRAY TEXT:C222(CCM_at_AuthPasswords; 0)  //Not used with all providers
			ARRAY TEXT:C222(CCM_at_AuthIDs; 0)  //Not used with all providers
			ARRAY LONGINT:C221(CCM_al_reconcileTime; 0)
			ARRAY LONGINT:C221(CCM_al_TestMode; 0)
			ARRAY BOOLEAN:C223(CCM_abo_AuthActive; 0)
			//*********************************************************************************************
			
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_al_Services; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_at_AuthNames; $_l_offset)  //The' local' name of the service
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_at_AuthProviderName; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_al_AuthProvidorID; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_at_AuthLogins; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_at_AuthPasswords; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_at_AuthIDs; $_l_offset)
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_abo_AuthActive; $_l_offset)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_blb_NameInBlob; $_l_offset)
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_useCV2; $_l_offset)
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_useAVS; $_l_offset)
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_blb_PublicKey; $_l_offset)
															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_al_TestMode; $_l_offset)
																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_CompanyCards; $_l_offset)
																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_UseCoRef; $_l_offset)
																		
																		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_CardDecode; $_l_offset)
																			
																			
																			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_bo_CardLog; $_l_offset)
																				
																				
																				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_t_EmailAddress; $_l_offset)
																					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CCM_al_reconcileTime; $_l_offset)
																					End if 
																					
																					
																				End if 
																				
																			End if 
																		End if 
																	End if 
																End if 
															End if 
															
														End if 
														
													End if 
													
												End if 
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
			
			
			
			
			$_l_SizeofArray:=Size of array:C274(CCM_al_Services)
			ARRAY LONGINT:C221(CCM_al_Services; $_l_SizeofArray)
			ARRAY TEXT:C222(CCM_at_AuthNames; $_l_SizeofArray)
			ARRAY TEXT:C222(CCM_at_AuthProviderName; $_l_SizeofArray)
			ARRAY LONGINT:C221(CCM_al_AuthProvidorID; $_l_SizeofArray)  //from the list item id
			ARRAY TEXT:C222(CCM_at_AuthLogins; $_l_SizeofArray)  //Not used with all providers
			ARRAY TEXT:C222(CCM_at_AuthPasswords; $_l_SizeofArray)  //Not used with all providers
			ARRAY TEXT:C222(CCM_at_AuthIDs; $_l_SizeofArray)  //Not used with all providers
			ARRAY BOOLEAN:C223(CCM_abo_AuthActive; $_l_SizeofArray)
			ARRAY LONGINT:C221(CCM_al_TestMode; $_l_SizeofArray)
			ARRAY LONGINT:C221(CCM_al_reconcileTime; $_l_SizeofArray)
			SORT ARRAY:C229(CCM_at_AuthNames; CCM_al_Services; CCM_at_AuthProviderName; CCM_al_AuthProvidorID; CCM_at_AuthLogins; CCM_at_AuthPasswords; CCM_at_AuthIDs; CCM_abo_AuthActive; CCM_al_TestMode; CCM_al_reconcileTime)
			
			
			$_l_offset:=0
		Else 
			
			
			//Update
			READ WRITE:C146([PREFERENCES:116])
			LOAD RECORD:C52([PREFERENCES:116])
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(CCM_al_Services; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_at_AuthNames; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_at_AuthProviderName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_al_AuthProvidorID; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_at_AuthLogins; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_at_AuthPasswords; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_at_AuthIDs; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_abo_AuthActive; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_blb_NameInBlob; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_useCV2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_useAVS; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_blb_PublicKey; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_al_TestMode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_CompanyCards; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_UseCoRef; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_CardDecode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_bo_CardLog; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_t_EmailAddress; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(CCM_al_reconcileTime; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			
		End if 
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		CLEAR SEMAPHORE:C144("LoadingAuthServices")
End case 
ERR_MethodTrackerReturn("CCM_LoadServiceProvidersV11"; $_t_oldMethodName)
