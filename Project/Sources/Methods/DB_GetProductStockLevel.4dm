//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_GetProductStockLevel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetProductStockLevel")
ERR_MethodTrackerReturn("DB_GetProductStockLevel"; $_t_oldMethodName)