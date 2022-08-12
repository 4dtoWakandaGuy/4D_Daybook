//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchase_AllSr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchase_AllSr2")
//Purchase_AllSr2
QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
$_r_Sum:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
$0:=((([PURCHASE_INVOICES:37]Total_Invoiced:7>0) & ($_r_Sum<0) & (Round:C94(([PURCHASE_INVOICES:37]Total_Invoiced:7+$_r_Sum); 2)=0)) | (([PURCHASE_INVOICES:37]Total_Invoiced:7<0) & ($_r_Sum>0) & (Round:C94(([PURCHASE_INVOICES:37]Total_Invoiced:7+$_r_Sum); 2)=0)))
ERR_MethodTrackerReturn("Purchase_AllSr2"; $_t_oldMethodName)
