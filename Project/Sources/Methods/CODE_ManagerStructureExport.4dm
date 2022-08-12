//%attributes = {}

If (False:C215)
	//Database Method Name:      CODE_ManagerStructureExport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_FormObjectExamined; 0)
	ARRAY LONGINT:C221($_al_changesDates; 0)
	ARRAY LONGINT:C221($_al_ComponentTypes; 0)
	ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
	ARRAY LONGINT:C221($_al_FieldPropTypes; 0)
	ARRAY LONGINT:C221($_al_MethodStamps; 0; 0)
	ARRAY LONGINT:C221($_al_NewSettingsTypes; 0)
	ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
	ARRAY LONGINT:C221($_al_ObjectProperties; 0)
	ARRAY LONGINT:C221($_al_OldFieldPropTypes; 0)
	ARRAY LONGINT:C221($_al_oldObjectProperties; 0)
	ARRAY LONGINT:C221($_al_oldPluginPropTypes; 0)
	ARRAY LONGINT:C221($_al_OldSettingsTypes; 0)
	ARRAY LONGINT:C221($_al_ParameterValue; 0)
	ARRAY LONGINT:C221($_al_ParameterValueType; 0)
	ARRAY LONGINT:C221($_al_PluginPropTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY OBJECT:C1221($_aObj_FormObjects; 0)
	ARRAY OBJECT:C1221($_aObj_oldFormObjects; 0)
	ARRAY TEXT:C222($_at_ChangesDocument; 0)
	ARRAY TEXT:C222($_at_ChangesList; 0)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	ARRAY TEXT:C222($_at_ComponentsList; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterNames; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterSettings; 0)
	ARRAY TEXT:C222($_at_DocofChanges; 0)
	ARRAY TEXT:C222($_at_EnabledFormEvents; 0)
	ARRAY TEXT:C222($_at_EnabledObjectEvents; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_MethodChanges; 0; 0)
	ARRAY TEXT:C222($_at_MethodCodes; 0; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_NewSettingsProperties; 0)
	ARRAY TEXT:C222($_at_ObjectProperties; 0)
	ARRAY TEXT:C222($_at_oldComponents; 0)
	ARRAY TEXT:C222($_at_oldEnabledFormEvents; 0)
	ARRAY TEXT:C222($_at_oldEnabledObjectEvents; 0)
	ARRAY TEXT:C222($_at_OldFieldNames; 0)
	ARRAY TEXT:C222($_at_OldFormProperties; 0)
	ARRAY TEXT:C222($_at_oldObjectProperties; 0)
	ARRAY TEXT:C222($_at_oldPlugInProperties; 0)
	ARRAY TEXT:C222($_at_OldSettingsProperties; 0)
	ARRAY TEXT:C222($_at_OldStructureProperties; 0)
	ARRAY TEXT:C222($_at_ParameterValue; 0)
	ARRAY TEXT:C222($_at_PLugInName; 0)
	ARRAY TEXT:C222($_at_PlugInProperties; 0)
	C_BLOB:C604($_Blb_DocAsBlob; $_Blb_FormStructure; $_Blb_ObjectStructure; $_Blb_oldFormblob; $_Blb_oldStructureblob)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $_bo_noModifications; $_Bo_AutoDraggable; $_Bo_AutoMany; $_Bo_automaticDrop; $_Bo_AutoOne; $_Bo_Draggable; $_Bo_Droppable; $_Bo_Exit; $_bo_FieldIndexed; $_bo_FieldInvisible)
	C_BOOLEAN:C305($_bo_FieldUnique; $_Bo_FixedHeight; $_Bo_FixedWidth; $_Bo_FocusRectangleVIsible; $_Bo_isthreestatecb; $_Bo_Mandatory; $_bo_noModifications; $_Bo_NonEnterable; $_Bo_NonModifiable; $_Bo_ObjectAutoSpellCheck; $_Bo_ObjectEnabled)
	C_BOOLEAN:C305($_Bo_ObjectEnterable; $_Bo_ObjectFound; $_Bo_ObjectHasContextMenu; $_Bo_ObjectisVIsible; $_Bo_oldAutoDraggable; $_Bo_oldAutoMany; $_Bo_oldautomaticDrop; $_Bo_oldAutoOne; $_Bo_oldDraggable; $_Bo_oldDroppable; $_Bo_OldFixedHeight)
	C_BOOLEAN:C305($_Bo_OldFixedWidth; $_Bo_oldFocusRectangleVisible; $_Bo_oldindex; $_Bo_OldInvisible; $_Bo_Oldisthreestatecb; $_Bo_oldMandatory; $_Bo_oldNonEnterable; $_Bo_oldNonModifiable; $_Bo_oldObjectAutoSpellCheck; $_Bo_oldObjectEnabled; $_Bo_oldObjectEnterable)
	C_BOOLEAN:C305($_Bo_oldObjectHasContextMenu; $_Bo_oldObjectisVIsible; $_Bo_oldPrintVarFrame; $_Bo_OldTrigDel; $_Bo_OldtrigSave; $_Bo_OldTrigSaveNew; $_Bo_oldUnique; $_Bo_OldVisibleHscroll; $_Bo_oldVisibleVScroll; $_Bo_PrintVarFrame; $_Bo_TrigDel)
	C_BOOLEAN:C305($_Bo_trigSave; $_Bo_trigSaveNew; $_Bo_VisibleHScroll; $_Bo_VisibleVScroll; $2)
	C_DATE:C307($_Dte_ChangedDate)
	C_LONGINT:C283($_l_ChangesCount; $_l_ChoiceField; $_l_ComponentSettings; $_l_CUrrentElement; $_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_DatabaseSettings; $_l_ElementCount; $_l_FieldLength; $_l_FieldType)
	C_LONGINT:C283($_l_FixedSubform; $_l_FontSize; $_l_FontStyle; $_l_Indicator; $_l_lastFieldNumber; $_l_LastTableNumber; $_l_ListReference; $_l_LocalizationSettings; $_l_MaximumValue; $_l_MethodStamp; $_l_minumumValue)
	C_LONGINT:C283($_l_Multiline; $_l_NewObjectPage; $_l_NewProperty; $_l_NumPages; $_l_ObjectAlignment; $_l_objectOrientation; $_l_OBottom; $_l_offset; $_l_oldChoiceField; $_l_OldCurrentElement; $_l_oldFieldLength)
	C_LONGINT:C283($_l_oldFieldType; $_l_OldFixedSubform; $_l_oldFontSize; $_l_oldFontStyle; $_l_oldHorizontalResizing; $_l_oldIndicator; $_l_oldListReference; $_l_oldMaximumValue; $_l_oldMinimumValue; $_l_oldMultiline; $_l_oldNumPages)
	C_LONGINT:C283($_l_OldObjectAlignment; $_l_oldObjectOrientation; $_l_OldObjectPage; $_l_oldoBottom; $_l_oldOLeft; $_l_oldOneField; $_l_oldOneTable; $_l_oldORight; $_l_oldOTop; $_l_oldPageNumber; $_l_OldProperty)
	C_LONGINT:C283($_l_OldSequenceNumber; $_l_OldShortcutmodifier; $_l_oldType; $_l_OldVerticalAlignment; $_l_oldVerticalResizing; $_l_oLeft; $_l_oMinimumValue; $_l_OneField; $_l_OneTable; $_l_oRight; $_l_Otop)
	C_LONGINT:C283($_l_PageNumber; $_l_ParseType; $_l_Platform; $_l_PluginSettings; $_l_Retries; $_l_SequenceNumber; $_l_shortcutmodifier; $_l_Start; $_l_TableIndex; $_l_TableIndex10; $_l_TableIndex2)
	C_LONGINT:C283($_l_TableIndex3; $_l_TableIndex4; $_l_TableIndex5; $_l_TableIndex6; $_l_TableIndex7; $_l_TimeStamp; $_l_Type; $_l_verticalAlignment; $_l_verticalResizing; $1)
	C_OBJECT:C1216($_Obj_Components; $_Obj_DatabaseParameters; $_Obj_FieldProperties; $_Obj_Fields; $_Obj_Localization; $_Obj_OldComponents; $_Obj_OLDDatabaseLocalization; $_Obj_OLDDatabaseParameters; $_Obj_oldFieldProperties; $_Obj_OldForm; $_Obj_OldPlugins)
	C_OBJECT:C1216($_Obj_OldStructure; $_Obj_oldTableProperties; $_Obj_PlugIns; $_Obj_Structure; $_Obj_TableProperties; $CORE_ob_FormObject)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_TEXT:C284($_t_Databasepath; $_t_TableName; $_txt_AddedObjectName; $_Txt_AddtoName; $_Txt_altBackGroundColour; $_Txt_BackGroundColour; $_Txt_BorderLinestyle; $_Txt_CurrentDatabaseLocalizatio; $_Txt_DefaultDatabaseLocalizatio; $_Txt_DisplayFormat; $_Txt_DocumentText)
	C_TEXT:C284($_txt_FieldName; $_Txt_FilterName; $_Txt_FontName; $_Txt_FontStyleName; $_Txt_ForegroundColour; $_Txt_FormChanges; $_Txt_FormTitle; $_Txt_HelpText; $_Txt_HorizontalResizing; $_Txt_Indicator; $_Txt_InputSuformObjectName)
	C_TEXT:C284($_Txt_InternalDatabaseLocalizati; $_Txt_ListName; $_Txt_MenuBarReference; $_Txt_MethodCHANGE; $_Txt_MethodChangesDocPath; $_Txt_MethodChangesDocumentName; $_Txt_MethodCode; $_Txt_MethodName; $_Txt_Methodnotes; $_Txt_methodPathName; $_Txt_MultilineName)
	C_TEXT:C284($_Txt_NewProperty; $_Txt_NewText; $_Txt_ObjectAlignment; $_Txt_ObjectName; $_Txt_ObjectStyleSheet; $_Txt_oldaltBackGroundColour; $_Txt_oldBackGroundColour; $_Txt_oldBorderLinestyle; $_Txt_oldCurrentDatabaseLoc; $_Txt_oldDefaultDatabaseLoc; $_Txt_oldDisplayFormat)
	C_TEXT:C284($_Txt_oldFilterName; $_Txt_oldFontName; $_Txt_oldFontStyleName; $_Txt_oldForegroundColour; $_Txt_OldFormTitle; $_Txt_oldHelpText; $_Txt_oldHorizontalResizing; $_Txt_OldIndicator; $_Txt_oldinputsubformobjectname; $_Txt_oldInternalDatabaseLoc; $_Txt_oldListName)
	C_TEXT:C284($_Txt_oldMenuBarReference; $_Txt_oldMultilineName; $_Txt_oldObjectAlignment; $_txt_oldObjectName; $_Txt_OldObjectStyleSheet; $_Txt_OldOutputsubformobjectname; $_Txt_oldPlaceholder; $_Txt_OldProperty; $_Txt_oldShortCutKey; $_Txt_oldStandardAction; $_Txt_oldSubformOption)
	C_TEXT:C284($_txt_OldTableName; $_txt_OldText; $_Txt_oldTypeName; $_Txt_oldUserDatabaseLoc; $_txt_oldVariableName; $_Txt_oldVerticalAlignment; $_Txt_oldVerticalResizing; $_Txt_OutputSuformObjectName; $_Txt_path2; $_Txt_Placeholder; $_Txt_Property)
	C_TEXT:C284($_Txt_Replace; $_Txt_ShortCutKey; $_Txt_standardAction; $_Txt_StructureChanges; $_Txt_SubformOption; $_Txt_tableName; $_Txt_TypeName; $_Txt_UserDatabaseLocalization; $_Txt_VariableName; $_Txt_VersionID; $_Txt_VersionObject)
	C_TEXT:C284($_Txt_VerticalAlignment; $_Txt_VerticalResizing; CORE_T_ParseFormName)
	C_TIME:C306($_ti_ChangedTime; $_ti_ChangesDocument; $_ti_ChangesDocument2; $_ti_FormDocument; $_ti_StructureDocument)
