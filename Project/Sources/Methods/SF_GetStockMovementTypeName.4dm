//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_GetStockMovementTypeName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/09/2011 14:25 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_GetStockMovementTypeName")
$0:=[MOVEMENT_TYPES:60]Type_Name:2
If (([MOVEMENT_TYPES:60]Stock_Plus:3#"") | ([MOVEMENT_TYPES:60]Stock_Minus:4#""))
	$0:=$0+"("
	If ([MOVEMENT_TYPES:60]Stock_Plus:3#"")
		$0:=$0+"+"+[MOVEMENT_TYPES:60]Stock_Plus:3+" "
	End if 
	If ([MOVEMENT_TYPES:60]Stock_Minus:4#"")
		$0:=$0+"-"+[MOVEMENT_TYPES:60]Stock_Minus:4+" "
	End if 
	$0:=$0+")"
End if 
ERR_MethodTrackerReturn("SF_GetStockMovementTypeName"; $_t_oldMethodName)
