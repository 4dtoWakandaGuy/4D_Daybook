If (False:C215)
	//object Name: [USER]WS_SetManager.oFieldNamesDropDown
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
	//ARRAY LONGINT(WS_al_FieldNumbers;0)
	//ARRAY LONGINT(WS_al_TableIDs;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(WS_at_FieldNames;0)
	//ARRAY TEXT(WS_at_TableNames;0)
	C_OBJECT:C1216($_obj_FileData)
	C_TEXT:C284($_t_oldMethodName; SM_T_MacroText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.oFieldNamesDropDown"; Form event code:C388)
If (WS_at_FieldNames>0)
	$_obj_FileData:=New object:C1471("tableName"; WS_at_TableNames{WS_at_TableNames}; "tableNumber"; WS_al_TableIDs{WS_at_TableNames}; "fieldName"; WS_at_FieldNames{WS_at_FieldNames}; "fieldNumber"; WS_al_FieldNumbers{WS_at_FieldNames})
	RecText_Field(->SM_T_MacroText; $_obj_FileData)
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.oFieldNamesDropDown"; $_t_oldMethodName)
