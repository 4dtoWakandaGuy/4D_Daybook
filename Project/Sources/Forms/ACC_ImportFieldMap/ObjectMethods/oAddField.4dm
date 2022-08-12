If (False:C215)
	//object Method Name: Object Name:      ACC_ImportFieldMap.oAddField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2012 14:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_Lb_StatementMap;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_FieldNames;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	C_POINTER:C301($_ptr_array; $_ptr_DropDown)
	C_TEXT:C284($_t_oldMethodName; ACC_t_editType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportFieldMap/oAddField"; Form event code:C388)
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
LISTBOX GET ARRAYS:C832(*; "oListBoxFieldMap"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
If (Size of array:C274($_at_ColumnNames)>0)
	Case of 
		: (ACC_t_editType="CSV")
			
			Gen_Alert("Note that the CSV field names are not verified on import. but the import order of the fields and their association with the internal fields is critical")
			LISTBOX INSERT ROWS:C913(ACC_Lb_StatementMap; 9999)
			$_ptr_array:=$_aptr_ColumnVariables{1}
			
			Case of 
				: (ACC_t_editType="CSV")
					
					LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
					$_ptr_DropDown:=->ACC_at_DaybookFields
				: (ACC_t_editType="QIF")
					$_ptr_DropDown:=->ACC_at_QIFDBFields
					LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_QIFFields; ->ACC_at_QIFDBFields)
					LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
					
			End case 
			LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 1)
			LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 2)
			LB_SetChoiceList("ABC_FBFields"; ->ACC_at_FieldNames; $_ptr_DropDown)
			EDIT ITEM:C870(*; $_at_ColumnNames{1}; 1)
			
		Else 
			Gen_Alert("Note that the QIF field names are for your indentification only. but the import order of the fields and their association with the internal fields is critical")
			
	End case 
End if 
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.oAddField"; $_t_oldMethodName)
