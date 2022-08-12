//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_ADTot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_AmountsDepositedBefore; 0)
	ARRAY REAL:C219($_ar_ReceiptedAmounts; 0)
	ARRAY TEXT:C222($_at_ReceiptNumbers; 0)
	C_BOOLEAN:C305(ACC_bo_IgnoreDepositDate)
	C_DATE:C307($_d_InvoiceDate; $2; vDate)
	C_LONGINT:C283($_l_WriteOffIndex)
	C_REAL:C285($_r_InvoiceTotalDue; $_r_TotalInvoiced; $_r_TotalPaid; $_r_TotalToWriteOff; $3; $4; $5; INV_l_QTY; Vtotal)
	C_TEXT:C284($_t_DepositNumber; $_t_invoiceNumber; $_t_oldMethodName; $1; Acc_t_AccountCodeFrom; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ADTot")
If (Count parameters:C259>=1)
	$_t_invoiceNumber:=$1
Else 
	$_t_invoiceNumber:=[INVOICES:39]Invoice_Number:1
End if 
If (Count parameters:C259>=2)
	$_d_InvoiceDate:=$2
Else 
	$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
End if 
If (Count parameters:C259>=3)
	$_r_TotalPaid:=$3
Else 
	$_r_TotalPaid:=[INVOICES:39]Total_Paid:6
End if 
If (Count parameters:C259>=4)
	$_r_TotalInvoiced:=$4
Else 
	$_r_TotalInvoiced:=[INVOICES:39]Total_Invoiced:5
	
End if 
If (Count parameters:C259>=5)
	$_r_InvoiceTotalDue:=$5
Else 
	$_r_InvoiceTotalDue:=[INVOICES:39]Total_Due:7
End if 

If (DB_t_CurrentFormUsage="AA")
	// If (ACC_t_PeriodFrom="")
	
	If (vDate<DB_GetSalesLedgerFromDate)
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=$_t_invoiceNumber; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=vDate; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
		vTotal:=Round:C94(Gen_Add(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Total:17); 2)
	Else 
		If ($_d_InvoiceDate<DB_GetSalesLedgerFromDate)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=$_t_invoiceNumber; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<DB_GetSalesLedgerFromDate; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom)
			
			
			INV_GetAllocations($_t_invoiceNumber)
			QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6>=DB_GetSalesLedgerFromDate; *)
			QUERY SELECTION:C341([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAllocationDate:6<=VDate)
			$_r_TotalToWriteOff:=0
			If ([INVOICES:39]Invoice_Number:1#"*@") & ([INVOICES:39]Total_Invoiced:5>0)
				CREATE SET:C116([XInvoiceAllocation:126]; "$Set1")
				$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4#"")
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6>Vdate)
				//this allocation would not get taken off the due amount so would show as due but if it was paying a deposit that came before then it should not do that
				SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xAmount:7; $_ar_ReceiptedAmounts; [XInvoiceAllocation:126]xReceiptNumber:4; $_at_ReceiptNumbers)
				ARRAY REAL:C219($_ar_AmountsDepositedBefore; 0)
				ARRAY REAL:C219($_ar_AmountsDepositedBefore; Size of array:C274($_ar_ReceiptedAmounts))
				For ($_l_WriteOffIndex; 1; Size of array:C274($_ar_ReceiptedAmounts))
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_ReceiptNumbers{$_l_WriteOffIndex}; *)
					QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5#"")
					If (Records in selection:C76([XInvoiceAllocation:126])>=1)
						$_t_DepositNumber:=[XInvoiceAllocation:126]xDepositNumber:5
						SET QUERY DESTINATION:C396(Into variable:K19:4; INV_l_QTY)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositNumber; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4<=$_d_InvoiceDate)
						If (INV_l_QTY>0)
							$_ar_AmountsDepositedBefore{$_l_WriteOffIndex}:=[XInvoiceAllocation:126]xAmount:7
						End if 
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
					End if 
				End for 
				For ($_l_WriteOffIndex; 1; Size of array:C274($_ar_AmountsDepositedBefore))
					$_r_TotalToWriteOff:=$_r_TotalToWriteOff+$_ar_AmountsDepositedBefore{$_l_WriteOffIndex}
				End for 
				
				USE SET:C118("$Set1")
			End if 
			vTotal:=(Round:C94(Gen_Add(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Total:17)-INV_CalculateAllocations($_t_invoiceNumber; False:C215); 2))
			If (Not:C34(ACC_bo_IgnoreDepositDate))
				Vtotal:=Vtotal+Round:C94($_r_TotalToWriteOff; 2)
			End if 
			
			
		Else 
			
			INV_GetAllocations($_t_invoiceNumber)
			
			QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6>=DB_GetSalesLedgerFromDate; *)
			QUERY SELECTION:C341([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAllocationDate:6<=VDate)
			$_r_TotalToWriteOff:=0
			If ([INVOICES:39]Invoice_Number:1#"*@") & ([INVOICES:39]Total_Invoiced:5>0)
				CREATE SET:C116([XInvoiceAllocation:126]; "$Set1")
				$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
				
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4#"")
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6>Vdate)
				SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xAmount:7; $_ar_ReceiptedAmounts; [XInvoiceAllocation:126]xReceiptNumber:4; $_at_ReceiptNumbers)
				ARRAY REAL:C219($_ar_AmountsDepositedBefore; 0)
				ARRAY REAL:C219($_ar_AmountsDepositedBefore; Size of array:C274($_ar_ReceiptedAmounts))
				For ($_l_WriteOffIndex; 1; Size of array:C274($_ar_ReceiptedAmounts))
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_ReceiptNumbers{$_l_WriteOffIndex}; *)
					QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5#"")
					If (Records in selection:C76([XInvoiceAllocation:126])>=1)
						$_t_DepositNumber:=[XInvoiceAllocation:126]xDepositNumber:5
						SET QUERY DESTINATION:C396(Into variable:K19:4; INV_l_QTY)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositNumber; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4<=$_d_InvoiceDate)
						If (INV_l_QTY>0)
							$_ar_AmountsDepositedBefore{$_l_WriteOffIndex}:=[XInvoiceAllocation:126]xAmount:7
						End if 
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
					End if 
				End for 
				For ($_l_WriteOffIndex; 1; Size of array:C274($_ar_AmountsDepositedBefore))
					$_r_TotalToWriteOff:=$_r_TotalToWriteOff+$_ar_AmountsDepositedBefore{$_l_WriteOffIndex}
				End for 
				
				USE SET:C118("$Set1")
			End if 
			
			If ([INVOICES:39]State:10=-2)
				vTotal:=Round:C94(((0-$_r_TotalPaid)-INV_CalculateAllocations($_t_invoiceNumber; False:C215)); 2)
				If (Not:C34(ACC_bo_IgnoreDepositDate))
					Vtotal:=Vtotal+Round:C94($_r_TotalToWriteOff; 2)
				End if 
			Else 
				vTotal:=Round:C94(($_r_TotalInvoiced-INV_CalculateAllocations($_t_invoiceNumber; False:C215)); 2)
				If (Not:C34(ACC_bo_IgnoreDepositDate))
					Vtotal:=Vtotal+Round:C94($_r_TotalToWriteOff; 2)
				End if 
			End if 
			
		End if 
	End if 
	// Else
	//   SEARCH([TRANSACTIONS];[TRANSACTIONS]Invoice No=[INVOICES]Invoice No;*)
	//   SEARCH([TRANSACTIONS]; & ;[TRANSACTIONS]Period Code<=ACC_t_PeriodFrom;*)
	//  SEARCH([TRANSACTIONS]; & ;[TRANSACTIONS]Account Code=Acc_t_AccountCodeFrom)
	//  vTotal:=Round(Gen_Add (»[TRANSACTIONS];»[TRANSACTIONS]Total);2)
	//  End if
Else 
	vTotal:=$_r_InvoiceTotalDue
End if 
ERR_MethodTrackerReturn("Invoices_ADTot"; $_t_oldMethodName)