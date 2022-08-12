//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Pay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vIn)
	C_TEXT:C284($_t_InvoiceTypeName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Pay")
//Invoices Payments
$_t_InvoiceTypeName:="Invoice Receipt"
Start_Process
If (Invoices_File)
	If (vIn=1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
		If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
			If (In_Allowed($_t_InvoiceTypeName; ->[INVOICES:39]))
				QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=1)
				If (Records in selection:C76([INVOICES:39])>0)
					Gen_Confirm("There are some Invoices that need posting to the General Ledger."+"  Do you want to check if these are relevant to the receipt?"; "Yes"; "No")
					If (OK=1)
						Invoices_Nom
					End if 
				End if 
				vIn:=1
				While (vIn=1)
					IDLE:C311  // 03/04/03 pb
					DB_t_CurrentFormUsage:="Pay"
					Invoices_Sel
					If (vIn=1)
						If (Records in selection:C76([INVOICES:39])>0)
							Invoices_Pay2
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
End if 
Process_End
ERR_MethodTrackerReturn("Invoices Pay"; $_t_oldMethodName)