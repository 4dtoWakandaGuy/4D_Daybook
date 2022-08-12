If (False:C215)
	//object Name: [TRANSACTIONS]Trans_in.oTransOpenPurchaseInv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_ViewCompanyProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_in.oTransOpenPurchaseInv"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([TRANSACTIONS:29]Purchase_Code:24#"")
			
			$_l_ViewCompanyProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[PURCHASE_INVOICES:37]); ""; [TRANSACTIONS:29]Purchase_Code:24)
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_in.oTransOpenPurchaseInv"; $_t_oldMethodName)
