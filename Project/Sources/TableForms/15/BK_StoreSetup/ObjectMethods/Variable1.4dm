If (False:C215)
	//object Name: [USER]BK_StoreSetup.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; $_l_ItemID; $_l_Retries; DM_l_BKStoreID)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKStoreName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_StoreSetup.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		READ WRITE:C146([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		$_l_Retries:=0
		While (Semaphore:C143("LoadingStorePrefs"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID(DM_t_BKStoreName; False:C215)
		If ($_l_ItemID>0)
			If ($_l_ItemID#DM_l_BKStoreID)
				Gen_Alert("Sorry That store name is already used")
				DM_t_BKStoreName:=""
			End if 
		End if 
		CLEAR SEMAPHORE:C144("LoadingStorePrefs")
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_StoreSetup.Variable1"; $_t_oldMethodName)
