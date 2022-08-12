If (False:C215)
	//Table Form Method Name: [USER]BK_StoreSetup
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
	C_BOOLEAN:C305(DB_bo_NoLoad; DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; $_l_offset; BeditPassword; DM_l_BKServerID; DM_l_BKStoreID)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKServerName; DM_t_BKStoreName; DM_t_BkStorePassLock; DM_t_BKStorePassword)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].BK_StoreSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "BK_StoreSetup")
		WS_AutoscreenSize(3; 160; 468)
		DM_Bo_BKedit:=False:C215
		
		If (DM_l_BKServerID>0)
			//Load Server Name
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BKServerID)
			If (Records in selection:C76([PREFERENCES:116])>0)
				DM_BKServerBlobtoVars
			End if 
			
		Else 
			DM_t_BKServerName:=""
			//here would need to load to a pop-up
		End if 
		If (DM_l_BKStoreID>0)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BKStoreID)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKStoreName; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKStorePassword; $_l_offset)
			End if 
			
			//here set the password to "*"
			DM_t_BkStorePassLock:="*"*Length:C16(DM_t_BKStorePassword)
			SET WINDOW TITLE:C213("EDIT STORE SETTINGS "+DM_t_BKStoreName)
			
		Else 
			//new Store
			SET WINDOW TITLE:C213("CREATE NEW STORE")
			
			DM_t_BKStoreName:=""
			DM_t_BKStorePassword:=""
			DM_t_BkStorePassLock:=""
			OBJECT SET ENTERABLE:C238(DM_t_BkStorePassLock; True:C214)
			OBJECT SET VISIBLE:C603(BeditPassword; False:C215)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM [USER].BK_StoreSetup"; $_t_oldMethodName)
