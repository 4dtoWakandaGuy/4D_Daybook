//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_DisplayAllocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2010 12:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_lb_ALLOCATIONS;0)
	//ARRAY DATE(INV_ad_AllocationDate;0)
	//ARRAY REAL(INV_ar_ABSAllocationAmount;0)
	//ARRAY REAL(INV_ar_DisplayAllocationAmount;0)
	//ARRAY TEXT(INV_ar_Deposit;0)
	//ARRAY TEXT(INV_at_CreditNum;0)
	//ARRAY TEXT(INV_at_DepositNum;0)
	//ARRAY TEXT(INV_at_DisplayAllocSource;0)
	//ARRAY TEXT(INV_at_InvoiceNum;0)
	//ARRAY TEXT(INV_at_Receipt;0)
	//ARRAY TEXT(INV_at_ReceiptNum;0)
	C_LONGINT:C283($_l_Index; $_l_ListboxColumns; $_l_SelectedRecordNumber; INC_l_COLHEAD1; INV_l_BUT1; INV_l_But2; INV_l_BUT3; INV_l_BUT4; INV_l_BUT5; INV_l_BUT6; INV_l_BUT7)
	C_LONGINT:C283(INV_l_BUT8; INV_l_BUT9; INV_l_Once; INV_PWAllocations)
	C_TEXT:C284($_t_FirstCharacter; $_t_oldMethodName; $_t_SecondCharacter; $_t_TotalPaid; oAllocations_COL1; oAllocations_COL2; oAllocations_COL3; oAllocations_COL4; oAllocations_COL5; oAllocations_COL6; oAllocations_COL7)
	C_TEXT:C284(oAllocations_COL8; oAllocations_COL9; oAllocations_HED1; oAllocations_HED2; oAllocations_HED3; oAllocations_HED4; oAllocations_HED5; oAllocations_HED6; oAllocations_HED7; oAllocations_HED8; oAllocations_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_DisplayAllocations")
ARRAY REAL:C219(INV_ar_DisplayAllocationAmount; 0)
ARRAY REAL:C219(INV_ar_ABSAllocationAmount; 0)
ARRAY TEXT:C222(INV_at_Receipt; 0)
ARRAY TEXT:C222(INV_ar_Deposit; 0)
ARRAY TEXT:C222(INV_at_CreditNum; 0)
ARRAY TEXT:C222(INV_at_ReceiptNum; 0)
ARRAY TEXT:C222(INV_at_InvoiceNum; 0)
ARRAY DATE:C224(INV_ad_AllocationDate; 0)
ARRAY TEXT:C222(INV_at_DisplayAllocSource; 0)
If ([INVOICES:39]Invoice_Number:1#"")
	$_t_FirstCharacter:=[INVOICES:39]Invoice_Number:1[[1]]
	If (Length:C16([INVOICES:39]Invoice_Number:1)>1)
		$_t_SecondCharacter:=[INVOICES:39]Invoice_Number:1[[2]]
	Else 
		$_t_SecondCharacter:=""
	End if 
	
	Case of 
		: ($_t_SecondCharacter="R")
			QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
		: ($_t_SecondCharacter="D")
			QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
		: (($_t_SecondCharacter="C") & ($_t_FirstCharacter="*")) | ($_t_FirstCharacter="C")
			QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
		Else 
			If ([INVOICES:39]Total_Invoiced:5>0)
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
				If (Records in selection:C76([XInvoiceAllocation:126])=0)
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
				End if 
				
			Else 
				//probably a credit
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
				If (Records in selection:C76([XInvoiceAllocation:126])=0)
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
				End if 
				
			End if 
	End case 
	CREATE SET:C116([XInvoiceAllocation:126]; "Allocations")
	SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xInvoiceNumber:2; INV_at_InvoiceNum; [XInvoiceAllocation:126]xCreditNumber:3; INV_at_CreditNum; [XInvoiceAllocation:126]xReceiptNumber:4; INV_at_ReceiptNum; [XInvoiceAllocation:126]xDepositNumber:5; INV_at_DepositNum; [XInvoiceAllocation:126]xAllocationDate:6; INV_ad_AllocationDate; [XInvoiceAllocation:126]xAmount:7; INV_ar_ABSAllocationAmount)
	ARRAY REAL:C219(INV_ar_DisplayAllocationAmount; Size of array:C274(INV_at_InvoiceNum))
	ARRAY TEXT:C222(INV_at_DisplayAllocSource; Size of array:C274(INV_at_InvoiceNum))
	For ($_l_Index; 1; Size of array:C274(INV_at_InvoiceNum))
		If ($_l_Index<=Size of array:C274(INV_at_CreditNum)) & ($_l_Index<=Size of array:C274(INV_at_ReceiptNum)) & ($_l_Index<=Size of array:C274(INV_at_DepositNum)) & ($_l_Index<=Size of array:C274(INV_ad_AllocationDate)) & ($_l_Index<=Size of array:C274(INV_ar_ABSAllocationAmount))
			Case of 
				: ($_t_SecondCharacter="R")
					Case of 
						: (INV_at_InvoiceNum{$_l_Index}#"")  //²
							//the invoice
							INV_at_DisplayAllocSource{$_l_Index}:="Invoice:"+INV_at_InvoiceNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=INV_ar_ABSAllocationAmount{$_l_Index}
						: (INV_at_CreditNum{$_l_Index}#"")  //²
							//theCredit
							INV_at_DisplayAllocSource{$_l_Index}:="Credit:"+INV_at_CreditNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=-(Abs:C99(INV_ar_ABSAllocationAmount{$_l_Index}))
						: (INV_at_DepositNum{$_l_Index}#"")  //²
							//theDeposit
							INV_at_DisplayAllocSource{$_l_Index}:="Deposit:"+INV_at_DepositNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=(INV_ar_ABSAllocationAmount{$_l_Index})
							
					End case 
					
				: ($_t_SecondCharacter="D")
					Case of 
						: (INV_at_InvoiceNum{$_l_Index}#"")
							//the invoice
							INV_at_DisplayAllocSource{$_l_Index}:="Invoice:"+INV_at_InvoiceNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=INV_ar_ABSAllocationAmount{$_l_Index}
						: (INV_at_CreditNum{$_l_Index}#"")  //SHOULD NOT  HAPPEN
							//theCredit
							INV_at_DisplayAllocSource{$_l_Index}:="Credit:"+INV_at_CreditNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
						: (INV_at_ReceiptNum{$_l_Index}#"")  //²
							//theReceipt
							INV_at_DisplayAllocSource{$_l_Index}:="Receipt:"+INV_at_ReceiptNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
							
					End case 
				: (($_t_SecondCharacter="C") & ($_t_FirstCharacter="*")) | ($_t_FirstCharacter="C")
					Case of 
						: (INV_at_InvoiceNum{$_l_Index}#"")
							//the invoice
							INV_at_DisplayAllocSource{$_l_Index}:="Invoice:"+INV_at_InvoiceNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=INV_ar_ABSAllocationAmount{$_l_Index}
						: (INV_at_DepositNum{$_l_Index}#"")  //SHOULD NOT  HAPPEN
							//theCredit
							INV_at_DisplayAllocSource{$_l_Index}:="Deposit:"+INV_at_DepositNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
						: (INV_at_ReceiptNum{$_l_Index}#"")  //²
							//theReceipt
							INV_at_DisplayAllocSource{$_l_Index}:="Receipt:"+INV_at_ReceiptNum{$_l_Index}
							INV_ar_DisplayAllocationAmount{$_l_Index}:=-(Abs:C99(INV_ar_ABSAllocationAmount{$_l_Index}))
							
					End case 
				Else 
					If ([INVOICES:39]Total_Invoiced:5>0)
						Case of 
							: (INV_at_CreditNum{$_l_Index}#"") & (INV_at_CreditNum{$_l_Index}#"")
								//the Credit
								INV_at_DisplayAllocSource{$_l_Index}:="Credit:"+INV_at_CreditNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
							: (INV_at_DepositNum{$_l_Index}#"")  //SHOULD NOT  HAPPEN
								//theCredit
								INV_at_DisplayAllocSource{$_l_Index}:="Deposit:"+INV_at_DepositNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
							: (INV_at_ReceiptNum{$_l_Index}#"")  //²
								//theReceipt
								INV_at_DisplayAllocSource{$_l_Index}:="Receipt:"+INV_at_ReceiptNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=INV_ar_ABSAllocationAmount{$_l_Index}
								
						End case 
					Else 
						Case of 
							: (INV_at_InvoiceNum{$_l_Index}#"") & (INV_at_CreditNum{$_l_Index}#"")
								//the invoice
								INV_at_DisplayAllocSource{$_l_Index}:="Invoice:"+INV_at_InvoiceNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=INV_ar_ABSAllocationAmount{$_l_Index}
							: (INV_at_DepositNum{$_l_Index}#"")  //SHOULD NOT  HAPPEN
								//thedeposit
								INV_at_DisplayAllocSource{$_l_Index}:="Deposit:"+INV_at_DepositNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
							: (INV_at_ReceiptNum{$_l_Index}#"")  //²
								//theReceipt
								INV_at_DisplayAllocSource{$_l_Index}:="Receipt:"+INV_at_ReceiptNum{$_l_Index}
								INV_ar_DisplayAllocationAmount{$_l_Index}:=-(INV_ar_ABSAllocationAmount{$_l_Index})
								
						End case 
					End if 
			End case 
		End if 
		
	End for 
	
Else 
	//clear the arrays
	CREATE EMPTY SET:C140([XInvoiceAllocation:126]; "Allocations")
End if 

//C_LONGINT(INV_lb_ALLOCATIONS)
$_l_ListboxColumns:=LISTBOX Get number of columns:C831(INV_lb_ALLOCATIONS)
If ($_l_ListboxColumns>0)
	LISTBOX DELETE COLUMN:C830(INV_lb_ALLOCATIONS; 1; $_l_ListboxColumns)
End if 
INC_l_COLHEAD1:=1

//"Reference"

LB_SetupListbox(->INV_lb_ALLOCATIONS; "oAllocations"; "INV_L"; 1; ->INV_at_DisplayAllocSource; ->INV_ar_DisplayAllocationAmount; ->INV_ad_AllocationDate)
OBJECT SET ENTERABLE:C238(INV_at_DisplayAllocSource; False:C215)
OBJECT SET ENTERABLE:C238(INV_ar_DisplayAllocationAmount; False:C215)
OBJECT SET ENTERABLE:C238(INV_ad_AllocationDate; False:C215)

LB_SetColumnHeaders(->INV_lb_ALLOCATIONS; "INV_L"; 1; "Reference"; "Amount"; "Date")
//LB_SetColumnWidths (->INV_lb_ALLOCATIONS;"INV_l_HED";1;101;80;80)
LB_SetColumnWidths(->INV_lb_ALLOCATIONS; "oAllocations"; 1; 101; 70; 70)
LB_SetScroll(->INV_lb_ALLOCATIONS; -3; -2)
LB_SetFormat(->INV_lb_ALLOCATIONS; 2; "|accounts"; 2)
LB_SetFormat(->INV_lb_ALLOCATIONS; 2; ""; 3; 0; 2)
LB_SetFormat(->INV_lb_ALLOCATIONS; 1; ""; 3; 0; 2)
LB_StyleSettings(->INV_lb_ALLOCATIONS; "Black"; 9; "oAllocations"; ->[INVOICES:39])

//INV_lb_LBAuths
//LB_SetSortOptions (->INV_lb_ALLOCATIONS;)

If ([INVOICES:39]Invoice_Number:1#"")
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
Else 
	REDUCE SELECTION:C351([INVOICES_ALLOCATIONS:162]; 0)
	
End if 

If (Size of array:C274(INV_ad_AllocationDate)=0) & (Records in selection:C76([INVOICES_ALLOCATIONS:162])>0)
	If (INV_l_Once=0)
		INV_l_Once:=1  //make sure not recursive
		COPY NAMED SELECTION:C331([INVOICES:39]; "$CUR")
		$_l_SelectedRecordNumber:=Selected record number:C246([INVOICES:39])
		SI_AllocationValidation
		USE NAMED SELECTION:C332("$CUR")
		GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
		
		INV_DisplayAllocations
		
		INV_l_Once:=0
	Else 
		USE SET:C118("Allocations")
		INV_CheckRemainder([INVOICES:39]Invoice_Number:1; False:C215)
		If ([INVOICES:39]Invoice_Number:1="*D@")
			If ([INVOICES:39]Total_Paid:6=0)
				$_t_TotalPaid:=Gen_Request("How much should this deposit be?"; "0.00")
				[INVOICES:39]Total_Paid:6:=Num:C11($_t_TotalPaid)
			End if 
			
		Else 
			USE SET:C118("Allocations")
			[INVOICES:39]Total_Paid:6:=Gen_Round(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2); 2; 2)
		End if 
		CLEAR SET:C117("Allocations")
	End if 
	
Else 
	USE SET:C118("Allocations")
	INV_CheckRemainder([INVOICES:39]Invoice_Number:1; False:C215)
	If ([INVOICES:39]Invoice_Number:1="*D@")
		If ([INVOICES:39]Total_Paid:6=0)
			$_t_TotalPaid:=Gen_Request("How much should this deposit be?"; "0.00")
			[INVOICES:39]Total_Paid:6:=Num:C11($_t_TotalPaid)
		End if 
		
	Else 
		USE SET:C118("Allocations")
		[INVOICES:39]Total_Paid:6:=Gen_Round(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; False:C215); 2); 2; 2)
	End if 
	CLEAR SET:C117("Allocations")
	
	
End if 
ERR_MethodTrackerReturn("INV_DisplayAllocations"; $_t_oldMethodName)