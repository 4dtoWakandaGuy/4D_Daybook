If (False:C215)
	//object Name: [DIARY]Diary_Sheet.Variable4
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
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Sheet.Variable4"; Form event code:C388)
If ([DIARY:12]Time_Do_From:6>?00:00:00?)
	If ([DIARY:12]Time_Do_To:35#[DIARY:12]Time_Do_From:6)
		vTitle1:=String:C10([DIARY:12]Time_Do_From:6; 2)+"-"+String:C10([DIARY:12]Time_Do_To:35; 2)
	Else 
		vTitle1:=String:C10([DIARY:12]Time_Do_From:6; 2)
	End if 
Else 
	vTitle2:=""
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Sheet.Variable4"; $_t_oldMethodName)
