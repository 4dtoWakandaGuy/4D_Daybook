If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oListboxOutputForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2012 09:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY PICTURE(DB_apic_SetPicture;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	ARRAY TEXT:C222($_at_ActiveTypes; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
	ARRAY TEXT:C222($_at_FormatNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_OptionKey; $_bo_ProcessVisible; DB_bo_AutorelationsTemp; DB_bo_DisplaySelections; SEL_SelectionsShare)
	C_LONGINT:C283($_l_ArraySIze; $_l_ColumnNumber; $_l_ColumnsIndex; $_l_ColumnWIdth; $_l_CurrentSortColumn; $_l_CurrentSortSetting; $_l_Event; $_l_FIeldNumber; $_l_FormRow; $_l_IgnoreColumnsCount; $_l_Index)
	C_LONGINT:C283($_l_LayoutColumnNumber; $_l_listboxWidth; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_objectTop; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_SelectedColumn; $_l_SelectedRow)
	C_LONGINT:C283($_l_SizeofArray; $_l_SortDirection; $_l_SortFieldNumber; $_l_SourceProcess; $_l_SourceRow; $_l_TableNumber; $_l_TableRow; $0; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; FS_l_SortDirection)
	C_LONGINT:C283(LB_l_CurrentSortColumn; LB_l_LastRow; SEL_configselection)
	C_PICTURE:C286($_pic_NUL; DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfColumnFormulas; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_Ptr_ColumnHeaderVar; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_ptr_SourceObject; $_ptr_Table)
	C_REAL:C285(DB_l_newSetClass)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDefinitionsName; $_t_CurrentOutputform; $_t_CurrentUserDefs; $_t_DocumentPath; $_t_DocumentType; $_t_oldMethodName; $_t_processName; $_t_VariableName; DB_t_CurrentContext; SM_t_loadedsetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oListboxOutputForm"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Header Click:K2:40)  //Column sort
		//get sort column and store it
		$_l_TableRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_TableRow>0)  //it shoud be!
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_TableRow}
			LB_l_LastRow:=0
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FIeldNumber)
			$_l_SelectedRow:=Self:C308->
			$_l_CurrentSortColumn:=LB_GetColumn(->DB_l_LBOutputForm; ""; $_t_VariableName)
			LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
			//``
			If (Not:C34(<>FS_bo_FSettingsLoaded))
				FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
			End if 
			$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
			$_bo_OptionKey:=Gen_Option
			
			$_l_ColumnNumber:=$_l_CurrentSortColumn
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			If (DB_t_CurrentContext#"")
				$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+DB_t_CurrentContext
			End if 
			$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
			LISTBOX GET ARRAYS:C832($_Ptr_ListBoxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
			$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
			If (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
				//this allows for different sort prefs for different views
				//these use the same form but are different processes
				PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
				$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+$_t_processName
				If (Length:C16($_t_CurrentDefinitionsName)>55)
					$_t_CurrentDefinitionsName:=Substring:C12($_t_CurrentDefinitionsName; 1; 55)
				End if 
				
			End if 
			$_l_Retries:=0
			While (Semaphore:C143("$WriteFormsortPref"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			$_l_FormRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
			$_Ptr_ColumnHeaderVar:=$_aptr_HeaderVariables{$_l_CurrentSortColumn}
			
			$_l_CurrentSortSetting:=$_Ptr_ColumnHeaderVar->
			If ($_l_CurrentSortSetting=1)
				If (FS_l_SortDirection<0)
					$_l_SortDirection:=1
				End if 
			End if 
			If ($_l_CurrentSortSetting=2)
				If (FS_l_SortDirection>0)
					$_l_SortDirection:=-1
				End if 
			End if 
			$_l_SortDirection:=0
			If ($_l_FormRow>0)
				$_l_SortDirection:=$_l_SortDirection
				If ($_l_SortFieldNumber=<>FS_al_FormSortFieldNum{$_l_FormRow}) | ((-Abs:C99($_l_ColumnNumber))=<>FS_al_FormSortFieldNum{$_l_FormRow})
					$_l_SortDirection:=$_l_SortDirection
				Else 
					$_l_SortDirection:=$_l_SortDirection
				End if 
			Else 
				$_l_SortDirection:=1
			End if 
			CLEAR SEMAPHORE:C144("$WriteFormsortPref")
			//Need to test if this is the current sort field
			//remember the sort field for the area?
			If ($_l_TableNumber#DB_l_CurrentDisplayedForm)
				DB_bo_AutorelationsTemp:=True:C214
				SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
			End if 
			
			If ($_l_SortFieldNumber>0) & ($_l_TableNumber>0)
				If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#7) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#3) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#30)
					FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; $_l_SortFieldNumber; $_l_TableNumber; ""; "")
				Else 
					If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)=7)
						FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; -Abs:C99($_l_ColumnNumber); $_l_TableNumber; ""; "")
					End if 
					
				End if 
			End if 
			
			//```
		End if 
	: ($_l_Event=On Double Clicked:K2:5)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		//edit record.
		DB_OutEditRecord(DB_l_CurrentDisplayedForm)
		
		
	: ($_l_Event=On Clicked:K2:4)
	: ($_l_Event=On Column Resize:K2:31)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		LISTBOX GET CELL POSITION:C971(DB_l_LBOutputForm; $_l_SelectedColumn; $_l_SelectedRow)
		LISTBOX GET ARRAYS:C832(DB_l_LBOutputForm; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TableRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_TableRow>0)  //it shoud be!
			READ WRITE:C146([LIST_LAYOUTS:96])
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_TableRow}
			LBi_Resize($_ptr_ListboxSetup)
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_t_CurrentUserDefs:=$_ptr_ArrayReferences->{7}
			LBi_ListFindDup($_t_CurrentDefinitionsName; $_t_CurrentUserDefs)
			$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
			$_l_ArraySize:=$_ptr_ListboxSetup->{2}
			$_ptr_ArrayOfColumnFormulas:=$_ptr_ListboxSetup->{6}
			$_l_SizeofArray:=Size of array:C274($_ptr_ArrayofColumnWIdths->)
			//The column number displayed may not match the sort order on the list layouts..
			
			FIRST RECORD:C50([LIST_LAYOUTS:96])
			COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$TempSelection")
			For ($_l_ColumnsIndex; 1; Size of array:C274($_ptr_ArrayofColumnWIdths->))
				If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_ColumnsIndex})=0) & ($_ptr_ArrayofColumnWIdths->{$_l_ColumnsIndex}#0)
					$_l_IgnoreColumnsCount:=0
					$_l_SelectedColumn:=$_l_ColumnsIndex
					For ($_l_Index; 1; $_l_SelectedColumn)
						If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_Index})#0)
							$_l_IgnoreColumnsCount:=$_l_IgnoreColumnsCount+1
						End if 
						If ($_ptr_ArrayofColumnWIdths->{$_l_Index}=0)  // Zero width columns are invisible so dont get counted
							//$_l_IgnoreColumnsCount:=$_l_IgnoreColumnsCount-1
						End if 
					End for 
					$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_SelectedColumn})
					$_l_LayoutColumnNumber:=$_l_SelectedColumn-$_l_IgnoreColumnsCount
					USE NAMED SELECTION:C332("$TempSelection")
					QUERY SELECTION:C341([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7=$_l_LayoutColumnNumber)
					If ([LIST_LAYOUTS:96]Width:5#$_ptr_ArrayofColumnWIdths->{$_l_SelectedColumn})
						[LIST_LAYOUTS:96]Width:5:=$_ptr_ArrayofColumnWIdths->{$_l_SelectedColumn}
						SAVE RECORD:C53([LIST_LAYOUTS:96])
					End if 
				End if 
			End for 
			UNLOAD RECORD:C212([LIST_LAYOUTS:96])
			READ ONLY:C145([LIST_LAYOUTS:96])
			
			//And write that back to the data
			
		End if 
	: ($_l_Event=On Drag Over:K2:13)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_SourceRow=-1)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$0:=0
				Else 
					$0:=-1
				End if 
			Else 
				$0:=-1
			End if 
		Else 
			If ($_l_SourceProcess=Current process:C322)
				
				$0:=-1
				
			Else 
				$0:=-1
			End if 
		End if 
	: ($_l_Event=On Drop:K2:12)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		If ($_l_SourceRow=-1)
			ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
			ARRAY TEXT:C222($_at_ActiveTypes; 0)
			ARRAY TEXT:C222($_at_FormatNames; 0)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$_t_DocumentPath:=Get file from pasteboard:C976(1)
					$_t_DocumentType:=Substring:C12($_t_DocumentPath; Length:C16($_t_DocumentPath)-2)
					Case of 
						: ($_t_DocumentType="4st")
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SM_t_loadedsetName:="TempSet"
							LOAD SET:C185($_ptr_Table->; SM_t_loadedsetName; $_t_DocumentPath)
							USE SET:C118("TempSet")
							CREATE SET:C116($_ptr_Table->; "DB_NewSet")
							If (OK=1)
								If (DB_bo_DisplaySelections)
									Gen_Confirm("Add this to the selection manager?"; "No"; "Yes")
									If (OK=0)
										
										APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
										APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
										APPEND TO ARRAY:C911(DB_al_SetID; 999999)
										APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
										APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
										
										DB_l_newSetClass:=853
										OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; False:C215)
										OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
										OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
										
										OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
										$_l_listboxWidth:=$_l_ObjectRight-$_l_ObjectLeft
										LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_listboxWidth-(30+20); 0; 0; 0)
										LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
										GOTO OBJECT:C206(DB_lb_Setsandselections)
										$_l_ArraySIze:=Size of array:C274(DB_apic_SetPicture)
										LB_SetScroll(->DB_lb_Setsandselections; $_l_ArraySIze; 0)
										LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_ArraySIze)
										APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
										OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
										OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
									End if 
								End if 
								OK:=1
							End if 
							If (Records in selection:C76($_ptr_Table->)>0)
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
							End if 
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SRCH_Applyfilterstoselection($_ptr_Table)
							DB_SetFormMenuoptions
							DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					End case 
					
				End if 
			Else 
				
			End if 
		Else 
			RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_SourceProcess=Current process:C322)
				
			Else 
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oListboxOutputForm"; $_t_oldMethodName)
