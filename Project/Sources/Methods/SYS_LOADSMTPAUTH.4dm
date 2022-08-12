//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_LOADSMTPAUTH
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
	//ARRAY LONGINT(GEN_al_AuthenticationTypes;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY TEXT(GEN_at_AuthenticationType;0)
	//ARRAY TEXT(SMTP_at_UserAuthName;0)
	//ARRAY TEXT(SMTP_at_UserAuthPass;0)
	C_BOOLEAN:C305($_bo_Save; $1; SYS_bo_AuthSettingsLoaded)
	C_LONGINT:C283($_l_CurrentPrefID; $_l_ItemID; $_l_offset; $_l_SizeofArray; $_l_SizeofArrayofBlob; SMTP_l_AUTH; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType)
	C_POINTER:C301($_ptr_GeneralPassActive; $_ptr_GeneralPassAuth; $_ptr_GeneralPassName; $_ptr_GeneralPassType; $_ptr_SMTPAUth; $_ptr_UserAuthActive; $_ptr_UserAuthNames; $_ptr_UserAuthPasswords; $_ptr_UserAuthTypes; $_ptr_UserIDS; $_ptr_UserUseSSL)
	C_POINTER:C301($10; $11; $12; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_LOADSMTPAUTH")
//this method loads to arrays the SMTP preferences
If (Count parameters:C259>=2)
	
End if 
If (Count parameters:C259>=1)
	$_bo_Save:=$1  //Pass $1 as true to save updated prefs
Else 
	$_bo_Save:=False:C215
End if 
If (Count parameters:C259>=2)
	$_ptr_SMTPAUth:=$2
	If (Count parameters:C259>=3)
		$_ptr_GeneralPassActive:=$3
		If (Count parameters:C259>=4)
			$_ptr_GeneralPassType:=$4
			If (Count parameters:C259>=5)
				$_ptr_GeneralPassName:=$5
				If (Count parameters:C259>=6)
					$_ptr_GeneralPassAuth:=$6
					If (Count parameters:C259>=7)
						$_ptr_UserIDS:=$7
						If (Count parameters:C259>=8)
							$_ptr_UserAuthActive:=$8
							If (Count parameters:C259>=9)
								$_ptr_UserAuthTypes:=$9
								If (Count parameters:C259>=10)
									$_ptr_UserAuthNames:=$10
									//SMTP_at_UserAuthPass
									If (Count parameters:C259>=11)
										$_ptr_UserAuthPasswords:=$11
										//SMTP_abo_UserPassSSL
										If (Count parameters:C259>=12)
											$_ptr_UserUseSSL:=$12
											//SMTP_abo_UserPassSSL
										Else 
											$_ptr_UserUseSSL:=->SMTP_abo_UserPassSSL
										End if 
									Else 
										$_ptr_UserAuthPasswords:=->SMTP_at_UserAuthPass
									End if 
								Else 
									$_ptr_UserAuthNames:=->SMTP_at_UserAuthName
								End if 
							Else 
								$_ptr_UserAuthTypes:=->SMTP_al_UserAuthType
							End if 
							
						Else 
							$_ptr_UserAuthActive:=->SMTP_al_UserAuthActive
						End if 
					Else 
						$_ptr_UserIDS:=->SMTP_al_UserIDs
					End if 
					
				Else 
					$_ptr_GeneralPassAuth:=->SMTP_t_GeneralPassAuth
				End if 
			Else 
				$_ptr_GeneralPassName:=->SMTP_t_GeneralPassName
			End if 
			
		Else 
			$_ptr_GeneralPassType:=->SMTP_l_GeneralPassType
		End if 
		
	Else 
		$_ptr_GeneralPassActive:=->SMTP_l_GeneralPassActive
	End if 
Else 
	$_ptr_SMTPAUth:=->SMTP_l_AUTH
End if 
If (SYS_bo_AuthSettingsLoaded=False:C215) | ($_bo_Save)
	SYS_bo_AuthSettingsLoaded:=True:C214  //it may seem strange to set this here-but if there is a problem in this method the settings load over and over again and CABOOM
	//also if the error came whilst loading a pref-this causees the pref record to get unloaded. so
	$_l_CurrentPrefID:=[PREFERENCES:116]IDNumber:1
	//SMTP_l_AUTH Acti ve indicates if this system uses auth for all users
	//$_ptr_GeneralPassActive-> `indicates if the auth uses a single password authentication for all users-if that is off the following values will be blank
	//SMTP_l_GeneralPassType
	//SMTP_t_GeneralPassName
	//SMTP_t_GeneralPassAuth
	//even if the SMTP_l_Auth is 0 it can be on for some users
	//SMTP_al_UserIDs `contains a list of the user ids
	//SMTP_al_UserAuthActive `Contains a list of the user auth active(is NOT only read when  SMTP_l_AUTH=0) but if SMTP_l_AUTH is 1 this is 1
	//SMTP_al_UserAuthType `Is defaulted to -1-if it is -1 then the value of SMTP_l_GeneralPassType is used else the valiue of  SMTP_al_UserAuthType
	//SMTP_at_UserAuthName contains a list of the user names for Exchange server-note these are not enterable if the  $_ptr_GeneralPassActive-> is set
	//SMTP_at_UserAuthPass contains a list of the usr ids for exchange-note these are not enterable if the  $_ptr_GeneralPassActive-> is set
	While (Semaphore:C143("LoadingSMTPPrefs"))
		DelayTicks(2)
	End while 
	//Note this same static set of values is loaded in Per_LoadSMTPAuth so if you need to modify it do so in both
	ARRAY LONGINT:C221(GEN_al_AuthenticationTypes; 4)
	ARRAY TEXT:C222(GEN_at_AuthenticationType; 4)
	//GEN_al_AuthenticationTypes{1}:=-1=Use  System setting
	GEN_al_AuthenticationTypes{1}:=0
	GEN_al_AuthenticationTypes{2}:=1
	GEN_al_AuthenticationTypes{3}:=2
	GEN_al_AuthenticationTypes{4}:=3
	//GEN_at_AuthenticationType{}:="Use System Setting"
	GEN_at_AuthenticationType{1}:="Most Secure Available"
	GEN_at_AuthenticationType{2}:="Plain"
	GEN_at_AuthenticationType{3}:="Password"
	GEN_at_AuthenticationType{4}:="CRAM-MD5"
	
	
	
	//********** kmw 28/07/08 - moved declare and initialise arrays from PRIOR to the test for if we are saving to ONLY occur if we are in LOAD or NEW section of this method - SHOULD NOT BE RESETTING THESE (or ANY SMTP settings) TO BLANK IF WE ARE TRYING TO SAVE THEM!!!! **********
	//re-unactivated `temporarily reactivated to see if get rid of errors in preferences
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY STRING(255;SMTP_at_UserAuthName;0)
	//ARRAY STRING(255;SMTP_at_UserAuthPass;0)
	//**************************************************************************************************************************************************************************************
	READ ONLY:C145([PREFERENCES:116])
	
	
	$_l_ItemID:=PREF_GetPreferenceID("SMTPAuthSettings")
	
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		//********** kmw 28/07/08 - moved declare and initialise arrays from PRIOR to the test for if we are saving to ONLY occur if we are in LOAD or NEW section of this method - SHOULD NOT BE RESETTING THESE (or ANY SMTP settings) TO BLANK IF WE ARE TRYING TO SAVE THEM!!!! **********
		ARRAY LONGINT:C221($_ptr_UserIDS->; 0)
		ARRAY LONGINT:C221($_ptr_UserAuthActive->; 0)
		ARRAY LONGINT:C221($_ptr_UserAuthTypes->; 0)
		ARRAY TEXT:C222($_ptr_UserAuthNames->; 0)
		ARRAY TEXT:C222($_ptr_UserAuthPasswords->; 0)
		ARRAY BOOLEAN:C223($_ptr_UserUseSSL->; 0)
		//**************************************************************************************************************************************************************************************
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		VARIABLE TO BLOB:C532($_ptr_SMTPAUth->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassActive->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassType->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassName->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassAuth->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserIDS->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthActive->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthTypes->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthNames->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthPasswords->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserUseSSL->; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	End if 
	If (Count parameters:C259>=1)
		$_bo_Save:=$1  //Pass $1 as true to save updated prefs
	Else 
		$_bo_Save:=False:C215
	End if 
	If ($_bo_Save=False:C215)
		//Load prefs
		//********** kmw 28/07/08 - moved declare and initialise arrays from PRIOR to the test for if we are saving to ONLY occur if we are in LOAD or NEW section of this method - SHOULD NOT BE RESETTING THESE (or ANY SMTP settings) TO BLANK IF WE ARE TRYING TO SAVE THEM!!!! **********
		ARRAY LONGINT:C221($_ptr_UserIDS->; 0)
		ARRAY LONGINT:C221($_ptr_UserAuthActive->; 0)
		ARRAY LONGINT:C221($_ptr_UserAuthTypes->; 0)
		ARRAY TEXT:C222($_ptr_UserAuthNames->; 0)
		ARRAY TEXT:C222($_ptr_UserAuthPasswords->; 0)
		ARRAY BOOLEAN:C223($_ptr_UserUseSSL->; 0)
		//**************************************************************************************************************************************************************************************
		
		$_l_offset:=0
		$_l_SizeofArrayofBlob:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		If ($_l_offset<($_l_SizeofArrayofBlob))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_SMTPAUth->; $_l_offset)
			If ($_l_offset<($_l_SizeofArrayofBlob))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_GeneralPassActive->; $_l_offset)
				If ($_l_offset<($_l_SizeofArrayofBlob))
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_GeneralPassType->; $_l_offset)
					If ($_l_offset<($_l_SizeofArrayofBlob))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_GeneralPassName->; $_l_offset)
						If ($_l_offset<($_l_SizeofArrayofBlob))
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_GeneralPassAuth->; $_l_offset)
							If ($_l_offset<($_l_SizeofArrayofBlob))
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserIDS->; $_l_offset)
								If ($_l_offset<($_l_SizeofArrayofBlob))
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserAuthActive->; $_l_offset)
									If ($_l_offset<($_l_SizeofArrayofBlob))
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserAuthTypes->; $_l_offset)
										If ($_l_offset<($_l_SizeofArrayofBlob))
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserAuthNames->; $_l_offset)
											If ($_l_offset<($_l_SizeofArrayofBlob))
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserAuthPasswords->; $_l_offset)
												
												If ($_l_offset<($_l_SizeofArrayofBlob))
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_UserUseSSL->; $_l_offset)
													//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
												Else 
													
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
		$_l_SizeofArray:=Size of array:C274($_ptr_UserIDS->)
		ARRAY LONGINT:C221($_ptr_UserIDS->; $_l_SizeofArray)
		ARRAY LONGINT:C221($_ptr_UserAuthActive->; $_l_SizeofArray)
		ARRAY LONGINT:C221($_ptr_UserAuthTypes->; $_l_SizeofArray)
		ARRAY TEXT:C222($_ptr_UserAuthNames->; $_l_SizeofArray)
		ARRAY TEXT:C222($_ptr_UserAuthPasswords->; $_l_SizeofArray)
		ARRAY BOOLEAN:C223($_ptr_UserUseSSL->; $_l_SizeofArray)
		
	Else 
		//Save prefs
		READ WRITE:C146([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532($_ptr_SMTPAUth->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassActive->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassType->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassName->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_GeneralPassAuth->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserIDS->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthActive->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthTypes->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthNames->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserAuthPasswords->; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_UserUseSSL->; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	End if 
	CLEAR SEMAPHORE:C144("LoadingSMTPPrefs")
	If ($_l_CurrentPrefID>0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CurrentPrefID)
	End if 
	
End if 
ERR_MethodTrackerReturn("SYS_LOADSMTPAUTH"; $_t_oldMethodName)
