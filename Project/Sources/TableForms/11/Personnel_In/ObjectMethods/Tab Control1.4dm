If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Tab Control1
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
	//ARRAY TEXT(SD_at_ActionResultTab;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Tab Control1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (SD_at_ActionResultTab=1)
		
		FORM GOTO PAGE:C247(8)
	: (SD_at_ActionResultTab=2)
		
		FORM GOTO PAGE:C247(9)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Tab Control1"; $_t_oldMethodName)
