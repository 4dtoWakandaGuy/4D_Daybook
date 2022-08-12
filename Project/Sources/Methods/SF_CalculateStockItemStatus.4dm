//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_CalculateStockItemStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/09/2011 17:11 v7.0.0/1
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

$_t_oldMethodName:=ERR_MethodTracker("SF_CalculateStockItemStatus")
ERR_MethodTrackerReturn("SF_CalculateStockItemStatus"; $_t_oldMethodName)