If (False:C215)
	//object Name: [ACTIONS]Action_In.Popup Drop down List1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_JSTypeCodes;0)
	//ARRAY TEXT(SD2_at_JSTypes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SD2_t_JSType; SD2_t_JSTypeNAME)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Popup Drop down List1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD2_t_JSTypeNAME:=SD2_at_JSTypes{SD2_at_JSTypes}
		SD2_t_JSType:=SD2_at_JSTypeCodes{SD2_at_JSTypes}  //Code
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Popup Drop down List1"; $_t_oldMethodName)
