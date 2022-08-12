If (False:C215)
	//Table Form Method Name: [PRICE_GROUPS]PriceGroup_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2011 13:54
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

$_t_oldMethodName:=ERR_MethodTracker("FM [PRICE_GROUPS].PriceGroup_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;280;560)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRICE_GROUPS:18]); "PriceGroup_In")
		WS_AutoscreenSize(2; 310; 565)
		INT_SetInput(Table:C252(->[PRICE_GROUPS:18]); WIN_t_CurrentInputForm)
		
		
End case 
PriceG_InLP
ERR_MethodTrackerReturn("FM:[PRICE_GROUPS].PriceGroup_In"; $_t_oldMethodName)
