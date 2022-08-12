If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable88
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
	C_LONGINT:C283(ch1; vCalActions)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable88"; Form event code:C388)
//cActions
If (ch1=1)
	vCalActions:=2
Else 
	vCalActions:=1
End if 
Diary_CalAct(0)
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable88"; $_t_oldMethodName)