End if 
//Code Starts Here
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_ManagerStructureExport
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2015
	//Created BY: Nigel Greenlee
	
	////////28/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
	//C_UNKNOWN(DIFF_MakeHistoryTables)
	//C_UNKNOWN(DIFF_SaveForm)
	ARRAY BOOLEAN:C223($_aBo_FormObjectExamined; 0)
	ARRAY LONGINT:C221($_al_changesDates; 0)
	ARRAY LONGINT:C221($_al_ComponentTypes; 0)
	ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
	ARRAY LONGINT:C221($_al_FieldPropTypes; 0)
	ARRAY LONGINT:C221($_al_MethodStamps; 0; 0)
	ARRAY LONGINT:C221($_al_NewSettingsTypes; 0)
	ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
	ARRAY LONGINT:C221($_al_ObjectProperties; 0)
	ARRAY LONGINT:C221($_al_OldFieldPropTypes; 0)
	ARRAY LONGINT:C221($_al_oldObjectProperties; 0)
	ARRAY LONGINT:C221($_al_oldPluginPropTypes; 0)
	ARRAY LONGINT:C221($_al_OldSettingsTypes; 0)
	ARRAY LONGINT:C221($_al_ParameterValue; 0)
	ARRAY LONGINT:C221($_al_ParameterValueType; 0)
	ARRAY LONGINT:C221($_al_PluginPropTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY OBJECT:C1221($_aObj_FormObjects; 0)
	ARRAY OBJECT:C1221($_aObj_oldFormObjects; 0)
	ARRAY TEXT:C222($_at_ChangesDocument; 0)
	ARRAY TEXT:C222($_at_ChangesList; 0)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	ARRAY TEXT:C222($_at_ComponentsList; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterNames; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterSettings; 0)
	ARRAY TEXT:C222($_at_DocofChanges; 0)
	ARRAY TEXT:C222($_at_EnabledFormEvents; 0)
	ARRAY TEXT:C222($_at_EnabledObjectEvents; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_MethodChanges; 0; 0)
	ARRAY TEXT:C222($_at_MethodCodes; 0; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_NewSettingsProperties; 0)
	ARRAY TEXT:C222($_at_ObjectProperties; 0)
	ARRAY TEXT:C222($_at_oldComponents; 0)
	ARRAY TEXT:C222($_at_oldEnabledFormEvents; 0)
	ARRAY TEXT:C222($_at_oldEnabledObjectEvents; 0)
	ARRAY TEXT:C222($_at_OldFieldNames; 0)
	ARRAY TEXT:C222($_at_OldFormProperties; 0)
	ARRAY TEXT:C222($_at_oldObjectProperties; 0)
	ARRAY TEXT:C222($_at_oldPlugInProperties; 0)
	ARRAY TEXT:C222($_at_OldSettingsProperties; 0)
	ARRAY TEXT:C222($_at_OldStructureProperties; 0)
	ARRAY TEXT:C222($_at_ParameterValue; 0)
	ARRAY TEXT:C222($_at_PLugInName; 0)
	ARRAY TEXT:C222($_at_PlugInProperties; 0)
	C_BLOB:C604($_Blb_DocAsBlob; $_Blb_FormStructure; $_Blb_ObjectStructure; $_Blb_oldFormblob; $_Blb_oldStructureblob)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $_bo_noModifications; $_Bo_AutoDraggable; $_Bo_AutoMany; $_Bo_automaticDrop; $_Bo_AutoOne; $_Bo_Draggable; $_Bo_Droppable; $_Bo_Exit; $_Bo_FixedHeight; $_Bo_FixedWidth)
	C_BOOLEAN:C305($_Bo_FocusRectangleVIsible; $_bo_FieldInvisible; $_Bo_isthreestatecb; $_Bo_Mandatory; $_bo_FieldIndexed; $_bo_noModifications; $_Bo_NonEnterable; $_Bo_NonModifiable; $_Bo_ObjectAutoSpellCheck; $_Bo_ObjectEnabled; $_Bo_ObjectEnterable)
	C_BOOLEAN:C305($_Bo_ObjectFound; $_Bo_ObjectHasContextMenu; $_Bo_ObjectisVIsible; $_Bo_oldAutoDraggable; $_Bo_oldAutoMany; $_Bo_oldautomaticDrop; $_Bo_oldAutoOne; $_Bo_oldDraggable; $_Bo_oldDroppable; $_Bo_OldFixedHeight; $_Bo_OldFixedWidth)
	C_BOOLEAN:C305($_Bo_oldFocusRectangleVisible; $_Bo_oldindex; $_Bo_OldInvisible; $_Bo_Oldisthreestatecb; $_Bo_oldMandatory; $_Bo_oldNonEnterable; $_Bo_oldNonModifiable; $_Bo_oldObjectAutoSpellCheck; $_Bo_oldObjectEnabled; $_Bo_oldObjectEnterable; $_Bo_oldObjectHasContextMenu)
	C_BOOLEAN:C305($_Bo_oldObjectisVIsible; $_Bo_oldPrintVarFrame; $_Bo_OldTrigDel; $_Bo_OldtrigSave; $_Bo_OldTrigSaveNew; $_Bo_oldUnique; $_Bo_OldVisibleHscroll; $_Bo_oldVisibleVScroll; $_Bo_PrintVarFrame; $_Bo_TrigDel; $_Bo_trigSave)
	C_BOOLEAN:C305($_Bo_trigSaveNew; $_bo_FieldUnique; $_Bo_VisibleHScroll; $_Bo_VisibleVScroll; $2)
	C_DATE:C307($_Dte_ChangedDate)
	C_LONGINT:C283($_l_ChangesCount; $_l_ChoiceField; $_l_ComponentSettings; $_l_CUrrentElement; $_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_DatabaseSettings; $_l_ElementCount; $_l_FieldLength; $_l_FieldType)
	C_LONGINT:C283($_l_FixedSubform; $_l_FontSize; $_l_FontStyle; $_l_TableIndex; $_l_TableIndex10; $_l_TableIndex2; $_l_TableIndex3; $_l_TableIndex4; $_l_TableIndex5; $_l_TableIndex6; $_l_TableIndex7)
	C_LONGINT:C283($_l_Indicator; $_l_lastFieldNumber; $_l_LastTableNumber; $_l_ListReference; $_l_LocalizationSettings; $_l_MaximumValue; $_l_MethodStamp; $_l_minumumValue; $_l_Multiline; $_l_NewObjectPage; $_l_NewProperty)
	C_LONGINT:C283($_l_NumPages; $_l_ObjectAlignment; $_l_objectOrientation; $_l_OBottom; $_l_offset; $_l_oldChoiceField; $_l_OldCurrentElement; $_l_oldFieldLength; $_l_oldFieldType; $_l_OldFixedSubform; $_l_oldFontSize)
	C_LONGINT:C283($_l_oldFontStyle; $_l_oldHorizontalResizing; $_l_oldIndicator; $_l_oldListReference; $_l_oldMaximumValue; $_l_oldMinimumValue; $_l_oldMultiline; $_l_oldNumPages; $_l_OldObjectAlignment; $_l_oldObjectOrientation; $_l_OldObjectPage)
	C_LONGINT:C283($_l_oldoBottom; $_l_oldOLeft; $_l_oldOneField; $_l_oldOneTable; $_l_oldORight; $_l_oldOTop; $_l_oldPageNumber; $_l_OldProperty; $_l_OldSequenceNumber; $_l_OldShortcutmodifier; $_l_oldType)
	C_LONGINT:C283($_l_OldVerticalAlignment; $_l_oldVerticalResizing; $_l_oLeft; $_l_oMinimumValue; $_l_OneField; $_l_OneTable; $_l_oRight; $_l_Otop; $_l_PageNumber; $_l_ParseType; $_l_Platform)
	C_LONGINT:C283($_l_PluginSettings; $_l_Retries; $_l_SequenceNumber; $_l_shortcutmodifier; $_l_Start; $_l_TimeStamp; $_l_Type; $_l_verticalAlignment; $_l_verticalResizing; $1)
	C_OBJECT:C1216($_Obj_Components; $_Obj_DatabaseParameters; $_Obj_FieldProperties; $_Obj_Fields; $_Obj_Localization; $_Obj_OldComponents; $_Obj_OLDDatabaseLocalization; $_Obj_OLDDatabaseParameters; $_Obj_oldFieldProperties; $_Obj_OldForm; $_Obj_OldPlugins)
	C_OBJECT:C1216($_Obj_OldStructure; $_Obj_oldTableProperties; $_Obj_PlugIns; $_Obj_Structure; $_Obj_TableProperties; $CORE_ob_FormObject)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_TEXT:C284($_t_TableName; $_txt_AddedObjectName; $_Txt_AddtoName; $_Txt_altBackGroundColour; $_Txt_BackGroundColour; $_Txt_BorderLinestyle; $_Txt_CurrentDatabaseLocalizatio; $_Txt_DefaultDatabaseLocalizatio; $_Txt_DisplayFormat; $_Txt_DocumentText; $_txt_FieldName)
	C_TEXT:C284($_Txt_FilterName; $_Txt_FontName; $_Txt_FontStyleName; $_Txt_ForegroundColour; $_Txt_FormChanges; $_Txt_FormTitle; $_Txt_HelpText; $_Txt_HorizontalResizing; $_Txt_Indicator; $_Txt_InputSuformObjectName; $_Txt_InternalDatabaseLocalizati)
	C_TEXT:C284($_Txt_ListName; $_Txt_MenuBarReference; $_Txt_MethodCHANGE; $_Txt_MethodChangesDocPath; $_Txt_MethodChangesDocumentName; $_Txt_MethodCode; $_Txt_MethodName; $_Txt_Methodnotes; $_Txt_methodPathName; $_Txt_MultilineName; $_Txt_NewProperty)
	C_TEXT:C284($_Txt_NewText; $_Txt_ObjectAlignment; $_Txt_ObjectName; $_Txt_ObjectStyleSheet; $_Txt_oldaltBackGroundColour; $_Txt_oldBackGroundColour; $_Txt_oldBorderLinestyle; $_Txt_oldCurrentDatabaseLoc; $_Txt_oldDefaultDatabaseLoc; $_Txt_oldDisplayFormat; $_Txt_oldFilterName)
	C_TEXT:C284($_Txt_oldFontName; $_Txt_oldFontStyleName; $_Txt_oldForegroundColour; $_Txt_OldFormTitle; $_Txt_oldHelpText; $_Txt_oldHorizontalResizing; $_Txt_OldIndicator; $_Txt_oldinputsubformobjectname; $_Txt_oldInternalDatabaseLoc; $_Txt_oldListName; $_Txt_oldMenuBarReference)
	C_TEXT:C284($_Txt_oldMultilineName; $_Txt_oldObjectAlignment; $_txt_oldObjectName; $_Txt_OldObjectStyleSheet; $_Txt_OldOutputsubformobjectname; $_Txt_oldPlaceholder; $_Txt_OldProperty; $_Txt_oldShortCutKey; $_Txt_oldStandardAction; $_Txt_oldSubformOption; $_txt_OldTableName)
	C_TEXT:C284($_txt_OldText; $_Txt_oldTypeName; $_Txt_oldUserDatabaseLoc; $_txt_oldVariableName; $_Txt_oldVerticalAlignment; $_Txt_oldVerticalResizing; $_Txt_OutputSuformObjectName; $_t_Databasepath; $_Txt_path2; $_Txt_Placeholder; $_Txt_Property)
	C_TEXT:C284($_Txt_Replace; $_Txt_ShortCutKey; $_Txt_standardAction; $_Txt_StructureChanges; $_Txt_SubformOption; $_Txt_tableName; $_Txt_TypeName; $_Txt_UserDatabaseLocalization; $_Txt_VariableName; $_Txt_VersionID; $_Txt_VersionObject)
	C_TEXT:C284($_Txt_VerticalAlignment; $_Txt_VerticalResizing; CORE_T_ParseFormName)
	C_TIME:C306($_ti_ChangedTime; $_ti_ChangesDocument; $_ti_ChangesDocument2; $_ti_FormDocument; $_ti_StructureDocument)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_l_ParseType:=$1
	If (Count parameters:C259>=2)
		$_bo_noModifications:=$2
	Else 
		$_bo_noModifications:=False:C215
	End if 
