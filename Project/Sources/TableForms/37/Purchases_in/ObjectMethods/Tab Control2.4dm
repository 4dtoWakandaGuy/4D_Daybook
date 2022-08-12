If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_in.Tab Control2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 19:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	C_BOOLEAN:C305(PI_bo_Addingitem)
	C_LONGINT:C283($_l_event; vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_in.Tab Control2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		vCT:=0
		If (PI_bo_Addingitem)
			[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
			DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
		End if 
		PI_bo_Addingitem:=False:C215
		LBi_RemoveAll(->PUR_aPtr_LBItemsSetup)
		ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
		Purch_InLPß("P1")
		
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_in.Tab Control2"; $_t_oldMethodName)
