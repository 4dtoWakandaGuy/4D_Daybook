//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_State
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
	C_TEXT:C284($_t_oldMethodName; PUR_t_PurchaseState)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_State")
If (False:C215)
	Case of 
		: ([PURCHASE_ORDERS:57]State:14=-1)
			
			PUR_t_PurchaseState:="UNCONFIRMED PURCHASE ORDER"
		: ([PURCHASE_ORDERS:57]State:14=0)
			PUR_t_PurchaseState:="CONFIRMED PURCHASE ORDER"
	End case 
Else 
	//TRACE
	PUR_t_PurchaseState:=PUR_GetFileState
End if 
ERR_MethodTrackerReturn("PurchOrd_State"; $_t_oldMethodName)
