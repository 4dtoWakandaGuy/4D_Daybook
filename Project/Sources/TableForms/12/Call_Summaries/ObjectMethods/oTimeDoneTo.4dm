If (False:C215)
	//object Name: [DIARY]Call_Summaries.Variable4
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
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Call_Summaries.Variable4"; Form event code:C388)
If ([DIARY:12]Time_Done_From:7>?00:00:00?)
	vTitle2:=String:C10([DIARY:12]Time_Done_From:7; 2)
Else 
	vTitle2:=""
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Call_Summaries.Variable4"; $_t_oldMethodName)
