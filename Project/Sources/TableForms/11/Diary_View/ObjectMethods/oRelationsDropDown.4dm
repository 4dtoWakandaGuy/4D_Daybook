If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oRelationsDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_MenuCall;0)
	//ARRAY POINTER(SD_aptr_RelationFields;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	C_LONGINT:C283(SD_l_RelationAdd)
	C_POINTER:C301(SD_ptr_RelationAdd)
	C_TEXT:C284($_t_oldMethodName; SD_t_RelationAdd)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oRelationsDropDown"; Form event code:C388)
If (SD_at_RelationTypes>0)
	SD_t_RelationAdd:=SD_at_RelationTypes{SD_at_RelationTypes}
	SD_l_RelationAdd:=SD_al_MenuCall{SD_at_RelationTypes}
	SD_ptr_RelationAdd:=SD_aptr_RelationFields{SD_at_RelationTypes}
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oRelationsDropDown"; $_t_oldMethodName)
