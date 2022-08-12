//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuNewRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       26/08/2010 17:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>OneEntry; <>StatesLoaded; $_bo_BatchedEntry; $DB_bo_RecordsinNewProcess; DB_bo_InRecord; DB_bo_InRecordListing; DB_bo_ReadyForParameters; DB_bo_RecordsinNewProcess; SD_bo_Contnue)
	C_LONGINT:C283($_l_CallBackProcess; $_l_CurrentDisplayedForm; $_l_EntryPoint; $_l_Index; $_l_LastTableNumber; $_l_NewRecordTable; $_l_offset; $_l_Offsets; $_l_ParentProcess; $_l_Process; $_l_TableNumber)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; INV_l_AssignedrecordID; INV_l_AssignedTable; SD_l_EntryPoint; SD_l_ParentProcess)
	C_POINTER:C301($2; $3; $4; $5; $6; $7; $8; $9)
	C_REAL:C285(INV_R_Depositmaxamt)
	C_TEXT:C284($_t_CallingCompanyCode; $_t_CallingContactCode; $_t_Context; $_t_InputFormName; $_t_MenuBarReference; $_t_MenuItemParameter; $_t_oldMethodName; $_t_TableName; $_t_TableName2; $1; INV_t_RecordCode)
	C_TEXT:C284(SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuNewRecord")


$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_t_MenuBarReference:=Get menu bar reference:C979
$_l_NewRecordTable:=Num:C11($_t_MenuItemParameter)
$_t_Context:=""
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If ($_l_NewRecordTable>10000)
	//This section here for handling calls direct from the menu
	//where we want to use a context, the table number is added to by 10000 for each context
	//the context has to be interpreted here
	$_l_offset:=$_l_NewRecordTable
	$_l_Offsets:=0
	Repeat 
		$_l_Offsets:=$_l_Offsets+1
		$_l_NewRecordTable:=$_l_NewRecordTable-10000
	Until ($_l_NewRecordTable<1000)
	Case of 
		: ($_l_NewRecordTable=Table:C252(->[ORDERS:24]))
			//no offset means new order
			Case of 
				: ($_l_Offsets=1)  //Enquiry
					
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{1}
					End if 
				: ($_l_Offsets=2)  //quotation
					
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{2}
					End if 
			End case 
		: ($_l_NewRecordTable=Table:C252(->[PURCHASE_INVOICES:37]))
			//no offset means PI
			Case of 
				: ($_l_Offsets=1)  //Credit note
					
					$_t_Context:="CreditNote"
				: ($_l_Offsets=2)  //prepayment
					
					$_t_Context:="Prepayment"
			End case 
		: ($_l_NewRecordTable=Table:C252(->[INVOICES:39]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					
					$_t_Context:="Credit Note"
				: ($_l_Offsets=2)  //deposit
					
					$_t_Context:="Deposit"
			End case 
		: ($_l_NewRecordTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					
					$_t_Context:="Assembly"
				: ($_l_Offsets=2)  //deposit
					
					$_t_Context:="Dissasembly"
			End case 
	End case 
	
	
End if 
If ($_l_NewRecordTable=0)  //``
	
	$_t_TableName:=$_t_MenuItemParameter
	
	
	Case of 
		: ($_t_TableName="OrdersTimeCosts")  //Replacing ZJobs_TCIn- not set the code for this yet
			
		: ($_t_TableName="OrdersEnquiry") | ($_t_TableName="OrdersEnquiries")
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			
			$_t_Context:="Enquiry"
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_Context:=<>SYS_at_RecStateCodes{24}{1}
			End if 
		: ($_t_TableName="OrdersQuotation") | ($_t_TableName="OrdersQuotations")
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="Quotation"
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_Context:=<>SYS_at_RecStateCodes{24}{2}
			End if 
		: ($_t_TableName="PurchasesPrePayment")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="PrePayment"
		: ($_t_TableName="PurchasesCreditNote") | ($_t_TableName="PurchasesCredit")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="CreditNote"
		: ($_t_TableName="PurchasesPayment")
			$_t_TableName:=Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))
			$_t_Context:="Payment"
		: ($_t_TableName="StockMovementsAssembly")
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40]))
			
			$_t_Context:="Assembly"
		: ($_t_TableName="StockMovementsDissasembly")
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40]))
			$_t_Context:="Disassembly"
		: ($_t_TableName="InvoicesDepRefund")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="DepositRefund"
		: ($_t_TableName="InvoicesProforma")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="ProForma"
		: ($_t_TableName="InvoicesCreditNote")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="CreditNote"
		: ($_t_TableName="InvoicesDeposit")  //replicating Invoices_InP
			
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Deposit"
		: ($_t_TableName="InvoicesReceipt")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="Receipt"
		: ($_t_TableName="InvoicesReceiptRefund")
			$_t_TableName:=Table name:C256(Table:C252(->[INVOICES:39]))
			$_t_Context:="ReceiptRefund"
			
		: ($_t_TableName="DiaryTime")  //replacing Time_In
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Time"
		: ($_t_TableName="DiaryCalendar")  //rep
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Calendar"
			$_l_EntryPoint:=8  //this may get altered later
		: ($_t_TableName="DiaryWorkflow")  //replacing
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Workflow"
			$_l_EntryPoint:=8  //this may get altered later
		: ($_t_TableName="DiaryNotes")  //re
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Notes"
		: ($_t_TableName="DiaryAutomated")  //r
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Automated"
		: ($_t_TableName="DIaryLetter")  //ZDiary_InQ
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Letter"
		: ($_t_TableName="DiaryEmail")  //zDiary_InEmail
			
			$_t_TableName:=Table name:C256(Table:C252(->[DIARY:12]))
			$_t_Context:="Email"
		: ($_t_TableName="DiaryTimeCosts")  //ZJobs_TCIn
			
			$_t_TableName:=Table name:C256(Table:C252(->[ORDERS:24]))
			$_t_Context:="Time & Costs"
		: ($_t_TableName="DocumentsLetters")  //ZLetters_In enter document letter template
			
			$_t_TableName:=Table name:C256(Table:C252(->[DOCUMENTS:7]))
			$_t_Context:="Letters"
		: ($_t_TableName="DocumentsReports")  //ZLetters_In enter document letter template
			
			$_t_TableName:=Table name:C256(Table:C252(->[DOCUMENTS:7]))
			$_t_Context:="Reports"
		: ($_t_TableName="StockMovementsAssembly")  //=StockAss_In/zStockAss_In
			
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40]))
			$_t_Context:="Assembly"
		: ($_t_TableName="StockMovementsDisassembly")  //ZStockAss_Dis/StockAss_Dis"
			
			
			$_t_TableName:=Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40]))
			$_t_Context:="Disassembly"
	End case 
	
	$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
	If ($_l_TableNumber<0)
		If (Position:C15(" "; $_t_TableName)>0)
			$_t_TableName2:=Replace string:C233($_t_TableName; " "; "_")
			$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName2)
		End if 
	End if 
	
	If ($_l_TableNumber<0)
		//this should not happen as only invisible tables are not included
		$_l_LastTableNumber:=Get last table number:C254
		For ($_l_Index; 1; $_l_LastTableNumber; 1)
			If (Is table number valid:C999($_l_Index))
				If (Table name:C256($_l_Index)=$_t_TableName)
					$_l_NewRecordTable:=$_l_Index
					$_l_Index:=$_l_LastTableNumber
				End if 
			End if 
		End for 
	Else 
		$_l_NewRecordTable:=<>DB_al_TableNums{$_l_TableNumber}
	End if 
