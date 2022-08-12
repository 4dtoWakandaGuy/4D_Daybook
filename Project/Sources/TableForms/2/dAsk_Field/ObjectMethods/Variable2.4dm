If (False:C215)
	//object Name: [COMPANIES]dAsk_Field.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Field.Variable2"; Form event code:C388)
If (<>SYS_at_CurrentTableFieldNames=0)
	<>SYS_at_CurrentTableFieldNames:=1
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Field.Variable2"; $_t_oldMethodName)
