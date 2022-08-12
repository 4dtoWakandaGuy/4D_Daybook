If (False:C215)
	//Table Form Method Name: [USER]CAT_Selector
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
	//ARRAY LONGINT(CAT_al_CatalogueSelected;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; CAT_l_CurrentSetting; CAT_l_PageNumber; CAT_l_SaveSettings)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CAT_Selector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "CAT_Selector")
		WS_AutoscreenSize(3; 240; 255)
		
		CAT_l_SaveSettings:=0
		INT_SetLongintCheckFormat(->CAT_al_CatalogueSelected)
		If (CAT_l_PageNumber>0)
			FORM GOTO PAGE:C247(CAT_l_PageNumber)
		End if 
		CAT_l_CurrentSetting:=0
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:CAT_Selector"; $_t_oldMethodName)
