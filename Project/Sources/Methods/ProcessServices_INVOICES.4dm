//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessServices_INVOICES
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/06/2010 21:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; $0)
	C_DATE:C307($_d_ClearedDate; $_d_TaxPointDate)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName; $_t_ServiceType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_INVOICES")
//ProcessService_INVOICES
// 29/5/2003 NG
// Runs various methods called from trigger


Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="AllocValidate")
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="CheckAllocationDate")
		READ WRITE:C146([XInvoiceAllocation:126])
		QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([XInvoiceAllocation:126])>0)
			$_d_TaxPointDate:=[XInvoiceAllocation:126]xTaxPointDate:8
			SI_SetTaxPoint
			If ($_d_TaxPointDate#[XInvoiceAllocation:126]xTaxPointDate:8)
				DB_SaveRecord(->[XInvoiceAllocation:126])
			End if 
			READ WRITE:C146([INVOICES:39])
			If ([XInvoiceAllocation:126]xCreditNumber:3#"")
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xCreditNumber:3)
				If (Records in selection:C76([INVOICES:39])>0)
					$_d_ClearedDate:=[INVOICES:39]X_invoiceClearedDate:43
					[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
					If ([INVOICES:39]X_invoiceClearedDate:43#$_d_ClearedDate)
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
					UNLOAD RECORD:C212([INVOICES:39])
					QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
					
				Else 
					[XInvoiceAllocation:126]xCreditNumber:3:=""
					DB_SaveRecord(->[XInvoiceAllocation:126])
				End if 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				
			End if 
			If ([XInvoiceAllocation:126]xCrossCreditNumber:12#"")
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xCrossCreditNumber:12)
				$_d_ClearedDate:=[INVOICES:39]X_invoiceClearedDate:43
				[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
				If ([INVOICES:39]X_invoiceClearedDate:43#$_d_ClearedDate)
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
				UNLOAD RECORD:C212([INVOICES:39])
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				
			End if 
			If ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xInvoiceNumber:2)
				$_d_ClearedDate:=[INVOICES:39]X_invoiceClearedDate:43
				[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
				If ([INVOICES:39]X_invoiceClearedDate:43#$_d_ClearedDate)
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
				UNLOAD RECORD:C212([INVOICES:39])
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				
			End if 
			If ([XInvoiceAllocation:126]xCrossInvoiceNumber:11#"")
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xCrossInvoiceNumber:11)
				$_d_ClearedDate:=[INVOICES:39]X_invoiceClearedDate:43
				[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
				If ([INVOICES:39]X_invoiceClearedDate:43#$_d_ClearedDate)
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
				UNLOAD RECORD:C212([INVOICES:39])
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
				
			End if 
			UNLOAD RECORD:C212([XInvoiceAllocation:126])
		End if 
		READ ONLY:C145([XInvoiceAllocation:126])
		
		$0:=True:C214
	Else 
		If ([PROCESSES_TO_HANDLE:115]ServiceType:6#"")
			If ([PROCESSES_TO_HANDLE:115]ServiceType:6[[1]]="•")
				$_t_InvoiceNumber:=Substring:C12([PROCESSES_TO_HANDLE:115]ServiceType:6; 2; Length:C16([PROCESSES_TO_HANDLE:115]ServiceType:6))
				//Put the cleared date on the record
				If ($_t_InvoiceNumber#"")
					READ WRITE:C146([INVOICES:39])
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
					If (Records in selection:C76([INVOICES:39])=0)
						[PROCESSES_TO_HANDLE:115]Comments:3:="Invoice record not found."
						[PROCESSES_TO_HANDLE:115]Status:2:=3
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
						$0:=True:C214
					Else 
						<>SI_bo_AllocationValidationDisab:=True:C214
						$_d_ClearedDate:=[INVOICES:39]X_invoiceClearedDate:43
						[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
						If ([INVOICES:39]X_invoiceClearedDate:43#$_d_ClearedDate)
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
						UNLOAD RECORD:C212([INVOICES:39])
						USE NAMED SELECTION:C332("Current")
						$0:=True:C214
						<>SI_bo_AllocationValidationDisab:=False:C215
					End if 
					READ ONLY:C145([INVOICES:39])
				Else 
					$0:=True:C214
				End if 
			Else 
				//NG may 2004 The invoices table does not have an ID field(numeric)
				//and I dont want to implement that as part of a 'quick fix' so here we are going
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[PROCESSES_TO_HANDLE:115]ServiceType:6)
				$_t_ServiceType:=[PROCESSES_TO_HANDLE:115]ServiceType:6
				If (Records in selection:C76([INVOICES:39])=0)
					[PROCESSES_TO_HANDLE:115]Comments:3:="Invoice record not found."
					[PROCESSES_TO_HANDLE:115]Status:2:=3
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
					$0:=True:C214
				Else 
					$_t_ServiceType:=[PROCESSES_TO_HANDLE:115]ServiceType:6
					SI_AllocationValidation
					READ WRITE:C146([INVOICES:39])
					<>SI_bo_AllocationValidationDisab:=True:C214
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ServiceType)
					LOAD RECORD:C52([INVOICES:39])
					INV_CheckRemainder
					[INVOICES:39]X_invoiceClearedDate:43:=INV_CalcClearedDate
					<>SI_bo_AllocationValidationDisab:=True:C214
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					
					DB_SaveRecord(->[INVOICES:39])
					<>SI_bo_AllocationValidationDisab:=False:C215
					If (Application type:C494=4D Remote mode:K5:5)
						
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					UNLOAD RECORD:C212([INVOICES:39])
					<>SI_bo_AllocationValidationDisab:=False:C215
					
					$0:=True:C214
					
				End if 
			End if 
		Else 
			$0:=True:C214
			
		End if 
		
End case 
UNLOAD RECORD:C212([ORDERS:24])
UNLOAD RECORD:C212([PERIODS:33])
UNLOAD RECORD:C212([ACCOUNTS:32])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
ERR_MethodTrackerReturn("ProcessServices_INVOICES"; $_t_oldMethodName)
