//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Order_TitUp2
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
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	C_LONGINT:C283($_l_End; $_l_UsageRow; $_l_UsageRow2; $_l_UsageRow3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_TitUp2")

$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 15)
$_l_UsageRow2:=Find in array:C230(ST_ai_StatusUsage; 16)
$_l_UsageRow3:=Find in array:C230(ST_ai_StatusUsage; 17)
If (($_l_UsageRow>0) | ($_l_UsageRow2>0) | ($_l_UsageRow3>0))
	$_l_End:=0
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($_l_End=0))
		If (($_l_UsageRow>0) & ([ORDER_ITEMS:25]Allocated:28>0))
			$_l_End:=1
			Gen_Alert("You can't change an Order with Allocated Items to this State"; "Cancel")
		Else 
			If (($_l_UsageRow2>0) & ([ORDER_ITEMS:25]Delivery_Date:11>!00-00-00!))
				$_l_End:=2
				Gen_Alert("You can't change an Order with Delivered Items to this State"; "Cancel")
			Else 
				If (($_l_UsageRow3>0) & ([ORDER_ITEMS:25]Invoice_Number:17#""))
					$_l_End:=3
					Gen_Alert("You can't change an Order with Invoiced Items to this State"; "Cancel")
				End if 
			End if 
		End if 
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
	If ($_l_End>0)
		[ORDERS:24]State:15:=$1
		States_CUArr(->[ORDERS:24]State:15)
	Else 
		Order_TitUp3
	End if 
	
Else 
	Order_TitUp3
End if 
ERR_MethodTrackerReturn("Order_TitUp2"; $_t_oldMethodName)
