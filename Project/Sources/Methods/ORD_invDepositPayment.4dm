//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_invDepositPayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 12:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ExistingReceipts; 0)
	ARRAY TEXT:C222($_at_ExistingReceipts2; 0)
	C_LONGINT:C283($_l_ExistingRow; $_l_InvoiceIndex; $_l_PSPTransactionID; $_l_ReceiptFindIndex; $1; vIn)
	C_REAL:C285($_r_Amount; $_r_AmountDue; $3)
	C_TEXT:C284($_t_CurrencyCode; $_t_DepositNumber; $_t_InvoiceNumber; $_t_NewReceiptNumber; $_t_oldMethodName; $2; CCM_t_DepositNumber; CCM_t_InvoiceNumber; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_invDepositPayment")
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
CCM_t_InvoiceNumber:=$_t_InvoiceNumber
If (Count parameters:C259>=2)
	If (OK=1)
		If ($_t_InvoiceNumber#$2)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
		End if 
		$_r_AmountDue:=[INVOICES:39]Total_Due:7
		If ($_r_AmountDue>0)
			QUERY:C277([INVOICES:39]; [INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]); *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedRecordID:45=$1; *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D@"; *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
			
			If (Records in selection:C76([INVOICES:39])>0)
				//there is a deposit against this order
				FIRST RECORD:C50([INVOICES:39])
				CREATE EMPTY SET:C140([INVOICES:39]; "Depositstopay")
				
				For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
					$_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
					
					If ([INVOICES:39]Total_Due:7>0)  //this would be a negative deposiy
						$_r_Amount:=$_r_Amount+(-[INVOICES:39]Total_Due:7)
					Else 
						$_r_Amount:=$_r_Amount+Abs:C99([INVOICES:39]Total_Due:7)
					End if 
					If ($_r_Amount<=$3)
						ADD TO SET:C119([INVOICES:39]; "Depositstopay")
					End if 
					If ($_r_Amount>=$3)
						$_l_InvoiceIndex:=99999
					End if 
					
					NEXT RECORD:C51([INVOICES:39])
				End for 
				Gen_Confirm("There is "+$_t_CurrencyCode+String:C10($_r_Amount)+" on deposit against this order."+Char:C90(13)+"  Do you wish to pay the invoice with this deposit?"; "Yes"; "No")
				If (OK=1)
					USE SET:C118("Depositstopay")
					For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
						READ WRITE:C146([CC_OrderAuths:133])
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]Order_ID:2=$1; *)
						QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xinvoiceCode:9=""; *)
						QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xDepositCode:8=[INVOICES:39]Invoice_Number:1)
						[CC_OrderAuths:133]xinvoiceCode:9:=$2
						$_l_PSPTransactionID:=[CC_OrderAuths:133]TransactionID:10
						DB_SaveRecord(->[CC_OrderAuths:133])
						
						UNLOAD RECORD:C212([CC_OrderAuths:133])
						READ WRITE:C146([CCM_PSPTransaction:136])
						READ ONLY:C145([CC_OrderAuths:133])
						QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_PSPTransactionID)
						[CCM_PSPTransaction:136]xInvoiceID:11:=$2
						DB_SaveRecord(->[CCM_PSPTransaction:136])
						UNLOAD RECORD:C212([CCM_PSPTransaction:136])
						READ ONLY:C145([CCM_PSPTransaction:136])
						NEXT RECORD:C51([INVOICES:39])
						
					End for 
					UNLOAD RECORD:C212([CC_OrderAuths:133])
					READ ONLY:C145([CC_OrderAuths:133])
					
					If (Records in selection:C76([INVOICES:39])>0)
						FIRST RECORD:C50([INVOICES:39])
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
						//````````
						If ((DB_GetLedgerTRANSRECpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
							vIn:=1
							While (vIn=1)
								//`IDLE  ` 03/04/03 pb
								DB_t_CurrentFormUsage:="Pay"
								If ([INVOICES:39]Invoice_Number:1#$2)
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
									CREATE SET:C116([INVOICES:39]; "invtopay")
									
								End if 
								//Note the receipts
								ARRAY TEXT:C222($_at_ExistingReceipts; 0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4#"")
								SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xReceiptNumber:4; $_at_ExistingReceipts)
								
								UNION:C120("invtopay"; "Depositstopay"; "invtopay")
								USE SET:C118("invtopay")
								CLEAR SET:C117("invtopay")
								CLEAR SET:C117("Depositstopay")
								//here need to check if there are any CC allocations against th
								//TRACE
								
								If (vIn=1)
									If ($_r_Amount>=$_r_AmountDue)
										Invoices_Pay2(False:C215; 0; -1)
									Else 
										Invoices_Pay2(False:C215; 0; -1)
									End if 
									ARRAY TEXT:C222($_at_ExistingReceipts2; 0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$2; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4#"")
									SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xReceiptNumber:4; $_at_ExistingReceipts2)
									$_t_NewReceiptNumber:=""
									If (Size of array:C274($_at_ExistingReceipts2)>0)
										For ($_l_ReceiptFindIndex; Size of array:C274($_at_ExistingReceipts2); 1; -1)
											$_l_ExistingRow:=Find in array:C230($_at_ExistingReceipts; $_at_ExistingReceipts2{$_l_ReceiptFindIndex})
											If ($_l_ExistingRow<0)
												$_t_NewReceiptNumber:=$_at_ExistingReceipts2{$_l_ReceiptFindIndex}
												$_l_ReceiptFindIndex:=1
											End if 
										End for 
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5#""; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_NewReceiptNumber)
										$_t_DepositNumber:=[XInvoiceAllocation:126]xDepositNumber:5
										//We now have a receipt number to put on the PSP record
										QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]Order_ID:2=$1; *)
										QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xinvoiceCode:9=$2; *)
										QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xDepositCode:8=$_t_DepositNumber)
										If (Records in selection:C76([CC_OrderAuths:133])>0)
											
											$_l_PSPTransactionID:=[CC_OrderAuths:133]TransactionID:10
											UNLOAD RECORD:C212([CC_OrderAuths:133])
											READ WRITE:C146([CCM_PSPTransaction:136])
											READ ONLY:C145([CC_OrderAuths:133])
											QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_PSPTransactionID)
											[CCM_PSPTransaction:136]xReceiptID:13:=$_t_NewReceiptNumber
											DB_SaveRecord(->[CCM_PSPTransaction:136])
											UNLOAD RECORD:C212([CCM_PSPTransaction:136])
											READ ONLY:C145([CCM_PSPTransaction:136])
										End if 
									End if 
									vIn:=0
								End if 
							End while 
							
						Else 
							Gen_Alert("Required Setups have not been completed"; "")
						End if 
						
					End if 
					
					
				End if 
			End if 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
			
		End if 
		
		OK:=1
	End if 
	
End if 
ERR_MethodTrackerReturn("ORD_invDepositPayment"; $_t_oldMethodName)
