If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Tab Control1
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
	//ARRAY TEXT(WS_at_PersonGroupTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Tab Control1"; Form event code:C388)
Case of 
	: (WS_at_PersonGroupTab=1)
		FORM GOTO PAGE:C247(1)
	: (WS_at_PersonGroupTab{WS_at_PersonGroupTab}="Diary")
		
		FORM GOTO PAGE:C247(3)
	Else 
		FORM GOTO PAGE:C247(5)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Tab Control1"; $_t_oldMethodName)
