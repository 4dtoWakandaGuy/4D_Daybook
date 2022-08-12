//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_RemSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_LONGINT:C283($_l_RecordsinSelection; $_l_RowIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_RemSR")
Purch_RemLP
QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)


$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])
FIRST RECORD:C50([PURCHASE_INVOICE_ALLOCATIONS:159])
Form_SRArray($_l_RecordsinSelection)
$_l_RowIndex:=1


While (Not:C34(End selection:C36([PURCHASE_INVOICE_ALLOCATIONS:159])))
	SRProdCode{$_l_RowIndex}:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4
	SRDesc{$_l_RowIndex}:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1
	SRQtyT{$_l_RowIndex}:=String:C10([PURCHASE_INVOICE_ALLOCATIONS:159]Date:3; 1)
	SRAmount{$_l_RowIndex}:=[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
	SREuroAmt{$_l_RowIndex}:=WS_EuroConvertor([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2; [PURCHASE_INVOICES:37]Currency_Code:23)
	NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
	$_l_RowIndex:=$_l_RowIndex+1
End while 
ERR_MethodTrackerReturn("Purch_RemSR"; $_t_oldMethodName)
