//%attributes = {}
If (False:C215)
	//Project Method Name:      PG_isDiscountBased
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/06/2010 13:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PG_isDiscountBased")
If ([PRICE_GROUPS:18]Price_Based:3)
	$0:=""
Else 
	$0:="DIscount Based"
End if 
ERR_MethodTrackerReturn("PG_isDiscountBased"; $_t_oldMethodName)
