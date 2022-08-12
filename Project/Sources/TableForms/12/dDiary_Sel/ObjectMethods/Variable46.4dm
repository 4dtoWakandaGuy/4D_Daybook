If (False:C215)
	//object Name: [DIARY]dDiary_Sel.Variable46
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vStage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.Variable46"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vStage; ""; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2; "Stage")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.Variable46"; $_t_oldMethodName)
