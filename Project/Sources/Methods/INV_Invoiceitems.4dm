//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_Invoiceitems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/11/2010 06:56
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

$_t_oldMethodName:=ERR_MethodTracker("INV_Invoiceitems")
ERR_MethodTrackerReturn("INV_Invoiceitems"; $_t_oldMethodName)