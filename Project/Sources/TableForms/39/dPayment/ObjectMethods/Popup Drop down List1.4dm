If (False:C215)
	//object Name: [INVOICES]dPayment.Popup Drop down List1
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
	//ARRAY TEXT(INV_at_PaymentTypes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; $EventText; INV_t_PaymentType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPayment.Popup Drop down List1"; Form event code:C388)

$_l_event:=Form event code:C388





ERR_MethodTrackerReturn("OBJ [INVOICES].dPayment.Popup Drop down List1"; $_t_oldMethodName)
