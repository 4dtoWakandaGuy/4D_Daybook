If (False:C215)
	//object Name: [DIARY]Diary_inT.Variable21
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inT.Variable21"; Form event code:C388)
Time_Button(->[DIARY:12]Time_Done_From:7; -1)
Diary_InLPX(->[DIARY:12]Time_Done_From:7)  //added 22/05/07 -kmw
SD_bo_RecordModified:=True:C214  //added 22/05/07 -kmw
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inT.Variable21"; $_t_oldMethodName)