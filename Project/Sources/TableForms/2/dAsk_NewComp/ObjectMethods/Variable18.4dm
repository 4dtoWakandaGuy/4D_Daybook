If (False:C215)
	//object Name: [COMPANIES]dAsk_NewComp.Variable18
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
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_NewComp.Variable18"; Form event code:C388)
If (Size of array:C274(AA_at_ProffesionallAdditions)=0)
	AA_LoadNameArrays
End if 
If (AA_at_Salutations{Size of array:C274(AA_at_Salutations)}#"Add Salutation")
	INSERT IN ARRAY:C227(AA_at_Salutations; 9999; 2)
	AA_at_Salutations{Size of array:C274(AA_at_Salutations)-1}:="-"
	AA_at_Salutations{Size of array:C274(AA_at_Salutations)}:="Add Salutation"
End if 


FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_NewComp.Variable18"; $_t_oldMethodName)