//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases LPAge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Purchases LPAge
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vContr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases LPAge")
//See Also Purchases Out & Pay
vCalls:=<>DB_d_CurrentDate-[PURCHASE_INVOICES:37]Invoice_Date:5
If ([PURCHASE_INVOICES:37]Due_Date:17#!00-00-00!)
	vContr:=<>DB_d_CurrentDate-[PURCHASE_INVOICES:37]Due_Date:17
Else 
	vContr:=Current date:C33(*)-[PURCHASE_INVOICES:37]Invoice_Date:5
End if 
ERR_MethodTrackerReturn("Purchases LPAge"; $_t_oldMethodName)