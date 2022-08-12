//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SaveMyPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INT_al_SkinNumbers;0)
	//ARRAY LONGINT(INT_al_SkinOwnerIDs;0)
	C_BOOLEAN:C305(INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ItemID; $_l_offset; $_l_SkinsRow; INT_l_ContextualSheen; INT_l_GreySheen; INT_l_OSXGrey; INT_l_PlainGrey; INT_l_PlainWhite)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_SaveMyPreference")
If (<>PER_l_CurrentUserID>0)
	While (Semaphore:C143("SkinSetting"))
		DelayTicks(10)
	End while 
	
	READ WRITE:C146([PREFERENCES:116])
	While (Semaphore:C143("LoadingPrefsSkins"))
		DelayTicks(2)
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Skins Preferences")
	CLEAR SEMAPHORE:C144("LoadingPrefsSkins")
	
	If (Not:C34(INT_bo_SkinsPrefsLoaded))
		ARRAY LONGINT:C221(INT_al_SkinOwnerIDs; 0)
		ARRAY LONGINT:C221(INT_al_SkinNumbers; 0)
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			$_l_offset:=0
			VARIABLE TO BLOB:C532(INT_al_SkinOwnerIDs; [PREFERENCES:116]DataBlob:2)  // log to diary
			VARIABLE TO BLOB:C532(INT_al_SkinNumbers; [PREFERENCES:116]DataBlob:2; *)  //log to email
			DB_SaveRecord(->[PREFERENCES:116])
			
		Else 
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; INT_al_SkinOwnerIDs; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; INT_al_SkinNumbers; $_l_offset)
				
			End if 
			
		End if 
	Else 
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	End if 
	
	$_l_SkinsRow:=Find in array:C230(INT_al_SkinOwnerIDs; <>PER_l_CurrentUserID)
	If ($_l_SkinsRow<0)
		INSERT IN ARRAY:C227(INT_al_SkinOwnerIDs; Size of array:C274(INT_al_SkinNumbers)+1; 1)
		INSERT IN ARRAY:C227(INT_al_SkinNumbers; Size of array:C274(INT_al_SkinNumbers)+1; 1)
		INT_al_SkinOwnerIDs{Size of array:C274(INT_al_SkinOwnerIDs)}:=<>PER_l_CurrentUserID
		$_l_SkinsRow:=Size of array:C274(INT_al_SkinNumbers)
	End if 
	Case of 
		: (INT_l_ContextualSheen=1)
			INT_al_SkinNumbers{$_l_SkinsRow}:=1
		: (INT_l_GreySheen=1)
			INT_al_SkinNumbers{$_l_SkinsRow}:=2
		: (INT_l_PlainWhite=1)
			
			INT_al_SkinNumbers{$_l_SkinsRow}:=3
		: (INT_l_PlainGrey=1)
			INT_al_SkinNumbers{$_l_SkinsRow}:=4
		: (INT_l_OSXGrey=1)
			INT_al_SkinNumbers{$_l_SkinsRow}:=5
	End case 
	VARIABLE TO BLOB:C532(INT_al_SkinOwnerIDs; [PREFERENCES:116]DataBlob:2)  // log to diary
	VARIABLE TO BLOB:C532(INT_al_SkinNumbers; [PREFERENCES:116]DataBlob:2; *)  //log to email
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	CLEAR SEMAPHORE:C144("SkinSetting")
End if 
ERR_MethodTrackerReturn("INT_SaveMyPreference"; $_t_oldMethodName)