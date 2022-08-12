If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable39
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; PER_l_allowDecode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable39"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		[PERSONNEL:11]CCM_L_DisplayFullCard:50:=PER_l_allowDecode
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable39"; $_t_oldMethodName)
