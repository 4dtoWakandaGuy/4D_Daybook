If (False:C215)
	//object Name: [PERSONNEL]Diary_View.SD_vDayNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vDayNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.SD_vDayNo"; Form event code:C388)

vDayNo:=Day of:C23(Current date:C33)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.SD_vDayNo"; $_t_oldMethodName)