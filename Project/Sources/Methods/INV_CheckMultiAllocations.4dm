//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CheckMultiAllocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 11:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RecordNumbers; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT3; 0)
	ARRAY TEXT:C222($_at_SubrefersInvoice; 0)
	ARRAY TEXT:C222($_at_SubrefersInvoice2; 0)
	ARRAY TEXT:C222($_at_SubrefersInvoice3; 0)
	C_BOOLEAN:C305($_bo_Used)
	C_LONGINT:C283($_l_AllocationsIndex2; $_l_AmountRow; $_l_CountAllocationsRecords; $_l_CurrentRow; $_l_Index; $_l_InvoiceIndex2; $_l_InvoiceRow)
	C_TEXT:C284($_t_Invoice; $_t_oldMethodName; $_t_Primary; $_t_Secondary; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CheckMultiAllocations")
//$1=Invoice number
//$2=Credit note number
//$3=Deposit
//$4=Credit
//$5=Amount
//TRACE
$_t_Invoice:=[INVOICES:39]Invoice_Number:1
$_bo_Used:=False:C215
If (Count parameters:C259>=4)
	If ($1#"")
		$_t_Primary:=$1
		If ([INVOICES:39]Invoice_Number:1#$1)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
		End if 
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		ARRAY TEXT:C222($_at_SubrefersInvoice; 0)
		ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
		$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
		ARRAY TEXT:C222($_at_SubrefersInvoice; $_l_CountAllocationsRecords)
		ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; $_l_CountAllocationsRecords)
		
		FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
		For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
			$_ar_SubrefersInvoiceAMT{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
			$_at_SubrefersInvoice{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
		End for 
		$_bo_Used:=True:C214
	End if 
	If ($2#"")
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		
		If ($_bo_Used=False:C215)
			$_t_Primary:=$2
			ARRAY TEXT:C222($_at_SubrefersInvoice; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; $_l_CountAllocationsRecords)
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			$_bo_Used:=True:C214
		Else 
			
			$_t_Secondary:=$2
			ARRAY TEXT:C222($_at_SubrefersInvoice2; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice2; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; $_l_CountAllocationsRecords)
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			
		End if 
	End if 
	
	If ($3#"")
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$3)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		If ($_bo_Used=False:C215)
			$_t_Primary:=$3
			ARRAY TEXT:C222($_at_SubrefersInvoice; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; $_l_CountAllocationsRecords)
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			$_bo_Used:=True:C214
		Else 
			$_t_Secondary:=$3
			ARRAY TEXT:C222($_at_SubrefersInvoice2; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice2; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; $_l_CountAllocationsRecords)
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			
		End if 
	End if 
	
	If ($4#"")
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$4)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		
		If ($_bo_Used=False:C215)
			$_t_Primary:=$4
			ARRAY TEXT:C222($_at_SubrefersInvoice; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; $_l_CountAllocationsRecords)
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			$_bo_Used:=True:C214
		Else 
			$_t_Secondary:=$4
			ARRAY TEXT:C222($_at_SubrefersInvoice2; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
			$_l_CountAllocationsRecords:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubrefersInvoice2; $_l_CountAllocationsRecords)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; $_l_CountAllocationsRecords)
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex2; 1; $_l_CountAllocationsRecords)
				$_ar_SubrefersInvoiceAMT2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubrefersInvoice2{$_l_AllocationsIndex2}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			
			
		End if 
		
	End if 
	// OK we now have two groups of arrays
	If ($_t_Primary#"") & ($_t_Secondary#"")
		//Check for refs to secondary in first arrays
		For ($_l_Index; Size of array:C274($_at_SubrefersInvoice); 1; -1)
			If ($_at_SubrefersInvoice{$_l_Index}#$_t_Secondary)
				DELETE FROM ARRAY:C228($_at_SubrefersInvoice; $_l_Index)
				DELETE FROM ARRAY:C228($_ar_SubrefersInvoiceAMT; $_l_Index)
			End if 
			
		End for 
		//Check for refs to primary in second arrays
		For ($_l_Index; Size of array:C274($_at_SubrefersInvoice2); 1; -1)
			If ($_at_SubrefersInvoice2{$_l_Index}#$_t_Primary)
				DELETE FROM ARRAY:C228($_at_SubrefersInvoice2; $_l_Index)
				DELETE FROM ARRAY:C228($_ar_SubrefersInvoiceAMT2; $_l_Index)
			End if 
			
		End for 
		//Now in theory our two arrays should cross refer!
		ARRAY TEXT:C222($_at_SubrefersInvoice3; 0)
		ARRAY REAL:C219($_ar_SubrefersInvoiceAMT3; 0)
		ARRAY TEXT:C222($_at_SubrefersInvoice3; Size of array:C274($_ar_SubrefersInvoiceAMT2)+Size of array:C274($_ar_SubrefersInvoiceAMT))
		ARRAY REAL:C219($_ar_SubrefersInvoiceAMT3; Size of array:C274($_ar_SubrefersInvoiceAMT2)+Size of array:C274($_ar_SubrefersInvoiceAMT))
		$_l_CurrentRow:=0
		For ($_l_Index; 1; Size of array:C274($_ar_SubrefersInvoiceAMT2))
			If ($_ar_SubrefersInvoiceAMT2{$_l_Index}#0)
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_at_SubrefersInvoice3{$_l_CurrentRow}:=$_at_SubrefersInvoice2{$_l_Index}
				$_ar_SubrefersInvoiceAMT3{$_l_CurrentRow}:=Abs:C99($_ar_SubrefersInvoiceAMT2{$_l_Index})
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274($_ar_SubrefersInvoiceAMT))
			If ($_ar_SubrefersInvoiceAMT{$_l_Index}#0)
				$_l_InvoiceRow:=Find in array:C230($_ar_SubrefersInvoiceAMT3; Abs:C99($_ar_SubrefersInvoiceAMT{$_l_Index}))
				If ($_l_InvoiceRow<0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					$_at_SubrefersInvoice3{$_l_CurrentRow}:=$_at_SubrefersInvoice{$_l_Index}
					$_ar_SubrefersInvoiceAMT3{$_l_CurrentRow}:=Abs:C99($_ar_SubrefersInvoiceAMT{$_l_Index})
				Else 
					If ($_at_SubrefersInvoice3{$_l_InvoiceRow}#$_at_SubrefersInvoice{$_l_Index})
						$_at_SubrefersInvoice3{$_l_InvoiceRow}:=$_at_SubrefersInvoice{$_l_Index}
					Else 
						For ($_l_InvoiceIndex2; $_l_InvoiceRow+1; Size of array:C274($_ar_SubrefersInvoiceAMT3))
							If ($_ar_SubrefersInvoiceAMT3{$_l_InvoiceIndex2}=Abs:C99($_ar_SubrefersInvoiceAMT{$_l_Index}))
								If ($_at_SubrefersInvoice3{$_l_InvoiceRow}#$_at_SubrefersInvoice{$_l_Index})
									$_at_SubrefersInvoice3{$_l_InvoiceIndex2}:=$_at_SubrefersInvoice{$_l_Index}
									
								End if 
							End if 
						End for 
						
					End if 
				End if 
			End if 
		End for 
		
		
		ARRAY TEXT:C222($_at_SubrefersInvoice3; $_l_CurrentRow)
		ARRAY REAL:C219($_ar_SubrefersInvoiceAMT3; $_l_CurrentRow)
		//This is a picture of what we should have-even if it does not match up
		ARRAY REAL:C219($_ar_AllocationAmounts; 0)
		ARRAY LONGINT:C221($_al_RecordNumbers; 0)
		QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$1; *)
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$2; *)
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$3; *)
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$4)
		SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_RecordNumbers; [XInvoiceAllocation:126]xAmount:7; $_ar_AllocationAmounts)
		For ($_l_Index; 1; Size of array:C274($_ar_AllocationAmounts))
			If ($_ar_AllocationAmounts{$_l_Index}#0)
				$_l_AmountRow:=Find in array:C230($_ar_SubrefersInvoiceAMT3; Abs:C99($_ar_AllocationAmounts{$_l_Index}))
				If ($_l_AmountRow>0)
					$_ar_SubrefersInvoiceAMT3{$_l_AmountRow}:=0
				Else 
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_RecordNumbers{$_l_Index})
					DELETE RECORD:C58([XInvoiceAllocation:126])
					
				End if 
			Else 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_RecordNumbers{$_l_Index})
				DELETE RECORD:C58([XInvoiceAllocation:126])
				
			End if 
			
		End for 
	End if 
	
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_Invoice)
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
End if 
ERR_MethodTrackerReturn("INV_CheckMultiAllocations"; $_t_oldMethodName)