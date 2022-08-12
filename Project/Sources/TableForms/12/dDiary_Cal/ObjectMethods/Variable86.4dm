If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable86
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
	C_DATE:C307(SD_D_CurrentviewDate; vCalF)
	C_LONGINT:C283(vCalActions)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable86"; Form event code:C388)
vCalF:=vCalF-25
SD_D_CurrentviewDate:=vCalF
Diary_CalPer(vCalF)
If (vCalActions>1)
	vCalActions:=2
	Diary_CalAct(1)
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable86"; $_t_oldMethodName)
