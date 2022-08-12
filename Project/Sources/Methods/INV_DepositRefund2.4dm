//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_DepositRefund2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoCC; $_bo_Select; $1; $4; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CCAuditID; $3; vNo)
	C_REAL:C285($_r_Amount; $2)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_DepositRefund2")
//Invoices_Pay2 - Inside Invoices_Pay + Subscript_Inv
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (DB_GetLedgerPostBatch)
	//  START TRANSACTION
	StartTransaction  // 13/05/02 pb
	
	DB_bo_RecordModified:=False:C215
End if 
vNo:=Records in selection:C76([INVOICES:39])
CREATE SET:C116([INVOICES:39]; "Master")
FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_Pay")
WIN_t_CurrentOutputform:="Invoices_Pay"
If (Records in selection:C76([INVOICES:39])>50)
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
Else 
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >; [INVOICES:39]Invoice_Number:1; >)
End if 
Userset_Empty(->[INVOICES:39])
If (Count parameters:C259>=1)
	$_bo_Select:=$1
Else 
	$_bo_Select:=True:C214
End if 
If (Count parameters:C259>=2)
	$_r_Amount:=$2
Else 
	$_r_Amount:=0
End if 
If (Count parameters:C259>=3)
	If ($3>0)
		$_l_CCAuditID:=$3
	Else 
		$_l_CCAuditID:=0
	End if 
	
Else 
	$_l_CCAuditID:=0
End if 
If (Count parameters:C259>4)  //WHEN voiding a credit car payment and it is a deposit the deposit is being reversed  before the cc amount t is refuneded
	
	$_bo_NoCC:=$4
Else 
	$_bo_NoCC:=False:C215
End if 
If ($_bo_Select)
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])); True:C214)
	If (DB_GetLedgerPostBatch)
		Transact_End
	End if 
Else 
	//No User Select---selection is made
	CREATE SET:C116([INVOICES:39]; "Userset")
	INV_RefundSel(False:C215; $_r_Amount; $_bo_NoCC)
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("INV_DepositRefund2"; $_t_oldMethodName)