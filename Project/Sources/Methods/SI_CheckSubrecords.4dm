//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_CheckSubrecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2010 10:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllocationDates; 0)
	ARRAY DATE:C224($_ad_AllocationsDates; 0)
	ARRAY DATE:C224($_ad_AllocationsDates2; 0)
	ARRAY LONGINT:C221($_al_Updated; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts2; 0)
	ARRAY REAL:C219($_ar_AllocationAmountsSideA; 0)
	ARRAY REAL:C219($_ar_AllocationAmountsSideB; 0)
	ARRAY TEXT:C222($_at_AllocationsSideA; 0)
	ARRAY TEXT:C222($_at_AllocationsSideB; 0)
	ARRAY TEXT:C222($_at_AllocationsToCreate; 0)
	ARRAY TEXT:C222($_at_CreateAllocationCompanies; 0)
	ARRAY TEXT:C222($_at_CreateAllocationContacts; 0)
	ARRAY TEXT:C222($_at_CreateAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CreateLayerCodes; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers2; 0)
	ARRAY TEXT:C222($_at_MissingInvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	ARRAY TEXT:C222($_at_ReferringInvoices; 0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; $_bo_AddSubRecord; $_bo_CreateMissingAllocation; $_bo_Deletion; $_bo_EndTransaction; $_bo_FIxSideAmount; $_bo_notFound; $_bo_OK; $_bo_Reload; $_bo_ToCreate; $_bo_Valid)
	C_BOOLEAN:C305($_bo_Validate; $0)
	C_LONGINT:C283($_l_Aready; $_l_ArraySize; $_l_CountAdditions; $_l_CurrentElement; $_l_Delay; $_l_Delete; $_l_FixSideAindex; $_l_Index; $_l_Index2; $_l_InvIsUnique; $_l_LoadInvoiceIndex)
	C_LONGINT:C283($_l_LoadSubIndex; $_l_PreTryIndex; $_l_Records; $_l_Repeats; $_l_ResetIndex; $_l_SelectedRecordNumber; $_l_TestIndex; $_l_ValidElement)
	C_REAL:C285($_r_AllocationAmount; $_r_AllocationTotal; $_r_NewAllocationsAmount; $_r_TotalDue2; $_r_TotalDueToClient; $_r_totalPaid_3)
	C_TEXT:C284($_t_CorrectInvoice; $_t_FindInvoiceNumber; $_t_InvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_CheckSubrecords")

//because in so many databases we have found subrecords that dont
//cross refer and these are messing up the allocations
//this method has been created which will attempt to rectify the subrecords
//prior to doing the alloction validation
//TRACE
//AAJUNK_4

COPY NAMED SELECTION:C331([INVOICES:39]; "$Temp")
READ WRITE:C146([INVOICES:39])
READ WRITE:C146([INVOICES_ALLOCATIONS:162])
$_l_SelectedRecordNumber:=Selected record number:C246([INVOICES:39])

$_bo_OK:=False:C215
$_l_Repeats:=0
$_l_Delay:=1
Repeat 
	$_l_Repeats:=$_l_Repeats+1
	$_bo_OK:=Check_Locked(->[INVOICES:39]; 0)
	If (Not:C34($_bo_OK))
		If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
			//only increase every 10 tries
			$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			
		End if 
		DelayTicks(2*$_l_Delay)
	End if 
Until ($_bo_OK=True:C214)


If ([INVOICES:39]Invoice_Number:1#"C166") & ([INVOICES:39]Invoice_Number:1#"17804")
	
End if 

$_bo_Reload:=False:C215
QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
ARRAY REAL:C219($_ar_AllocationAmounts; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
ARRAY TEXT:C222($_at_InvoiceNumbers; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
ARRAY DATE:C224($_ad_AllocationDates; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
$_l_CurrentElement:=0
ARRAY TEXT:C222($_at_AllocationsToCreate; 0)
ARRAY TEXT:C222($_at_AllocationsSideA; 0)
ARRAY TEXT:C222($_at_AllocationsSideB; 0)
ARRAY REAL:C219($_ar_AllocationAmountsSideA; 0)
ARRAY REAL:C219($_ar_AllocationAmountsSideB; 0)
ARRAY DATE:C224($_ad_AllocationsDates; 0)
ARRAY TEXT:C222($_at_CreateAllocationCompanies; 0)
ARRAY TEXT:C222($_at_CreateAllocationContacts; 0)
ARRAY TEXT:C222($_at_PeriodCodes; 0)
ARRAY TEXT:C222($_at_CreateAnalysisCodes; 0)
ARRAY TEXT:C222($_at_CreateLayerCodes; 0)
If (Not:C34(In transaction:C397))
	StartTransaction
	$_bo_EndTransaction:=True:C214
Else 
	$_bo_EndTransaction:=False:C215
End if 
For ($_l_Index; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	
	
	If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"")
		$_bo_CreateMissingAllocation:=False:C215
		Case of 
			: ([INVOICES:39]Invoice_Number:1#"*@") & ([INVOICES:39]Total_Invoiced:5<0)
				//The invoice is a credit.
				If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*R@") & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*-R@")
					$_bo_CreateMissingAllocation:=True:C214
				End if 
				
			: ([INVOICES:39]Invoice_Number:1#"*@") & ([INVOICES:39]Total_Invoiced:5>0)
				If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*R@") & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*-R@")
					$_bo_CreateMissingAllocation:=True:C214
				End if 
			: ([INVOICES:39]Invoice_Number:1="*D@")
				If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*R@") & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"*-R@")
					$_bo_CreateMissingAllocation:=True:C214
				End if 
		End case 
		
		$_l_CurrentElement:=$_l_CurrentElement+1
		If ([INVOICES_ALLOCATIONS:162]Amount:2=0)
			//TRACE
		End if 
		$_ar_AllocationAmounts{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Amount:2
		$_ad_AllocationDates{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Date:3
		If ($_bo_CreateMissingAllocation=False:C215)
			$_at_InvoiceNumbers{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
		Else 
			SET QUERY DESTINATION:C396(3; $_l_InvIsUnique)
			If (Length:C16([INVOICES_ALLOCATIONS:162]Invoice_Number:1)<=9) & (Position:C15("*"; [INVOICES_ALLOCATIONS:162]Invoice_Number:1)=0)
				$_at_InvoiceNumbers{$_l_CurrentElement}:="*R"+[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			Else 
				$_at_InvoiceNumbers{$_l_CurrentElement}:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)  //see also Invoices_ImpR
				
			End if 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_CurrentElement})
			SET QUERY DESTINATION:C396(0)
			If ($_l_InvIsUnique#0)
				Repeat 
					$_t_FindInvoiceNumber:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)  //see also Invoices_ImpR
					
					SET QUERY DESTINATION:C396(3; $_l_InvIsUnique)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_FindInvoiceNumber)
					SET QUERY DESTINATION:C396(0)
				Until ($_l_InvIsUnique=0)
				
				$_at_InvoiceNumbers{$_l_CurrentElement}:=$_t_FindInvoiceNumber
			End if 
			
		End if 
		
		If ($_bo_CreateMissingAllocation)
			$_bo_Reload:=True:C214
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			For ($_l_ResetIndex; 1; $_l_Index)
				If ($_l_ResetIndex<$_l_Index)
					NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
				End if 
				
			End for 
			$_l_ArraySize:=Size of array:C274($_at_AllocationsToCreate)+1
			ARRAY TEXT:C222($_at_AllocationsToCreate; $_l_ArraySize)
			ARRAY TEXT:C222($_at_AllocationsSideA; $_l_ArraySize)
			ARRAY TEXT:C222($_at_AllocationsSideB; $_l_ArraySize)
			ARRAY REAL:C219($_ar_AllocationAmountsSideA; $_l_ArraySize)
			ARRAY REAL:C219($_ar_AllocationAmountsSideB; $_l_ArraySize)
			ARRAY DATE:C224($_ad_AllocationsDates; $_l_ArraySize)
			ARRAY TEXT:C222($_at_CreateAllocationCompanies; $_l_ArraySize)
			ARRAY TEXT:C222($_at_CreateAllocationContacts; $_l_ArraySize)
			
			ARRAY TEXT:C222($_at_PeriodCodes; $_l_ArraySize)
			ARRAY TEXT:C222($_at_CreateAnalysisCodes; $_l_ArraySize)
			ARRAY TEXT:C222($_at_CreateLayerCodes; $_l_ArraySize)
			$_at_CreateAllocationCompanies{$_l_ArraySize}:=[INVOICES:39]Company_Code:2
			$_at_CreateAllocationContacts{$_l_ArraySize}:=[INVOICES:39]Contact_Code:3
			$_at_PeriodCodes{$_l_ArraySize}:=[INVOICES:39]Period_Code:13
			$_at_CreateAnalysisCodes{$_l_ArraySize}:=[INVOICES:39]Analysis_Code:17
			$_at_CreateLayerCodes{$_l_ArraySize}:=[INVOICES:39]Layer_Code:38
			$_at_AllocationsToCreate{$_l_ArraySize}:=$_at_InvoiceNumbers{$_l_CurrentElement}
			$_at_AllocationsSideA{$_l_ArraySize}:=[INVOICES:39]Invoice_Number:1
			$_at_AllocationsSideB{$_l_ArraySize}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			$_ar_AllocationAmountsSideA{$_l_ArraySize}:=[INVOICES_ALLOCATIONS:162]Amount:2
			If ($_ar_AllocationAmountsSideA{$_l_ArraySize}>0)
				$_ar_AllocationAmountsSideB{$_l_ArraySize}:=-$_ar_AllocationAmountsSideA{$_l_ArraySize}
			Else 
				$_ar_AllocationAmountsSideB{$_l_ArraySize}:=Abs:C99($_ar_AllocationAmountsSideA{$_l_ArraySize})
			End if 
			[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_InvoiceNumbers{$_l_CurrentElement}
			DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
			$_ad_AllocationsDates{$_l_ArraySize}:=$_ad_AllocationDates{$_l_CurrentElement}
		End if 
	End if 
	NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
End for 
If (Size of array:C274($_at_AllocationsToCreate)>0)
	<>SI_bo_AllocationValidationDisab:=True:C214
	If (Application type:C494=4D Remote mode:K5:5)
		
		SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
	End if 
	
	DB_SaveRecord(->[INVOICES:39])
	<>SI_bo_AllocationValidationDisab:=False:C215
	If (Application type:C494=4D Remote mode:K5:5)
		
		SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
	End if 
	For ($_l_Index2; 1; Size of array:C274($_at_AllocationsToCreate))
		$_bo_ToCreate:=False:C215
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_AllocationsSideB{$_l_Index2})
		If (Records in selection:C76([INVOICES:39])=0)
			CREATE RECORD:C68([INVOICES:39])
			[INVOICES:39]Invoice_Number:1:=$_at_AllocationsSideB{$_l_Index2}
			Case of 
				: ($_at_AllocationsSideB{$_l_Index2}="*R@") | ($_at_AllocationsSideB{$_l_Index2}="*-R@")
					[INVOICES:39]State:10:=-3
				: ($_at_AllocationsSideB{$_l_Index2}="*D@") | ($_at_AllocationsSideB{$_l_Index2}="*-D@")
					[INVOICES:39]State:10:=-2
				Else 
					If (Position:C15("*"; $_at_AllocationsSideB{$_l_Index2})>0) | (Position:C15("-"; $_at_AllocationsSideB{$_l_Index2})>0)
						//TRACE
					End if 
					[INVOICES:39]State:10:=2
			End case 
			
			[INVOICES:39]Company_Code:2:=$_at_CreateAllocationCompanies{$_l_Index2}
			[INVOICES:39]Contact_Code:3:=$_at_CreateAllocationContacts{$_l_Index2}
			[INVOICES:39]Period_Code:13:=$_at_PeriodCodes{$_l_Index2}
			[INVOICES:39]Analysis_Code:17:=$_at_CreateAnalysisCodes{$_l_Index2}
			[INVOICES:39]Layer_Code:38:=$_at_CreateLayerCodes{$_l_Index2}
			<>SI_bo_AllocationValidationDisab:=True:C214
			If (Application type:C494=4D Remote mode:K5:5)
				
				SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
			End if 
			DB_SaveRecord(->[INVOICES:39])
			<>SI_bo_AllocationValidationDisab:=False:C215
			If (Application type:C494=4D Remote mode:K5:5)
				
				SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
			End if 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_AllocationsSideB{$_l_Index2})
		End if 
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		
		$_bo_FIxSideAmount:=False:C215
		
		For ($_l_Index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_AllocationsSideA{$_l_Index2}) & (([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmountsSideB{$_l_Index2}) | ([INVOICES_ALLOCATIONS:162]Amount:2=0) | ($_ar_AllocationAmountsSideB{$_l_Index2}=0))
				If ($_ar_AllocationAmountsSideB{$_l_Index2}=0)
					$_ar_AllocationAmountsSideB{$_l_Index2}:=[INVOICES_ALLOCATIONS:162]Amount:2
					If ($_ar_AllocationAmountsSideB{$_l_Index2}>0)
						$_ar_AllocationAmountsSideA{$_l_Index2}:=-$_ar_AllocationAmountsSideB{$_l_Index2}
					Else 
						$_ar_AllocationAmountsSideA{$_l_Index2}:=Abs:C99($_ar_AllocationAmountsSideB{$_l_Index2})
					End if 
					$_bo_FIxSideAmount:=True:C214
				End if 
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsToCreate{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideB{$_l_Index2}
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				
				$_bo_ToCreate:=True:C214
				$_l_Index2:=9999999
				
			End if 
			NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
		End for 
		If ($_bo_ToCreate=False:C215)
			CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
			[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
			[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
			[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
			[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsToCreate{$_l_Index2}
			[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideB{$_l_Index2}
			DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
			
			$_bo_ToCreate:=True:C214
		End if 
		If ($_bo_ToCreate)
			
			
			<>SI_bo_AllocationValidationDisab:=True:C214
			If (Application type:C494=4D Remote mode:K5:5)
				
				SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
			End if 
			
			DB_SaveRecord(->[INVOICES:39])
			<>SI_bo_AllocationValidationDisab:=False:C215
			If (Application type:C494=4D Remote mode:K5:5)
				
				SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
			End if 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_AllocationsToCreate{$_l_Index2})
			If (Records in selection:C76([INVOICES:39])=0)
				CREATE RECORD:C68([INVOICES:39])
				[INVOICES:39]Invoice_Number:1:=$_at_AllocationsToCreate{$_l_Index2}
				Case of 
					: ($_at_AllocationsToCreate{$_l_Index2}="*R@") | ($_at_AllocationsToCreate{$_l_Index2}="*-R@")
						[INVOICES:39]State:10:=-3
					: ($_at_AllocationsToCreate{$_l_Index2}="*D@") | ($_at_AllocationsToCreate{$_l_Index2}="*-D@")
						[INVOICES:39]State:10:=-2
					Else 
						[INVOICES:39]State:10:=2
				End case 
				[INVOICES:39]Company_Code:2:=$_at_CreateAllocationCompanies{$_l_Index2}
				[INVOICES:39]Contact_Code:3:=$_at_CreateAllocationContacts{$_l_Index2}
				[INVOICES:39]Period_Code:13:=$_at_PeriodCodes{$_l_Index2}
				[INVOICES:39]Analysis_Code:17:=$_at_CreateAnalysisCodes{$_l_Index2}
				[INVOICES:39]Layer_Code:38:=$_at_CreateLayerCodes{$_l_Index2}
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsSideA{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Date:3:=$_ad_AllocationsDates{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideA{$_l_Index2}
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsSideB{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Date:3:=$_ad_AllocationsDates{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideB{$_l_Index2}
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				
				<>SI_bo_AllocationValidationDisab:=True:C214
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				DB_SaveRecord(->[INVOICES:39])
				<>SI_bo_AllocationValidationDisab:=False:C215
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
			Else 
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsSideA{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Date:3:=$_ad_AllocationsDates{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideA{$_l_Index2}
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_at_AllocationsSideB{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Date:3:=$_ad_AllocationsDates{$_l_Index2}
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideB{$_l_Index2}
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				<>SI_bo_AllocationValidationDisab:=True:C214
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				DB_SaveRecord(->[INVOICES:39])
				<>SI_bo_AllocationValidationDisab:=False:C215
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				
			End if 
			
			If ($_bo_FIxSideAmount)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_AllocationsSideA{$_l_Index2})
				QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
				
				FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
				$_l_records:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
				For ($_l_FixSideAindex; 1; $_l_records)
					If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"")
						If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_AllocationsToCreate{$_l_Index2}) & ([INVOICES_ALLOCATIONS:162]Amount:2=0)
							[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmountsSideA{$_l_Index2}
							$_ar_AllocationAmounts{$_l_FixSideAindex}:=[INVOICES_ALLOCATIONS:162]Amount:2
							$_l_FixSideAindex:=$_l_records
							$_bo_FIxSideAmount:=False:C215
							DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
							
						End if 
					End if 
					NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
					
				End for 
				<>SI_bo_AllocationValidationDisab:=True:C214
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				DB_SaveRecord(->[INVOICES:39])
				<>SI_bo_AllocationValidationDisab:=False:C215
				If (Application type:C494=4D Remote mode:K5:5)
					
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				
				$_bo_Validate:=True:C214
			End if 
		Else 
			$_l_Index2:=99999999
			$_bo_Validate:=False:C215
		End if 
	End for 
	If ($_bo_EndTransaction)
		Transact_End($_bo_Validate)
	End if 
	USE NAMED SELECTION:C332("$Temp")
	
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
Else 
	USE NAMED SELECTION:C332("$Temp")
	
	GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
	If ($_bo_EndTransaction)
		Transact_End(True:C214)
	End if 
	
	
End if 

ARRAY REAL:C219($_ar_AllocationAmounts; $_l_CurrentElement)
ARRAY TEXT:C222($_at_InvoiceNumbers; $_l_CurrentElement)
ARRAY DATE:C224($_ad_AllocationDates; $_l_CurrentElement)
ARRAY LONGINT:C221($_al_Updated; $_l_CurrentElement)
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1

For ($_l_Index; 1; Size of array:C274($_at_InvoiceNumbers))
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
	Case of 
		: (Records in selection:C76([INVOICES:39])=0)
			//the invoice does not exist
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
			SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_MissingInvoiceNumbers)
			QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_MissingInvoiceNumbers)
			If (Records in selection:C76([INVOICES:39])=0)
				//nothing refers back to this invoice--do we kill the allocations!!
				//no the other side of the allocation is proably deleted so best just leave
			Else 
				//Something does refer back...does this cause a clash?
				//we either need to create the subrecord or fix the one that is there
				FIRST RECORD:C50([INVOICES:39])
				QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
				
				ARRAY REAL:C219($_ar_AllocationAmounts2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				ARRAY TEXT:C222($_at_InvoiceNumbers2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				ARRAY DATE:C224($_ad_AllocationsDates2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				ARRAY TEXT:C222($_at_ReferringInvoices; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
				$_l_CurrentElement:=0
				
				For ($_l_TestIndex; 1; Records in selection:C76([INVOICES:39]))
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
					$_l_CurrentElement:=0
					For ($_l_Index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
						If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
							$_l_CurrentElement:=$_l_CurrentElement+1
							If ($_l_CurrentElement>Size of array:C274($_ar_AllocationAmounts2))
								INSERT IN ARRAY:C227($_ar_AllocationAmounts2; Size of array:C274($_ar_AllocationAmounts2)+1; 1)
								INSERT IN ARRAY:C227($_at_InvoiceNumbers2; Size of array:C274($_at_InvoiceNumbers2)+1; 1)
								INSERT IN ARRAY:C227($_ad_AllocationsDates2; Size of array:C274($_ad_AllocationsDates2)+1; 1)
								INSERT IN ARRAY:C227($_at_ReferringInvoices; Size of array:C274($_at_ReferringInvoices)+1; 1)
							End if 
							Case of 
								: ([INVOICES:39]Invoice_Number:1="*C@") | ([INVOICES:39]Invoice_Number:1="C@") | ([INVOICES:39]Invoice_Number:1="*D@") & (False:C215)
									If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
										$_ar_AllocationAmounts2{$_l_CurrentElement}:=-[INVOICES_ALLOCATIONS:162]Amount:2
									Else 
										$_ar_AllocationAmounts2{$_l_CurrentElement}:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
									End if 
								Else 
									$_ar_AllocationAmounts2{$_l_CurrentElement}:=([INVOICES_ALLOCATIONS:162]Amount:2)
							End case 
							$_at_InvoiceNumbers2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
							$_ad_AllocationsDates2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Date:3
							$_at_ReferringInvoices{$_l_CurrentElement}:=[INVOICES:39]Invoice_Number:1
						End if 
						NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
					End for 
					NEXT RECORD:C51([INVOICES:39])
					
				End for 
				ARRAY REAL:C219($_ar_AllocationAmounts2; $_l_CurrentElement)
				ARRAY TEXT:C222($_at_InvoiceNumbers2; $_l_CurrentElement)
				ARRAY DATE:C224($_ad_AllocationsDates2; $_l_CurrentElement)
				ARRAY TEXT:C222($_at_ReferringInvoices; $_l_CurrentElement)
				$_bo_Valid:=False:C215
				$_bo_notFound:=True:C214
				$_t_CorrectInvoice:=""
				$_l_CountAdditions:=0
				$_r_NewAllocationsAmount:=0
				For ($_l_PreTryIndex; 1; Size of array:C274($_ar_AllocationAmounts2))
					Case of 
						: ($_t_InvoiceNumber="*C@") | ($_t_InvoiceNumber="C@") | ($_t_InvoiceNumber="*D@") & (False:C215)
							If ($_ar_AllocationAmounts{$_l_Index}>0)
								$_r_AllocationAmount:=-$_ar_AllocationAmounts{$_l_Index}
							Else 
								$_r_AllocationAmount:=-Abs:C99($_ar_AllocationAmounts{$_l_Index})
							End if 
						Else 
							$_r_AllocationAmount:=$_ar_AllocationAmounts{$_l_Index}
					End case 
					
					If (Find in array:C230($_at_InvoiceNumbers; $_at_ReferringInvoices{$_l_PreTryIndex})<0)
						$_l_CountAdditions:=$_l_CountAdditions+1
						$_r_NewAllocationsAmount:=$_r_NewAllocationsAmount+$_ar_AllocationAmounts2{$_l_PreTryIndex}
						If ($_ar_AllocationAmounts2{$_l_PreTryIndex}=$_r_AllocationAmount)
							//This is the one it should refer to
							If ($_t_CorrectInvoice="")
								$_t_CorrectInvoice:=$_at_ReferringInvoices{$_l_PreTryIndex}
							End if 
							
						End if 
					End if 
					
				End for 
				If ($_t_CorrectInvoice#"")
					//change the invoice this subrecord refers to
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					
					
					FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
					
					$_bo_Reload:=True:C214
					
					For ($_l_Delete; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
						If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
							[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_CorrectInvoice
							$_l_Delete:=999999999
						Else 
							NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
						End if 
					End for 
					<>SI_bo_AllocationValidationDisab:=True:C214
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					DB_SaveRecord(->[INVOICES:39])
					<>SI_bo_AllocationValidationDisab:=False:C215
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					
				Else 
					
					//all the invoices that refer back to this invoice are already accounted for so kill this subrecord
					//ONLY kill it if
					If (Abs:C99($_r_NewAllocationsAmount))>=(Abs:C99($_ar_AllocationAmounts{$_l_Index}))
						
						$_bo_Deletion:=True:C214
					End if 
					If ($_l_CountAdditions>0)  //if there are no additions..else the referal is valid just was deleted
						
						$_bo_Reload:=True:C214
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
						
						FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
						For ($_l_Delete; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
							If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
								If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[1]]="*")
									If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[2]]#"-")
										[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="*"+"-"+Substring:C12([INVOICES_ALLOCATIONS:162]Invoice_Number:1; 2; Length:C16([INVOICES_ALLOCATIONS:162]Invoice_Number:1))
									Else 
										//TRACE
									End if 
								Else 
									[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="-"+[INVOICES_ALLOCATIONS:162]Invoice_Number:1
								End if 
								DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
								
								$_l_Delete:=999999999
							Else 
								NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
							End if 
						End for 
						<>SI_bo_AllocationValidationDisab:=True:C214
						If (Application type:C494=4D Remote mode:K5:5)
							
							SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
						End if 
						DB_SaveRecord(->[INVOICES:39])
						<>SI_bo_AllocationValidationDisab:=False:C215
						If (Application type:C494=4D Remote mode:K5:5)
							
							SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
						End if 
					End if 
				End if 
			End if 
			
			
			
			
			
			
			
			
		: (Records in selection:C76([INVOICES:39])=1)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			
			ARRAY REAL:C219($_ar_AllocationAmounts2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY TEXT:C222($_at_InvoiceNumbers2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY DATE:C224($_ad_AllocationsDates2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			ARRAY TEXT:C222($_at_ReferringInvoices; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			$_l_CurrentElement:=0
			For ($_l_Index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
					$_l_CurrentElement:=$_l_CurrentElement+1
					Case of 
						: ([INVOICES:39]Invoice_Number:1="*C@") | ([INVOICES:39]Invoice_Number:1="C@") | ([INVOICES:39]Invoice_Number:1="*D@") & (False:C215)
							If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
								$_ar_AllocationAmounts2{$_l_CurrentElement}:=-[INVOICES_ALLOCATIONS:162]Amount:2
							Else 
								$_ar_AllocationAmounts2{$_l_CurrentElement}:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
							End if 
						Else 
							$_ar_AllocationAmounts2{$_l_CurrentElement}:=([INVOICES_ALLOCATIONS:162]Amount:2)
					End case 
					
					
					$_at_InvoiceNumbers2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
					$_ad_AllocationsDates2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Date:3
					$_at_ReferringInvoices{$_l_CurrentElement}:=[INVOICES:39]Invoice_Number:1
				End if 
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			ARRAY REAL:C219($_ar_AllocationAmounts2; $_l_CurrentElement)
			ARRAY TEXT:C222($_at_InvoiceNumbers2; $_l_CurrentElement)
			ARRAY DATE:C224($_ad_AllocationsDates2; $_l_CurrentElement)
			ARRAY TEXT:C222($_at_ReferringInvoices; $_l_CurrentElement)
			$_bo_Valid:=False:C215
			$_bo_notFound:=True:C214
			$_l_arraySize:=Size of array:C274($_ar_AllocationAmounts2)
			For ($_l_TestIndex; 1; $_l_arraySize)
				Case of 
					: ($_t_InvoiceNumber="*C@") | ($_t_InvoiceNumber="C@") | ($_t_InvoiceNumber="*D@") & (False:C215)
						If ($_ar_AllocationAmounts{$_l_Index}>0)
							$_r_AllocationAmount:=-$_ar_AllocationAmounts{$_l_Index}
						Else 
							$_r_AllocationAmount:=-Abs:C99($_ar_AllocationAmounts{$_l_Index})
						End if 
					Else 
						$_r_AllocationAmount:=$_ar_AllocationAmounts{$_l_Index}
				End case 
				If ($_ar_AllocationAmounts2{$_l_TestIndex}=$_r_AllocationAmount)
					
					$_l_ValidElement:=$_l_TestIndex
					$_l_TestIndex:=$_l_arraySize
					$_bo_Valid:=True:C214
				Else 
					
					$_l_ValidElement:=$_l_TestIndex
				End if 
				$_bo_notFound:=False:C215
			End for 
			If (Not:C34($_bo_Valid))
				//the invoice does not refer back at the same amount
				If ($_bo_notFound)
					//it was not referred to
					$_bo_Reload:=True:C214
					//the invoice referred to on here does exist but it does not refer back...does something else refer back
					QUERY:C277([INVOICES:39]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
					If (Records in selection:C76([INVOICES:39])=0)
						//no invoice refers to this allocation..delete the subrecord
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
						
						FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
						
						$_l_Records:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
						
						For ($_l_Delete; 1; $_l_Records)
							If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
								If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[1]]="*")
									If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[2]]#"*")
										[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="*"+"-"+Substring:C12([INVOICES_ALLOCATIONS:162]Invoice_Number:1; 2; Length:C16([INVOICES_ALLOCATIONS:162]Invoice_Number:1))
									Else 
										//TRACE
									End if 
								Else 
									[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="-"+[INVOICES_ALLOCATIONS:162]Invoice_Number:1
								End if 
								DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
								
								$_l_Delete:=$_l_Records
							Else 
								NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
							End if 
						End for 
						<>SI_bo_AllocationValidationDisab:=True:C214
						If (Application type:C494=4D Remote mode:K5:5)
							
							SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
						End if 
						DB_SaveRecord(->[INVOICES:39])
						<>SI_bo_AllocationValidationDisab:=False:C215
						If (Application type:C494=4D Remote mode:K5:5)
							
							SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
						End if 
						
					Else 
						//Something does refer back to this..check which one this should be and change this subrecord
						ARRAY REAL:C219($_ar_AllocationAmounts2; 99)
						ARRAY TEXT:C222($_at_InvoiceNumbers2; 99)
						ARRAY DATE:C224($_ad_AllocationsDates2; 99)
						ARRAY TEXT:C222($_at_ReferringInvoices; 99)
						
						$_l_CurrentElement:=0
						For ($_l_LoadInvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
							QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
							
							FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
							For ($_l_LoadSubIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
								If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
									$_l_CurrentElement:=$_l_CurrentElement+1
									If ($_l_CurrentElement>Size of array:C274($_ar_AllocationAmounts2))
										INSERT IN ARRAY:C227($_ar_AllocationAmounts2; Size of array:C274($_ar_AllocationAmounts2)+1; 99)
										INSERT IN ARRAY:C227($_at_InvoiceNumbers2; Size of array:C274($_at_InvoiceNumbers2)+1; 99)
										INSERT IN ARRAY:C227($_ad_AllocationsDates2; Size of array:C274($_ad_AllocationsDates2)+1; 99)
										INSERT IN ARRAY:C227($_at_ReferringInvoices; Size of array:C274($_at_ReferringInvoices)+1; 99)
									End if 
									Case of 
										: ([INVOICES:39]Invoice_Number:1="*C@") | ([INVOICES:39]Invoice_Number:1="C@") | ([INVOICES:39]Invoice_Number:1="*D@") & (False:C215)
											If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
												$_ar_AllocationAmounts2{$_l_CurrentElement}:=-[INVOICES_ALLOCATIONS:162]Amount:2
											Else 
												$_ar_AllocationAmounts2{$_l_CurrentElement}:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
											End if 
										Else 
											$_ar_AllocationAmounts2{$_l_CurrentElement}:=([INVOICES_ALLOCATIONS:162]Amount:2)
									End case 
									
									$_at_InvoiceNumbers2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
									$_ad_AllocationsDates2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Date:3
									$_at_ReferringInvoices{$_l_CurrentElement}:=[INVOICES:39]Invoice_Number:1
								End if 
								
								NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
								
							End for 
							
							NEXT RECORD:C51([INVOICES:39])
						End for 
						ARRAY REAL:C219($_ar_AllocationAmounts2; $_l_CurrentElement)
						ARRAY TEXT:C222($_at_InvoiceNumbers2; $_l_CurrentElement)
						ARRAY DATE:C224($_ad_AllocationsDates2; $_l_CurrentElement)
						ARRAY TEXT:C222($_at_ReferringInvoices; $_l_CurrentElement)
						
						$_t_CorrectInvoice:=""
						$_l_Aready:=0
						For ($_l_PreTryIndex; 1; Size of array:C274($_ar_AllocationAmounts2))
							If (Find in array:C230($_at_InvoiceNumbers; $_at_ReferringInvoices{$_l_PreTryIndex})<0)
								If ($_ar_AllocationAmounts2{$_l_PreTryIndex}=$_ar_AllocationAmounts{$_l_Index})
									//This is the one it should refer to
									$_t_CorrectInvoice:=$_at_ReferringInvoices{$_l_PreTryIndex}
									
								End if 
							Else 
								$_l_Aready:=$_l_Aready+1
							End if 
							
						End for 
						If ($_t_CorrectInvoice#"")
							//change the invoice this subrecord refers to
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
							QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
							
							FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
							
							$_bo_Reload:=True:C214
							$_l_Records:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
							For ($_l_Delete; 1; $_l_Records)
								If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
									[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_CorrectInvoice
									$_l_Delete:=$_l_Records
									DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
									
								Else 
									NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
								End if 
							End for 
							<>SI_bo_AllocationValidationDisab:=True:C214
							If (Application type:C494=4D Remote mode:K5:5)
								
								SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
							End if 
							DB_SaveRecord(->[INVOICES:39])
							<>SI_bo_AllocationValidationDisab:=False:C215
							If (Application type:C494=4D Remote mode:K5:5)
								
								SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
							End if 
							
							
						Else 
							$_bo_Reload:=True:C214
							
							//all the invoices that refer back to this invoice are already accounted for so kill this subrecord
							If (False:C215)
								
							Else 
								//Add the subrecord to the referring invoice--it is missing from IF that invoice has a missing allocation
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
								QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
								
								ARRAY REAL:C219($_ar_AllocationAmounts2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
								ARRAY TEXT:C222($_at_InvoiceNumbers2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
								ARRAY DATE:C224($_ad_AllocationsDates2; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
								ARRAY TEXT:C222($_at_ReferringInvoices; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
								
								FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
								$_l_CurrentElement:=0
								$_r_AllocationTotal:=0
								For ($_l_Index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
									
									$_l_CurrentElement:=$_l_CurrentElement+1
									Case of 
										: ([INVOICES:39]Invoice_Number:1="*C@") | ([INVOICES:39]Invoice_Number:1="C@") | ([INVOICES:39]Invoice_Number:1="*D@") & (False:C215)
											If ([INVOICES_ALLOCATIONS:162]Amount:2>0)
												$_ar_AllocationAmounts2{$_l_CurrentElement}:=-[INVOICES_ALLOCATIONS:162]Amount:2
											Else 
												$_ar_AllocationAmounts2{$_l_CurrentElement}:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
											End if 
										Else 
											$_ar_AllocationAmounts2{$_l_CurrentElement}:=([INVOICES_ALLOCATIONS:162]Amount:2)
									End case 
									
									$_r_AllocationTotal:=$_r_AllocationTotal+$_ar_AllocationAmounts2{$_l_CurrentElement}
									$_at_InvoiceNumbers2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
									$_ad_AllocationsDates2{$_l_CurrentElement}:=[INVOICES_ALLOCATIONS:162]Date:3
									$_at_ReferringInvoices{$_l_CurrentElement}:=[INVOICES:39]Invoice_Number:1
									
									NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
								End for 
								ARRAY REAL:C219($_ar_AllocationAmounts2; $_l_CurrentElement)
								ARRAY TEXT:C222($_at_InvoiceNumbers2; $_l_CurrentElement)
								ARRAY DATE:C224($_ad_AllocationsDates2; $_l_CurrentElement)
								ARRAY TEXT:C222($_at_ReferringInvoices; $_l_CurrentElement)
								//`````
								$_r_TotalDue2:=[INVOICES:39]Total_Invoiced:5-$_r_AllocationTotal
								$_r_totalPaid_3:=$_r_AllocationTotal
								$_bo_AddSubRecord:=True:C214
								Case of 
									: ([INVOICES:39]Total_Invoiced:5>0)
										Case of 
											: ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
												If ([INVOICES:39]State:10#-1)
													$_r_AllocationTotal:=Gen_Round(($_r_AllocationTotal); 2; 2)
													$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_AllocationTotal); 2; 2)
													//[INVOICES]Total Paid:=$_r_AllocationTotal
												Else 
													If ($_r_totalPaid_3#0)
														$_r_AllocationTotal:=Gen_Round(($_r_AllocationTotal); 2; 2)
														$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_AllocationTotal); 2; 2)
													Else 
														
														$_r_TotalDue2:=0
														
														//something was paid cannot be a real proforma
														
													End if 
												End if 
												
											Else 
												$_r_AllocationTotal:=Gen_Round(($_r_AllocationTotal); 2; 2)
												$_r_TotalDue2:=[INVOICES:39]Total_Due:7
										End case 
										If ($_r_TotalDue2<=0)
											$_bo_AddSubRecord:=False:C215
										End if 
									: ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))=0)
										If ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
											If ($_r_AllocationTotal<0)
												$_r_TotalDue2:=(Abs:C99([INVOICES:39]Total_Invoiced:5))-(Abs:C99($_r_AllocationTotal))
											Else 
												$_r_TotalDue2:=([INVOICES:39]Total_Invoiced:5)-($_r_AllocationTotal)
											End if 
											
										Else 
											$_r_AllocationTotal:=Gen_Round(($_r_AllocationTotal); 2; 2)
											$_r_TotalDue2:=[INVOICES:39]Total_Due:7
										End if 
										If ($_r_TotalDue2>=0)
											$_bo_AddSubRecord:=False:C215
										End if 
									Else 
										If ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))>0)
											If ([INVOICES:39]Invoice_Number:1="*D@") | ([INVOICES:39]Invoice_Number:1="*-D@")
												If ($_r_AllocationTotal#0)
													If ($_r_AllocationTotal<0)
														$_r_AllocationTotal:=Abs:C99($_r_AllocationTotal)
														$_r_totalPaid_3:=$_r_AllocationTotal
													Else 
														$_r_AllocationTotal:=-($_r_AllocationTotal)
														$_r_totalPaid_3:=$_r_AllocationTotal
														
													End if 
													$_r_TotalDueToClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_AllocationTotal); 2; 2)
													If ($_r_TotalDueToClient>0)
														$_r_TotalDue2:=-$_r_TotalDueToClient
														If ($_r_TotalDue2<=0)
															$_bo_AddSubRecord:=False:C215
														End if 
													Else 
														$_r_TotalDue2:=Abs:C99($_r_TotalDueToClient)
														If ($_r_TotalDue2>=0)
															$_bo_AddSubRecord:=False:C215
														End if 
													End if 
													
												Else 
													$_r_TotalDueToClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_AllocationTotal); 2; 2)
													If ($_r_TotalDueToClient>0)
														$_r_TotalDue2:=-$_r_TotalDueToClient
														If ($_r_TotalDue2<=0)
															$_bo_AddSubRecord:=False:C215
														End if 
													Else 
														$_r_TotalDue2:=Abs:C99($_r_TotalDueToClient)
														If ($_r_TotalDue2>=0)
															$_bo_AddSubRecord:=False:C215
														End if 
														
													End if 
													
												End if 
												
											Else 
												$_r_AllocationTotal:=Gen_Round(($_r_AllocationTotal); 2; 2)
												$_r_TotalDue2:=0
												
												$_bo_AddSubRecord:=False:C215
												
												
											End if 
											
										End if 
										
										
								End case 
								If ($_bo_AddSubRecord)
									//add subrecord to that invoice
									CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
									[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
									[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
									[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
									[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmounts{$_l_Index}
									[INVOICES_ALLOCATIONS:162]Date:3:=$_ad_AllocationDates{$_l_Index}
									[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumber
									<>SI_bo_AllocationValidationDisab:=True:C214
									If (Application type:C494=4D Remote mode:K5:5)
										
										SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
									End if 
									DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
									DB_SaveRecord(->[INVOICES:39])
									<>SI_bo_AllocationValidationDisab:=False:C215
									If (Application type:C494=4D Remote mode:K5:5)
										
										SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
									End if 
								Else 
									
									//delete subrecord from the referring one
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
									QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
									FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
									$_l_Records:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
									For ($_l_Delete; 1; $_l_Records)
										If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
											If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[1]]="*")
												If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1[[2]]#"-")
													[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="*"+"-"+Substring:C12([INVOICES_ALLOCATIONS:162]Invoice_Number:1; 2; Length:C16([INVOICES_ALLOCATIONS:162]Invoice_Number:1))
												Else 
													//TRACE
												End if 
											Else 
												[INVOICES_ALLOCATIONS:162]Invoice_Number:1:="-"+[INVOICES_ALLOCATIONS:162]Invoice_Number:1
											End if 
											DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
											
											$_l_Delete:=$_l_Records
										Else 
											NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
										End if 
									End for 
									<>SI_bo_AllocationValidationDisab:=True:C214
									If (Application type:C494=4D Remote mode:K5:5)
										
										SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
									End if 
									DB_SaveRecord(->[INVOICES:39])
									<>SI_bo_AllocationValidationDisab:=False:C215
									If (Application type:C494=4D Remote mode:K5:5)
										
										SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
									End if 
								End if 
								
							End if 
							
						End if 
						
					End if 
				Else 
					
					//it was referred to but at a different amount
					//make both the subrecords say the same amount
					$_bo_Reload:=True:C214
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
					//READ WRITE([INVOICES_ALLOCATIONS])
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
					FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
					
					
					$_l_Records:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
					For ($_l_Delete; 1; $_l_Records)
						If ([INVOICES_ALLOCATIONS:162]Amount:2=$_ar_AllocationAmounts{$_l_Index}) & ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
							[INVOICES_ALLOCATIONS:162]Amount:2:=$_ar_AllocationAmounts2{$_l_ValidElement}
							DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
							
							$_l_Delete:=$_l_Records
						Else 
							NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
						End if 
					End for 
					UNLOAD RECORD:C212([INVOICES_ALLOCATIONS:162])
					//READ ONLY([INVOICES_ALLOCATIONS])
					
					<>SI_bo_AllocationValidationDisab:=True:C214
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					DB_SaveRecord(->[INVOICES:39])
					<>SI_bo_AllocationValidationDisab:=False:C215
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					
				End if 
				
			End if 
		Else 
			//TRACE
	End case 
	
End for 
UNLOAD RECORD:C212([INVOICES:39])
UNLOAD RECORD:C212([INVOICES_ALLOCATIONS:162])

USE NAMED SELECTION:C332("$Temp")

GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
$0:=False:C215
If ($_bo_Reload)
	READ WRITE:C146([XInvoiceAllocation:126])
	INV_GetAllocations([INVOICES:39]Invoice_Number:1)
	DELETE SELECTION:C66([XInvoiceAllocation:126])
	$0:=True:C214
End if 
USE NAMED SELECTION:C332("$Temp")

GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_SelectedRecordNumber)
ERR_MethodTrackerReturn("SI_CheckSubrecords"; $_t_oldMethodName)