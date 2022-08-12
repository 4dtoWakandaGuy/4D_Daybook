//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_SOADat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/12/2009 13:42`Method: Invoices_SOADat
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_SOADat")
//Invoices_SOADat Search

QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Statement_Date:34#!00-00-00!)
ORDER BY:C49([INVOICES:39]; [INVOICES:39]Statement_Date:34; >)
LAST RECORD:C200([INVOICES:39])
$0:=[INVOICES:39]Statement_Date:34
ERR_MethodTrackerReturn("Invoices_SOADat"; $_t_oldMethodName)