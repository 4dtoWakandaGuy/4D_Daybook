//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InLPA2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPA2")
QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)

While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
	RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
	If ([TAX_CODES:35]Use_Areas:4)
		[INVOICES_ITEMS:161]Tax_Amount:7:=Round:C94(([INVOICES_ITEMS:161]Amount:5*([INVOICES:39]Tax_Rate:28/100)); 2)
	End if 
	NEXT RECORD:C51([INVOICES_ITEMS:161])
End while 
QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
ERR_MethodTrackerReturn("Invoices_InLPA2"; $_t_oldMethodName)