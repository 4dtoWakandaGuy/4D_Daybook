If (False:C215)
	//object Name: [TRANSACTIONS]Trans_List.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2012 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_List.Variable6"; Form event code:C388)
vAmount:=Round:C94([TRANSACTIONS:29]Amount:6; 2)
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_List.Variable6"; $_t_oldMethodName)