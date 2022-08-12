If (False:C215)
	//Table Form Method Name: [CONTACTS]LAB_SelectL7160
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; LAB_l_Continue)
	C_TEXT:C284($_t_oldMethodName; LAB_t_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].LAB_SelectL7160"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "LAB_SelectL7160")
		LAB_t_BUTTON:=""
		
		LAB_l_Continue:=0
		WS_AutoscreenSize(3; 400; 400)
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].LAB_SelectL7160"; $_t_oldMethodName)
