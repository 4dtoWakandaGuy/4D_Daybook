If (False:C215)
	//object Name: [ORDERS]Orders_In.oOrderPeriodSplitter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/12/2013 14:28
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS]Orders_In.oOrderPeriodSplitter"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		ORD_SetFormObjects(202)
		
End case 
ERR_MethodTrackerReturn("OBJ Orders_In.oOrderPeriodSplitter"; $_t_oldMethodName)
