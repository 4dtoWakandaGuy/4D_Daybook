If (False:C215)
	//object Name: [DIARY]Diary_SubsEditor.oSubsMailing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/05/2011 11:03
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_SUBSEditor.oSubsMailing"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_SUBSEditor.oSubsMailing"; $_t_oldMethodName)