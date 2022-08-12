If (False:C215)
	//object Name: [LIST_ITEMS]List_In.Variable1
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_ITEMS].List_In.Variable1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [LIST_ITEMS].List_In.Variable1"; $_t_oldMethodName)