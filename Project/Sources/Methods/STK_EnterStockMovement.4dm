//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EnterStockMovement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 07:29
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

$_t_oldMethodName:=ERR_MethodTracker("STK_EnterStockMovement")
ERR_MethodTrackerReturn("STK_EnterStockMovement"; $_t_oldMethodName)