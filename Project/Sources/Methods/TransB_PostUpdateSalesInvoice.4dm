//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_PostUpdateSalesInvoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; vHideMessages)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_InvoiceDate; $8)
	C_LONGINT:C283($_l_Add; $_l_IsUnique; $1)
	C_REAL:C285($_r_DebitTotal; $7)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_InvoiceNumber; $_t_InvoiceNumberP; $_t_oldMethodName; $10; $11; $12; $13; $14; $15)
	C_TEXT:C284($2; $3; $4; $5; $6; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_PostUpdateSalesInvoice")
$_l_Add:=$1
If (Application type:C494#4D Server:K5:6)
	vHideMessages:=False:C215
Else 
	vHideMessages:=True:C214
End if 
If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$6)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$6)
End if 
If ($2#"")
	If (($3=DB_GetLedgerTRANSRECpost) & ($4#"") & ($_l_Add=1) & (OK=1))
		READ WRITE:C146([INVOICES:39])
		If ([INVOICES:39]Invoice_Number:1#$2)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$2; *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Company_Code:2=$4)
		Else 
		End if 
		If (Records in selection:C76([INVOICES:39])>0)
			If (Check_LockMess(->[INVOICES:39]; "Sales Ledger Item"))
				If (vHideMessages=False:C215)  //added 20/03/07 -kmw
					MESSAGE:C88(Char:C90(13)+"      Allocating to Invoice "+[INVOICES:39]Invoice_Number:1)
				End if 
				
				Repeat 
					$_t_InvoiceNumber:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)
					SET QUERY DESTINATION:C396(3; $_l_IsUnique)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
					SET QUERY DESTINATION:C396(0)
				Until ($_l_IsUnique=0)
				$_t_InvoiceNumberP:=[INVOICES:39]Invoice_Number:1
				$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
				$_t_CompanyCode:=[INVOICES:39]Company_Code:2
				$_t_ContactCode:=[INVOICES:39]Contact_Code:3
				If (($15="Reversal@") & ($5#[TRANSACTION_TYPES:31]Debit_Account:4))
					$_r_DebitTotal:=Gen_Round((0-$7); 2; 2)
				Else 
					$_r_DebitTotal:=$7
				End if 
				[INVOICES:39]Total_Paid:6:=Gen_Round(([INVOICES:39]Total_Paid:6+$_r_DebitTotal); 2; 2)
				[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumber
				[INVOICES_ALLOCATIONS:162]Date:3:=$8
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_r_DebitTotal
				<>SI_bo_AllocationValidationDisab:=True:C214
				If (Application type:C494=4D Remote mode:K5:5)
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
				DB_SaveRecord(->[INVOICES:39])
				//Create Payment record
				<>SI_bo_AllocationValidationDisab:=False:C215
				If (Application type:C494=4D Remote mode:K5:5)
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
				End if 
				INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_InvoiceNumber; $8; $_r_DebitTotal; ""; $9)
				CREATE RECORD:C68([INVOICES:39])
				[INVOICES:39]Invoice_Number:1:=$_t_InvoiceNumber
				[INVOICES:39]State:10:=-3
				[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
				[INVOICES:39]Invoice_Date:4:=$8
				[INVOICES:39]Period_Code:13:=$9
				[INVOICES:39]Company_Code:2:=$_t_CompanyCode
				[INVOICES:39]Contact_Code:3:=$_t_ContactCode
				[INVOICES:39]Debtors_Account:15:=$10
				[INVOICES:39]Bank_Account:16:=$5
				[INVOICES:39]Comments:12:="Receipt Posting"+Char:C90(13)+"Cheque No: "+$11
				[INVOICES:39]Total_Paid:6:=$_r_DebitTotal
				[INVOICES:39]Total_Due:7:=0
				[INVOICES:39]Analysis_Code:17:=$12
				[INVOICES:39]Currency_Code:27:=$13
				[INVOICES:39]Layer_Code:38:=$14
				CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
				[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
				[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumberP
				[INVOICES_ALLOCATIONS:162]Date:3:=$_d_InvoiceDate
				[INVOICES_ALLOCATIONS:162]Amount:2:=$_r_DebitTotal
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
				INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_InvoiceNumberP; $8; $_r_DebitTotal; ""; $9)
				
			End if 
		End if 
		UNLOAD RECORD:C212([INVOICES:39])
		READ ONLY:C145([INVOICES:39])
	End if 
End if 
ERR_MethodTrackerReturn("TransB_PostUpdateSalesInvoice"; $_t_oldMethodName)
