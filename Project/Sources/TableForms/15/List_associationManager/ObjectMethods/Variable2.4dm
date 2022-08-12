If (False:C215)
	//object Name: [USER]List_associationManager.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(AA_bo_SaveAssociation)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_associationManager.Variable2"; Form event code:C388)

AA_bo_SaveAssociation:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].List_associationManager.Variable2"; $_t_oldMethodName)