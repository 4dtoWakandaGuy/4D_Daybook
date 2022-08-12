If (False:C215)
	//object Name: [INVOICES]dPayment.INV_l_btnPaymentTypeCard
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
	C_LONGINT:C283(INV_l_btnPaymentTypeCard; INV_l_btnPaymentTypeCash; INV_l_btnPaymentTypeCheque)
	C_TEXT:C284($_t_oldMethodName; INV_t_PaymentType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES]dPayment.INV_l_btnPaymentTypeCard"; Form event code:C388)




//*************** added -kmw 15/01/09 - v631b120h_4 / v631b120m ***************

ARRAY TEXT:C222(INV_at_PaymentTypes; 3)
INV_at_PaymentTypes{1}:="Cash"
INV_at_PaymentTypes{2}:="Cheque"
INV_at_PaymentTypes{3}:="Card"

Case of 
	: (INV_l_btnPaymentTypeCash=1)
		INV_at_PaymentTypes:=1
		
	: (INV_l_btnPaymentTypeCheque=1)
		INV_at_PaymentTypes:=2
		
	: (INV_l_btnPaymentTypeCard=1)
		INV_at_PaymentTypes:=3
		
	Else 
		
End case 
INV_t_PaymentType:=INV_at_PaymentTypes{INV_at_PaymentTypes}
//*************************************************************************************
ERR_MethodTrackerReturn("OBJ [INVOICES]dPayment.INV_l_btnPaymentTypeCard"; $_t_oldMethodName)
