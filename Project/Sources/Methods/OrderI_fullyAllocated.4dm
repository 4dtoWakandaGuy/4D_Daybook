//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_fullyAllocated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2012 10:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_REAL:C285($_r_AllocatedQuantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_fullyAllocated")

//To use in a query by formula
//returns true if fully allocated...checks if allocations are from P
$0:=True:C214
If ([ORDER_ITEMS:25]Allocated:28=[ORDER_ITEMS:25]Quantity:3)
	$_r_AllocatedQuantity:=ORDERI_GetAllocated([ORDER_ITEMS:25]Item_Number:27; False:C215)
	If ($_r_AllocatedQuantity#[ORDER_ITEMS:25]Quantity:3)
		$0:=False:C215
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("OrderI_fullyAllocated"; $_t_oldMethodName)
