//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 15:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_Detailtype; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_Mod")
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	$_t_Detailtype:=$1
End if 
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
ERR_MethodTrackerReturn("Stock_Mod"; $_t_oldMethodName)
