//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices AllSr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 20:11
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices AllSr2")
//Invoices AllSr2

QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)

$_r_Sum:=Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)
$0:=((([INVOICES:39]Total_Invoiced:5>0) & ($_r_Sum<0) & (Round:C94(([INVOICES:39]Total_Invoiced:5+$_r_Sum); 2)=0)) | (([INVOICES:39]Total_Invoiced:5<0) & ($_r_Sum>0) & (Round:C94(([INVOICES:39]Total_Invoiced:5+$_r_Sum); 2)=0)))
ERR_MethodTrackerReturn("Invoices AllSr2"; $_t_oldMethodName)