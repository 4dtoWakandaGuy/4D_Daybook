If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]TransB_List
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
	//C_UNKNOWN(vLayer)
	//C_UNKNOWN(vTitle2)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284(vLayer; vTitle2; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES].TransB_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Header:K2:17)
		vTitle2:=Term_VATWT("VAT")
	: (Form event code:C388=On Printing Detail:K2:18)
		If (vLayer#"")
			TransB_LaySel
		End if 
End case 
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCHES].TransB_List"; $_t_oldMethodName)
