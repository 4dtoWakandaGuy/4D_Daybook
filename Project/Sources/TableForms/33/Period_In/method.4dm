If (False:C215)
	//Table Form Method Name: [PERIODS]Period_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2011 12:44
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

$_t_oldMethodName:=ERR_MethodTracker("FM [PERIODS].Period_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 425; 545)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PERIODS:33]); "Period_In")
		WS_AutoscreenSize(2; 524; 545)
		INT_SetInput(Table:C252(->[PERIODS:33]); WIN_t_CurrentInputForm)
		
		
End case 
Periods_InLP
ERR_MethodTrackerReturn("FM:Period_In"; $_t_oldMethodName)
