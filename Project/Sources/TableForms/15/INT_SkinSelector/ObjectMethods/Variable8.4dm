If (False:C215)
	//object Name: [USER]INT_SkinSelector.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_ItemID; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].INT_SkinSelector.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388
If (User in group:C338(Current user:C182; "ADMINISTRATOR"))
	Gen_Confirm("Are you sure you want to delete all preferences for interface settings?"; "Yes"; "No")
	If (Ok=1)
		$_l_Retries:=0
		While (Semaphore:C143("SkinSetting"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		$_l_Retries:=0
		While (Semaphore:C143("LoadingPrefsSkins"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		READ ONLY:C145([PREFERENCES:116])
		$_l_ItemID:=PREF_GetPreferenceID("Skins Preferences")
		If ($_l_ItemID>0)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			If (Records in selection:C76([PREFERENCES:116])>0)
				DELETE SELECTION:C66([PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
			End if 
		End if 
		CLEAR SEMAPHORE:C144("LoadingPrefsSkins")
		CLEAR SEMAPHORE:C144("SkinSetting")
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ:INT_SkinSelector,Variable8"; $_t_oldMethodName)
