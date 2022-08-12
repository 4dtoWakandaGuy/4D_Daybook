If (False:C215)
	//object Name: [ORDERS]Forecasts.Variable16
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
	C_TEXT:C284($_t_oldMethodName; VPPAGE)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Forecasts.Variable16"; Form event code:C388)
VPPAGE:="Page "+String:C10(Printing page:C275)
ERR_MethodTrackerReturn("OBJ [ORDERS].Forecasts.Variable16"; $_t_oldMethodName)