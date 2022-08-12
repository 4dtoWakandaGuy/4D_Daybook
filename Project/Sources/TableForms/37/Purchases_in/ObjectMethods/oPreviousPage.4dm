If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_in.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PUR_at_PurchasesTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_in.Invisible Button1"; Form event code:C388)
If (PUR_at_PurchasesTab>1)
	PUR_at_PurchasesTab:=PUR_at_PurchasesTab-1
End if 

If (PUR_at_PurchasesTab>0)
	If (PUR_at_PurchasesTab#FORM Get current page:C276)
		Case of 
			: (PUR_at_PurchasesTab=2)
				
				FORM GOTO PAGE:C247(2)
			: (PUR_at_PurchasesTab=1)
				
				FORM GOTO PAGE:C247(1)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_in.Invisible Button1"; $_t_oldMethodName)
