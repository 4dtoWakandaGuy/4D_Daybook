If (False:C215)
	//object Name: [STOCK_MOVEMENTS]Movements_in.Tab Control2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/01/2012 00:50
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.Tab Control2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.Tab Control2"; $_t_oldMethodName)