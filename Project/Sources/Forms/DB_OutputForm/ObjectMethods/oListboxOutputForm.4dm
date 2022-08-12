If (False:C215)
	//object Method Name: DB_OutputForm.oListboxOutputForm
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 23:38
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
	ARRAY POINTER:C280($_aptr_ColumnsStyle; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	ARRAY TEXT:C222($_at_Activetypes; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
	ARRAY TEXT:C222($_at_FormatNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_Filter; $_bo_OptionKey; $_Bo_ProcessVisible; $_bo_RelationFound; $_bo_RightClick; $_bo_Search; $_bo_Sort; DB_bo_AutorelationsTemp; DB_bo_DisplaySelections; DB_bo_MouseActive)
	C_BOOLEAN:C305(SEL_SelectionsShare)
	C_DATE:C307(SD2_d_SearchValue; SD2_d_SearchValue2)
	C_LONGINT:C283($_l_ArrayElement; $_l_ArraySize; $_l_Column; $_l_ColumnNumber; $_l_ColumnWIdth; $_l_CurrentSortColumn; $_l_CurrentSortDirection; $_l_CurrentSortSetting; $_l_FieldNumber; $_l_FindRelated; $_l_FormEvent)
	C_LONGINT:C283($_l_IgnoreColumnsCount; $_l_Index; $_l_Indexy; $_l_LastFieldNumber; $_l_mouseButton; $_l_mousex; $_l_Mousey; $_l_NumberofRows; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_ObjectWidth; $_l_OneFIeld; $_l_OneTable; $_l_ProcessState; $_l_ProcessTime; $_l_Row; $_l_SelectedItem; $_l_SortDirection; $_l_SortFieldNumbers; $_l_SourceProcess)
	C_LONGINT:C283($_l_SourceRow; $_l_TableNumber; $_l_Tries; $_l_WIndowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $0; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; FS_l_SortDirection)
	C_LONGINT:C283(LB_l_CurrentSortColumn; LB_l_LastRow; SD2_l_False; SD2_l_SearchValue2; SD2_l_True; SEL_configselection; SRCH_l_FieldType)
	C_PICTURE:C286(DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayReferences; $_Ptr_Field; $_ptr_FormulaArray; $_Ptr_HeaderButton; $_ptr_ListboxArea; $_Ptr_ListboxHeader; $_ptr_ListboxSetup; $_ptr_RelatedField; $_ptr_SourceObject; $_ptr_Table)
	C_POINTER:C301($_ptr_WidthsArray)
	C_REAL:C285(DB_l_newSetClass; SD2_r_SearchValue)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ColumnName; $_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName; $_t_DocumentPath; $_t_DocumentType; $_t_FieldName; $_t_ListboxHeaderName; $_t_OldMethodName; $_t_ProcessName; $_t_TableName)
	C_TEXT:C284($_t_VariableName; DB_t_CurrentContext; SD2_t_SearchValue; SD2_t_SearchValue2; SM_t_loadedsetName; SRCH_t_FieldName; SRCH_t_Prompt2; SRCH_t_SearchValue)
	C_TIME:C306(SD2_ti_SearchValue; SD2_ti_SearchValue2)
End if 
//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oListboxOutputForm"; Form event code:C388)
$_l_FormEvent:=Form event code:C388

Case of 
		
		
	: ($_l_FormEvent=On Mouse Leave:K2:34)
		
		
		DB_bo_MouseActive:=False:C215
	: ($_l_FormEvent=On Mouse Move:K2:35)
		
		
		
		LBI_HandleRollover(DB_bo_MouseActive; "oListboxOutputForm"; ->DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm; ->DB_aptr_ContextPointers)
		
	: ($_l_FormEvent=On Mouse Enter:K2:33)  //Column sort
		
		
		DB_bo_MouseActive:=True:C214
		LBI_HandleRollover(DB_bo_MouseActive; "oListboxOutputForm"; ->DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm; ->DB_aptr_ContextPointers)
		
		//
		
		
	: ($_l_FormEvent=On Header Click:K2:40)  //Column sort
		
		//get sort column and store it
		$_bo_RightClick:=Right click:C712 | Macintosh control down:C544
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WIndowBottom)
		GET MOUSE:C468($_l_mousex; $_l_Mousey; $_l_mouseButton)
		
		DB_bo_MouseActive:=False:C215
		$_l_ArrayElement:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_ArrayElement>0)  //& (False)  //it shoud be!
			// Get the pointer to the clicked Listbox header
			$_Ptr_ListboxHeader:=OBJECT Get pointer:C1124(Object current:K67:2)
			// Get the name of the clicked Listbox header from the object pointer
			$_t_ListboxHeaderName:=OBJECT Get title:C1068($_Ptr_ListboxHeader->)
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ArrayElement}
			LB_l_LastRow:=0
			RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FieldNumber)
			$_l_Row:=Self:C308->
			$_l_CurrentSortColumn:=LB_GetColumn(->DB_l_LBOutputForm; ""; $_t_ColumnName)
			LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
			//
			If (Not:C34(<>FS_bo_FSettingsLoaded))
				FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
			End if 
			$_bo_OptionKey:=Gen_Option
			$_l_ColumnNumber:=$_l_CurrentSortColumn
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			If (DB_t_CurrentContext#"")
				$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+DB_t_CurrentContext
			End if 
			$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
			LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnsVisible; $_aptr_ColumnsStyle)
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_l_SortFieldNumbers:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
			$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
			//$_l_SortFieldNumbers:=Field($_aptr_ColumnVars{$_l_CurrentSortColumn})
			//$_l_TableNumber:=Table($_aptr_ColumnVars{$_l_CurrentSortColumn})
			If ($_bo_RightClick)
				$_bo_Search:=DB_FieldHasSearch($_l_TableNumber; $_l_SortFieldNumbers)
				
				$_bo_Filter:=DB_FieldHasFilter($_l_TableNumber; $_l_SortFieldNumbers)
			End if 
			
			If (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
				//this allows for different sort prefs for different views
				//these use the same form but are different processes
				PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_Bo_ProcessVisible)
				$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+$_t_ProcessName
				If (Length:C16($_t_CurrentDefinitionsName)>55)
					$_t_CurrentDefinitionsName:=Substring:C12($_t_CurrentDefinitionsName; 1; 55)
				End if 
				
			End if 
			$_l_Tries:=0
			While (Semaphore:C143("$WriteFormsortPref"))
				$_l_Tries:=$_l_Tries+1
				DelayTicks($_l_Tries*2)
			End while 
			$_l_ArrayElement:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
			$_Ptr_HeaderButton:=$_aptr_HeaderVars{$_l_CurrentSortColumn}
			$_l_CurrentSortSetting:=$_Ptr_HeaderButton->
			$_l_CurrentSortDirection:=FS_l_SortDirection
			If ($_bo_RightClick)
				If ($_l_CurrentSortSetting>=2)
					Case of 
						: ($_bo_Search) & ($_bo_Filter)
							$_l_SelectedItem:=Pop up menu:C542("Sort <;Sort >;Search;Filter")
						: ($_bo_Search)
							$_l_SelectedItem:=Pop up menu:C542("Sort <;Sort >;Search")
						: ($_bo_Filter)
							$_l_SelectedItem:=Pop up menu:C542("Sort <;Sort >;Filter")
							If ($_l_SelectedItem=3)
								$_l_SelectedItem:=4
							End if 
					End case 
				Else 
					//$_l_SelectedItem:=Pop up menu("Sort >;Sort <;Search;Filter")
					Case of 
						: ($_bo_Search) & ($_bo_Filter)
							$_l_SelectedItem:=Pop up menu:C542("Sort >;Sort <;Search;Filter")
						: ($_bo_Search)
							$_l_SelectedItem:=Pop up menu:C542("Sort >;Sort <;Search")
						: ($_bo_Filter)
							$_l_SelectedItem:=Pop up menu:C542("Sort >;Sort <;Filter")
							If ($_l_SelectedItem=3)
								$_l_SelectedItem:=4
							End if 
					End case 
				End if 
			Else 
				$_l_SelectedItem:=1
			End if 
			$_bo_Sort:=False:C215
			Case of 
				: ($_l_SelectedItem=1)
					Case of 
						: ($_l_CurrentSortSetting>=2)
							$_l_CurrentSortDirection:=1
						: ($_l_CurrentSortSetting<2)
							$_l_CurrentSortDirection:=2
					End case 
					$_bo_Sort:=True:C214
					$0:=0
				: ($_l_SelectedItem=2)
					$_l_CurrentSortDirection:=$_l_CurrentSortSetting
					$_bo_Sort:=True:C214
					$0:=0
				: ($_l_SelectedItem=3)
					$0:=-1
					$_ptr_Table:=Table:C252($_l_TableNumber)
					$_t_TableName:=DB_GetNormalisedTableName($_ptr_Table)
					$_t_FieldName:=Field name:C257(Field:C253($_l_TableNumber; $_l_SortFieldNumbers))
					$_t_FieldName:=Replace string:C233($_t_FieldName; "_"; " ")
					SRCH_t_Prompt2:="Find "+Uppers2($_t_FieldName; 1)
					SD2_d_SearchValue:=!00-00-00!
					SD2_t_SearchValue:=""
					SD2_r_SearchValue:=0
					SD2_ti_SearchValue:=?00:00:00?
					SD2_l_True:=1
					SD2_l_False:=0
					
					$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SortFieldNumbers)
					SRCH_l_FieldType:=Type:C295($_Ptr_Field->)
					SRCH_t_FieldName:=$_t_FieldName
					Open window:C153($_l_WindowLeft+$_l_mousex; $_l_WindowTop+$_l_Mousey; $_l_WindowLeft+$_l_mousex; $_l_WindowTop+$_l_Mousey; 1)
					DIALOG:C40("DB_minisearch")
					CLOSE WINDOW:C154
					
					If (SD2_t_SearchValue#"")
						
						SRCH_t_SearchValue:=Field name:C257(Field:C253($_l_TableNumber; $_l_SortFieldNumbers))+":"+SD2_t_SearchValue
						SRCH_StandardSearch(DB_l_CurrentDisplayedForm; SRCH_t_SearchValue; DB_t_CurrentContext; $_l_TableNumber)
					End if 
					
				: ($_l_SelectedItem=4)
					ALERT:C41("Filter")
					$0:=-1
			End case 
			If ($_bo_Sort)
				$_l_SortDirection:=0
				
				If ($_l_ArrayElement>0)
					
					$_l_SortDirection:=$_l_CurrentSortDirection
					
					If ($_l_SortFieldNumbers=<>FS_al_FormSortFieldNum{$_l_ArrayElement}) | ((-Abs:C99($_l_ColumnNumber))=<>FS_al_FormSortFieldNum{$_l_ArrayElement})
						
						$_l_SortDirection:=$_l_CurrentSortDirection
						
					Else 
						$_l_SortDirection:=$_l_CurrentSortDirection
					End if 
				Else 
					$_l_SortDirection:=1
				End if 
				
				
				CLEAR SEMAPHORE:C144("$WriteFormsortPref")
				//Need to test if this is the current sort field
				//remember the sort field for the area?
				If ($_l_TableNumber#DB_l_CurrentDisplayedForm)
					DB_bo_AutorelationsTemp:=True:C214
					$_bo_RelationFound:=False:C215
					$_l_LastFieldNumber:=Get last field number:C255(DB_l_CurrentDisplayedForm)
					For ($_l_FindRelated; 1; $_l_LastFieldNumber)
						//So..in some cases this automation is rubbish. for example ORDER ITEMS to COMPANIES finds a relation at the field [order items]supplier code
						//which of course is rubbish we want to relate from [ORDERS ITEMS] via [ORDERS] to [COMPANIES
						If ($_l_TableNumber=Table:C252(->[COMPANIES:2])) & (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))
							
							$_ptr_RelatedField:=->[ORDER_ITEMS:25]Order_Code:1
							
							
							SET FIELD RELATION:C919($_ptr_RelatedField->; Manual:K51:3; Automatic:K51:4)
							//$Ftr:=->[ORDERS]Company_Code
							SET FIELD RELATION:C919($_ptr_RelatedField->; Manual:K51:3; Automatic:K51:4)
							$_l_FindRelated:=$_l_LastFieldNumber
						Else 
							
							
							
							
							If (Is field number valid:C1000(DB_l_CurrentDisplayedForm; $_l_FindRelated))
								GET RELATION PROPERTIES:C686(DB_l_CurrentDisplayedForm; $_l_FindRelated; $_l_OneTable; $_l_OneFIeld)
								If ($_l_OneTable=$_l_TableNumber)
									$_ptr_RelatedField:=Field:C253(DB_l_CurrentDisplayedForm; $_l_FindRelated)
									SET FIELD RELATION:C919($_ptr_RelatedField->; Manual:K51:3; Automatic:K51:4)
									$_bo_RelationFound:=True:C214
									$_l_FindRelated:=99999
								End if 
							End if 
						End if 
					End for 
					If (Not:C34($_bo_RelationFound))
						SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
					End if 
				Else 
					SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				End if 
				
				If ($_l_SortFieldNumbers>0) & ($_l_TableNumber>0)
					If ($_l_TableNumber=DB_l_CurrentDisplayedForm)
						If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumbers)->)#7) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumbers)->)#3) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumbers)->)#30)
							FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; $_l_SortFieldNumbers; $_l_TableNumber; ""; "")
						Else 
							If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumbers)->)=7)
								FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; -Abs:C99($_l_ColumnNumber); $_l_TableNumber; ""; "")
							End if 
							
						End if 
						
					End if 
				End if 
				SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				
			End if 
		End if 
	: ($_l_FormEvent=On Double Clicked:K2:5)
		
		DB_bo_MouseActive:=False:C215
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		//edit record.
		DB_OutEditRecord(DB_l_CurrentDisplayedForm)
		
		
	: ($_l_FormEvent=On Clicked:K2:4)
		
		DB_bo_MouseActive:=False:C215
	: ($_l_FormEvent=On Column Resize:K2:31)
		
		
		DB_bo_MouseActive:=False:C215
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		
		LISTBOX GET CELL POSITION:C971(DB_l_LBOutputForm; $_l_Column; $_l_Row)
		LISTBOX GET ARRAYS:C832(DB_l_LBOutputForm; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnsVisible; $_aptr_ColumnsStyle)
		$_l_ArrayElement:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		If ($_l_ArrayElement>0)  //it shoud be!
			
			
			READ WRITE:C146([LIST_LAYOUTS:96])
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ArrayElement}
			LBi_Resize($_ptr_ListboxSetup)
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
			$_t_CurrentUserDefinitionsName:=$_ptr_ArrayReferences->{7}
			LBi_ListFindDup($_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName)
			$_ptr_WidthsArray:=$_ptr_ListboxSetup->{13}
			
			$_ptr_RelatedField:=$_ptr_ListboxSetup->{2}
			$_ptr_FormulaArray:=$_ptr_ListboxSetup->{6}
			$_l_NumberofRows:=Size of array:C274($_ptr_WidthsArray->)
			//The column number displayed may not match the sort order on the list layouts..
			
			FIRST RECORD:C50([LIST_LAYOUTS:96])
			COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$TempSelection")
			For ($_l_Indexy; 1; Size of array:C274($_ptr_WidthsArray->))
				If (Position:C15("LB_GetRelation"; $_ptr_FormulaArray->{$_l_Indexy})=0) & ($_ptr_WidthsArray->{$_l_Indexy}#0)
					$_l_IgnoreColumnsCount:=0
					$_l_Column:=$_l_Indexy
					For ($_l_Index; 1; $_l_Column)
						If (Position:C15("LB_GetRelation"; $_ptr_FormulaArray->{$_l_Index})#0)
							$_l_IgnoreColumnsCount:=$_l_IgnoreColumnsCount+1
						End if 
						If ($_ptr_WidthsArray->{$_l_Index}=0)  // Zero width columns are invisible so dont get counted
							
							
							//$_l_IgnoreColumnsCount:=$_l_IgnoreColumnsCount-1
						End if 
					End for 
					$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Column})
					$_l_ColumnNumber:=$_l_Column-$_l_IgnoreColumnsCount
					USE NAMED SELECTION:C332("$TempSelection")
					QUERY SELECTION:C341([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7=$_l_ColumnNumber)
					If ([LIST_LAYOUTS:96]Width:5#$_ptr_WidthsArray->{$_l_Column})
						[LIST_LAYOUTS:96]Width:5:=$_ptr_WidthsArray->{$_l_Column}
						SAVE RECORD:C53([LIST_LAYOUTS:96])
					End if 
				End if 
			End for 
			UNLOAD RECORD:C212([LIST_LAYOUTS:96])
			READ ONLY:C145([LIST_LAYOUTS:96])
			
			//And write that back to the data
			
		End if 
	: ($_l_FormEvent=On Drag Over:K2:13)
		
		
		DB_bo_MouseActive:=False:C215
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_SourceRow=-1)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_Activetypes; $_at_FormatNames)
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
	: ($_l_FormEvent=On Drop:K2:12)
		
		
		DB_bo_MouseActive:=False:C215
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		If ($_l_SourceRow=-1)
			ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
			ARRAY TEXT:C222($_at_Activetypes; 0)
			ARRAY TEXT:C222($_at_FormatNames; 0)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_Activetypes; $_at_FormatNames)
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
										
										OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
										$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
										LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWidth-(30+20); 0; 0; 0)
										LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
										GOTO OBJECT:C206(DB_lb_Setsandselections)
										$_l_ArraySize:=Size of array:C274(DB_apic_SetPicture)
										LB_SetScroll(->DB_lb_Setsandselections; $_l_ArraySize; 0)
										LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_ArraySize)
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
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oListboxOutputForm"; $_t_OldMethodName)
