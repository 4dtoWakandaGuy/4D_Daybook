//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SkinsPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2012 13:14
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
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ItemID; $_l_LoadAttempts; $_l_Offset; $_l_Size; $_l_SkinsID; $_l_SkinsReference; $0; INT_l_ContextualSheen; INT_l_GreySheen; INT_l_OSXGrey)
	C_LONGINT:C283(INT_l_PlainGrey; INT_l_PlainWhite)
	C_OBJECT:C1216(INT_OBJ_INterfaceObject)
	C_TEXT:C284($_t_OldMethodName)
End if 

//Code Starts Here


$_t_OldMethodName:=ERR_MethodTracker("INT_SkinsPrefs")
If (Not:C34(INT_bo_SkinsPrefsLoaded))
	
	$_l_LoadAttempts:=0
	While (Semaphore:C143("SkinSetting")) & ($_l_LoadAttempts<100)
		$_l_LoadAttempts:=$_l_LoadAttempts+1
		DelayTicks(10*$_l_LoadAttempts)
	End while 
	If ($_l_LoadAttempts<100)
		READ ONLY:C145([PREFERENCES:116])
		$_l_LoadAttempts:=0
		While (Semaphore:C143("LoadingPrefsSkins")) & ($_l_LoadAttempts<100)
			$_l_LoadAttempts:=$_l_LoadAttempts+1
			DelayTicks(10*$_l_LoadAttempts)
		End while 
		If ($_l_LoadAttempts<100)
			$_l_ItemID:=PREF_GetPreferenceID("Skins Preferences")
			If ($_l_ItemID>0)
				CLEAR SEMAPHORE:C144("LoadingPrefsSkins")
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				If (Records in selection:C76([PREFERENCES:116])=0)
					READ WRITE:C146([PREFERENCES:116])
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					$_l_Offset:=0
					VARIABLE TO BLOB:C532(INT_al_SkinOwnerIDs; [PREFERENCES:116]DataBlob:2)  // log to diary
					VARIABLE TO BLOB:C532(INT_al_SkinNumbers; [PREFERENCES:116]DataBlob:2; *)  //log to email
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
				Else 
					$_l_Offset:=0
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; INT_al_SkinOwnerIDs; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; INT_al_SkinNumbers; $_l_Offset)
						
					End if 
					
					UNLOAD RECORD:C212([PREFERENCES:116])
					
					
				End if 
				$_l_Size:=Size of array:C274(INT_al_SkinOwnerIDs)
				//NG November 2004 to make sure no mismatch
				ARRAY LONGINT:C221(INT_al_SkinOwnerIDs; $_l_Size)
				ARRAY LONGINT:C221(INT_al_SkinNumbers; $_l_Size)
				INT_bo_SkinsPrefsLoaded:=True:C214
				If (<>PER_l_CurrentUserID>0)
					$_l_SkinsReference:=Find in array:C230(INT_al_SkinOwnerIDs; <>PER_l_CurrentUserID)
					If ($_l_SkinsReference<0)
						//Default
						$_l_SkinsID:=1
					Else 
						$_l_SkinsID:=INT_al_SkinNumbers{$_l_SkinsReference}
					End if 
					
				Else 
					//Default
					$_l_SkinsID:=1
				End if 
				
				INT_l_ContextualSheen:=0
				INT_l_GreySheen:=0
				INT_l_PlainWhite:=0
				INT_l_PlainGrey:=0
				INT_l_OSXGrey:=0
				
				Case of 
					: ($_l_SkinsID=1)
						INT_l_ContextualSheen:=1
					: ($_l_SkinsID=2)
						INT_l_GreySheen:=1
					: ($_l_SkinsID=3)
						INT_l_PlainWhite:=1
					: ($_l_SkinsID=4)
						INT_l_PlainGrey:=1
					: ($_l_SkinsID=5)
						INT_l_OSXGrey:=1
					Else 
						$_l_SkinsID:=3
				End case 
			Else 
				INT_l_ContextualSheen:=0
				INT_l_GreySheen:=0
				INT_l_PlainWhite:=0
				INT_l_PlainGrey:=0
				INT_l_OSXGrey:=0
				INT_l_PlainWhite:=1
				$_l_SkinsID:=3
			End if 
		Else 
			//defaults
			INT_l_ContextualSheen:=0
			INT_l_GreySheen:=0
			INT_l_PlainWhite:=0
			INT_l_PlainGrey:=0
			INT_l_OSXGrey:=0
			INT_l_PlainWhite:=1
			$_l_SkinsID:=3
		End if 
	Else 
		//defaults
		INT_l_ContextualSheen:=0
		INT_l_GreySheen:=0
		INT_l_PlainWhite:=0
		INT_l_PlainGrey:=0
		INT_l_OSXGrey:=0
		INT_l_PlainWhite:=1
		
	End if 
	OB SET:C1220(INT_OBJ_INterfaceObject; "BackGround"; $_l_SkinsID)
	
	CLEAR SEMAPHORE:C144("SkinSetting")
Else 
	$_l_SkinsID:=OB Get:C1224(INT_OBJ_INterfaceObject; "BackGround")
	$0:=$_l_SkinsID
	Case of 
		: ($_l_SkinsID=1)
			INT_l_ContextualSheen:=1
		: ($_l_SkinsID=2)
			INT_l_GreySheen:=1
		: ($_l_SkinsID=3)
			INT_l_PlainWhite:=1
		: ($_l_SkinsID=4)
			INT_l_PlainGrey:=1
		: ($_l_SkinsID=5)
			INT_l_OSXGrey:=1
		Else 
			$_l_SkinsID:=3
	End case 
	
End if 
ERR_MethodTrackerReturn("INT_SkinsPrefs"; $_t_OldMethodName)