//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_LevelCrS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:45
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

$_t_oldMethodName:=ERR_MethodTracker("OrderI_LevelCrS")
//OrderI_LevelCrS - Set
CREATE SET:C116([ORDER_ITEMS:25]; "LCRS")
OrderI_LevelCr("LCRS")
USE SET:C118("LCRS")
CLEAR SET:C117("LCRS")
ERR_MethodTrackerReturn("OrderI_LevelCrS"; $_t_oldMethodName)