If (False:C215)
	//object Name: [INVOICES]Invoices_In.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2010 07:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(INV_at_InvoicesTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Invisible Button1"; Form event code:C388)
If (INV_at_InvoicesTab>1)
	INV_at_InvoicesTab:=INV_at_InvoicesTab-1
End if 
If (INV_at_InvoicesTab#FORM Get current page:C276)
	Case of 
		: (INV_at_InvoicesTab=2)
			
			Invoices_InLPDC
			FORM GOTO PAGE:C247(2)
			Invoices_InLPß("P2")
		: (INV_at_InvoicesTab=1)
			Invoices_InLPß("P1")
			FORM GOTO PAGE:C247(1)
	End case 
End if 
ERR_MethodTrackerReturn("OBJ:Invoices_In,Bright"; $_t_oldMethodName)
