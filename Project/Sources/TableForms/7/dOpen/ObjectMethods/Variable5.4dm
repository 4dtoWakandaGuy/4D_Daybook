If (False:C215)
	//object Name: [DOCUMENTS]dOpen.Variable5
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
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dOpen.Variable5"; Form event code:C388)
If (<>Per_at_PersonnelNames=0)
	<>Per_at_PersonnelNames:=1
End if 
Letters_SWSaSrc
GEN_at_Identity:=1
GEN_at_Name:=1
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dOpen.Variable5"; $_t_oldMethodName)