If (False:C215)
	//object Name: [INVOICES_ITEMS]Items_Out.oSortSalesAccount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 11:55
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES_ITEMS].Items_Out.oSortSalesAccount"; Form event code:C388)

WT_SORT_TABLE_3(->[INVOICES_ITEMS:161]; "oSalesAccount"; ->[INVOICES_ITEMS:161]Sales_Account:9)
ERR_MethodTrackerReturn("OBJ [INVOICES_ITEMS].Items_Out.oSortSalesAccount"; $_t_oldMethodName)