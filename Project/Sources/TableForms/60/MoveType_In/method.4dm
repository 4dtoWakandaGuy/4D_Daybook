If (False:C215)
	//Table Form Method Name: [MOVEMENT_TYPES]MoveType_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2012 21:19
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

$_t_oldMethodName:=ERR_MethodTracker("FM [MOVEMENT_TYPES].MoveType_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;465;590)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[MOVEMENT_TYPES:60]); "MoveType_in")
		WS_AutoscreenSize(2; 465; 590)
		INT_SetInput(Table:C252(->[MOVEMENT_TYPES:60]); WIN_t_CurrentInputForm)
		
End case 
MoveTypes_InLP
ERR_MethodTrackerReturn("FM:MoveType_in"; $_t_oldMethodName)
