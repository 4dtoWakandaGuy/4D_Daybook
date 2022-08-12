If (False:C215)
	//object Name: [DIARY]Diary_Sheet.Variable2
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
	C_TEXT:C284($_t_oldMethodName; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Sheet.Variable2"; Form event code:C388)
If ([DIARY:12]Date_Do_From:4>!00-00-00!)
	If ([DIARY:12]Date_Do_To:33#[DIARY:12]Date_Do_From:4)
		vTitle4:=String:C10([DIARY:12]Date_Do_From:4; 1)+"-"+String:C10([DIARY:12]Date_Do_To:33; 1)
	Else 
		vTitle4:=String:C10([DIARY:12]Date_Do_From:4; 1)
	End if 
Else 
	vTitle4:=""
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Sheet.Variable2"; $_t_oldMethodName)
