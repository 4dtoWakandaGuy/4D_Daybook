If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Purch_InvJobs13
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purch_InvJobs13"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 345; 553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "Purch_InvJobs13")
		
		WS_AutoscreenSize(2; 345; 553)
		
End case 
Purch_InvJobLP
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purch_InvJobs13"; $_t_oldMethodName)
