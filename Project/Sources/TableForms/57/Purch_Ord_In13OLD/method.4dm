If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].PurchaseOrder_In"; Form event code:C388)

$_l_event:=Form event code:C388
PurchOrd_InLP($_l_event)
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS].PurchaseOrder_In"; $_t_oldMethodName)
