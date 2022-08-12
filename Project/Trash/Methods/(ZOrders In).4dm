//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZOrders_In
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

$_t_oldMethodName:=ERR_MethodTracker("ZOrders_In")

ZProc("Orders_In"; DB_ProcessMemoryinit(4); "Enter Sales Orders")
//Copied to Functions Palette
ERR_MethodTrackerReturn("ZOrders_In"; $_t_oldMethodName)