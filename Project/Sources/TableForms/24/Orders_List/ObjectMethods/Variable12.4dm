If (False:C215)
	//object Name: [ORDERS]Orders_List.Variable12
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
	C_REAL:C285(vT1; vT4; vT6)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_List.Variable12"; Form event code:C388)
vT6:=100-(vT4/vT1*100)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_List.Variable12"; $_t_oldMethodName)