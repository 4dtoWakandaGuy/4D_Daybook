If (False:C215)
	//Table Form Method Name: [USER]INT_SkinSelector
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].INT_SkinSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "INT_SkinSelector")
		WS_AutoscreenSize(3; 240; 250)
		INT_SkinsPrefs
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].INT_SkinSelector"; $_t_oldMethodName)
