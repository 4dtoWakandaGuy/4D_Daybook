If (False:C215)
	//object Name: [INVOICES_ITEMS]Items_Out.oSortCostAmount
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES_ITEMS].Items_Out.oSortCostAmount"; Form event code:C388)

WT_SORT_TABLE_3(->[INVOICES_ITEMS:161]; "oCostAmount"; ->[INVOICES_ITEMS:161]Cost_Amount:15)
ERR_MethodTrackerReturn("OBJ [INVOICES_ITEMS].Items_Out.oSortCostAmount"; $_t_oldMethodName)