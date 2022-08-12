If (False:C215)
	//Table Form Method Name: [INFORMATION]Information_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INFORMATION].Information_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 384; 553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INFORMATION:55]); "Information_in")
		WS_AutoscreenSize(2; 384; 553)
		INT_SetInput(Table:C252(->[INFORMATION:55]); WIN_t_CurrentInputForm)
		
End case 
Qualities_InLP
ERR_MethodTrackerReturn("FM [INFORMATION].Information_in"; $_t_oldMethodName)
