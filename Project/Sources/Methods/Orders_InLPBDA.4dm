//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPBDA
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
	//C_UNKNOWN(vDetails)
	C_TEXT:C284(vDetails; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPBDA")
If ([ORDERS:24]Delivery_Company:29#"")
	Orders_InLPDelC
Else 
	vDetails:=""
End if 
ERR_MethodTrackerReturn("Orders_InLPBDA"; $_t_oldMethodName)
