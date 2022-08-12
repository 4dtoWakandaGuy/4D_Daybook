If (False:C215)
	//object Name: [DOCUMENTS]dSaveAs.Variable6
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dSaveAs.Variable6"; Form event code:C388)
If (DB_bo_RecordModified)
	USE SET:C118("Master")
	POP RECORD:C177([DOCUMENTS:7])
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dSaveAs.Variable6"; $_t_oldMethodName)
