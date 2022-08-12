If (False:C215)
	//object Name: [DIARY]Call_Summaries.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Call_Summaries.Variable2"; Form event code:C388)
If ([DIARY:12]Date_Done_From:5>!00-00-00!)
	vTitle3:=String:C10([DIARY:12]Date_Done_From:5; 1)
Else 
	vTitle3:=""
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Call_Summaries.Variable2"; $_t_oldMethodName)
