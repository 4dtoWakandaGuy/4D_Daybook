If (False:C215)
	//Table Form Method Name: [CONTACTS]DIary_OwnerSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].DIary_OwnerSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "DIary_OwnerSelector")
		SD_at_SelectPersonNames:=0
		
		WS_AutoscreenSize(3; 202; 370)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].DIary_OwnerSelector"; $_t_oldMethodName)
