If (False:C215)
	//object Name: [DIARY]Diary_OutL.3D Button5
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_OutL.3D Button5"; Form event code:C388)
WT_SORT_TABLE_3(Current form table:C627; "Text9"; ->[DIARY:12]Document_Code:15)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_OutL.3D Button5"; $_t_oldMethodName)