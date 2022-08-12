If (False:C215)
	//object Name: [DIARY]Diary_Sheet.Variable3
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
	C_TEXT:C284($_t_oldMethodName; vTitle3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_Sheet.Variable3"; Form event code:C388)
If ([DIARY:12]Date_Done_From:5>!00-00-00!)
	If ([DIARY:12]Date_Done_To:34#[DIARY:12]Date_Done_From:5)
		vTitle3:=String:C10([DIARY:12]Date_Done_From:5; 1)+"-"+String:C10([DIARY:12]Date_Done_To:34; 1)
	Else 
		vTitle3:=String:C10([DIARY:12]Date_Done_From:5; 1)
	End if 
Else 
	vTitle3:=""
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_Sheet.Variable3"; $_t_oldMethodName)
