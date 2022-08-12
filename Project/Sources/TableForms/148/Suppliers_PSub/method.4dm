If (False:C215)
	//Table Form Method Name: [PRODUCTS_SUPPLIERS]Suppliers_PSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/08/2009 17:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vSupplier)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS_SUPPLIERS].Suppliers_PSub"; Form event code:C388)

RELATE ONE:C42([PRODUCTS_SUPPLIERS:148]Company_Code:1)
vSupplier:=[COMPANIES:2]Company_Name:2
ERR_MethodTrackerReturn("FM [PRODUCTS_SUPPLIERS].Suppliers_PSub"; $_t_oldMethodName)