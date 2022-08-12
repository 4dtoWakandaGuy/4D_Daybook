//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term MenuMod
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
	C_BOOLEAN:C305(<>TermRP)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_InventoryMenuName; $_t_InventoryMenuName2; $_t_oldMethodName; $_t_PurchaseLedgerMenuName; $_t_PurchaseLedgerMenuName2; $_t_SalesLedgerMenuName; $_t_SalesLedgerMenuName2; $_t_VolumesMenuName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Term MenuMod")
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

$_t_InventoryMenuName:=Get localized string:C991("MenuItem_StockManager")
$_t_InventoryMenuName2:=Term_StoWT($_t_InventoryMenuName)
If ($_t_InventoryMenuName2#$_t_InventoryMenuName)
	DB_MenuAction($_t_VolumesMenuName; $_t_InventoryMenuName; 1; $_t_InventoryMenuName2; <>MenuProc; False:C215)
End if 


If (<>TermRP)
	$_t_SalesLedgerMenuName:=Get localized string:C991("MenuItem_SalesLedger")
	$_t_SalesLedgerMenuName2:=Term_SLPLWT($_t_SalesLedgerMenuName)
	DB_MenuAction($_t_VolumesMenuName; $_t_SalesLedgerMenuName; 1; $_t_SalesLedgerMenuName2; <>MenuProc; False:C215)
	$_t_PurchaseLedgerMenuName:=Get localized string:C991("MenuItem_PurchaseLedger")
	$_t_PurchaseLedgerMenuName2:=Term_SLPLWT($_t_PurchaseLedgerMenuName)
	DB_MenuAction($_t_VolumesMenuName; $_t_PurchaseLedgerMenuName; 1; $_t_PurchaseLedgerMenuName2; <>MenuProc; False:C215)
	
End if 
ERR_MethodTrackerReturn("Term MenuMod"; $_t_oldMethodName)
