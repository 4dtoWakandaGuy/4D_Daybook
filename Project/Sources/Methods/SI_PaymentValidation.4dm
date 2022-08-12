//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_PaymentValidation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllocationDates; 0)
	ARRAY LONGINT:C221($_al_AllocationUpdates; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY TEXT:C222($_at_AllocationInvoiceNumbers; 0)
	C_DATE:C307($_d_INDate)
	C_LONGINT:C283($_l_AllocationIndex; $_l_CurrentRow; $_l_InvoiceIndex)
	C_REAL:C285($_r_INValue)
	C_TEXT:C284($_t_AnalysisCode; $_t_CreditNumber; $_t_DepositNumber; $_t_IN2; $_t_InvoiceCompanyCode; $_t_InvoiceContactCode; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_PaymentValidation")
//this method is to validate the creation of subrecords methodology

ALL RECORDS:C47([INVOICES:39])
CREATE SET:C116([INVOICES:39]; "All")
Open window:C153(40; 40; 300; 100; -1984)
For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
	USE SET:C118("All")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_InvoiceIndex)
	ERASE WINDOW:C160
	
	MESSAGE:C88("INVOICE TEST "+String:C10($_l_InvoiceIndex)+" of "+String:C10(Records in selection:C76([INVOICES:39])))
	
	
	
	$_t_InvoiceCompanyCode:=[INVOICES:39]Company_Code:2
	$_t_InvoiceContactCode:=[INVOICES:39]Contact_Code:3
	$_t_AnalysisCode:=[INVOICES:39]Analysis_Code:17
	
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	
	ARRAY REAL:C219($_ar_AllocationAmounts; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	ARRAY TEXT:C222($_at_AllocationInvoiceNumbers; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	ARRAY DATE:C224($_ad_AllocationDates; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
	$_l_CurrentRow:=0
	For ($_l_AllocationIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))  //2
		If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"")  //3
			$_l_CurrentRow:=$_l_CurrentRow+1
			$_ar_AllocationAmounts{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Amount:2
			$_at_AllocationInvoiceNumbers{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			$_ad_AllocationDates{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Date:3
		End if   //3
		NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
	End for   //2
	ARRAY REAL:C219($_ar_AllocationAmounts; $_l_CurrentRow)
	ARRAY TEXT:C222($_at_AllocationInvoiceNumbers; $_l_CurrentRow)
	ARRAY DATE:C224($_ad_AllocationDates; $_l_CurrentRow)
	ARRAY LONGINT:C221($_al_AllocationUpdates; $_l_CurrentRow)
	$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
	
	For ($_l_AllocationIndex; 1; Size of array:C274($_ar_AllocationAmounts))  //4
		$_t_CreditNumber:=""
		$_t_ReceiptNumber:=""
		$_t_InvoiceNumber:=""
		$_t_DepositNumber:=""
		
		$_t_IN2:=$_at_AllocationInvoiceNumbers{$_l_AllocationIndex}
		$_d_INDate:=$_ad_AllocationDates{$_l_AllocationIndex}
		$_r_INValue:=$_ar_AllocationAmounts{$_l_AllocationIndex}
		Case of   //5
			: ([INVOICES:39]Invoice_Number:1="*@") | ([INVOICES:39]Invoice_Number:1="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
				//$invoic`6e is credit number
				Case of 
					: ($_t_InvoiceNumber="*R@")
						//Receipt
						$_t_ReceiptNumber:=$_t_InvoiceNumber
					: ($_t_InvoiceNumber="*D@")
						//Deposit
						$_t_DepositNumber:=$_t_InvoiceNumber
					: ($_t_InvoiceNumber="*C@") | ($_t_InvoiceNumber="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
						//Credit against a credit?????
						$_t_CreditNumber:=$_t_InvoiceNumber
				End case 
			Else 
				$_t_InvoiceNumber:=$_t_InvoiceNumber
		End case   //5
		If ($_t_IN2="*@") | ($_t_IN2="C@")  //7
			Case of   //8
				: ($_t_IN2="*R@")
					//Receipt
					$_t_ReceiptNumber:=$_t_IN2
				: ($_t_IN2="*D@")
					//Deposit
					$_t_DepositNumber:=$_t_IN2
				: ($_t_IN2="*C@") | ($_t_IN2="C@")
					//Credit
					$_t_CreditNumber:=$_t_IN2
			End case   //8
			
		Else 
			$_t_InvoiceNumber:=$_t_IN2
		End if   //7
		QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber; *)
		If ($_t_CreditNumber#"")  //9
			QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_t_CreditNumber; *)
		End if 
		If ($_t_ReceiptNumber#"")  //9
			QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)
		End if 
		If ($_t_DepositNumber#"")  //10
			QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber; *)
		End if 
		
		//QUERY([XInvoiceAllocation]; & ;[XInvoiceAllocation]xAllocationDate=$_d_INDate;*)
		
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_r_INValue)
		If (Records in selection:C76([XInvoiceAllocation:126])=0)  //11
			//If (False)
			CREATE RECORD:C68([XInvoiceAllocation:126])
			
			[XInvoiceAllocation:126]xInvoiceNumber:2:=$_t_InvoiceNumber
			[XInvoiceAllocation:126]xCreditNumber:3:=$_t_CreditNumber
			[XInvoiceAllocation:126]xReceiptNumber:4:=$_t_ReceiptNumber
			[XInvoiceAllocation:126]xDepositNumber:5:=$_t_DepositNumber
			[XInvoiceAllocation:126]xAllocationDate:6:=$_d_INDate
			[XInvoiceAllocation:126]xAmount:7:=$_r_INValue
			
			SI_SetTaxPoint
			
			
			
		End if   //11
		DB_SaveRecord(->[XInvoiceAllocation:126])
		
	End for   //4
	
	
	
	
	
End for   //1
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("SI_PaymentValidation"; $_t_oldMethodName)