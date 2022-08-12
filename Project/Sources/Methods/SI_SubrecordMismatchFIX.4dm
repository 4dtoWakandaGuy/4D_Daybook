//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_SubrecordMismatchFIX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; $_bo_HeaderSent)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CountAllocations; $_l_Index; $_l_Invoice2Row; $_l_RecordstoCheck; $_l_RefersIndex)
	C_REAL:C285($_r_ExpectedAmount; $_r_TotalDue; $_r_TotalPaid)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName; $_t_PostingType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_SubrecordMismatchFIX")
SI_CrossInvoiceFix
ALL RECORDS:C47([INVOICES:39])
QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1#"*@")
CREATE SET:C116([INVOICES:39]; "ToCheck")


$_l_RecordstoCheck:=Records in selection:C76([INVOICES:39])
For ($_l_Index; 1; $_l_RecordstoCheck)
	
	READ WRITE:C146([INVOICES:39])
	USE SET:C118("ToCheck")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
	Case of 
		: ([INVOICES:39]Total_Invoiced:5<0) | ([INVOICES:39]Invoice_Number:1="C@")
			$_t_PostingType:="CREDIT"
		Else 
			$_t_PostingType:="INVOICE"
	End case 
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
	$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
	If ((Position:C15("*D"; [INVOICES:39]Invoice_Number:1))=0)
		Case of 
			: ([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]Total_Paid:6>0)
				[INVOICES:39]Total_Paid:6:=-[INVOICES:39]Total_Paid:6
				SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
				QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
				
				$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
				$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
				
			: ([INVOICES:39]Total_Invoiced:5>0) & ([INVOICES:39]Total_Paid:6<0)
				[INVOICES:39]Total_Paid:6:=-[INVOICES:39]Total_Paid:6
				QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
				
				$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
				$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
				
		End case 
		Case of 
			: (($_r_TotalPaid>0) & ([INVOICES:39]Total_Paid:6<0))
				If ($_r_TotalPaid=Abs:C99([INVOICES:39]Total_Paid:6))
					SI_CreditAllocationFix([INVOICES:39]Invoice_Number:1)
					USE SET:C118("ToCheck")
					GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					
					$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
					$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
					
				End if 
			: ($_r_TotalPaid<0) & ([INVOICES:39]Total_Paid:6>0)
				If (Abs:C99($_r_TotalPaid)=([INVOICES:39]Total_Paid:6))
					SI_CreditAllocationFix([INVOICES:39]Invoice_Number:1)
					USE SET:C118("ToCheck")
					GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					
					$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
					$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
				End if 
				
		End case 
	End if 
	
	//   `cross check the sub records and report any problems
	ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; 0)
	$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	$_l_CountAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
	ARRAY TEXT:C222($_at_SubRefersInvoices; $_l_CountAllocations)
	ARRAY REAL:C219($_ar_SubrefersInvoiceAMT; $_l_CountAllocations)
	FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
	For ($_l_RefersIndex; 1; $_l_CountAllocations)
		$_at_SubRefersInvoices{$_l_RefersIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
		$_ar_SubrefersInvoiceAMT{$_l_RefersIndex}:=[INVOICES_ALLOCATIONS:162]Amount:2
		NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
	End for 
	$_bo_HeaderSent:=False:C215
	
	For ($_l_RefersIndex; 1; Size of array:C274($_at_SubRefersInvoices))
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_SubRefersInvoices{$_l_RefersIndex})
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		If (Records in selection:C76([INVOICES:39])>0)
			ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; 0)
			$_l_CountAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			ARRAY TEXT:C222($_at_SubRefersInvoices2; $_l_CountAllocations)
			ARRAY REAL:C219($_ar_SubrefersInvoiceAMT2; $_l_CountAllocations)
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_AllocationsIndex; 1; $_l_CountAllocations)
				$_ar_SubrefersInvoiceAMT2{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Amount:2
				$_at_SubRefersInvoices2{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			$_l_Invoice2Row:=Find in array:C230($_at_SubRefersInvoices2; $_t_InvoiceNumber)
			If ($_l_Invoice2Row>0)
				//first pass we check the amount matches the correct way
				Case of 
					: ($_t_PostingType="Credit")
						If ([INVOICES:39]Invoice_Number:1#"*D@") & ([INVOICES:39]Invoice_Number:1#"*R@")
							$_r_ExpectedAmount:=-$_ar_SubrefersInvoiceAMT{$_l_RefersIndex}
						Else 
							$_r_ExpectedAmount:=$_ar_SubrefersInvoiceAMT{$_l_RefersIndex}
						End if 
						
					Else 
						If ([INVOICES:39]Invoice_Number:1="*R@") | ([INVOICES:39]Invoice_Number:1="*D@")
							$_r_ExpectedAmount:=$_ar_SubrefersInvoiceAMT{$_l_RefersIndex}
						Else 
							$_r_ExpectedAmount:=-$_ar_SubrefersInvoiceAMT{$_l_RefersIndex}
						End if 
				End case 
				If (($_ar_SubrefersInvoiceAMT2{$_l_Invoice2Row})#$_r_ExpectedAmount)
					FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
					For ($_l_AllocationsIndex; 1; $_l_CountAllocations)
						If ($_l_AllocationsIndex=$_l_Invoice2Row)
							[INVOICES_ALLOCATIONS:162]Amount:2:=$_r_ExpectedAmount
							$_l_AllocationsIndex:=$_l_CountAllocations+1
							DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
							
						End if 
						NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
						
					End for 
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					
					$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
					$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
					If ((Position:C15("*D"; [INVOICES:39]Invoice_Number:1))=0)
						Case of 
							: ([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]Total_Paid:6>0)
								[INVOICES:39]Total_Paid:6:=-[INVOICES:39]Total_Paid:6
								SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
								QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
								
								$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
								$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
								
							: ([INVOICES:39]Total_Invoiced:5>0) & ([INVOICES:39]Total_Paid:6<0)
								[INVOICES:39]Total_Paid:6:=-[INVOICES:39]Total_Paid:6
								QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
								
								$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
								$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
								
						End case 
						Case of 
							: (($_r_TotalPaid>0) & ([INVOICES:39]Total_Paid:6<0))
								If ($_r_TotalPaid=Abs:C99([INVOICES:39]Total_Paid:6))
									[INVOICES:39]Total_Paid:6:=$_r_TotalPaid
									QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
									
									$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
									$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
									
								End if 
							: ($_r_TotalPaid<0) & ([INVOICES:39]Total_Paid:6>0)
								If (Abs:C99($_r_TotalPaid)=([INVOICES:39]Total_Paid:6))
									[INVOICES:39]Total_Paid:6:=$_r_TotalPaid
									QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
									
									$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
									$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
								End if 
								
						End case 
					End if 
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
					SAVE RECORD:C53([INVOICES:39])
					READ WRITE:C146([XInvoiceAllocation:126])
					INV_GetAllocations([INVOICES:39]Invoice_Number:1)
					If (Records in selection:C76([XInvoiceAllocation:126])>0)
						//TRACE
						DELETE SELECTION:C66([XInvoiceAllocation:126])
					End if 
					
					
				End if 
				
			Else 
				If (False:C215)
					
				End if 
				
			End if 
		End if 
		
	End for 
	
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
	
	
	
End for 
ERR_MethodTrackerReturn("SI_SubrecordMismatchFIX"; $_t_oldMethodName)
