If (False:C215)
	//object Name: [DIARY]dDiary_Sel.Variable21
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
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.Variable21"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[DIARY:12])
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.Variable21"; $_t_oldMethodName)