Else 
	$_l_ParseType:=0
	
	
	
End if 
//-------------------- Main Method -------------------

//This is a utility method which will export the entire structure to a single report such that it can be included in physical document
///For methods and forms this will include information in the comments -but not the code itself(unless parameter invoked to that

Case of 
	: ($_l_ParseType=0)  //Export All the methods
		//CONFIRM("Clear Data?";"No";"Yes")
		//If (OK=0)
		//DIFF_MakeHistoryTables (True)
		
		
		//End if 
		
		//CODE_ManagerStructureExport (2;True)  //Makes sure the latest version of all Forms is exported
		
		ARRAY TEXT:C222($_at_MethodPaths; 0)
		METHOD GET PATHS:C1163(Path database method:K72:2; $_at_MethodPaths)
		For ($_l_TableIndex; 1; Size of array:C274($_at_MethodPaths))
			CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path database method:K72:2; True:C214)
		End for 
		ARRAY TEXT:C222($_at_MethodPaths; 0)
		METHOD GET PATHS:C1163(Path project method:K72:1; $_at_MethodPaths)
		For ($_l_TableIndex; 1; Size of array:C274($_at_MethodPaths))
			CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path project method:K72:1; True:C214)
		End for 
		ARRAY TEXT:C222($_at_MethodPaths; 0)
		FORM GET NAMES:C1167($_at_FormNames)
		For ($_l_CurrentForm; 1; Size of array:C274($_at_FormNames))
			METHOD GET PATHS FORM:C1168($_at_MethodPaths; $_at_FormNames{$_l_CurrentForm})
			For ($_l_TableIndex; 1; Size of array:C274($_at_MethodPaths))
				If (Position:C15("FormMethod"; $_at_MethodPaths{$_l_TableIndex})>0)
					CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path project form:K72:3; True:C214)
				Else 
					CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path project form:K72:3+99; True:C214)
				End if 
			End for 
		End for 
		$_l_LastTableNumber:=Get last table number:C254
		For ($_l_CurrentTable; 1; $_l_LastTableNumber)
			If (Is table number valid:C999($_l_CurrentTable))
				ARRAY TEXT:C222($_at_FormNames; 0)
				$_Ptr_ptrTablePointer:=Table:C252($_l_CurrentTable)
				FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames; *)
				For ($_l_CurrentFormNumber; 1; Size of array:C274($_at_FormNames))
					ARRAY TEXT:C222($_at_MethodPaths; 0)
					METHOD GET PATHS FORM:C1168($_Ptr_ptrTablePointer->; $_at_MethodPaths; $_at_FormNames{$_l_CurrentFormNumber})
					For ($_l_TableIndex; 1; Size of array:C274($_at_MethodPaths))
						If (Position:C15("FormMethod"; $_at_MethodPaths{$_l_TableIndex})>0)
							CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path table form:K72:5; True:C214)
						Else 
							CORE_DBCodeManager($_at_MethodPaths{$_l_TableIndex}; Path table form:K72:5+99; True:C214)
						End if 
					End for 
				End for 
			End if 
		End for 
	: ($_l_ParseType=2)  //Export all forms in the database
		
		FORM GET NAMES:C1167($_at_FormNames)  //Project Forms
		$_l_TableIndex:=Find in array:C230($_at_FormNames; CORE_T_ParseFormName)
		For ($_l_TableIndex; 1; Size of array:C274($_at_FormNames))
			While (Semaphore:C143("CORE_EditingCodeManager"))  //lock other methods from altering the array 
				UTIL_DelayTicks(2)
			End while 
			$_t_TableName:=""
			CORE_T_ParseFormName:=$_at_FormNames{$_l_TableIndex}
			FORM LOAD:C1103($_at_FormNames{$_l_TableIndex})
			C_OBJECT:C1216($CORE_ob_FormObject)
			CLEAR VARIABLE:C89($CORE_ob_FormObject)
			CORE_GetFormObjects($_at_FormNames{$_l_TableIndex}; 0; ->$CORE_ob_FormObject)
			If (UTIL_isComponentInstalled("DIFFComponent")) | (UTIL_isComponentInstalled("DIFF"))
				If ($_bo_noModifications)
					
					//DIFF_SaveForm ($_t_TableName;$_at_FormNames{$_l_TableIndex};->$CORE_ob_FormObject;$_bo_noModifications)
				Else 
					//DIFF_SaveForm ($_t_TableName;$_at_FormNames{$_l_TableIndex};->$CORE_ob_FormObject)
					
				End if 
				
			End if 
			CLEAR SEMAPHORE:C144("CORE_EditingCodeManager")  //Clear other methods to alter the array 
			
		End for 
		
		C_TEXT:C284($_Txt_VersionID)
		C_TEXT:C284($_Txt_VersionObject)
		$_Txt_VersionObject:="Version ID"
		//VERSION_GetVersioninformation (->$_Txt_VersionID;->$_Txt_VersionObject)
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;":";"")
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;"/";"_")
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;"\\";"_")
		
		$_l_LastTableNumber:=Get last table number:C254
		For ($_l_TableIndex; 1; $_l_LastTableNumber)
			$_txt_TableName:=Table name:C256($_l_TableIndex)
			If (Is table number valid:C999($_l_TableIndex))
				$_Ptr_ptrTablePointer:=Table:C252($_l_TableIndex)
				FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames; *)
				For ($_l_TableIndex2; 1; Size of array:C274($_at_FormNames))
					While (Semaphore:C143("CORE_EditingCodeManager"))  //lock other methods from altering the array 
						UTIL_DelayTicks(2)
					End while 
					C_OBJECT:C1216($CORE_ob_FormObject)
					CLEAR VARIABLE:C89($CORE_ob_FormObject)
					//parse the form-note that in this context we do not handle the form method or object scripts
					//ARRAY TEXT($_at_FormNames;0)
					CORE_T_ParseFormName:=$_at_FormNames{$_l_TableIndex2}
					FORM LOAD:C1103($_Ptr_ptrTablePointer->; $_at_FormNames{$_l_TableIndex2})
					C_OBJECT:C1216($CORE_ob_FormObject)
					CLEAR VARIABLE:C89($CORE_ob_FormObject)
					CORE_GetFormObjects($_at_FormNames{$_l_TableIndex2}; $_l_TableIndex; ->$CORE_ob_FormObject)
					If (UTIL_isComponentInstalled("DIFFComponent"))
						If ($_bo_noModifications)
							//DIFF_SaveForm ($_txt_TableName;$_at_FormNames{$_l_TableIndex2};->$CORE_ob_FormObject;$_bo_noModifications)
						Else 
							
							//DIFF_SaveForm ($_txt_TableName;$_at_FormNames{$_l_TableIndex2};->$CORE_ob_FormObject)
						End if 
					End if 
					CLEAR SEMAPHORE:C144("CORE_EditingCodeManager")  //Clear other methods to alter the array 
					
				End for 
			End if 
		End for 
		
	: ($_l_ParseType=1)
		While (Semaphore:C143("CORE_EditingCodeManager"))  //lock other methods from altering the array 
			UTIL_DelayTicks(2)
		End while 
		//Get the database settings-and do a compare to the last settings
		ARRAY TEXT:C222($_at_DatabaseParameterSettings; 0)
		ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
		ARRAY TEXT:C222($_at_DatabaseParameterNames; 0)
		ARRAY TEXT:C222($_at_ParameterValue; 0)
		ARRAY LONGINT:C221($_al_ParameterValue; 0)
		ARRAY LONGINT:C221($_al_ParameterValueType; 0)
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 10)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D Local mode scheduler")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 12)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D remote mode scheduler")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 14)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D Remote mode Timeout")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 28)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D server log recording")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 11)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D Server scheduler")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 13)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "4D Server timeout")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 48)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Auto Synchro resources folder")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 66)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Cache unload minimum size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 26)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "cache writing mode")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 17)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Character set")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 24)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client character set")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 40)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client HTTPS port ID")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 23)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client IP address to listen")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 45)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client log recording")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 25)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client max concurrent Web proc")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 21)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client max Web requests size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 20)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client maximum Web process")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 19)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client minimum Web process")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 22)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client port ID")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 35)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client Server port ID")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 30)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Client Web log recording")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 9)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Database cache size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 34)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Debug log recording")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 79)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Diagnostic log recording")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 0)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D disabled")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 74)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D get active status")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 1)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D hardware")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 2)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D hardware SVG and editors")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 5)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D mixed")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 3)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D software")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 4)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D software SVG and editors")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 69)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Direct2D status")
		
		
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 54)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Idle connections timeout")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 37)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Invert objects")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 16)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "IP Address to listen")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 85)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "JSON use local time")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 80)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Log command list")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 61)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Maximum temporary memory size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 7)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Maximum Web process")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 27)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Maximum Web requests size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 6)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Minimum Web process")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 47)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Order by formula on server")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 55)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "PHP interpreter IP address")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 56)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "PHP interpreter port")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 58)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "PHP max requests")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 57)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "PHP number of children")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 60)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "PHP use external interpreter")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 15)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Port ID")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 49)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Query by formula joins")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 46)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Query by formula on server")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 53)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Server base process stack size")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 81)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Spellchecker")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 43)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "SQL autocommit")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 44)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "SQL engine case sensitivity")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 64)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "SSL cipher list")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 31)  //PER TABLE
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Table sequence number")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 41)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Unicode mode")
		APPEND TO ARRAY:C911($_at_ParameterValue; "")
		APPEND TO ARRAY:C911($_al_ParameterValue; 0)
		APPEND TO ARRAY:C911($_al_ParameterValueType; Is longint:K8:6)
		APPEND TO ARRAY:C911($_al_DatabaseParameters; 8)
		APPEND TO ARRAY:C911($_at_DatabaseParameterNames; "Web conversion mode")
		
		ARRAY TEXT:C222($_at_ComponentsList; 0)
		SORT ARRAY:C229($_al_DatabaseParameters; $_at_DatabaseParameterNames; $_al_ParameterValueType; $_al_ParameterValue; $_at_ParameterValue)
		
		
		For ($_l_TableIndex; 1; Size of array:C274($_al_DatabaseParameters))
			If ($_al_DatabaseParameters{$_l_TableIndex}#31)
				
				If ($_al_ParameterValueType{$_l_TableIndex}=Is text:K8:3)
					
					
					$_al_ParameterValue{$_l_TableIndex}:=Get database parameter:C643($_al_DatabaseParameters{$_l_TableIndex}; $_at_ParameterValue{$_l_TableIndex})
					
				Else 
					Case of 
						: ($_al_DatabaseParameters{$_l_TableIndex}=64) | ($_al_DatabaseParameters{$_l_TableIndex}=80)
							$_al_ParameterValue{$_l_TableIndex}:=Get database parameter:C643($_al_DatabaseParameters{$_l_TableIndex}; $_at_ParameterValue{$_l_TableIndex})
						: ($_al_DatabaseParameters{$_l_TableIndex}=0) | ($_al_DatabaseParameters{$_l_TableIndex}=1) | ($_al_DatabaseParameters{$_l_TableIndex}=2) | ($_al_DatabaseParameters{$_l_TableIndex}=3) | ($_al_DatabaseParameters{$_l_TableIndex}=4) | ($_al_DatabaseParameters{$_l_TableIndex}=5)
							//No point in asking this under OSX
							$_l_Platform:=0
							
							//_O_PLATFORM PROPERTIES($_l_Platform)
							Get_PlatformProperty("Platform"; ->$_l_Platform)
							If ($_l_Platform=3)
								$_al_ParameterValue{$_l_TableIndex}:=Get database parameter:C643($_al_DatabaseParameters{$_l_TableIndex})
							End if 
						Else 
							$_al_ParameterValue{$_l_TableIndex}:=Get database parameter:C643($_al_DatabaseParameters{$_l_TableIndex})
							
					End case 
				End if 
			End if 
		End for 
		C_OBJECT:C1216($_Obj_DatabaseParameters)
		CLEAR VARIABLE:C89($_Obj_DatabaseParameters)
		For ($_l_TableIndex; 1; Size of array:C274($_at_ParameterValue))
			If ($_al_ParameterValueType{$_l_TableIndex}=Is text:K8:3)
				
				OB SET:C1220($_Obj_DatabaseParameters; $_at_DatabaseParameterNames{$_l_TableIndex}; $_at_ParameterValue{$_l_TableIndex})
			Else 
				OB SET:C1220($_Obj_DatabaseParameters; $_at_DatabaseParameterNames{$_l_TableIndex}; $_al_ParameterValue{$_l_TableIndex})
			End if 
			
		End for 
		$_l_LastTableNumber:=Get last table number:C254
		C_OBJECT:C1216($_Obj_Structure)
		CLEAR VARIABLE:C89($_Obj_Structure)
		
		For ($_l_TableIndex; 1; $_l_LastTableNumber)
			If (Is table number valid:C999($_l_TableIndex))
				$_Txt_tableName:=Table name:C256($_l_TableIndex)
				GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_FieldInvisible; $_Bo_trigSaveNew; $_Bo_trigSave; $_Bo_TrigDel)
				$_l_SequenceNumber:=Get database parameter:C643(Table:C252($_l_TableIndex)->; Table sequence number:K37:31)
				C_OBJECT:C1216($_Obj_TableProperties)
				CLEAR VARIABLE:C89($_Obj_TableProperties)
				OB SET:C1220($_Obj_TableProperties; "invisible"; $_bo_FieldInvisible)
				OB SET:C1220($_Obj_TableProperties; "Trigger Save New"; $_Bo_trigSaveNew)
				OB SET:C1220($_Obj_TableProperties; "Trigger Save"; $_Bo_trigSave)
				OB SET:C1220($_Obj_TableProperties; "Trigger Delete"; $_Bo_TrigDel)
				OB SET:C1220($_Obj_TableProperties; "Sequence Number"; $_l_SequenceNumber)
				
				OB SET:C1220($_Obj_Structure; $_Txt_tableName; $_Obj_TableProperties)
				C_OBJECT:C1216($_Obj_Fields)
				CLEAR VARIABLE:C89($_Obj_Fields)
				$_l_lastFieldNumber:=Get last field number:C255($_l_TableIndex)
				For ($_l_TableIndex2; 1; $_l_lastFieldNumber)
					If (Is field number valid:C1000($_l_TableIndex; $_l_TableIndex2))
						GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_TableIndex2; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						GET FIELD ENTRY PROPERTIES:C685($_l_TableIndex; $_l_TableIndex2; $_Txt_ListName; $_Bo_Mandatory; $_Bo_NonEnterable; $_Bo_NonModifiable)
						GET RELATION PROPERTIES:C686($_l_TableIndex; $_l_TableIndex2; $_l_OneTable; $_l_OneField; $_l_ChoiceField; $_Bo_AutoOne; $_Bo_AutoMany)
						C_OBJECT:C1216($_Obj_FieldProperties)
						CLEAR VARIABLE:C89($_Obj_FieldProperties)
						OB SET:C1220($_Obj_FieldProperties; "Field Type"; $_l_FieldType; "Field Length"; $_l_FieldLength; "Indexed"; $_bo_FieldIndexed; "Unique"; $_bo_FieldUnique; "Invisible"; $_bo_FieldInvisible)
						OB SET:C1220($_Obj_FieldProperties; "List Name"; $_Txt_ListName; "Mandatory"; $_Bo_Mandatory; "Non Enterable"; $_Bo_NonEnterable; "Non Modifiable"; $_Bo_NonModifiable)
						If ($_l_OneTable#0)
							OB SET:C1220($_Obj_FieldProperties; "One Table"; $_l_OneTable; "One Field"; $_l_OneField; "Choice Field"; $_l_ChoiceField; "Auto One"; $_Bo_AutoOne; "Auto Many"; $_Bo_AutoMany)
						End if 
						
						$_txt_FieldName:=Field name:C257($_l_TableIndex; $_l_TableIndex2)
						OB SET:C1220($_Obj_Fields; $_txt_FieldName; $_Obj_FieldProperties)
						
						
					End if 
					
				End for 
				OB SET:C1220($_Obj_Structure; $_Txt_tableName+"_FIELDS"; $_Obj_Fields)
			End if 
		End for 
		ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
		ARRAY TEXT:C222($_at_PLugInName; 0)
		PLUGIN LIST:C847($_al_NumberOfPlug; $_at_PLugInName)
		If (Size of array:C274($_al_NumberOfPlug)>0)
			C_OBJECT:C1216($_Obj_PlugIns)
			CLEAR VARIABLE:C89($_Obj_PlugIns)
			
			For ($_l_TableIndex; 1; Size of array:C274($_al_NumberOfPlug))
				OB SET:C1220($_Obj_PlugIns; $_at_PLugInName{$_l_TableIndex}; $_al_NumberOfPlug{$_l_TableIndex})
			End for 
			OB SET:C1220($_Obj_Structure; "PLUG INS"; $_Obj_PlugIns)
		End if 
		ARRAY TEXT:C222($_at_ComponentNames; 0)
		COMPONENT LIST:C1001($_at_ComponentNames)
		If (Size of array:C274($_at_ComponentNames)>0)
			C_OBJECT:C1216($_Obj_Components)
			CLEAR VARIABLE:C89($_Obj_Components)
			For ($_l_TableIndex; 1; Size of array:C274($_at_ComponentNames))
				OB SET:C1220($_Obj_Components; $_at_ComponentNames{$_l_TableIndex}; $_at_ComponentNames{$_l_TableIndex})
			End for 
			OB SET:C1220($_Obj_Structure; "Components"; $_Obj_Components)
		End if 
		$_Txt_CurrentDatabaseLocalizatio:=Get database localization:C1009(Current localization:K5:22)
		$_Txt_DefaultDatabaseLocalizatio:=Get database localization:C1009(Default localization:K5:21)
		$_Txt_InternalDatabaseLocalizati:=Get database localization:C1009(Internal 4D localization:K5:24)
		$_Txt_UserDatabaseLocalization:=Get database localization:C1009(User system localization:K5:23)
		C_OBJECT:C1216($_Obj_Localization)
		CLEAR VARIABLE:C89($_Obj_Localization)
		OB SET:C1220($_Obj_Localization; "Current"; $_Txt_CurrentDatabaseLocalizatio; "Default"; $_Txt_DefaultDatabaseLocalizatio; "Internal"; $_Txt_InternalDatabaseLocalizati; "User"; $_Txt_UserDatabaseLocalization)
		OB SET:C1220($_Obj_Structure; "Localization"; $_Obj_Localization)
		OB SET:C1220($_Obj_Structure; "Database Settings"; $_Obj_DatabaseParameters)
		
		C_TEXT:C284($_Txt_VersionID)
		C_TEXT:C284($_Txt_VersionObject)
		$_Txt_VersionObject:="Version ID"
		///VERSION_GetVersioninformation (->$_Txt_VersionID;->$_Txt_VersionObject)
		//1st check the code exports directory exists
		
		$_t_Databasepath:=Get 4D folder:C485(4)
		$_t_Databasepath:=UTIL_ResolvePathName($_t_Databasepath)
		//1st check the code exports directory exists
		$_t_Databasepath:=$_t_Databasepath+"FUD_CODE_EXPORTS"
		If (Not:C34(Test path name:C476($_t_Databasepath)=0))
			CREATE FOLDER:C475($_t_Databasepath)
		End if 
		//Get the current version ID -which will give us a path to a subfolder(-that is where the document will go so here we just make sure the folder exists)
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;":";"")
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;"/";"_")
		//$_Txt_VersionID:=Replace string($_Txt_VersionID;"\\";"_")
		While (Semaphore:C143("MCR"))
			UTIL_DelayTicks(2)
		End while 
		$_Txt_MethodChangesDocumentName:="Method_Changes_Report_"+$_Txt_VersionID
		$_Txt_MethodChangesDocPath:=$_t_Databasepath+Folder separator:K24:12+$_Txt_MethodChangesDocumentName
		If (Not:C34(Test path name:C476($_Txt_MethodChangesDocPath+".txt")=1))
			$_ti_ChangesDocument:=Create document:C266($_Txt_MethodChangesDocPath+".txt")
			CLOSE DOCUMENT:C267($_ti_ChangesDocument)
			
		End if 
		If (Not:C34(Test path name:C476($_Txt_MethodChangesDocPath+"BINARY.txt")=1))
			$_ti_ChangesDocument2:=Create document:C266($_Txt_MethodChangesDocPath+"BINARY.txt")
			CLOSE DOCUMENT:C267($_ti_ChangesDocument2)
		End if 
		CLEAR SEMAPHORE:C144("MCR")
		$_Txt_methodPathName:=$_t_Databasepath+Folder separator:K24:12+"STRUCTURESETTINGS"
		If ((Test path name:C476($_Txt_methodPathName+".txt")=1))
			//We already have a copy of the structure so now we will compare
			C_BLOB:C604($_Blb_oldStructureblob)
			C_OBJECT:C1216($_Obj_OldStructure; 0)
			
			SET BLOB SIZE:C606($_Blb_oldStructureblob; 0)
			DOCUMENT TO BLOB:C525($_Txt_methodPathName+".txt"; $_Blb_oldStructureblob)
			$_l_offset:=0
			BLOB TO VARIABLE:C533($_Blb_oldStructureblob; $_Obj_OldStructure)
			$_Txt_StructureChanges:=""
			OB GET PROPERTY NAMES:C1232($_Obj_OldStructure; $_at_OldStructureProperties; $_al_PropertyTypes)
			$_l_DatabaseSettings:=Find in array:C230($_at_OldStructureProperties; "Database Settings")
			If ($_l_DatabaseSettings>0)
				If ($_al_PropertyTypes{$_l_DatabaseSettings}=Is object:K8:27)
					C_OBJECT:C1216($_Obj_OLDDatabaseParameters)
					$_Obj_OLDDatabaseParameters:=OB Get:C1224($_Obj_OldStructure; "Database Settings")
					ARRAY TEXT:C222($_at_OldSettingsProperties; 0)
					ARRAY LONGINT:C221($_al_OldSettingsTypes; 0)
					ARRAY TEXT:C222($_at_NewSettingsProperties; 0)
					ARRAY LONGINT:C221($_al_NewSettingsTypes; 0)
					OB GET PROPERTY NAMES:C1232($_Obj_OLDDatabaseParameters; $_at_OldSettingsProperties; $_al_OldSettingsTypes)
					OB GET PROPERTY NAMES:C1232($_Obj_DatabaseParameters; $_at_NewSettingsProperties; $_al_NewSettingsTypes)
					For ($_l_TableIndex; 1; Size of array:C274($_at_OldSettingsProperties))
						If (Find in array:C230($_at_NewSettingsProperties; $_at_OldSettingsProperties{$_l_TableIndex})>0)
							If ($_al_OldSettingsTypes{$_l_TableIndex}=Is longint:K8:6)
								$_l_OldProperty:=0
								$_l_NewProperty:=0
								$_l_OldProperty:=OB Get:C1224($_Obj_OLDDatabaseParameters; $_at_OldSettingsProperties{$_l_TableIndex}; Is text:K8:3)
								$_l_NewProperty:=OB Get:C1224($_Obj_DatabaseParameters; $_at_OldSettingsProperties{$_l_TableIndex}; Is text:K8:3)
								If ($_l_OldProperty#$_l_NewProperty)
									$_Txt_StructureChanges:=$_Txt_StructureChanges+"Database Parameter Changed from "+String:C10($_l_OldProperty)+" to "+String:C10($_l_NewProperty)+Char:C90(13)
								End if 
							Else 
								$_Txt_OldProperty:=""
								$_Txt_NewProperty:=""
								$_Txt_OldProperty:=OB Get:C1224($_Obj_OLDDatabaseParameters; $_at_OldSettingsProperties{$_l_TableIndex}; Is text:K8:3)
								$_Txt_NewProperty:=OB Get:C1224($_Obj_DatabaseParameters; $_at_OldSettingsProperties{$_l_TableIndex}; Is text:K8:3)
								If ($_Txt_OldProperty#$_Txt_NewProperty)
									$_Txt_StructureChanges:=$_Txt_StructureChanges+"Database Parameter Changed from "+$_Txt_OldProperty+" to "+$_Txt_NewProperty+Char:C90(13)
								End if 
							End if 
						Else 
							$_Txt_StructureChanges:=$_Txt_StructureChanges+"Database Parameter "+$_at_OldSettingsProperties{$_l_TableIndex}+"Removed"+Char:C90(13)
						End if 
					End for 
					For ($_l_TableIndex; 1; Size of array:C274($_at_NewSettingsProperties))
						If (Find in array:C230($_at_NewSettingsProperties; $_at_OldSettingsProperties{$_l_TableIndex})<0)
							
							$_Txt_StructureChanges:=$_Txt_StructureChanges+"Database Parameter "+$_at_NewSettingsProperties{$_l_TableIndex}+"Added"+Char:C90(13)
						End if 
					End for 
				End if 
			End if 
			//OB SET($_Obj_Structure;"Localization";$_Obj_Localization)
			$_l_LocalizationSettings:=Find in array:C230($_at_OldStructureProperties; "Localization")
			If ($_l_LocalizationSettings>0)
				If ($_al_PropertyTypes{$_l_LocalizationSettings}=Is object:K8:27)
					C_OBJECT:C1216($_Obj_OLDDatabaseParameters)
					$_Obj_OLDDatabaseLocalization:=OB Get:C1224($_Obj_OldStructure; "Localization"; Is object:K8:27)
					$_Txt_oldCurrentDatabaseLoc:=OB Get:C1224($_Obj_OLDDatabaseLocalization; "Current"; Is text:K8:3)
					$_Txt_oldDefaultDatabaseLoc:=OB Get:C1224($_Obj_OLDDatabaseLocalization; "Default"; Is text:K8:3)
					$_Txt_oldInternalDatabaseLoc:=OB Get:C1224($_Obj_OLDDatabaseLocalization; "Internal"; Is text:K8:3)
					$_Txt_oldUserDatabaseLoc:=OB Get:C1224($_Obj_OLDDatabaseLocalization; "User"; Is text:K8:3)
					$_Txt_CurrentDatabaseLocalizatio:=OB Get:C1224($_Obj_Localization; "Current"; Is text:K8:3)
					$_Txt_DefaultDatabaseLocalizatio:=OB Get:C1224($_Obj_Localization; "Default"; Is text:K8:3)
					$_Txt_InternalDatabaseLocalizati:=OB Get:C1224($_Obj_Localization; "Internal"; Is text:K8:3)
					$_Txt_UserDatabaseLocalization:=OB Get:C1224($_Obj_Localization; "User"; Is text:K8:3)
					If ($_Txt_oldCurrentDatabaseLoc#$_Txt_CurrentDatabaseLocalizatio)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Current Localization Changed from "+$_Txt_oldCurrentDatabaseLoc+" to "+$_Txt_CurrentDatabaseLocalizatio+Char:C90(13)
					End if 
					If ($_Txt_oldDefaultDatabaseLoc#$_Txt_DefaultDatabaseLocalizatio)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Default Localization Changed from "+$_Txt_oldDefaultDatabaseLoc+" to "+$_Txt_DefaultDatabaseLocalizatio+Char:C90(13)
					End if 
					If ($_Txt_oldInternalDatabaseLoc#$_Txt_InternalDatabaseLocalizati)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Internal Localization Changed from "+$_Txt_oldInternalDatabaseLoc+" to "+$_Txt_InternalDatabaseLocalizati+Char:C90(13)
					End if 
					If ($_Txt_oldUserDatabaseLoc#$_Txt_UserDatabaseLocalization)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"User Localization Changed from "+$_Txt_oldUserDatabaseLoc+" to "+$_Txt_UserDatabaseLocalization+Char:C90(13)
					End if 
					
					
				End if 
				
			End if   ///
			//$_Obj_Structure
			$_l_ComponentSettings:=Find in array:C230($_at_OldStructureProperties; "Components")
			If ($_l_ComponentSettings>0)
				C_OBJECT:C1216($_Obj_OldComponents)
				$_Obj_OldComponents:=OB Get:C1224($_Obj_OldStructure; "Components"; Is object:K8:27)
				ARRAY LONGINT:C221($_al_ComponentTypes; 0)
				ARRAY TEXT:C222($_at_oldComponents; 0)
				ARRAY LONGINT:C221($_al_ComponentTypes; 0)
				ARRAY TEXT:C222($_at_ComponentNames; 0)
				OB GET PROPERTY NAMES:C1232($_Obj_OldComponents; $_at_oldComponents; $_al_ComponentTypes)
				OB GET PROPERTY NAMES:C1232($_Obj_Components; $_at_ComponentNames; $_al_ComponentTypes)
				For ($_l_TableIndex; 1; Size of array:C274($_at_oldComponents))
					If (Find in array:C230($_at_ComponentNames; $_at_oldComponents{$_l_TableIndex})<0)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Component "+$_at_oldComponents{$_l_TableIndex}+"Removed"+Char:C90(13)
					End if 
				End for 
				For ($_l_TableIndex; 1; Size of array:C274($_at_ComponentNames))
					If (Find in array:C230($_at_oldComponents; $_at_ComponentNames{$_l_TableIndex})<0)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Component "+$_at_ComponentNames{$_l_TableIndex}+"Added"+Char:C90(13)
					End if 
				End for 
			End if 
			//OB SET($_Obj_Structure;"PLUG INS";$_Obj_PlugIns)
			$_l_PluginSettings:=Find in array:C230($_at_OldStructureProperties; "PLUG INS")
			If ($_l_PluginSettings>0)
				
				C_OBJECT:C1216($_Obj_OldPlugins)
				$_Obj_OldPlugins:=OB Get:C1224($_Obj_OldStructure; "PLUG INS"; Is object:K8:27)
				ARRAY TEXT:C222($_at_oldPlugInProperties; 0)
				ARRAY LONGINT:C221($_al_oldPluginPropTypes; 0)
				ARRAY TEXT:C222($_at_PlugInProperties; 0)
				ARRAY LONGINT:C221($_al_PluginPropTypes; 0)
				
				OB GET PROPERTY NAMES:C1232($_Obj_OldPlugins; $_at_oldPlugInProperties; $_al_oldPluginPropTypes)
				OB GET PROPERTY NAMES:C1232($_Obj_OldPlugins; $_at_PlugInProperties; $_al_PluginPropTypes)
				For ($_l_TableIndex; 1; $_at_oldPlugInProperties)  //we only need to worry about the names here
					If (Find in array:C230($_at_PlugInProperties; $_at_oldPlugInProperties{$_l_TableIndex})<0)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Plug-in "+$_at_oldPlugInProperties{$_l_TableIndex}+"Removed"+Char:C90(13)
					End if 
				End for 
				For ($_l_TableIndex; 1; $_at_PlugInProperties)  //we only need to worry about the names here
					If (Find in array:C230($_at_oldPlugInProperties; $_at_PlugInProperties{$_l_TableIndex})<0)
						$_Txt_StructureChanges:=$_Txt_StructureChanges+"Plug-in "+$_at_PlugInProperties{$_l_TableIndex}+"Added"+Char:C90(13)
					End if 
				End for 
			End if 
			
			For ($_l_TableIndex; 1; Size of array:C274($_at_OldStructureProperties))
				If ($_at_OldStructureProperties{$_l_TableIndex}#"PLUG INS") & ($_at_OldStructureProperties{$_l_TableIndex}#"Components") & ($_at_OldStructureProperties{$_l_TableIndex}#"Localization") & ($_at_OldStructureProperties{$_l_TableIndex}#"Database Settings")
					$_Txt_Property:=$_at_OldStructureProperties{$_l_TableIndex}
					If (Position:C15("_FIELDS"; $_Txt_Property)=0)  //this is a table
						C_OBJECT:C1216($_Obj_oldTableProperties)
						CLEAR VARIABLE:C89($_Obj_oldTableProperties)
						$_Obj_oldTableProperties:=OB Get:C1224($_Obj_OldStructure; $_at_OldStructureProperties{$_l_TableIndex}; Is object:K8:27)
						$_Obj_TableProperties:=OB Get:C1224($_Obj_Structure; $_at_OldStructureProperties{$_l_TableIndex}; Is object:K8:27)
						//
						$_Bo_OldInvisible:=OB Get:C1224($_Obj_oldTableProperties; "invisible"; Is boolean:K8:9)
						$_Bo_OldTrigSaveNew:=OB Get:C1224($_Obj_oldTableProperties; "Trigger Save New"; Is boolean:K8:9)
						$_Bo_OldtrigSave:=OB Get:C1224($_Obj_oldTableProperties; "Trigger Save"; Is boolean:K8:9)
						$_Bo_OldTrigDel:=OB Get:C1224($_Obj_oldTableProperties; "Trigger Delete"; Is boolean:K8:9)
						$_l_OldSequenceNumber:=OB Get:C1224($_Obj_oldTableProperties; "Sequence Number"; Is longint:K8:6)
						$_bo_FieldInvisible:=OB Get:C1224($_Obj_TableProperties; "invisible"; Is boolean:K8:9)
						$_Bo_trigSaveNew:=OB Get:C1224($_Obj_TableProperties; "Trigger Save New"; Is boolean:K8:9)
						$_Bo_trigSave:=OB Get:C1224($_Obj_TableProperties; "Trigger Save"; Is boolean:K8:9)
						$_Bo_TrigDel:=OB Get:C1224($_Obj_TableProperties; "Trigger Delete"; Is boolean:K8:9)
						$_l_SequenceNumber:=OB Get:C1224($_Obj_TableProperties; "Sequence Number"; Is longint:K8:6)
						If ($_bo_FieldInvisible#$_Bo_OldInvisible)
							If ($_bo_FieldInvisible)
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Invisible Changed From False to True"+Char:C90(13)
							Else 
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Invisible Changed From True to False"+Char:C90(13)
							End if 
						End if 
						If ($_Bo_trigSaveNew#$_Bo_OldTrigSaveNew)
							If ($_Bo_trigSaveNew)
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Save new Set to True"+Char:C90(13)
							Else 
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Save new Set to False"+Char:C90(13)
							End if 
						End if 
						If ($_Bo_trigSave#$_Bo_OldtrigSave)
							If ($_Bo_trigSave)
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Save Set to True"+Char:C90(13)
							Else 
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Save Set to False"+Char:C90(13)
							End if 
						End if 
						If ($_Bo_TrigDel#$_Bo_OldTrigDel)
							If ($_Bo_TrigDel)
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Delete Set to True"+Char:C90(13)
							Else 
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Table "+$_at_OldStructureProperties{$_l_TableIndex}+" Trigger on Delete Set to False"+Char:C90(13)
							End if 
						End if 
						//note that we dont compare the value of the sequence number its not really an structural change.
					Else 
						//these are the fields
						$_Txt_tableName:=Replace string:C233($_Txt_Property; "_FIELDS"; "")
						C_OBJECT:C1216($_Obj_oldFieldProperties)
						CLEAR VARIABLE:C89($_Obj_oldFieldProperties)
						C_OBJECT:C1216($_Obj_FieldProperties)
						CLEAR VARIABLE:C89($_Obj_FieldProperties)
						ARRAY TEXT:C222($_at_OldFieldNames; 0)
						ARRAY LONGINT:C221($_al_OldFieldPropTypes; 0)
						ARRAY TEXT:C222($_at_FieldNames; 0)
						ARRAY LONGINT:C221($_al_FieldPropTypes; 0)
						$_Obj_oldFieldProperties:=OB Get:C1224($_Obj_OldStructure; $_at_OldStructureProperties{$_l_TableIndex}; Is object:K8:27)
						$_Obj_FieldProperties:=OB Get:C1224($_Obj_Structure; $_at_OldStructureProperties{$_l_TableIndex}; Is object:K8:27)
						OB GET PROPERTY NAMES:C1232($_Obj_oldFieldProperties; $_at_OldFieldNames; $_al_OldFieldPropTypes)
						OB GET PROPERTY NAMES:C1232($_Obj_FieldProperties; $_at_FieldNames; $_al_FieldPropTypes)
						For ($_l_TableIndex2; 1; Size of array:C274($_at_OldFieldNames))
							If (Find in array:C230($_at_FieldNames; $_at_OldFieldNames{$_l_TableIndex2})>0)
								C_OBJECT:C1216($_Obj_FieldProperties; $_Obj_oldFieldProperties)
								CLEAR VARIABLE:C89($_Obj_FieldProperties)
								CLEAR VARIABLE:C89($_Obj_oldFieldProperties)
								$_Obj_oldFieldProperties:=OB Get:C1224($_Obj_oldFieldProperties; $_at_OldFieldNames{$_l_TableIndex2}; Is object:K8:27)
								$_Obj_FieldProperties:=OB Get:C1224($_Obj_FieldProperties; $_at_OldFieldNames{$_l_TableIndex2}; Is object:K8:27)
								//
								$_l_oldFieldType:=OB Get:C1224($_Obj_oldFieldProperties; "Field Type"; Is longint:K8:6)
								$_l_oldFieldLength:=OB Get:C1224($_Obj_oldFieldProperties; "Field Length"; Is longint:K8:6)
								$_Bo_oldindex:=OB Get:C1224($_Obj_oldFieldProperties; "Indexed"; Is boolean:K8:9)
								$_Bo_oldUnique:=OB Get:C1224($_Obj_oldFieldProperties; "Unique"; Is boolean:K8:9)
								$_Bo_OldInvisible:=OB Get:C1224($_Obj_oldFieldProperties; "Invisible"; Is boolean:K8:9)
								$_Txt_oldListName:=OB Get:C1224($_Obj_oldFieldProperties; "List Name"; Is text:K8:3)
								$_Bo_oldMandatory:=OB Get:C1224($_Obj_oldFieldProperties; "Mandatory"; Is boolean:K8:9)
								$_Bo_oldNonEnterable:=OB Get:C1224($_Obj_oldFieldProperties; "Non Enterable"; Is boolean:K8:9)
								$_Bo_oldNonModifiable:=OB Get:C1224($_Obj_oldFieldProperties; "Non Modifiable"; Is boolean:K8:9)
								$_l_oldOneTable:=OB Get:C1224($_Obj_oldFieldProperties; "One Table"; Is longint:K8:6)
								$_l_oldOneField:=OB Get:C1224($_Obj_oldFieldProperties; "One Field"; Is longint:K8:6)
								$_l_oldChoiceField:=OB Get:C1224($_Obj_oldFieldProperties; "Choice Field"; Is longint:K8:6)
								$_Bo_oldAutoOne:=OB Get:C1224($_Obj_oldFieldProperties; "Auto One"; Is boolean:K8:9)
								$_Bo_oldAutoMany:=OB Get:C1224($_Obj_oldFieldProperties; "Auto Many"; Is boolean:K8:9)
								///
								$_l_FieldType:=OB Get:C1224($_Obj_FieldProperties; "Field Type"; Is longint:K8:6)
								$_l_FieldLength:=OB Get:C1224($_Obj_FieldProperties; "Field Length"; Is longint:K8:6)
								$_bo_FieldIndexed:=OB Get:C1224($_Obj_FieldProperties; "Indexed"; Is boolean:K8:9)
								$_bo_FieldUnique:=OB Get:C1224($_Obj_FieldProperties; "Unique"; Is boolean:K8:9)
								$_bo_FieldInvisible:=OB Get:C1224($_Obj_FieldProperties; "Invisible"; Is boolean:K8:9)
								$_Txt_ListName:=OB Get:C1224($_Obj_FieldProperties; "List Name"; Is text:K8:3)
								$_Bo_Mandatory:=OB Get:C1224($_Obj_FieldProperties; "Mandatory"; Is boolean:K8:9)
								$_Bo_NonEnterable:=OB Get:C1224($_Obj_FieldProperties; "Non Enterable"; Is boolean:K8:9)
								$_Bo_NonModifiable:=OB Get:C1224($_Obj_FieldProperties; "Non Modifiable"; Is boolean:K8:9)
								$_l_OneTable:=OB Get:C1224($_Obj_FieldProperties; "One Table"; Is longint:K8:6)
								$_l_OneField:=OB Get:C1224($_Obj_FieldProperties; "One Field"; Is longint:K8:6)
								$_l_ChoiceField:=OB Get:C1224($_Obj_FieldProperties; "Choice Field"; Is longint:K8:6)
								$_Bo_AutoOne:=OB Get:C1224($_Obj_FieldProperties; "Auto One"; Is boolean:K8:9)
								$_Bo_AutoMany:=OB Get:C1224($_Obj_FieldProperties; "Auto Many"; Is boolean:K8:9)
								
								If ($_Bo_AutoMany#$_Bo_oldAutoMany)
									If ($_Bo_oldAutoMany)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Auto-Many to Non-Auto-many"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Auto-many to Auto-many"+Char:C90(13)
									End if 
								End if 
								If ($_Bo_AutoOne#$_Bo_oldAutoOne)
									If ($_Bo_oldAutoOne)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Auto-one to Non-Auto-one"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Auto-one to Auto-one"+Char:C90(13)
									End if 
								End if 
								If ($_l_ChoiceField#$_l_oldChoiceField)
									Case of 
										: ($_l_oldChoiceField>0)
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Choice Field "+String:C10($_l_oldChoiceField)+" removed"+Char:C90(13)
										: ($_l_ChoiceField>0)
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Choice Field "+String:C10($_l_ChoiceField)+" added"+Char:C90(13)
											
										Else 
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Choice Field Changed from "+String:C10($_l_oldChoiceField)+" to "+String:C10($_l_ChoiceField)+Char:C90(13)
									End case 
								End if 
								If ($_bo_FieldIndexed#$_Bo_oldindex)
									If ($_Bo_oldindex)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Indexes to Non-indexed"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Indexed to indexed"+Char:C90(13)
									End if 
								End if 
								If ($_bo_FieldInvisible#$_Bo_OldInvisible)
									If ($_Bo_OldInvisible)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Invisble to Not-Invisible"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Not-invisible to Invisible"+Char:C90(13)
									End if 
								End if 
								If ($_Bo_Mandatory#$_Bo_oldMandatory)
									If ($_Bo_oldMandatory)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Mandatory to Non-Mandatory"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Mandatory to Mandatory"+Char:C90(13)
									End if 
								End if 
								If ($_Bo_NonEnterable#$_Bo_oldNonEnterable)
									If ($_Bo_NonEnterable)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Enterable to Non-Enterable"+Char:C90(13)
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Enterable to Enterable"+Char:C90(13)
									End if 
								End if 
								If ($_Bo_NonModifiable#$_Bo_oldNonModifiable)
									If ($_Bo_NonModifiable)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Modifiable to Non-Modifiable"+Char:C90(13)
										
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from Non-Modifiable to Modifiable"+Char:C90(13)
									End if 
								End if 
								If ($_bo_FieldUnique#$_Bo_oldUnique)
									If ($_bo_FieldUnique)
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from non-unique to unique"+Char:C90(13)
										
									Else 
										$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Changed from unique to non-unique"+Char:C90(13)
									End if 
								End if 
								If ($_l_FieldLength#$_l_oldFieldLength)  //unlikely as i dont use string fields
									$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Length Changed from :"+String:C10($_l_oldFieldLength)+" to "+String:C10($_l_FieldLength)+Char:C90(13)
									
								End if 
								If ($_l_FieldType#$_l_oldFieldType)
									
									$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Type Changed from : "+String:C10($_l_oldFieldType)+" to "+String:C10($_l_FieldType)+Char:C90(13)
									
									
								End if 
								If ($_l_OneField#$_l_oldOneField)
									Case of 
										: ($_l_OneField=0)
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Relation Removed Table number: "+String:C10($_l_oldOneTable)+" Field Number: "+String:C10($_l_oldOneField)+Char:C90(13)
											
										: ($_l_oldOneField=0)
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Relation Added Table number: "+String:C10($_l_OneTable)+" Field Number: "+String:C10($_l_OneField)+Char:C90(13)
											
										Else 
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Relation Changed from Table number: "+String:C10($_l_oldOneTable)+" Field Number: "+String:C10($_l_oldOneField)+" to Table number:"+String:C10($_l_OneTable)+" Field Number: "+String:C10($_l_OneField)+Char:C90(13)
											
									End case 
								End if 
								If ($_Txt_ListName#$_Txt_oldListName)
									Case of 
										: ($_Txt_oldListName="")
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Attached list "+$_Txt_ListName+" added"+Char:C90(13)
										: ($_Txt_ListName="")
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Attached list "+$_Txt_oldListName+" removed"+Char:C90(13)
											
										Else 
											$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Attached list changed from "+$_Txt_oldListName+" to "+$_Txt_ListName+Char:C90(13)
									End case 
								End if 
								
							Else 
								
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_OldFieldNames{$_l_TableIndex2}+" Has been deleted"+Char:C90(13)
							End if 
						End for 
						//Now just find any fields added
						For ($_l_TableIndex2; 1; Size of array:C274($_at_FieldNames))
							If (Find in array:C230($_at_OldFieldNames; $_at_FieldNames{$_l_TableIndex2})<0)
								$_Txt_StructureChanges:=$_Txt_StructureChanges+"Field "+$_Txt_tableName+" "+$_at_FieldNames{$_l_TableIndex2}+" Has been added"+Char:C90(13)
							End if 
						End for 
					End if 
				End if 
			End for 
			
			If ($_Txt_StructureChanges#"")
				//if the structure is modified we write that into the changes document as well
				//read the changes document and write this into it.
				
				//
				C_LONGINT:C283($_l_MethodStamp)
				ARRAY TEXT:C222($_at_ChangesDocument; 0)
				ARRAY TEXT:C222($_at_DocofChanges; 0)
				ARRAY TEXT:C222($_at_ChangesList; 0)
				ARRAY LONGINT:C221($_al_changesDates; 0)
				SET BLOB SIZE:C606($_Blb_DocAsBlob; 0)
				$_Txt_DocumentText:=""
				DOCUMENT TO BLOB:C525($_Txt_MethodChangesDocPath+"BINARY.txt"; $_Blb_DocAsBlob)
				$_l_offset:=0
				If (BLOB size:C605($_Blb_DocAsBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_l_ElementCount; $_l_offset)  //How many lines
				Else 
					$_l_ElementCount:=0
				End if 
				ARRAY TEXT:C222($_at_MethodNames; 0)
				ARRAY TEXT:C222($_at_MethodCodes; 0; 0)
				ARRAY TEXT:C222($_at_MethodChanges; 0; 0)
				ARRAY LONGINT:C221($_al_MethodStamps; 0; 0)
				ARRAY TEXT:C222($_at_MethodNames; $_l_ElementCount)
				ARRAY TEXT:C222($_at_MethodCodes; $_l_ElementCount; 0)
				ARRAY TEXT:C222($_at_MethodChanges; $_l_ElementCount; 0)
				ARRAY LONGINT:C221($_al_MethodStamps; $_l_ElementCount; 0)
				$_l_CUrrentElement:=0
				$_Txt_MethodName:=""
				Repeat 
					$_l_CUrrentElement:=$_l_CUrrentElement+1
					If (BLOB size:C605($_Blb_DocAsBlob)>$_l_offset)
						BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_Txt_MethodName; $_l_offset)
						BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_l_ChangesCount; $_l_offset)
						$_l_TableIndex4:=Find in array:C230($_at_MethodNames; $_Txt_MethodName)
						$_l_OldCurrentElement:=0
						If ($_l_TableIndex4>0)
							//
							$_l_OldCurrentElement:=$_l_CUrrentElement
							$_l_CUrrentElement:=$_l_TableIndex4
						End if 
						If ($_l_CUrrentElement>Size of array:C274($_at_MethodNames))  //this would be a fault!
							APPEND TO ARRAY:C911($_at_MethodNames; $_Txt_MethodName)
							INSERT IN ARRAY:C227($_at_MethodCodes; Size of array:C274($_at_MethodCodes)+1; 1)
							INSERT IN ARRAY:C227($_al_MethodStamps; Size of array:C274($_al_MethodStamps)+1; 1)
							INSERT IN ARRAY:C227($_at_MethodChanges; Size of array:C274($_at_MethodChanges)+1; 1)
							
						Else 
							$_at_MethodNames{$_l_CUrrentElement}:=$_Txt_MethodName
							
						End if 
						For ($_l_TableIndex; 1; $_l_ChangesCount)
							BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_l_MethodStamp; $_l_offset)
							APPEND TO ARRAY:C911($_al_MethodStamps{$_l_CUrrentElement}; $_l_MethodStamp)
						End for 
						For ($_l_TableIndex; 1; $_l_ChangesCount)
							BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_Txt_MethodCode; $_l_offset)
							APPEND TO ARRAY:C911($_at_MethodCodes{$_l_CUrrentElement}; $_Txt_MethodCode)
						End for 
						For ($_l_TableIndex; 1; $_l_ChangesCount)
							BLOB TO VARIABLE:C533($_Blb_DocAsBlob; $_Txt_Methodnotes; $_l_offset)
							APPEND TO ARRAY:C911($_at_MethodChanges{$_l_CUrrentElement}; $_Txt_Methodnotes)
						End for 
						$_l_TableIndex4:=Find in array:C230($_at_MethodNames; $_Txt_MethodName)
						$_l_OldCurrentElement:=0
						If ($_l_TableIndex4>0)
							
							$_l_OldCurrentElement:=$_l_CUrrentElement
							$_l_CUrrentElement:=$_l_TableIndex4
						End if 
					End if 
				Until (BLOB size:C605($_Blb_DocAsBlob)<=$_l_offset)
				$_l_TableIndex2:=Find in array:C230($_at_MethodNames; "STRUCTURESETTINGS")
				If ($_l_TableIndex2<0)
					APPEND TO ARRAY:C911($_at_MethodNames; "STRUCTURESETTINGS")
					INSERT IN ARRAY:C227($_at_MethodCodes; Size of array:C274($_at_MethodCodes)+1; 1)
					INSERT IN ARRAY:C227($_at_MethodChanges; Size of array:C274($_at_MethodChanges)+1; 1)
					INSERT IN ARRAY:C227($_al_MethodStamps; Size of array:C274($_al_MethodStamps)+1; 1)
					$_l_TableIndex2:=Size of array:C274($_at_MethodNames)
					
				End if 
				$_l_TableIndex3:=Find in array:C230($_al_MethodStamps{$_l_TableIndex2}; 0)
				If ($_l_TableIndex3<0)
					APPEND TO ARRAY:C911($_at_MethodCodes{$_l_TableIndex2}; "")
					APPEND TO ARRAY:C911($_at_MethodChanges{$_l_TableIndex2}; $_Txt_StructureChanges)
					APPEND TO ARRAY:C911($_al_MethodStamps{$_l_TableIndex2}; DATA_CreateTimeStamp(Current date:C33; Current time:C178))
				Else 
					$_at_MethodCodes{$_l_TableIndex2}{$_l_TableIndex3}:=""
					$_at_MethodChanges{$_l_TableIndex2}{$_l_TableIndex3}:=$_Txt_StructureChanges
					$_al_MethodStamps{$_l_TableIndex2}{$_l_TableIndex3}:=DATA_CreateTimeStamp(Current date:C33; Current time:C178)
					
				End if 
				
				
				If (Not:C34(Test path name:C476($_t_Databasepath+Folder separator:K24:12+"Previous_Versions")=0))
					CREATE FOLDER:C475($_t_Databasepath+Folder separator:K24:12+"Previous_Versions")
				End if 
				$_Txt_AddtoName:=" "+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
				$_Txt_AddtoName:=Replace string:C233($_Txt_AddtoName; ":"; "")
				$_Txt_AddtoName:=Replace string:C233($_Txt_AddtoName; "/"; "_")
				$_Bo_Exit:=False:C215
				$_l_Retries:=0
				Repeat 
					If (Not:C34(Test path name:C476($_t_Databasepath+Folder separator:K24:12+"Previous_Versions"+Folder separator:K24:12+"STRUCTURESETTINGS"+$_Txt_AddtoName+".txt")=1))
						MOVE DOCUMENT:C540($_Txt_methodPathName+".txt"; $_t_Databasepath+Folder separator:K24:12+"Previous_Versions"+Folder separator:K24:12+"STRUCTURESETTINGS"+$_Txt_AddtoName+".txt")
						$_Bo_Exit:=True:C214
					Else 
						If ($_l_Retries=0)
							$_Txt_AddtoName:=$_Txt_AddtoName+"_1"
							$_l_Retries:=$_l_Retries+1
						Else 
							$_Txt_Replace:="_"+String:C10($_l_Retries)
							$_Txt_AddtoName:=Substring:C12($_Txt_AddtoName; 1; (Length:C16($_Txt_AddtoName))-Length:C16($_Txt_Replace))
							$_Txt_AddtoName:=$_Txt_AddtoName+" "+String:C10($_l_Retries)
							$_l_Retries:=$_l_Retries+1
							$_Bo_Exit:=False:C215
						End if 
					End if 
				Until ($_Bo_Exit)
				C_BLOB:C604($_Blb_ObjectStructure)
				SET BLOB SIZE:C606($_Blb_ObjectStructure; 0)
				VARIABLE TO BLOB:C532($_Obj_Structure; $_Blb_ObjectStructure)
				$_ti_StructureDocument:=Create document:C266($_t_Databasepath+Folder separator:K24:12+"STRUCTURESETTINGS"+".txt")  //overwrite the document
				CLOSE DOCUMENT:C267($_ti_StructureDocument)
				BLOB TO DOCUMENT:C526(document; $_Blb_ObjectStructure)
				
				$_ti_ChangesDocument:=Create document:C266($_Txt_MethodChangesDocPath+".txt")
				SET BLOB SIZE:C606($_Blb_DocAsBlob; 0)
				$_l_ElementCount:=Size of array:C274($_at_MethodNames)
				VARIABLE TO BLOB:C532($_l_ElementCount; $_Blb_DocAsBlob; *)
				For ($_l_TableIndex; 1; Size of array:C274($_at_MethodNames))
					If ($_at_MethodNames{$_l_TableIndex}#"")
						VARIABLE TO BLOB:C532($_at_MethodNames{$_l_TableIndex}; $_Blb_DocAsBlob; *)
						SEND PACKET:C103($_ti_ChangesDocument; $_at_MethodNames{$_l_TableIndex}+Char:C90(13))
						$_l_TableIndex3:=Find in array:C230($_al_MethodStamps{$_l_TableIndex}; 0)
						If ($_l_TableIndex3>0)
							$_l_ChangesCount:=$_l_TableIndex3-1
						Else 
							$_l_ChangesCount:=Size of array:C274($_at_MethodCodes{$_l_TableIndex})
						End if 
						VARIABLE TO BLOB:C532($_l_ChangesCount; $_Blb_DocAsBlob; *)
						C_DATE:C307($_Dte_ChangedDate)
						C_TIME:C306($_ti_ChangedTime)
						
						For ($_l_TableIndex2; 1; $_l_ChangesCount)
							DATA_GetDataFromTimeStamp($_al_MethodStamps{$_l_TableIndex}{$_l_TableIndex2}; ->$_Dte_ChangedDate; ->$_ti_ChangedTime)
							
							SEND PACKET:C103($_ti_ChangesDocument; String:C10($_Dte_ChangedDate)+" "+Time string:C180($_ti_ChangedTime)+Char:C90(9)+$_at_MethodChanges{$_l_TableIndex}{$_l_TableIndex2}+Char:C90(13))
							$_l_TimeStamp:=$_al_MethodStamps{$_l_TableIndex}{$_l_TableIndex2}
							VARIABLE TO BLOB:C532($_l_TimeStamp; $_Blb_DocAsBlob; *)
						End for 
						For ($_l_TableIndex2; 1; $_l_ChangesCount)
							$_Txt_MethodCode:=$_at_MethodCodes{$_l_TableIndex}{$_l_TableIndex2}
							VARIABLE TO BLOB:C532($_Txt_MethodCode; $_Blb_DocAsBlob; *)
						End for 
						For ($_l_TableIndex2; 1; $_l_ChangesCount)
							$_Txt_MethodCHANGE:=$_at_MethodChanges{$_l_TableIndex}{$_l_TableIndex2}
							VARIABLE TO BLOB:C532($_Txt_MethodCHANGE; $_Blb_DocAsBlob; *)
						End for 
					End if 
				End for 
				CLOSE DOCUMENT:C267($_ti_ChangesDocument)
				//BLOB TO DOCUMENT ( document ; blob {; *} )
				$_ti_ChangesDocument2:=Create document:C266($_Txt_MethodChangesDocPath+"BINARY.txt")
				CLOSE DOCUMENT:C267($_ti_ChangesDocument)
				BLOB TO DOCUMENT:C526($_Txt_MethodChangesDocPath+"BINARY.txt"; $_Blb_DocAsBlob)
			End if 
		Else 
			C_BLOB:C604($_Blb_ObjectStructure)
			SET BLOB SIZE:C606($_Blb_ObjectStructure; 0)
			VARIABLE TO BLOB:C532($_Obj_Structure; $_Blb_ObjectStructure)
			$_ti_StructureDocument:=Create document:C266($_t_Databasepath+Folder separator:K24:12+"STRUCTURESETTINGS"+".txt")  //overwrite the document
			CLOSE DOCUMENT:C267($_ti_StructureDocument)
			BLOB TO DOCUMENT:C526(document; $_Blb_ObjectStructure)
		End if 
		CLEAR SEMAPHORE:C144("CORE_EditingCodeManager")
		//Test
		If (False:C215)
		End if 
		
End case 
