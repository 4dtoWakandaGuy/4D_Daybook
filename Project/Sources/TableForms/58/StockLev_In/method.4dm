If (False:C215)
	//Table Form Method Name: [STOCK_LEVELS]StockLev_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2011 14:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(WIN_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_LEVELS].StockLev_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;320;570)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[STOCK_LEVELS:58]); "StockLev_in")
		WS_AutoscreenSize(2; 510; 570)
		INT_SetInput(Table:C252(->[STOCK_LEVELS:58]); WIN_t_CurrentInputForm)
		
End case 
StockLev_InLP($_l_event)
ERR_MethodTrackerReturn("FM:StockLev_In"; $_t_oldMethodName)
