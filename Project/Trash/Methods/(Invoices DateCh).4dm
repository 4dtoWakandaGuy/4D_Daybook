//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices DateCh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 20:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld)
	C_DATE:C307($_d_InvoiceDate)
	C_LONGINT:C283($_l_AllocationIndex)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices DateCh")
CREATE SET:C116([INVOICES:39]; "Master")
While (Records in set:C195("Master")>0)
	FIRST RECORD:C50([INVOICES:39])
	ONE RECORD SELECT:C189([INVOICES:39])
	CREATE SET:C116([INVOICES:39]; "Extra")
	DIFFERENCE:C122("Master"; "Extra"; "Master")
	$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
	$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
	CREATE EMPTY SET:C140([XInvoiceAllocation:126]; "RelatedAllocations")
	$_bo_UseOld:=False:C215
	If ($_bo_UseOld)
		
		
	Else 
		INV_GetAllocations($_t_InvoiceNumber)
		CREATE SET:C116([XInvoiceAllocation:126]; "RelatedAllocations")
		//and get the related records
		CREATE EMPTY SET:C140([INVOICES:39]; "Extra")
		For ($_l_AllocationIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
			Case of 
				: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumber)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xInvoiceNumber:2)
				: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#$_t_InvoiceNumber)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xCreditNumber:3)
				: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#$_t_InvoiceNumber)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xReceiptNumber:4)
				: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#$_t_InvoiceNumber)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xDepositNumber:5)
					
			End case 
			If (Records in selection:C76([INVOICES:39])>0)
				ADD TO SET:C119([INVOICES:39]; "Extra")
			End if 
			NEXT RECORD:C51([XInvoiceAllocation:126])
		End for 
		USE SET:C118("Extra")
		CLEAR SET:C117("Extra")
		
	End if 
	FIRST RECORD:C50([INVOICES:39])
	While (Not:C34(End selection:C36([INVOICES:39])))
		If ($_bo_UseOld)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			
			QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
			If ((Records in selection:C76([INVOICES_ALLOCATIONS:162])>0) & ([INVOICES_ALLOCATIONS:162]Date:3#$_d_InvoiceDate))
				[INVOICES_ALLOCATIONS:162]Date:3:=$_d_InvoiceDate
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				
			Else 
				INV_GetAllocations([INVOICES_ALLOCATIONS:162]Invoice_Number:1)
				CREATE SET:C116([XInvoiceAllocation:126]; "RelatedAllocations2")
				INTERSECTION:C121("RelatedAllocations2"; "RelatedAllocations"; "RelatedAllocations2")
				USE SET:C118("RelatedAllocations2")
				CLEAR SET:C117("RelatedAllocations2")
			End if 
			DB_SaveRecord(->[INVOICES:39])
		End if 
		NEXT RECORD:C51([INVOICES:39])
	End while 
	CLEAR SET:C117("RelatedAllocations")
	USE SET:C118("Master")
End while 
ERR_MethodTrackerReturn("Invoices DateCh"; $_t_oldMethodName)