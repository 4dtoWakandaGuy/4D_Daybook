If (False:C215)
	//object Name: [DIARY]Diary_Out.3D Button3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Out.3D Button3"; Form event code:C388)
WT_SORT_TABLE_3(Current form table:C627; "Text3"; ->[DIARY:12]Date_Do_From:4)
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Out.3D Button3"; $_t_oldMethodName)