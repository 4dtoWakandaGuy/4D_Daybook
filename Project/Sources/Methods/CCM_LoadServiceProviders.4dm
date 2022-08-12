//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadServiceProviders
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_abo_AuthActive;0)
	//ARRAY LONGINT(CCM_al_AuthProvidorID;0)
	//ARRAY LONGINT(CCM_al_reconcileTime;0)
	//ARRAY LONGINT(CCM_al_Services;0)
	//ARRAY LONGINT(CCM_al_TestMode;0)
	//ARRAY TEXT(CCM_at_AuthIDs;0)
	//ARRAY TEXT(CCM_at_AuthLogins;0)
	//ARRAY TEXT(CCM_at_AuthNames;0)
	//ARRAY TEXT(CCM_at_AuthPasswords;0)
	//ARRAY TEXT(CCM_at_AuthProviderName;0)
	C_BLOB:C604(CCM_blb_NameInBlob; CCM_blb_PublicKey)
	C_BOOLEAN:C305($_bo_OK; CCM_bo_CardDecode; CCM_bo_CardLog; CCM_bo_CompanyCards; CCM_bo_IsLicenced; CCM_bo_OfflineHandling; CCM_bo_useAVS; CCM_bo_UseCoRef; CCM_bo_useCV2)
	C_LONGINT:C283($_l_Delay; $_l_DelayTicks; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Retries; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; CCM_t_EmailAddress)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadServiceProviders")

//NG Feb 2005 New method to load/Save Authorization Service Provider data
CCM_bo_OfflineHandling:=False:C215

//there will a licence issuer for the module.
$_l_DelayTicks:=0
$_l_Retries:=0
While (Semaphore:C143("LoadingAuthServices"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Auth Services")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database

//here use a Check_Locked
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

If (Records in selection:C76([PREFERENCES:116])=0)
	//add the the preferences list here
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
	
	//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
	//********************************************************************************************
	
	
	If (BLOB size:C605(CCM_blb_NameInBlob)>0)
		
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//*********************************************************************************************
		
		CCM_bo_IsLicenced:=CCM_VerifyLicence
		
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//********************************************************************************************
		
		
	Else 
		CCM_bo_IsLicenced:=False:C215
	End if 
	If (Not:C34(CCM_bo_IsLicenced))
		If (Not:C34(Is compiled mode:C492))
			CCM_bo_OfflineHandling:=True:C214
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
	
	//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
	//*********************************************************************************************
	
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
	SAVE RECORD:C53([PREFERENCES:116])
	DB_SaveRecord(->[PREFERENCES:116])
	
	//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
	//********************************************************************************************
	
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingAuthServices")
ERR_MethodTrackerReturn("CCM_LoadServiceProviders"; $_t_oldMethodName)