If (False:C215)
	//object Name: [ORDERS]Forecasts.Variable6
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
	C_TEXT:C284($_t_oldMethodName; vPerson)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Forecasts.Variable6"; Form event code:C388)
RELATE ONE:C42([ORDERS:24]Person:5)
vPerson:=[PERSONNEL:11]Name:2
ERR_MethodTrackerReturn("OBJ [ORDERS].Forecasts.Variable6"; $_t_oldMethodName)