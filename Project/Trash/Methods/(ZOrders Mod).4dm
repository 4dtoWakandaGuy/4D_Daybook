//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZOrders_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2009 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_Mod")

ZProc("Orders_Mod"; DB_ProcessMemoryinit(4); "View Sales Orders")

//Copied to Functions Palette
ERR_MethodTrackerReturn("ZOrders_Mod"; $_t_oldMethodName)