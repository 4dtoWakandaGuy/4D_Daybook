If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable50
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_AutoResultCodes;0)
	//ARRAY TEXT(SD2_at_AutoResultNames;0)
	C_TEXT:C284($_t_oldMethodName; SD2_t_AutoResult)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable50"; Form event code:C388)
If (SD2_at_AutoResultNames>0)
	SD2_t_AutoResult:=SD2_at_AutoResultCodes{SD2_at_AutoResultNames}
	
End if 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable50"; $_t_oldMethodName)
