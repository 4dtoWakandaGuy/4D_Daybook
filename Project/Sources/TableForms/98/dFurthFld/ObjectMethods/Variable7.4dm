If (False:C215)
	//object Name: [CUSTOM_FIELDS]dFurthFld.Variable7
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
	//ARRAY BOOLEAN(CUS_lb_FurtherFields;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELDS].dFurthFld.Variable7"; Form event code:C388)

//AL_GetPrevCell (eAlFurth;$_l_Column;$_l_Row)
$_l_Row:=CUS_lb_FurtherFields
//AL_UpdateArrays (eAlFurth;-1)

If ($_l_Row>0)
	If (FUR_at_CustomFieldTypes{$_l_Row}="T")
		Text_Expand(->CUS_at_DisplayedData{$_l_Row}; "Edit "+FUR_at_CustomFieldNames{$_l_Row})
		//AL_UpdateArrays (eAlFurth;-1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELDS].dFurthFld.Variable7"; $_t_oldMethodName)
