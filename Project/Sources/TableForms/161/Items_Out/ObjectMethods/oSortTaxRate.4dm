If (False:C215)
	//object Name: [INVOICES_ITEMS]Items_Out.oSortTaxRate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 10:18
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES_ITEMS].Items_Out.oSortTaxRate"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDER_ITEMS:25]; "Text3"; ->[ORDER_ITEMS:25]Total_Amount:9)
ERR_MethodTrackerReturn("OBJ [INVOICES_ITEMS].Items_Out.oSortTaxRate"; $_t_oldMethodName)