End if 
If ($_l_NewRecordTable=0)
	Gen_Alert($_t_MenuItemParameter+" was not understood")
Else 
	$_bo_BatchedEntry:=(Not:C34(<>OneEntry))
	
	
	If (Not:C34(DB_bo_InRecordListing)) | (DB_bo_InRecord)
		$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
		
		DB_l_CurrentDisplayedForm:=0
		DB_bo_RecordsinNewProcess:=True:C214
	Else 
		$DB_bo_RecordsinNewProcess:=DB_bo_RecordsinNewProcess
		If (DB_l_CurrentDisplayedForm#$_l_NewRecordTable)
			
			DB_bo_RecordsinNewProcess:=True:C214
		End if 
	End if 
	
	$_t_TableName:=Table name:C256($_l_NewRecordTable)
	$_t_InputFormName:=SD_t_InputFormName
	$_t_CallingContactCode:=SD_t_CallingContactCode
	$_t_CallingCompanyCode:=SD_t_CallingCompanyCode
	$_l_ParentProcess:=SD_l_ParentProcess
	
	SD_t_InputFormName:=""
	SD_t_CallingContactCode:=""
	SD_t_CallingCompanyCode:=""
	SD_l_ParentProcess:=0
	INV_R_Depositmaxamt:=0
	INV_l_AssignedTable:=0
	INV_l_AssignedrecordID:=0
	If (Count parameters:C259>=2)
		
		Case of 
			: ($_l_NewRecordTable=Table:C252(->[PRODUCTS:9]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[SERVICE_CALLS:20]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[CONTRACTS:17]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
				
			: ($_l_NewRecordTable=Table:C252(->[INVOICES:39]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
				If (Count parameters:C259>=5)
					INV_t_RecordCode:=$5->
				End if 
				//SD_l_ParentProcess:=0
				INV_l_AssignedTable:=0
				INV_l_AssignedrecordID:=0
				INV_R_Depositmaxamt:=0
				If (Count parameters:C259>=8)
					INV_l_AssignedTable:=$6->
					INV_l_AssignedrecordID:=$7->
					INV_R_Depositmaxamt:=$8->
					If (Count parameters:C259>=9)
						SD_l_ParentProcess:=$9->
					End if 
				End if 
			: ($_l_NewRecordTable=Table:C252(->[ORDERS:24]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[DIARY:12]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[JOBS:26]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=4)
					SD_t_InputFormName:=$4->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[PURCHASE_ORDERS:57]))
				SD_l_ParentProcess:=Current process:C322
				SD_t_CallingCompanyCode:=$2->
				If (Count parameters:C259>=3)
					//SD_t_CallingContactCode:=$3->
				End if 
				If (Count parameters:C259>=3)
					SD_t_InputFormName:=$3->
				End if 
			: ($_l_NewRecordTable=Table:C252(->[PRODUCTS:9]))
		End case 
	End if 
	
	If (DB_bo_RecordsinNewProcess)  //Enter new records in a new process
		
		If (DB_l_CurrentDisplayedForm=$_l_NewRecordTable)
			$_l_CallBackProcess:=Current process:C322
			//must call back to add new record to current selection
			
		Else 
			$_l_CallBackProcess:=Current process:C322
			//no call back required!
		End if 
		If ($_t_Context#"")
			If (SD_l_ParentProcess>0) | ($_l_EntryPoint>0)
				//new process needs the extra parameters-set $_t_MenuItemParameter to  a minus
				DB_bo_ReadyForParameters:=False:C215
				$_l_Process:=New process:C317("DB_CreateNewRecord"; 256000; "Enter New "+$_t_TableName; -$_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214; $_t_Context)
				Repeat 
					DelayTicks(2)
				Until (DB_bo_ReadyForParameters)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_InputFormName; SD_t_InputFormName)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_CallingCompanyCode; SD_t_CallingCompanyCode)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_CallingContactCode; SD_t_CallingContactCode)
				SET PROCESS VARIABLE:C370($_l_Process; INV_R_Depositmaxamt; INV_R_Depositmaxamt)
				SET PROCESS VARIABLE:C370($_l_Process; INV_l_AssignedTable; INV_l_AssignedTable)
				SET PROCESS VARIABLE:C370($_l_Process; INV_l_AssignedrecordID; INV_l_AssignedrecordID)
				SET PROCESS VARIABLE:C370($_l_Process; INV_t_RecordCode; INV_t_RecordCode)
				
				SET PROCESS VARIABLE:C370($_l_Process; SD_l_EntryPoint; $_l_EntryPoint)
				SET PROCESS VARIABLE:C370($_l_Process; SD_l_ParentProcess; SD_l_ParentProcess)
				SET PROCESS VARIABLE:C370($_l_Process; SD_bo_Contnue; True:C214)
				
			Else 
				$_l_Process:=New process:C317("DB_CreateNewRecord"; 256000; "Enter New "+$_t_TableName; $_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214; $_t_Context)
			End if 
			
		Else 
			If (SD_l_ParentProcess>0)
				//new process needs the extra parameters-set $_t_MenuItemParameter to  a minus
				DB_bo_ReadyForParameters:=False:C215
				$_l_Process:=New process:C317("DB_CreateNewRecord"; 256000; "Enter New "+$_t_TableName; -$_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214)
				Repeat 
					DelayTicks(2)
				Until (DB_bo_ReadyForParameters)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_InputFormName; SD_t_InputFormName)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_CallingCompanyCode; SD_t_CallingCompanyCode)
				SET PROCESS VARIABLE:C370($_l_Process; SD_t_CallingContactCode; SD_t_CallingContactCode)
				SET PROCESS VARIABLE:C370($_l_Process; INV_R_Depositmaxamt; INV_R_Depositmaxamt)
				SET PROCESS VARIABLE:C370($_l_Process; INV_l_AssignedTable; INV_l_AssignedTable)
				SET PROCESS VARIABLE:C370($_l_Process; INV_l_AssignedrecordID; INV_l_AssignedrecordID)
				SET PROCESS VARIABLE:C370($_l_Process; SD_l_EntryPoint; $_l_EntryPoint)
				SET PROCESS VARIABLE:C370($_l_Process; SD_l_ParentProcess; SD_l_ParentProcess)
				SET PROCESS VARIABLE:C370($_l_Process; SD_bo_Contnue; True:C214)
				
				
			Else 
				$_l_Process:=New process:C317("DB_CreateNewRecord"; 256000; "Enter New "+$_t_TableName; $_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214)
			End if 
		End if 
		PROC_SetProcess($_l_Process; 0; Current process:C322)
		
	Else 
		$_l_CallBackProcess:=Current process:C322
		//stay in the same window..do not open a window
		If ($_t_Context#"")
			DB_CreateNewRecord($_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214; $_t_Context)
		Else 
			DB_CreateNewRecord($_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214)
		End if 
		If ($_t_MenuBarReference#"")
			//SET MENU BAR($_t_MenuBarReference)
		End if 
	End if 
	
	$_t_InputFormName:=SD_t_InputFormName
	$_t_CallingContactCode:=SD_t_CallingContactCode
	$_t_CallingCompanyCode:=SD_t_CallingCompanyCode
	$_l_ParentProcess:=SD_l_ParentProcess
	If (Not:C34(DB_bo_InRecordListing)) | (DB_bo_InRecord)
		DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
		
	Else 
		DB_bo_RecordsinNewProcess:=$DB_bo_RecordsinNewProcess
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DB_MenuNewRecord"; $_t_oldMethodName)