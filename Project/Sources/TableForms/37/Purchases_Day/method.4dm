If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Purchases_Day
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 10:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purchases_Day"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Header:K2:17) | ($_l_event=On Printing Detail:K2:18)
	//BEEP
	
	Case of 
		: ([PURCHASE_INVOICES:37]State:24=-3)
			vInvTitle:="Payment"
		: ([PURCHASE_INVOICES:37]State:24=-2)
			vInvTitle:="Pre-Payment"
		Else 
			vInvTitle:="Invoice"
	End case 
	RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
	If (DB_t_CurrentFormUsage#"Items")
		REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; 0)
	End if 
	If (DB_t_CurrentFormUsage#"Items@")
		REDUCE SELECTION:C351([PURCHASE_INVOICE_ALLOCATIONS:159]; 0)
		
	End if 
	If (False:C215)
		If ([PURCHASE_INVOICES:37]State:24<-1)
			vAmount:=[PURCHASE_INVOICES:37]Total_Paid:8
		Else 
			vAmount:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purchases_Day"; $_t_oldMethodName)
