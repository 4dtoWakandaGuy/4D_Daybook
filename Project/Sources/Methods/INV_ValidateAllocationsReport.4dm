//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ValidateAllocationsReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_ReferredAmounts; 0)
	ARRAY REAL:C219($_ar_ReferredAmounts2; 0)
	ARRAY TEXT:C222($_at_ReferredAllocations; 0)
	ARRAY TEXT:C222($_at_ReferredAllocations2; 0)
	C_BOOLEAN:C305($_bo_IsWrong)
	C_LONGINT:C283($_l_allocationsIndex; $_l_CrossAllocIndex; $_l_InvoiceIndex; $_l_RecordsinSelection; $_l_ReferredRow)
	C_REAL:C285($_r_TotalAmountAllocated)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_ThisInvoice)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ValidateAllocationsReport")

ALL RECORDS:C47([INVOICES:39])
CREATE SET:C116([INVOICES:39]; "$ALL")
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
For ($_l_InvoiceIndex; 1; $_l_RecordsinSelection)
	USE SET:C118("$ALL")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_InvoiceIndex)
	MESSAGE:C88([INVOICES:39]Invoice_Number:1)
	ARRAY TEXT:C222($_at_ReferredAllocations; 0)
	ARRAY REAL:C219($_ar_ReferredAmounts; 0)
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	For ($_l_allocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
		If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"") | ([INVOICES_ALLOCATIONS:162]Amount:2#0)
			APPEND TO ARRAY:C911($_at_ReferredAllocations; [INVOICES_ALLOCATIONS:162]Invoice_Number:1)
			APPEND TO ARRAY:C911($_ar_ReferredAmounts; [INVOICES_ALLOCATIONS:162]Amount:2)
			NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
		End if 
	End for 
	$_t_Message:=""
	$_bo_IsWrong:=False:C215
	$_t_ThisInvoice:=[INVOICES:39]Invoice_Number:1
	$_r_TotalAmountAllocated:=0
	$_t_Message:=[INVOICES:39]Invoice_Number:1+Char:C90(13)
	
	For ($_l_AllocationsIndex; 1; Size of array:C274($_at_ReferredAllocations))
		$_t_Message:=$_t_Message+(Char:C90(9)*2)+$_at_ReferredAllocations{$_l_AllocationsIndex}+Char:C90(9)+String:C10($_ar_ReferredAmounts)
		If ($_at_ReferredAllocations{$_l_AllocationsIndex}=$_t_ThisInvoice)
			$_t_Message:=$_t_Message+Char:C90(9)+"ERROR-Allocation against itself!"
			$_bo_IsWrong:=True:C214
		Else 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_ReferredAllocations{$_l_AllocationsIndex})
			If (Records in selection:C76([INVOICES:39])>1)
				$_bo_IsWrong:=True:C214
				$_t_Message:=$_t_Message+Char:C90(9)+"ERROR Multiple invoices with same number"
			Else 
				$_t_Message:=$_t_Message+Char:C90(13)+(Char:C90(9)*4)
				If (Records in selection:C76([INVOICES:39])>0)
					ARRAY TEXT:C222($_at_ReferredAllocations2; 0)
					ARRAY REAL:C219($_ar_ReferredAmounts2; 0)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					For ($_l_CrossAllocIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
						If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"") | ([INVOICES_ALLOCATIONS:162]Amount:2#0)
							APPEND TO ARRAY:C911($_at_ReferredAllocations2; [INVOICES_ALLOCATIONS:162]Invoice_Number:1)
							APPEND TO ARRAY:C911($_ar_ReferredAmounts2; [INVOICES_ALLOCATIONS:162]Amount:2)
							NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
						End if 
					End for 
					USE SET:C118("$ALL")
					GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_InvoiceIndex)
					$_l_ReferredRow:=Find in array:C230($_at_ReferredAllocations2; $_t_ThisInvoice)
					If ($_l_ReferredRow>0)
						If ($_ar_ReferredAmounts2{$_l_ReferredRow}#$_ar_ReferredAmounts{$_l_AllocationsIndex})
							$_bo_IsWrong:=True:C214
							$_t_Message:=$_t_Message+Char:C90(9)+"ERROR-Referred Allocation"+$_at_ReferredAllocations{$_l_AllocationsIndex}+" Amount referred is different Referred says it is"+String:C10($_ar_ReferredAmounts2{$_l_ReferredRow})+"This invoice says it is"+String:C10($_ar_ReferredAmounts{$_l_AllocationsIndex})+Char:C90(13)
							
							
							$_r_TotalAmountAllocated:=$_r_TotalAmountAllocated+$_ar_ReferredAmounts{$_l_AllocationsIndex}
							
						Else 
							$_r_TotalAmountAllocated:=$_r_TotalAmountAllocated+$_ar_ReferredAmounts{$_l_AllocationsIndex}
							$_t_Message:=$_t_Message+Char:C90(9)+String:C10($_ar_ReferredAmounts{$_l_AllocationsIndex})+Char:C90(13)
						End if 
					Else 
						$_bo_IsWrong:=True:C214
						$_t_Message:=$_t_Message+Char:C90(9)+"ERROR-Referred Allocation"+$_at_ReferredAllocations{$_l_AllocationsIndex}+"does not refer back! Should be an amount of"+String:C10($_ar_ReferredAmounts{$_l_AllocationsIndex})+Char:C90(13)
					End if 
				Else 
					$_bo_IsWrong:=True:C214
					$_t_Message:=$_t_Message+Char:C90(9)+"ERROR-Referred Allocation:"+$_at_ReferredAllocations{$_l_AllocationsIndex}+"  does not exist! SHould be an amount of"+String:C10($_ar_ReferredAmounts{$_l_AllocationsIndex})+Char:C90(13)
					$_r_TotalAmountAllocated:=$_r_TotalAmountAllocated+$_ar_ReferredAmounts{$_l_AllocationsIndex}
					
				End if 
			End if 
			
		End if 
	End for 
	$_t_Message:=$_t_Message+Char:C90(9)+"Total amt allocated "+Char:C90(9)+String:C10($_r_TotalAmountAllocated)+Char:C90(9)+"Invoice total"+Char:C90(9)+String:C10([INVOICES:39]Total_Invoiced:5)+Char:C90(9)+"Total Paid"+Char:C90(9)+String:C10([INVOICES:39]Total_Paid:6)+Char:C90(9)+"Total Due"+Char:C90(9)+String:C10([INVOICES:39]Total_Due:7)+Char:C90(13)
	
	If ($_bo_IsWrong)
		
		SEND PACKET:C103($_ti_DocumentRef; $_t_Message)
		
	End if 
	NEXT RECORD:C51([INVOICES:39])
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("INV_ValidateAllocationsReport"; $_t_oldMethodName)