If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Field
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Field"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Field")
		INT_SetDialog
		SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM:dAsk_Field"; $_t_oldMethodName)
