If (False:C215)
	//object Name: [USER]User_In.Tab Control2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_LONGINT:C283($_l_TimeManagerTab)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Tab Control2"; Form event code:C388)

$_l_TimeManagerTab:=Find in array:C230(DB_at_USERTAB; "Time Manager")

FORM GOTO PAGE:C247(DB_al_UserTabPage{$_l_TimeManagerTab}+1)
ERR_MethodTrackerReturn("OBJ:User_In,SD_at_ActionResultTab"; $_t_oldMethodName)
