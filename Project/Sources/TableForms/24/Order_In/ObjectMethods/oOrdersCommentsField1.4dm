If (False:C215)
	//object Name: [ORDERS]Orders_In.oOrdersCommentsField1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 09:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oOrdersCommentsField1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		ORD_SetFormObjects(201)
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.oOrdersCommentsField1"; $_t_oldMethodName)
