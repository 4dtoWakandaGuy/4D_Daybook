//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EditCheckUnallocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2014 13:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocCLog; $_bo_isUnallocation; $0; $1)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_EditCheckUnallocation")
$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Check is unallocation="+String:C10(Current time:C178)
End if 
$_bo_isUnallocation:=$1
$0:=False:C215
If ($_bo_isUnallocation)
	If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
		[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
		[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
		$0:=True:C214
	End if 
Else 
	If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25>0)
		[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=0
		$0:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("STK_EditCheckUnallocation"; $_t_oldMethodName)
