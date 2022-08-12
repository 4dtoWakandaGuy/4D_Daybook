//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_DisFileRA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseLedgerMenuName; $_t_SalesLedgerMenuName; $_t_StockManagerMenuName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_DisFileRA")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//Menu_DisFileRA - Remote Access needs them all greyed if not set up properly
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_Timemanager"); 3; ""; <>MenuProc; False:C215)
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_DocumentManager"); 3; ""; <>MenuProc; False:C215)
$_t_StockManagerMenuName:=Get localized string:C991("MenuItem_StockManager")
$_t_StockManagerMenuName:=Term_StoWT($_t_StockManagerMenuName)
DB_MenuAction($_t_VolumesMenuName; $_t_StockManagerMenuName; 3; ""; <>MenuProc; False:C215)
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_SalesOrders"); 3; ""; <>MenuProc; False:C215)

DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_PurchaseOrders"); 3; ""; <>MenuProc; False:C215)
$_t_SalesLedgerMenuName:=Get localized string:C991("MenuItem_SalesLedger")
$_t_SalesLedgerMenuName:=Term_SLPLWT($_t_SalesLedgerMenuName)
DB_MenuAction($_t_VolumesMenuName; $_t_SalesLedgerMenuName; 3; ""; <>MenuProc; False:C215)
$_t_PurchaseLedgerMenuName:=Get localized string:C991("MenuItem_PurchaseLedger")
$_t_PurchaseLedgerMenuName:=Term_SLPLWT($_t_PurchaseLedgerMenuName)
DB_MenuAction($_t_VolumesMenuName; $_t_PurchaseLedgerMenuName; 3; ""; <>MenuProc; False:C215)

DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_NominalLedger"); 3; ""; <>MenuProc; False:C215)
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_ServiceManager"); 3; ""; <>MenuProc; False:C215)
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_JobCosts"); 3; ""; <>MenuProc; False:C215)
If ((DB_GetModuleSettingByNUM(21)<2) & (DB_GetModuleSettingByNUM(32)<2))  //Communications
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WebAccess"); 3; ""; <>MenuProc; False:C215)
End if 
ERR_MethodTrackerReturn("Menu_DisFileRA"; $_t_oldMethodName)
