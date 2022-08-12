//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InvBP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2009 21:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InvBP1")
//Orders_InvBP1
CREATE EMPTY SET:C140([ORDERS:24]; "Master")
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
	ADD TO SET:C119([ORDERS:24]; "Master")
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
USE SET:C118("Master")
ERR_MethodTrackerReturn("Orders_InvBP1"; $_t_oldMethodName)