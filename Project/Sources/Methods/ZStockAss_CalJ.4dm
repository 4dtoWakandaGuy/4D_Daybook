//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockAss_CalJ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vALLevels)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZStockAss_CalJ")
Menu_Record("ZStockAss_CalJ"; "Trial Assembly - Display")
vALLevels:=0
ZStockAss_CalOI
ERR_MethodTrackerReturn("ZStockAss_CalJ"; $_t_oldMethodName)