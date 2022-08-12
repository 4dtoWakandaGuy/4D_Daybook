//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Trans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont Trans")
//Cont Trans
READ WRITE:C146(*)
Gen_AppToSelEx(->[DIARY:12]; ->[DIARY:12]Contact_Code:2; vText; ->[DIARY:12]Export:24)
Gen_AppToSel(->[INFORMATION:55]; ->[INFORMATION:55]Contact_Code:1; vText)
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]Contact_Code:4; vText)
Gen_AppToSelEx(->[ORDERS:24]; ->[ORDERS:24]Contact_Code:2; vText; ->[ORDERS:24]Export:24)
Gen_AppToSel(->[INVOICES:39]; ->[INVOICES:39]Contact_Code:3; vText)
Gen_AppToSel(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Contact_Code:5; vText)
Gen_AppToSel(->[CONTRACTS:17]; ->[CONTRACTS:17]Contact_Code:2; vText)
Gen_AppToSel(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Contact_Code:2; vText)

Gen_AppToSel(->[PUBLICATIONS:52]; ->[PUBLICATIONS:52]Contact_Code:4; vText)
ERR_MethodTrackerReturn("Cont Trans"; $_t_oldMethodName)