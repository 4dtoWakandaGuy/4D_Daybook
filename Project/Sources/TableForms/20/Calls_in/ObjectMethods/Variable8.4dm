If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.Variable8"; Form event code:C388)
[SERVICE_CALLS:20]Value:12:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)-[ORDER_ITEMS:25]Sales_Amount:7
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.Variable8"; $_t_oldMethodName)