//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InrCanc
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
	C_LONGINT:C283($End)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InrCanc")
//Orders_InrCanc - not used since File States
//If (r3=1)
$End:=0
FIRST RECORD:C50([ORDER_ITEMS:25])
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($End=0))
	If ([ORDER_ITEMS:25]Allocated:28>0)
		$End:=1
		Gen_Alert("Please unallocate Allocated Items first"; "Cancel")
	End if 
	If ([ORDER_ITEMS:25]Delivery_Date:11>!00-00-00!)
		$End:=2
		Gen_Alert("You can't cancel an order with Delivered Items"; "Cancel")
	End if 
	If ([ORDER_ITEMS:25]Invoice_Number:17#"")
		$End:=3
		Gen_Alert("You can't cancel an order with Invoiced Items"; "Cancel")
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
If ($End>0)
	// [ORDERS]State:=0
	// Order_Title
	// r3:=0
	//  r2:=1
End if 
//End if
ERR_MethodTrackerReturn("Orders_InrCanc"; $_t_oldMethodName)
