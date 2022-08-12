//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdersV_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdersV_FileI")
FORM SET INPUT:C55([ORDERS:24]; "Orders_In13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Orders_In13"
ERR_MethodTrackerReturn("OrdersV_FileI"; $_t_oldMethodName)