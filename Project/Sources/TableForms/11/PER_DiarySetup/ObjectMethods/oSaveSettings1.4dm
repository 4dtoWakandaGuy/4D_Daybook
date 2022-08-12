If (False:C215)
	//object Name: [PERSONNEL]PER_DiarySetup.oSaveSettings1
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
	C_LONGINT:C283(PER_l_SaveSettings)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].PER_DiarySetup.oSaveSettings1"; Form event code:C388)
PER_l_SaveSettings:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [PERSONNEL].PER_DiarySetup.oSaveSettings1"; $_t_oldMethodName)