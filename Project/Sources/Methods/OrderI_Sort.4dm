//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_Sort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:08
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

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Sort")
Menu_Record("OrderI_Sort"; "Sort Items")
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)

If (vALLevels>0)
	Orders_InLPOI
	Orders_InLPß("S1")
Else 
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
End if 
ERR_MethodTrackerReturn("OrderI_Sort"; $_t_oldMethodName)