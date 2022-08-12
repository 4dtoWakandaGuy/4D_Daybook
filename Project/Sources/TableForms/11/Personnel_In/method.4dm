If (False:C215)
	//Table Form Method Name: Object Name:      [PERSONNEL].Personnel_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY TEXT(SD_at_ActionResultTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Personnel_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		ARRAY TEXT:C222(SD_at_ActionResultTab; 2)
		SD_at_ActionResultTab{1}:="Actions"
		SD_at_ActionResultTab{2}:="Results"
		SD_at_ActionResultTab:=1
		//WS_AutoscreenSize (2;540;600)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Personnel_In")
		WS_AutoscreenSize(2; 540; 600)
		INT_SetLongintCheckFormat(->SD_ai_ResultCodes)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodes)
		
		INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
		
		SD_bo_ChangePrefs:=False:C215
		INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		
End case 
Personnel_InLP_NEW
ERR_MethodTrackerReturn("FM:Personnel_In"; $_t_oldMethodName)
