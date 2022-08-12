//%attributes = {}
If (False:C215)
	//Project Method Name:      PT_Price
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/06/2010 21:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_Price")
If ([PRICE_GROUPS:18]Price_Based:3)
	$0:=[PRICE_TABLE:28]Price_Discount:3
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("PT_Price"; $_t_oldMethodName)
