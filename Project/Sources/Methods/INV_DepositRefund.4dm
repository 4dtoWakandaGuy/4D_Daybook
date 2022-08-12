//%attributes = {}

If (False:C215)
	//Project Method Name:      INV_DepositRefund
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
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_LONGINT:C283(vIn)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_DepositRefund")

//This new method allows a 'negative' deposit
//This ensures integrity in the entering of a negative deposit by only allowing an existing deposit amount to be refunded.
$_t_oldMethodName:=ERR_MethodTracker("INV_DepositRefund")
//Invoices_Payments
$_t_Name:="Deposit Refund"
Start_Process
Invoices_File
If (vIn=1)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
	If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		If (In_Allowed($_t_Name; ->[INVOICES:39]))
			vIn:=1
			While (vIn=1)
				IDLE:C311  // 03/04/03 pb
				DB_t_CurrentFormUsage:="Pay"
				Invoices_Sel
				//Only select deposits
				//And check they are not resolved
				If (vIn=1)
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6>0; *)
					QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
					QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
					QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					If (Records in selection:C76([INVOICES:39])>0)
						
						SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
						QUERY WITH ARRAY:C644([CC_OrderAuths:133]xDepositCode:8; $_at_InvoiceNumbers)
						If (Records in selection:C76([CC_OrderAuths:133])>0)
							//Some payments were taken by CC. Need to ask if the refund should also be by card
						End if 
						INV_DepositRefund2
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
ERR_MethodTrackerReturn("INV_DepositRefund"; $_t_oldMethodName)