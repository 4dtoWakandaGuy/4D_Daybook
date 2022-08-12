If (False:C215)
	//object Name: [USER]List_Manager.Variable7
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
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	C_BOOLEAN:C305($_bo_Update; AA_Bo_ListtoUpdate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Variable7"; Form event code:C388)
$_bo_Update:=AA_DisplayListProperties(->AA_al_ListPropTypesID; ->AA_at_ListPropertyTypes)
If ($_bo_Update)
	AA_Bo_ListtoUpdate:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Variable7"; $_t_oldMethodName)
