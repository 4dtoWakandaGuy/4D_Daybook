//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ReceiptRefund2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Select; $_bo_VoidTest; $1; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CCAuditID; $3; vNo)
	C_REAL:C285($_r_Amount; $2)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_RefundText; $_t_Tab; INV_t_ButtonText; WIN_t_CurrentOutputform)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ReceiptRefund2")
$_bo_VoidTest:=False:C215
$_t_RefundText:="INV_ReceiptRefund2"

//$T1:=Milliseconds
//Invoices_Pay2 - Inside Invoices_Pay + Subscript_Inv
//use when a partial refund to make sure we only refund against one invoice if required

$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (DB_GetLedgerPostBatch)
	//$_t_RefundText:=$_t_RefundText+Char(9)+"transaction Started at"+";"+String((Milliseconds-$T1)/1000)
	StartTransaction  // 13/05/02 pb
	
	DB_bo_RecordModified:=False:C215
End if 
//Gen_Alert ("Receipt refund started")
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

If ($_bo_Select)
	INV_t_ButtonText:="Reverse Receipt"
	
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])); True:C214)
	If (DB_GetLedgerPostBatch)
		Transact_End
	End if 
	
Else 
	//No User Select---selection is made
	//$_t_RefundText:=$_t_RefundText+Char(9)+"Refund Stage 2 Started at"+";"+String((Milliseconds-$T1)/1000)
	CREATE SET:C116([INVOICES:39]; "Userset")
	INV_UndoSel(False:C215; $_r_Amount)
End if 
If ($_bo_VoidTest)
	If (Test path name:C476("RefundTest.txt")#Is a document:K24:1)
		$_ti_DocumentRef:=DB_CreateDocument("RefundTest.txt")
		$_t_Tab:=Char:C90(9)
		SEND PACKET:C103($_ti_DocumentRef; $_t_RefundText+$_t_Tab)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(10)+Char:C90(13))
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
		If (Is macOS:C1572)
			//_O_SET DOCUMENT CREATOR("RefundTest.txt";"ttxt")
		End if 
	Else 
		
		If (Is macOS:C1572)
			//_O_SET DOCUMENT CREATOR("RefundTest.txt";"ttxt")
		End if 
		$_ti_DocumentRef:=Append document:C265("RefundTest.txt")
		$_t_Tab:=Char:C90(9)
		SEND PACKET:C103($_ti_DocumentRef; $_t_RefundText+$_t_Tab)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(10)+Char:C90(13))
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 


WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("INV_ReceiptRefund2"; $_t_oldMethodName)