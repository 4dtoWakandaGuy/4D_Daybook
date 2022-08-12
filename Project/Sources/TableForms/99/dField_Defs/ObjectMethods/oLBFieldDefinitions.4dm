If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs.oLBFieldDefinitions
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
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY TEXT(<>FUR_at_ListboxEditMode;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS]dField_Defs.oLBFieldDefinitions"; Form event code:C388)


ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.oLBFieldDefinitions"; $_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.oLBFieldDefinitions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		//LB_SetMode:=1  `added 29/08/06 -kmw (getting error due to pointer to undefined variable)
		$_l_CurrentSortColumn:=LB_GetColumn(->GEN_lb_ItemsArea; ""; $_t_VariableName)
		LBi_AreaScript(->CUS_aptr_LBSetup; 0; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; -><>FUR_at_ListboxEditMode; $_l_Row; $_t_VariableName; "FLD_LBI_DefItems"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LBi_AreaScript(->CUS_aptr_LBSetup; 0; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; -><>FUR_at_ListboxEditMode; $_l_Row; $_t_VariableName; "FLD_LBI_DefItems")
		
End case 
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].dField_Defs.oLBFieldDefinitions"; $_t_oldMethodName)
