If (False:C215)
	//object Name: [DOCUMENTS]dMerge.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vRequest)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dMerge.Variable9"; Form event code:C388)
If (vRequest#"")
	Cont_Sel2(vRequest)
	Letters_SWMerA1
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dMerge.Variable9"; $_t_oldMethodName)
