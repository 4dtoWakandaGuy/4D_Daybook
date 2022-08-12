If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oButschedule
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oButschedule"; Form event code:C388)
//call to "ZDiary_Mod" added to BShedule on 03/07/08 -kmw (previously this button had an emtpy object method)
ZDiary_Mod
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oButschedule"; $_t_oldMethodName)
