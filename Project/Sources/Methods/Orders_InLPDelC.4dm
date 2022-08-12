//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPDelC
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPDelC")
RELATE ONE:C42([ORDERS:24]Delivery_Company:29)
RELATE ONE:C42([ORDERS:24]Delivery_Contact:30)
Letter_Details
ERR_MethodTrackerReturn("Orders_InLPDelC"; $_t_oldMethodName)
