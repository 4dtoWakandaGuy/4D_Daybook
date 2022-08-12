//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_CancelDateHasPassed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2014 16:36
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

$_t_oldMethodName:=ERR_MethodTracker("PO_CancelDateHasPassed")

QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Cancel_Date:22#!00-00-00!; *)

QUERY:C277([PURCHASE_ORDERS:57];  & ; [PURCHASE_ORDERS:57]Cancel_Date:22<Current date:C33)
ERR_MethodTrackerReturn("PO_CancelDateHasPassed"; $_t_oldMethodName)