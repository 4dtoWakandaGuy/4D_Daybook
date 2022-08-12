If (False:C215)
	//Table Form Method Name: [USER]BK_ServerSetup
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
	C_LONGINT:C283($_l_event; DM_l_BKServerID; DM_l_BKServerPort)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKFilePath; DM_t_BKServerIP; DM_t_BKServerName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].BK_ServerSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "BK_ServerSetup")
		DM_Bo_BKedit:=False:C215
		WS_AutoscreenSize(3; 200; 468)
		DM_t_BKServerName:=""
		If (DM_l_BKServerID>0)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BKServerID)
			If (Records in selection:C76([PREFERENCES:116])>0)
				DM_BKServerBlobtoVars
				
			End if 
			SET WINDOW TITLE:C213("Edit Server"+DM_t_BKServerName)
			
		Else 
			SET WINDOW TITLE:C213("New Server")
			DM_l_BKServerID:=0
			DM_t_BKServerIP:=""
			DM_l_BKServerPort:=0
			DM_t_BKServerName:=""
			DM_t_BKFilePath:=""
		End if 
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].BK_ServerSetup"; $_t_oldMethodName)
