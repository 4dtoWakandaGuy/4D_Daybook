//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PaypalGetCurrencyCode
	//------------------ Method Notes ------------------
	//This method takes a daybook
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2012 15:30
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

$_t_oldMethodName:=ERR_MethodTracker("CCM_PaypalGetCurrencyCode")
ERR_MethodTrackerReturn("CCM_PaypalGetCurrencyCode"; $_t_oldMethodName)