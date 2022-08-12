If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]TransB_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; vNo2)
	C_TEXT:C284($_t_oldMethodName; vLayCode; vTitle2; vTitle3; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES].TransB_Print"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Display Detail:K2:22)
		
		If (vLayCode#String:C10([TRANSACTION_BATCHES:30]Batch_Number:10))
			vLayCode:=String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			vTitle2:=Term_VATWT("Control VAT")
			vTitle3:=Term_VATWT("Batch VAT")
			vTitle4:=Term_VATWT("Value, VAT, Total")
			TransB_InLPSt
		End if 
		vNo2:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
End case 
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCHES].TransB_Print"; $_t_oldMethodName)
