If (False:C215)
	//object Name: [PRODUCTS]dAsk Price.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Price.Variable1"; Form event code:C388)
r2:=1
r1:=0
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Price.Variable1"; $_t_oldMethodName)