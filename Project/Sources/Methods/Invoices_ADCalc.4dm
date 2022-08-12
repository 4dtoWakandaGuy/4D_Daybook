//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_ADCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 17:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_InvoiceDate; $_d_InvoicesDueDate; $2; $3; vDate)
	C_LONGINT:C283($_l_Difference)
	C_REAL:C285($_r_Amount; $1; v0; v31; v61; v91)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ADCalc")
If (Count parameters:C259>=2)
	$_d_InvoiceDate:=$2
Else 
	$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
End if 
If (Count parameters:C259>=3)
	$_d_InvoicesDueDate:=$3
Else 
	$_d_InvoicesDueDate:=[INVOICES:39]Due_Date:18
End if 
$_r_Amount:=$1
//TRACE
$_l_Difference:=vDate-[INVOICES:39]Invoice_Date:4  //this is not correnct the invoice is not overdue sin
If ($_l_Difference>DB_GetLedgerADStageThree)
	v91:=v91+$_r_Amount
End if 
If (($_l_Difference>DB_GetLedgerADStageTwo) & ($_l_Difference<=DB_GetLedgerADStageThree))
	v61:=v61+$_r_Amount
End if 
If (($_l_Difference>DB_GetLedgerADStageOne) & ($_l_Difference<=DB_GetLedgerADStageTwo))
	v31:=v31+$_r_Amount
End if 
If ($_l_Difference<=DB_GetLedgerADStageOne)
	v0:=v0+$_r_Amount
End if 
ERR_MethodTrackerReturn("Invoices_ADCalc"; $_t_oldMethodName)