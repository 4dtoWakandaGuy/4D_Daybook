//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_TitUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>SalesOrder; <>StatesLoaded)
	C_TEXT:C284($_t_NewOrderState; $_t_oldMethodName; $_t_StatePrevious; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_TitUp")
//Order_TitUp
CREATE SET:C116([ORDER_ITEMS:25]; "$Before")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
	$_t_NewOrderState:="024"+<>SYS_at_RecStateCodes{24}{3}
Else 
	$_t_NewOrderState:="024ZZZ"
End if 

If (Not:C34(((<>SalesOrder=False:C215) | (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3)) & ([ORDERS:24]State:15>=$_t_NewOrderState) & (vProcaMod=13)))
	$_t_StatePrevious:=vStPrev
	States_Up(->[ORDERS:24]State:15)
	//  Order_TitCheck ($_t_StatePrevious)
	Orders_InLPX(->[ORDERS:24]State:15)
	// End if
End if 
USE SET:C118("$Before")
ERR_MethodTrackerReturn("Order_TitUp"; $_t_oldMethodName)
