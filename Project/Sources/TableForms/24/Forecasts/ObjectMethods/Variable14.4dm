If (False:C215)
	//object Name: [ORDERS]Forecasts.Variable14
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
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Forecasts.Variable14"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT1:=Subtotal:C97([ORDERS:24]Total_Amount:6)
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Forecasts.Variable14"; $_t_oldMethodName)
