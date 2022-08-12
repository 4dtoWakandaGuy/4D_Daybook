//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_GetSubLevelAllocation
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
	C_LONGINT:C283($_l_AllocationType; $_l_CallBackProcess; $_l_OrderItemCount; $_l_OrderItemReference; $2; $3; ORD_l_SubAllocation)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_GetSubLevelAllocation")

If (Count parameters:C259>=3)
	$_t_OrderCode:=$1
	$_l_OrderItemReference:=$2
	$_l_CallBackProcess:=$3
	If ($_t_OrderCode#"") & ($_l_OrderItemReference#0)
		//$1 is the order code and $2 it the orders we want sub items for
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode; *)
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$_l_OrderItemReference)
		$_l_OrderItemCount:=Records in selection:C76([ORDER_ITEMS:25])
		//This gives us the sub items to test....note that these could have sub items themselves so this could go down a few levels if needed
		
		QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_AllocSrc)
		If (Records in selection:C76([ORDER_ITEMS:25])>$_l_OrderItemCount)
			$_l_AllocationType:=1
			SET PROCESS VARIABLE:C370($3; ORD_l_SubAllocation; $_l_AllocationType)
			
			
		Else 
			$_l_AllocationType:=0
			SET PROCESS VARIABLE:C370($3; ORD_l_SubAllocation; $_l_AllocationType)
			
		End if 
	Else 
		$_l_AllocationType:=0
		SET PROCESS VARIABLE:C370($3; ORD_l_SubAllocation; $_l_AllocationType)
		
	End if 
End if 
ERR_MethodTrackerReturn("ORD_GetSubLevelAllocation"; $_t_oldMethodName)