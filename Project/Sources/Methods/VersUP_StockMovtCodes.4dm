//%attributes = {}
If (False:C215)
	//Project Method Name:      VersUP_StockMovtCodes
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

$_t_oldMethodName:=ERR_MethodTracker("VersUP_StockMovtCodes")
ERR_MethodTrackerReturn("VersUP_StockMovtCodes"; $_t_oldMethodName)