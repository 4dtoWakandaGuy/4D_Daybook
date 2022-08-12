//%attributes = {}
If (False:C215)
	//Project Method Name:      Order
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; vNumber; vTitle; vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order")
//Order
vTitle:="ORDER ACKNOWLEDGEMENT"
vNumber:=[ORDERS:24]Order_Code:3
vTitle4:="Printed"
vDate:=<>DB_d_CurrentDate
ERR_MethodTrackerReturn("Order"; $_t_oldMethodName)