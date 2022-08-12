If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Cheques3
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Cheques3"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		Purch_CheqLP
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Cheques3"; $_t_oldMethodName)
