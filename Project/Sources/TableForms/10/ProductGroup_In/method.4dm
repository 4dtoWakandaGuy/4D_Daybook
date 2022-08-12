If (False:C215)
	//Table Form Method Name: [PRODUCT_GROUPS]ProductGroup_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
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

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCT_GROUPS].ProductGroup_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 305; 560)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCT_GROUPS:10]); "ProductGroup_In")
		WS_AutoscreenSize(2; 305; 560)
		INT_SetInput(Table:C252(->[PRODUCT_GROUPS:10]); WIN_t_CurrentInputForm)
End case 
Groups_InLP
ERR_MethodTrackerReturn("FM:ProductGroup_In"; $_t_oldMethodName)
