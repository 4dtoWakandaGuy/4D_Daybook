If (False:C215)
	//object Name: [INVOICES_ITEMS]Items_Out.oSortProductName
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES_ITEMS].Items_Out.oSortProductName"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDER_ITEMS:25]; "Text16"; ->[ORDER_ITEMS:25]Serial_Number:24)
ERR_MethodTrackerReturn("OBJ [INVOICES_ITEMS].Items_Out.oSortProductName"; $_t_oldMethodName)