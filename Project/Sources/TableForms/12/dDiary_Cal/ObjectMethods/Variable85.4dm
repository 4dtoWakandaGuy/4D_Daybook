If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable85
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
	C_LONGINT:C283(vCalActions)
	C_TEXT:C284($_t_oldMethodName; $User2; vUser2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable85"; Form event code:C388)
//xWho
$User2:=vUser2
vUser2:=Substring:C12(Uppercase:C13(Gen_Request("Who:")); 1; 5)
If (OK=1)
	If (vCalActions>1)
		vCalActions:=2
		Diary_CalAct(1)
	End if 
Else 
	vUser2:=$User2
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable85"; $_t_oldMethodName)
