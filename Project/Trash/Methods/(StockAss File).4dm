//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vSt)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss File")

//NG April 2004 Removed ◊Screen
FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "StockAss_In13")
WIN_t_CurrentInputForm:="StockAss_In13"
FORM SET OUTPUT:C54([STOCK_MOVEMENT_ITEMS:27]; "Stock Out")
WIN_t_CurrentOutputform:="Stock Out"
vSt:=1
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
End if 
ERR_MethodTrackerReturn("StockAss File"; $_t_oldMethodName)
