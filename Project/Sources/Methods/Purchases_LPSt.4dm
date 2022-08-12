//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_LPSt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvTitle; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_LPSt")
Case of   //Copied to LP Out
	: ([PURCHASE_INVOICES:37]State:24=-3)
		vStatus:="Payment"
		vInvTitle:="PURCHASE PAYMENT"
	: ([PURCHASE_INVOICES:37]State:24=-2)
		vStatus:="Pre-Payment"
		vInvTitle:="PURCHASE PRE-PAYMENT"
	: ([PURCHASE_INVOICES:37]State:24=-1)
		vStatus:=""
		vInvTitle:="PURCHASE INVOICE"
	: ([PURCHASE_INVOICES:37]State:24=0)
		vStatus:="Not Posted"
		vInvTitle:="PURCHASE INVOICE"
	: ([PURCHASE_INVOICES:37]State:24=1)
		vStatus:="Batched"
		vInvTitle:="PURCHASE INVOICE"
	: ([PURCHASE_INVOICES:37]State:24=2)
		vStatus:="Posted"
		vInvTitle:="PURCHASE INVOICE"
	: ([PURCHASE_INVOICES:37]State:24=3)
		vStatus:="PL Only"
		vInvTitle:="PURCHASE INVOICE"
End case 
If (vInvTitle="PURCHASE INVOICE")
	If ((([PURCHASE_INVOICES:37]Total_Invoiced:7=0) & (DB_t_CurrentFormUsage="CN")) | ([PURCHASE_INVOICES:37]Total_Invoiced:7<0))
		vInvTitle:="PURCHASE CREDIT NOTE"
	End if 
End if 
vInvTitle:=Uppercase:C13(Term_SLPLWT(vInvTitle))
ERR_MethodTrackerReturn("Purchases_LPSt"; $_t_oldMethodName)