//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchItemEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($13; ACC_bo_SuppressDateCheck)
	C_DATE:C307($9; ACC_D_BatchDate; ACC_D_TransDate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_WindowLeft; $_l_WindowTop; $1; $11; $12; $2; $3; $4; $8; ACC_l_BatchItemID)
	C_LONGINT:C283(ACC_l_CurrentBatchNumber; ACC_l_ItemEntryProcess; ACC_l_ItemViewContext; ACC_l_ParentProcessNumber; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; ACC_l_TransinState; MOD_l_CurrentModuleAccess; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(ACC_R_BATCHCREDITTOTAL; ACC_R_BATCHDEBITTOTAL; ACC_R_TransAmount; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal)
	C_TEXT:C284($_t_oldMethodName; $10; $5; $6; $7; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName)
	C_TEXT:C284(ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo)
	C_TEXT:C284(ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTransCode; ACC_t_UKEC; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; SYS_t_AccessType; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchItemEntry")
//NG June 2004
//This method. Runs as a process to display or enter batch items
Start_Process

DB_t_CallOnCloseorSave:=""
ACC_l_TransinState:=$4
MOD_l_CurrentModuleAccess:=$8
DB_t_CurrentFormUsage:=$5
DB_t_CurrentFormUsage2:=$6
DB_t_CurrentFormUsage3:=$7
ACC_D_BatchDate:=$9
SYS_t_AccessType:=$10  // Was used to determine different screens-Aug 2006 no longer used for that


$_l_WindowLeft:=$11
$_l_WindowTop:=$12
ACC_l_CurrentBatchNumber:=$2
ACC_l_ParentProcessNumber:=$1
If (Count parameters:C259>=13)  // to prevent the Check_Period message when double clicking an entry.
	//if it starts a new process
	ACC_bo_SuppressDateCheck:=$13
End if 
//The following variables are the same as used in the batch item. They can therefore be used to pass values to this process
GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; ACC_R_BATCHDEBITTOTAL; ACC_R_BATCHDEBITTOTAL)
GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; ACC_R_BATCHCREDITTOTAL; ACC_R_BATCHCREDITTOTAL)

If (Count parameters:C259>=3)
	ACC_l_ItemViewContext:=$3
	If ($_l_WindowLeft=0) | ($_l_WindowTop=0)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-640; 40; Screen width:C187-2; 400; 1987; "Batch Item"; "ACC_BatchEntryEscape")
	Else 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft; $_l_WindowTop; 1987; "Batch Item"; "ACC_BatchEntryEscape")
	End if 
	
	WIN_t_CurrentInputForm:="SubItemDisplay"
	DIALOG:C40([TRANSACTION_BATCHES:30]; "SubItemDisplay")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 

ACC_l_ItemEntryProcess:=0
SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_ItemEntryProcess; ACC_l_ItemEntryProcess)

Process_End
ERR_MethodTrackerReturn("ACC_BatchItemEntry"; $_t_oldMethodName)
