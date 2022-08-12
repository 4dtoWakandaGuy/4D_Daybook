If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_Out.3D Button14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:47
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_Out.3D Button14"; Form event code:C388)
//Object Method [PURCHASES].Purchases Out.bSortButt1 26• /3/2(ID 3249-88)

WT_SORT_TABLE_3(->[PURCHASE_INVOICES:37]; "Text14"; ->[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9)

//Used by
//Form [PURCHASES].Purchases_Out•

//Uses
//Project Method WT_SORT_TABLE_3
//Table [PURCHASES]•
//•Field [PURCHASES]Analysis Code•
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_Out.3D Button14"; $_t_oldMethodName)