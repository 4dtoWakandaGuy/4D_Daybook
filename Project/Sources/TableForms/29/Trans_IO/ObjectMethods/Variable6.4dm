If (False:C215)
	//object Name: [TRANSACTIONS]Trans_IO.Variable6
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
	C_TEXT:C284($_t_oldMethodName; vContCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_IO.Variable6"; Form event code:C388)
Case of 
	: ([TRANSACTIONS:29]IO:18="U")
		vContCode:="UK"
	: ([TRANSACTIONS:29]IO:18="E")
		vContCode:="EC"
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_IO.Variable6"; $_t_oldMethodName)
