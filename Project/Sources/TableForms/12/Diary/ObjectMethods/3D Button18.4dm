If (False:C215)
	//object Name: [DIARY]3D Button18
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary.3D Button18"; Form event code:C388)
WT_SORT_TABLE_3(Current form table:C627; "Text8"; ->[DIARY:12]Value:16)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary.3D Button18"; $_t_oldMethodName)