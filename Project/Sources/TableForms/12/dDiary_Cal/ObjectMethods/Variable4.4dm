If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable4
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
	C_TEXT:C284($_t_oldMethodName; vD2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable4"; Form event code:C388)
If (vD2#"")
	vbutt:=2
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable4"; $_t_oldMethodName)
