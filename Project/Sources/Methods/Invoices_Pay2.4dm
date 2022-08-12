//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Pay2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isFromOrder; $_bo_Select; $_bo_showAllocationDialogs; $1; $4; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CCAuditID; $3; vNo)
	C_REAL:C285($_r_Amount; $2)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; CCM_t_ChequeNo; WIN_t_CurrentOutputform)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Invoices_Pay2")

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
$_bo_isFromOrder:=False:C215
If (Count parameters:C259>=4)
	$_bo_isFromOrder:=$4  // dont look up if the CCID=0
End if 

If ($_bo_Select)
	//INV_t_ButtonText:="Receipt"
	//Open_Pro_Window ("Invoice Receipt";0;1;->[INVOICES];WIN_t_CurrentOutputform)
	// ``FS_SetFormSort (WIN_t_CurrentOutputform)
	//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
	//D`ISPLAY SELECTION([INVOICES];*)  `NG added table may 2004
	
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
	If (DB_GetLedgerPostBatch)
		Transact_End
	End if 
	//Close_ProWin
	
Else 
	//No User Select---selection is made
	//USE NAMED SELECTION("$PaySel")
	
	//``but do we want the allocation dialogues
	If (Count parameters:C259>=5)
		$_bo_showAllocationDialogs:=$4  // dont look up if the CCID=0
	Else 
		$_bo_showAllocationDialogs:=False:C215
	End if 
	
	CREATE SET:C116([INVOICES:39]; "Userset")
	Invoices_PaySel($_bo_showAllocationDialogs; $_r_Amount; $_l_CCAuditID; $_bo_isFromOrder)
	//********************************************************************************************
	
End if 


WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Invoices_Pay2"; $_t_oldMethodName)