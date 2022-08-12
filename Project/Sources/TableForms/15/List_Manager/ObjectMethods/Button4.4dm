If (False:C215)
	//object Name: [USER]List_Manager.Button4
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
	//ARRAY LONGINT(AA_al_RelatedFieldsID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsTable;0)
	//ARRAY TEXT(AA_at_RelatedFieldNames;0)
	C_BOOLEAN:C305($_bo_Update; AA_Bo_ListtoUpdate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button4"; Form event code:C388)
$_bo_Update:=AA_DisplayRelatedFields(->AA_al_RelatedFieldsTable; ->AA_al_RelatedFieldsID; ->AA_at_RelatedFieldNames)

If ($_bo_Update)
	AA_Bo_ListtoUpdate:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Button4"; $_t_oldMethodName)
