If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable50
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
	C_LONGINT:C283(vbutt)
	C_TEXT:C284($_t_oldMethodName; vD24)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable50"; Form event code:C388)
If (vD24#"")
	vbutt:=24
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable50"; $_t_oldMethodName)
