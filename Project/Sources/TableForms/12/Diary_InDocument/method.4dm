If (False:C215)
	//Table Form Method Name: [DIARY]Diary_InDocument
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
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

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_InDocument"; Form event code:C388)
ERR_MethodTrackerReturn("FM [DIARY].Diary_InDocument"; $_t_oldMethodName)