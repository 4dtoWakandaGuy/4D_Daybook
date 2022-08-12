//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_OutCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 08:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_CostPrice; $_r_Quantity)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_OutCo")
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$P")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5="")
$_r_Quantity:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
USE NAMED SELECTION:C332("$P")
QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5#"")
$_r_CostPrice:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
vText:=vText+"Free: "+String:C10($_r_Quantity)+vRec+"Alloc: "+String:C10($_r_CostPrice)+vRec
USE NAMED SELECTION:C332("$P")
ERR_MethodTrackerReturn("StockCurr_OutCo"; $_t_oldMethodName)
