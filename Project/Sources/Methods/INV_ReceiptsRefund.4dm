//%attributes = {}

If (False:C215)
	//Project Method Name:      INV_ReceiptsRefund
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vIn)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ReceiptsRefund")

//This new method allows a 'negative' deposit
//This ensures integrity in the entering of a negative deposit by only allowing an existing deposit amount to be refunded.
$_t_oldMethodName:=ERR_MethodTracker("INV_ReceiptsRefund")
//Invoices_Payments
$_t_Name:="Receipt Refund"
Start_Process
Invoices_File
If (vIn=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
	If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		
		If (In_Allowed($_t_Name; ->[INVOICES:39]))
			vIn:=1
			While (vIn=1)
				//IDLE  ` 03/04/03 pb
				DB_t_CurrentFormUsage:="Refund"  //NG this was commented out in Build 73 check its correct
				
				Invoices_Sel
				DB_t_CurrentFormUsage:="Pay"
				//Only select Receipts
				//And check they are not resolved
				If (vIn=1)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>=0; *)  // Modified NG 3/8/2006
					
					QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@")
					QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					//QUERY SELECTION([INVOICES]; & ;[INVOICES]Total Due#0)
					
					If (Records in selection:C76([INVOICES:39])>0)
						INV_ReceiptRefund2
						vIn:=0
					Else 
						Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
					End if 
				End if 
			End while 
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("INV_ReceiptsRefund"; $_t_oldMethodName)