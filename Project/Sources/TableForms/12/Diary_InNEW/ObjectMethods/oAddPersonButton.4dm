If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oAddPersonButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oAddPersonButton"; Form event code:C388)
WS_AddDiaryitemOwner([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
SD_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oAddPersonButton"; $_t_oldMethodName)