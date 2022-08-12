If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oDateDoTo
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
	C_LONGINT:C283($_l_event; CAL_l_CallBackEventNo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oDateDoTo"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		CAL_l_CallBackEventNo:=12
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oDateDoTo"; $_t_oldMethodName)
