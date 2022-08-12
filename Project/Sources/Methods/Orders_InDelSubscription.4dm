//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InDelSubscription
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

$_t_oldMethodName:=ERR_MethodTracker("Orders_InDelSubscription")
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	If ([ORDER_ITEMS:25]Item_Number:27>0)
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		DELETE SELECTION:C66([SUBSCRIPTIONS:93])
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
ERR_MethodTrackerReturn("Orders_InDelSubscription"; $_t_oldMethodName)
