If (False:C215)
	//object Name: [ORDERS]Orders_In.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 13:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Invisible Button1"; Form event code:C388)

If (ORD_at_OrdersTab>1)
	ORD_at_OrdersTab:=ORD_at_OrdersTab-1
End if 


If (ORD_at_OrdersTab#FORM Get current page:C276)
	Case of 
		: (ORD_at_OrdersTab=2)
			Orders_InLPß("P2")
			FORM GOTO PAGE:C247(2)
			//force a redraw
			ORD_SetFormObjects(201)
			
		: (ORD_at_OrdersTab=1)
			Orders_InLPß("P1")
			FORM GOTO PAGE:C247(1)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.Invisible Button1"; $_t_oldMethodName)
