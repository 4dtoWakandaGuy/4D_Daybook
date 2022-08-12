//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_CreditAllocationFix
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
	ARRAY DATE:C224($_ad_AllocationDates; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY TEXT:C222($_at_AllocationInvoices; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab)
	C_DATE:C307($_d_InvoiceDate)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CharacterPosition; $_l_Index; $_l_RecordsToCheck)
	C_REAL:C285($_r_TotalDue; $_r_TotalPaid)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_CreditAllocationFix")
//This method is to correct an problem with old credits
//There are some on the system where the sub records are a plus figure
//and the amount paid is a -figure


If (Count parameters:C259=0)
	SI_SubrecordMismatchFIX
	READ WRITE:C146([INVOICES:39])
	READ WRITE:C146([XInvoiceAllocation:126])
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1#"*")
	CREATE SET:C116([INVOICES:39]; "S1")
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Amount:2>0)
	SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumbers)
	QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5<0)
	CREATE SET:C116([INVOICES:39]; "S2")
	
	INTERSECTION:C121("S1"; "S2"; "S2")
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Amount:2<0)
	SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumbers)
	QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
	
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Invoiced:5>0)
	CREATE SET:C116([INVOICES:39]; "S3")
	INTERSECTION:C121("S1"; "S3"; "S3")
	UNION:C120("S2"; "S3"; "S2")
	USE SET:C118("S2")
	
	CREATE SET:C116([INVOICES:39]; "ToFix")
	$_l_RecordsToCheck:=Records in selection:C76([INVOICES:39])
Else 
	If (Records in selection:C76([INVOICES:39])#1) | ([INVOICES:39]Invoice_Number:1#$1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
	End if 
	
	CREATE SET:C116([INVOICES:39]; "ToFix")
	$_l_RecordsToCheck:=Records in selection:C76([INVOICES:39])
End if 

For ($_l_Index; 1; $_l_RecordsToCheck)
	READ WRITE:C146([INVOICES:39])
	READ WRITE:C146([XInvoiceAllocation:126])
	USE SET:C118("ToFix")
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
	//MESSAGE(String($_l_Index))
	LOAD RECORD:C52([INVOICES:39])
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	
	$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
	$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
	$_l_CharacterPosition:=Position:C15("*"; [INVOICES:39]Invoice_Number:1)
	Case of 
		: ([INVOICES:39]Total_Invoiced:5<0) & ($_r_TotalPaid>0)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			ARRAY REAL:C219($_ar_AllocationAmounts; 0)
			ARRAY DATE:C224($_ad_AllocationDates; 0)
			ARRAY TEXT:C222($_at_AllocationInvoices; 0)
			ARRAY REAL:C219($_ar_AllocationAmounts; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY DATE:C224($_ad_AllocationDates; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY TEXT:C222($_at_AllocationInvoices; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			
			For ($_l_AllocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				$_ad_AllocationDates{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Date:3
				$_at_AllocationInvoices{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1; *)
				Case of 
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="C@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						If (Records in selection:C76([XInvoiceAllocation:126])=0)
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCrossCreditNumber:12=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						End if 
						
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="*D@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
					Else 
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						If (Records in selection:C76([XInvoiceAllocation:126])=0)
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCrossCreditNumber:12=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
							End if 
						End if 
				End case 
				
				If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
					[INVOICES_ALLOCATIONS:162]Amount:2:=-[INVOICES_ALLOCATIONS:162]Amount:2
				Else 
					[INVOICES_ALLOCATIONS:162]Amount:2:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
				End if 
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
			$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
			[INVOICES:39]Invoice_Date:4:=!00-00-00!
			SAVE RECORD:C53([INVOICES:39])
			[INVOICES:39]Invoice_Date:4:=$_d_InvoiceDate
			SAVE RECORD:C53([INVOICES:39])
			USE SET:C118("ToFix")
			If (Records in selection:C76([XInvoiceAllocation:126])>0)
				//TRACE
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
			GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
			SI_AllocationValidation([INVOICES:39]Invoice_Number:1; True:C214)
			SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; False:C215)
			USE SET:C118("ToFix")
			GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
			LOAD RECORD:C52([INVOICES:39])
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
			$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
		: ([INVOICES:39]Total_Invoiced:5>0) & ($_r_TotalPaid<0)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			ARRAY REAL:C219($_ar_AllocationAmounts; 0)
			ARRAY DATE:C224($_ad_AllocationDates; 0)
			ARRAY TEXT:C222($_at_AllocationInvoices; 0)
			ARRAY REAL:C219($_ar_AllocationAmounts; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY DATE:C224($_ad_AllocationDates; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY TEXT:C222($_at_AllocationInvoices; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			
			For ($_l_AllocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				$_ad_AllocationDates{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Date:3
				$_at_AllocationInvoices{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
				Case of 
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="C@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						If (Records in selection:C76([XInvoiceAllocation:126])=0)
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						End if 
						
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
					: ([INVOICES_ALLOCATIONS:162]Invoice_Number:1="*D@")
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
					Else 
						QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
						If (Records in selection:C76([XInvoiceAllocation:126])=0)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES_ALLOCATIONS:162]Invoice_Number:1)
								
							End if 
						End if 
						
				End case 
				
				If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
					[INVOICES_ALLOCATIONS:162]Amount:2:=-[INVOICES_ALLOCATIONS:162]Amount:2
				Else 
					[INVOICES_ALLOCATIONS:162]Amount:2:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
				End if 
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			LAST RECORD:C200([INVOICES_ALLOCATIONS:162])
			
			$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
			[INVOICES:39]Invoice_Date:4:=!00-00-00!
			
			SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
			SAVE RECORD:C53([INVOICES:39])
			[INVOICES:39]Invoice_Date:4:=$_d_InvoiceDate
			SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
			SAVE RECORD:C53([INVOICES:39])
			If (Records in selection:C76([XInvoiceAllocation:126])>0)
				//TRACE
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
			
			SI_AllocationValidation([INVOICES:39]Invoice_Number:1; True:C214)
			SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; False:C215)
			USE SET:C118("ToFix")
			GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
			LOAD RECORD:C52([INVOICES:39])
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
			$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
			
	End case 
	
	UNLOAD RECORD:C212([INVOICES:39])
	
	
End for 
ERR_MethodTrackerReturn("SI_CreditAllocationFix"; $_t_oldMethodName)
