If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Purchases_inP
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purchases_inP"; Form event code:C388)
$_l_event:=Form event code:C388
Purch_InPLP($_l_event)
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purchases_inP"; $_t_oldMethodName)