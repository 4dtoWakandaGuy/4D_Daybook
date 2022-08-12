If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs.Variable4
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
	//ARRAY TEXT(<>FUR_at_ListboxEditMode;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable4"; Form event code:C388)
LBi_EditListLay(->CUS_aptr_LBSetup; -><>FUR_at_ListboxEditMode)
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.Variable4"; $_t_oldMethodName)