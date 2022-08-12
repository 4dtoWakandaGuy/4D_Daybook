If (False:C215)
	//object Name: [SOURCES]SOurces_in.oSourceUsage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_usage;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].SOurces_in.oSourceUsage"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(LB_lb_usage; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				Gen_CUScript($_l_Row)
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [SOURCES].SOurces_in.oSourceUsage"; $_t_oldMethodName)
