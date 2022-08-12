//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_inDelete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("Stock_inDelete")
//Stock_inDelete
DB_SaveRecord(->[STOCK_MOVEMENTS:40])
Are_You_Sure

If (OK=1)
	RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
	DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])
	DELETE RECORD:C58([STOCK_MOVEMENTS:40])
	CANCEL:C270
	Gen_InNoF(->[STOCK_MOVEMENTS:40])
End if 
ERR_MethodTrackerReturn("Stock_inDelete"; $_t_oldMethodName)