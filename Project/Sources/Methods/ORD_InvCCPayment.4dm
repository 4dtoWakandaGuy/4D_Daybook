//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_InvCCPayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 12:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AuthIDS; 0)
	//ARRAY LONGINT(ORD_al_StatusIDs;0)
	ARRAY REAL:C219($_ar_Amounts; 0)
	ARRAY TEXT:C222($_at_ExistingReceiptNumbers; 0)
	ARRAY TEXT:C222($_at_ExistingReceiptNumbers2; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	//ARRAY TEXT(ORD_at_StatusNames;0)
	C_LONGINT:C283($_l_AmountsIndex; $_l_AuthsIndex; $_l_ReceiptFindIndex; $_l_ReceiptRow; $1)
	C_REAL:C285($_r_Amount; $_r_PaymentReceived; $_r_TotalPaymentsReceived; $_r_TotalToPay)
	C_TEXT:C284($_t_InvoiceNumber; $_t_NewReceiptReference; $_t_oldMethodName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_InvCCPayment")
//This method will check the authorizations for an order($1), if there are unassigned(no invoice) allocations, it will find INVOICES awaiting payment and invite payment of them with
//the authorized ccs
//genereally this will be direct from an order an process the payment
If (Count parameters:C259>=3)
	If (OK=1)
		ARRAY LONGINT:C221(ORD_al_StatusIDs; 6)
		ARRAY TEXT:C222(ORD_at_StatusNames; 6)
		ORD_al_StatusIDs{1}:=1
		ORD_al_StatusIDs{2}:=2
		ORD_al_StatusIDs{3}:=3
		ORD_al_StatusIDs{4}:=4
		ORD_al_StatusIDs{5}:=5
		ORD_al_StatusIDs{6}:=6
		ORD_at_StatusNames{1}:="Awaiting Invoicing"
		ORD_at_StatusNames{2}:="Cancelled"
		ORD_at_StatusNames{3}:="Money Received"
		ORD_at_StatusNames{4}:="Money Refunded"
		ORD_at_StatusNames{5}:="AVS Failure"
		ORD_at_StatusNames{6}:="CVV2 Failure"
		//The above is here so anyone editing can see the stati
		//CALL needs to be added to Orders_InvTrans
		
		ARRAY LONGINT:C221($_al_AuthIDS; 0)
		ARRAY REAL:C219($_ar_Amounts; 0)
		If ($1>0)
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]Order_ID:2=$1; *)
			QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xinvoiceCode:9=""; *)
			QUERY:C277([CC_OrderAuths:133];  & ; [CC_OrderAuths:133]xAuthStatus:7=ORD_al_StatusIDs{1})
			
			QUERY SELECTION:C341([CC_OrderAuths:133]; [CC_OrderAuths:133]AuthorizationDate:4>=Current date:C33(*)-30)
			$_r_Amount:=0
			SELECTION TO ARRAY:C260([CC_OrderAuths:133]AuthorizationAmount:5; $_ar_Amounts; [CC_OrderAuths:133]x_ID:1; $_al_AuthIDS)
			$_r_Amount:=Sum:C1($_ar_Amounts)
			
			
			//Now find invoices that are not FULLY paid and relate to this order
			If ($_r_Amount>0)
				If ($3="")
					If ([INVOICES_ITEMS:161]Order_Code:11#$2)
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Order_Code:11=$2)
						SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
						QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
						
					End if 
				Else 
					//an invoice number is passed
					If ([INVOICES:39]Invoice_Number:1#$3)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$3)
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
						
					End if 
					
				End if 
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7>0)
				Case of 
					: (Records in selection:C76([INVOICES:39])>1)
						//Have to select only one1
					: (Records in selection:C76([INVOICES:39])=1)
						If ($_r_Amount<=[INVOICES:39]Total_Due:7)
							//"Do you wish to pay"
							$_t_InvoiceNumber:=$3
							Gen_Confirm("Do you wish to pay "+[INVOICES:39]Currency_Code:27+String:C10($_r_Amount)+" against invoice "+$_t_InvoiceNumber+" Using the authorized Credit Card Payments"; "Yes"; "No")
						Else 
							Gen_Confirm("Do you wish to pay "+[INVOICES:39]Currency_Code:27+String:C10([INVOICES:39]Total_Due:7)+" against invoice "+$_t_InvoiceNumber+" Using the authorized Credit Card Payments"; "Yes"; "No")
						End if 
						
						If (OK=1)
							$_r_TotalPaymentsReceived:=0
							$_r_TotalToPay:=[INVOICES:39]Total_Due:7
							For ($_l_AuthsIndex; 1; Size of array:C274($_al_AuthIDS))
								If ($_r_TotalPaymentsReceived<$_r_TotalToPay)
									//Before we take the payment get any existing allocations(receipts) from the invoice. After we find the new receipt(s) and update the PSP record
									ARRAY TEXT:C222($_at_ExistingReceiptNumbers; 0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4#"")
									SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xReceiptNumber:4; $_at_ExistingReceiptNumbers)
									$_r_PaymentReceived:=CCM_CreatePayment([INVOICES:39]Currency_Code:27; [INVOICES:39]Invoice_Number:1; $_al_AuthIDS{$_l_AuthsIndex}; $_ar_Amounts{$_l_AuthsIndex})
									$_r_TotalPaymentsReceived:=$_r_TotalPaymentsReceived+$_r_PaymentReceived
									//```
									ARRAY TEXT:C222($_at_ExistingReceiptNumbers2; 0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4#"")
									SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xReceiptNumber:4; $_at_ExistingReceiptNumbers2)
									$_t_NewReceiptReference:=""
									For ($_l_ReceiptFindIndex; Size of array:C274($_at_ExistingReceiptNumbers2); 1; -1)
										$_l_ReceiptRow:=Find in array:C230($_at_ExistingReceiptNumbers; $_at_ExistingReceiptNumbers2{$_l_ReceiptFindIndex})
										If ($_l_ReceiptRow<0)
											$_t_NewReceiptReference:=$_at_ExistingReceiptNumbers2{$_l_ReceiptFindIndex}
											$_l_ReceiptFindIndex:=1
										End if 
									End for 
									
									
									READ WRITE:C146([CC_OrderAuths:133])
									QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_al_AuthIDS{$_l_AuthsIndex})
									
									[CC_OrderAuths:133]xinvoiceCode:9:=[INVOICES:39]Invoice_Number:1
									DB_SaveRecord(->[CC_OrderAuths:133])
									READ WRITE:C146([CCM_PSPTransaction:136])
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=[CC_OrderAuths:133]TransactionID:10)
									[CCM_PSPTransaction:136]XTransactionStatus:15:=-1
									[CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1
									[CCM_PSPTransaction:136]xReceiptID:13:=$_t_NewReceiptReference
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ ONLY:C145([CC_OrderAuths:133])
									//```
								Else 
									$_l_AuthsIndex:=Size of array:C274($_al_AuthIDS)
								End if 
							End for 
							
							
						End if 
						
						
				End case 
			End if 
			
		End if 
		OK:=1
	End if 
End if 
ERR_MethodTrackerReturn("ORD_InvCCPayment"; $_t_oldMethodName)