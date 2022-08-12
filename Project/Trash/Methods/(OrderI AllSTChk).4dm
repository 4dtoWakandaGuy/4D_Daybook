//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI AllSTChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/04/2010 09:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI AllSTChk")
//OrderI AllSTChk
//check if alloced to alloc this Stock Type   - 4.0.036b
If ($1#[STOCK_TYPES:59]Type_Code:1)
	QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$1)
	
End if 
If ([STOCK_TYPES:59]Allocation_Allowed:8=False:C215)
	Gen_Alert(Term_StoWT("Stock Type ")+[STOCK_TYPES:59]Type_Code:1+" does not allow Allocations"; "Cancel")
	OK:=0
End if 
ERR_MethodTrackerReturn("OrderI AllSTChk"; $_t_oldMethodName)
