//%attributes = {}
If (False:C215)
	//Project Method Name:      InvoiceItems_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>INV_bo_ITEMSUSESET; $_bo_DisplayRecords; $_bo_EVTAutoFInd; $_bo_INVAutoFind; INV_bo_UseSet)
	C_LONGINT:C283(vIn)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_EventCodeFind; $_t_INVOICESCodeFind; $_t_oldMethodName; $_t_ProcessName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvoiceItems_Mod")
$_bo_DisplayRecords:=False:C215
If (Count parameters:C259=0)
	//here called from a menu OR form Zproc or Zproc_WithReply
	$_t_ProcessName:=Process_Name(Current process:C322)
	If ($_t_ProcessName#Term_SLPLWT("View Ledger Items"))
		
		InvoiceItems_Mod("StartProcess")
	Else 
		//we are in the process started by zProd or ZprocwithReply
		$_bo_DisplayRecords:=True:C214
	End if 
Else 
	If (Count parameters:C259=1)
		//recall from the menu call
		ZProc("InvoiceItems_Mod"; DB_ProcessMemoryinit(3); Term_SLPLWT("View Ledger Items"))
	Else 
		//called from anywhere else
		If (Count parameters:C259>=3)
			$3->:=ZProc_withReply("InvoiceItems_Mod"; DB_ProcessMemoryinit(3); Term_SLPLWT("View Ledger Items"); $1; $2)
		Else 
			ZProc("InvoiceItems_Mod"; DB_ProcessMemoryinit(3); Term_SLPLWT("View Ledger Items"))
		End if 
	End if 
	
End if 
If ($_bo_DisplayRecords)
	
	READ ONLY:C145([TRANSACTION_TYPES:31])
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
	If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
		If (Count parameters:C259>=2)
			$_bo_EVTAutoFInd:=($2="TRUE")
			$_t_EventCodeFind:=$1
		End if 
		INV_bo_UseSet:=False:C215
		If (<>INV_bo_ITEMSUSESET)
			USE SET:C118("◊RelatedInvoiceItems")
			CLEAR SET:C117("◊RelatedInvoiceItems")
			<>INV_bo_ITEMSUSESET:=False:C215
			INV_bo_UseSet:=True:C214
			CREATE SET:C116([INVOICES_ITEMS:161]; "InvoiceItemsSelection")
			Gen_Mod(Term_SLPLWT("View Sales Ledger items"); "Table_Setup"; "IMaster"; ->[INVOICES_ITEMS:161]; ->vIn; ""; Term_SLPLWT("Sales Ledger Items"); $_bo_EVTAutoFInd; $_t_EventCodeFind)
		Else 
			Gen_Mod(Term_SLPLWT("View Sales Ledger items"); "Table_Setup"; "IMaster"; ->[INVOICES_ITEMS:161]; ->vIn; "InvoiceItems_Sel"; Term_SLPLWT("Sales Ledger Items"); $_bo_EVTAutoFInd; $_t_EventCodeFind)
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
	
	
End if 
ERR_MethodTrackerReturn("InvoiceItems_Mod"; $_t_oldMethodName)