If (False:C215)
	//object Name: [USER]DiaryResultsDialog.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD_t_ActionEnter)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Variable12"; Form event code:C388)
[DIARY:12]Action_Details:10:=SD_t_ActionEnter
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Variable12"; $_t_oldMethodName)