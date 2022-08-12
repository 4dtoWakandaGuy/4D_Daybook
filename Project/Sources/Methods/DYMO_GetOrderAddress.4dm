//%attributes = {}
If (False:C215)
	//Project Method Name:      DYMO_GetOrderAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/05/2012 11:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; Vdetails)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DYMO_GetOrderAddress")

RELATE ONE:C42([ORDERS:24]Company_Code:1)
RELATE ONE:C42([ORDERS:24]Contact_Code:2)
MCont_Add("L")
$0:=Vdetails
ERR_MethodTrackerReturn("DYMO_GetOrderAddress"; $_t_oldMethodName)