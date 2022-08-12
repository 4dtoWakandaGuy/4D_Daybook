If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oSD_ALQ
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
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL]Diary_View.oSD_ALQ"; Form event code:C388)


$_l_event:=Form event code:C388
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oSD_ALQ"; Form event code:C388)
//$row2:=AL_GetLine (SD_l_ALQ)
LBi_SCPT_ManageEvent(->CONT_aPtr_LBSetup; $_l_event; Self:C308)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oSD_ALQ"; $_t_oldMethodName)