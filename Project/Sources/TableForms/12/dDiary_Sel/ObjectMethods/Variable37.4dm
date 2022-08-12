If (False:C215)
	//object Name: [DIARY]dDiary_Sel.Variable37
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
	C_TEXT:C284($_t_oldMethodName; vGroup)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.Variable37"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vGroup; ""; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Name:2; "Group")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.Variable37"; $_t_oldMethodName)
