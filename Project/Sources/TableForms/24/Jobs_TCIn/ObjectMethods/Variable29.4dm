If (False:C215)
	//object Name: [ORDERS]Jobs_TCIn.Variable29
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Jobs_TCIn.Variable29"; Form event code:C388)
If (OI_at_OrderItemTabs#FORM Get current page:C276)
	Case of 
		: (OI_at_OrderItemTabs=2)
			
			FORM GOTO PAGE:C247(2)
			
		: (OI_at_OrderItemTabs=1)
			FORM GOTO PAGE:C247(1)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Jobs_TCIn.Variable29"; $_t_oldMethodName)
