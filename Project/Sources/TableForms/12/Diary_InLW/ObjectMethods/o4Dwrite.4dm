If (False:C215)
	//object Name: [DIARY]Diary_inLW.o4Dwrite
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inLW.o4Dwrite"; Form event code:C388)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inLW.o4Dwrite"; $_t_oldMethodName)