If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_SU
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
	//ARRAY BOOLEAN(ORD_LB_Subs;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_SU"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->ORD_LB_Subs)
		//WS_AutoscreenSize (2;420;590)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_SU")
		WS_AutoscreenSize(2; 615; 590)
		INT_SetInput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
End case 
Products_SuLP
ERR_MethodTrackerReturn("FM:Products Su13"; $_t_oldMethodName)
