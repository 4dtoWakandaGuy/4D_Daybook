If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS_ITEMS]Items_Sub
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS_ITEMS].Items_Sub"; Form event code:C388)

PurchOrd_SubLP
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS_ITEMS].Items_Sub"; $_t_oldMethodName)
