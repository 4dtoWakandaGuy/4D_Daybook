If (False:C215)
	//object Name: [ORDERS]Orders_In.oPrintAuths
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
	C_TEXT:C284($_t_oldMethodName; CCM_t_PaymentHeader)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oPrintAuths"; Form event code:C388)
CCM_t_PaymentHeader:="Transaction activity for order "+[ORDERS:24]Order_Code:3

CCM_ShowDetails(24; ->[ORDERS:24]x_ID:58)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.oPrintAuths"; $_t_oldMethodName)