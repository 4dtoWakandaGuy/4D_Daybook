If (False:C215)
	//object Name: [USER]QV_Groupings.Listbox
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
	//ARRAY BOOLEAN(QV_LB_Items;0)
	ARRAY LONGINT:C221($_al_UsedLevels; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_OK; QV_bo_Drop; QV_bo_ExactQualityMatchOnly)
	C_LONGINT:C283($_l_DateRow; $_l_event; $_l_FieldNumber; $_l_GroupID; $_l_index; $_l_ItemReference; $_l_LastSort; $_l_Level; $_l_LevelRow; $_l_ParentItemRef; $_l_Row)
	C_LONGINT:C283($_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SublistID; $_l_TableFieldNumber; $_l_TableNumber; LB_l_ColumnNumber; LB_l_RowNumber; QV_HL_QualitiesList; QV_l_insertExistingGroupPos; QV_l_SourceElement)
	C_LONGINT:C283(QV_l_SourceProcess; SM_l_ReturnQueryID)
	C_POINTER:C301(QV_Ptr_SourceObject)
	C_TEXT:C284($_t_ItemText; $_t_LabelName; $_t_LastLabelName; $_t_oldMethodName; $_t_ParentItemText; $_t_VariableName; QV_T_QualitiesAsText; QV_T_QualitiesDropText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Listbox"; Form event code:C388)
$_l_event:=Form event code:C388
//````
// this is the call back method(currently for AL)
RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_TableFieldNumber)
$_l_Row:=Self:C308->

LB_l_RowNumber:=$_l_Row
LB_l_ColumnNumber:=LB_GetColumn(->QV_LB_Items; $_t_VariableName)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (LB_l_ColumnNumber=1)
				LB_GoToCell(->QV_LB_Items; 1; $_l_Row)
			: (LB_l_ColumnNumber=3)
				LB_GoToCell(->QV_LB_Items; 3; $_l_Row)
			: (LB_l_ColumnNumber=5)
				LB_GoToCell(->QV_LB_Items; 5; $_l_Row)
		End case 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (LB_l_ColumnNumber>0) & (LB_l_RowNumber>0)
				Case of 
					: (LB_l_ColumnNumber=1)  //Sort order
						If (QV_al_GroupIDs{LB_l_RowNumber}=0)
							QV_al_LabelOrder{LB_l_RowNumber}:=0
						Else 
							ARRAY LONGINT:C221($_al_UsedLevels; 1)
							$_al_UsedLevels{1}:=QV_al_LabelOrder{LB_l_RowNumber}
							For ($_l_index; 1; Size of array:C274(QV_al_LabelOrder))
								If ($_l_index#LB_l_RowNumber)
									If (QV_al_GroupIDs{$_l_index}#0)
										$_l_Level:=QV_al_LabelOrder{$_l_index}
										$_l_LevelRow:=Find in array:C230($_al_UsedLevels; $_l_Level)
										If ($_l_DateRow<0)
											INSERT IN ARRAY:C227($_al_UsedLevels; Size of array:C274($_al_UsedLevels)+1; 1)
											$_al_UsedLevels{Size of array:C274($_al_UsedLevels)}:=$_l_Level
										Else 
											$_bo_OK:=False:C215
											$_l_Level:=0
											Repeat 
												$_l_Level:=$_l_Level+1
												$_l_DateRow:=Find in array:C230($_al_UsedLevels; $_l_Level)
												If ($_l_DateRow<0)
													INSERT IN ARRAY:C227($_al_UsedLevels; Size of array:C274($_al_UsedLevels)+1; 1)
													$_al_UsedLevels{Size of array:C274($_al_UsedLevels)}:=$_l_Level
													QV_al_LabelOrder{$_l_index}:=$_l_Level
													$_bo_OK:=True:C214
												End if 
											Until ($_bo_OK)
										End if 
									End if 
								End if 
							End for 
						End if 
						
						
						
					: (LB_l_ColumnNumber=2)  // Notenterable
					: (LB_l_ColumnNumber=3)  // Group heading name-repeat till next heading
						
						If (QV_al_GroupIDs{LB_l_RowNumber}=0)
							$_t_LabelName:=QV_at_LabelNames{LB_l_RowNumber}
							For ($_l_index; LB_l_RowNumber; 1; -1)
								If (QV_al_GroupIDs{$_l_index}#0)
									QV_at_LabelNames{$_l_index}:=$_t_LabelName
									LB_l_RowNumber:=$_l_index
									$_l_index:=0
								End if 
							End for 
							$_l_GroupID:=QV_al_GroupIDs{LB_l_RowNumber}
							For ($_l_index; LB_l_RowNumber; Size of array:C274(QV_at_LabelNames))
								If (QV_al_GroupIDs{$_l_index}=0) | (QV_al_GroupIDs{$_l_index}=$_l_GroupID)
									QV_at_LabelNames{$_l_index}:=$_t_LabelName
								Else 
									$_l_index:=Size of array:C274(QV_at_LabelNames)
								End if 
								
							End for 
						Else 
							$_t_LabelName:=QV_at_LabelNames{LB_l_RowNumber}
							$_l_GroupID:=QV_al_GroupIDs{LB_l_RowNumber}
							For ($_l_index; LB_l_RowNumber; Size of array:C274(QV_at_LabelNames))
								If (QV_al_GroupIDs{$_l_index}=0) | (QV_al_GroupIDs{$_l_index}=$_l_GroupID)
									QV_at_LabelNames{$_l_index}:=$_t_LabelName
								Else 
									$_l_index:=Size of array:C274(QV_at_LabelNames)
								End if 
								
							End for 
						End if 
						
						
						
					: (LB_l_ColumnNumber=4)  //`Itemname--not enterable
					: (LB_l_ColumnNumber=5)  //itemdisplay name
						
				End case 
		End case 
		
		
	: ($_l_event=On Drag Over:K2:13)
		QV_bo_Drop:=False:C215
		_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
		RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName="QV_HL_QualitiesList")
			QV_bo_Drop:=True:C214
			
		End if 
	: ($_l_event=On Drop:K2:12)
		
		If (QV_bo_Drop)
			$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
			_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
			RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			GET LIST ITEM:C378(QV_HL_QualitiesList; QV_l_SourceElement; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
			
			$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
			
			If ($_l_SelectedItemParent>0)
				//this is a sublist item
				SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
				$_l_SelectedListItem2:=Selected list items:C379(QV_HL_QualitiesList)
				GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem2; $_l_ParentItemRef; $_t_ParentItemText; $_l_SublistID; $_bo_Expanded)
				QV_T_QualitiesDropText:="["+$_t_ParentItemText+"]"+$_t_ItemText
				
			Else 
				//this is a group
				QV_T_QualitiesDropText:="["+$_t_ItemText+"]"
			End if 
			If (QV_T_QualitiesDropText#"")
				
				QV_bo_ExactQualityMatchOnly:=True:C214  //added 25/08/06 - kmw
				QV_l_insertExistingGroupPos:=-1  //kmw 31/08/06 - gets set to a value in QV_ParseText if user is adding an item to an existing group
				QV_ParseText(QV_T_QualitiesDropText)
				QV_bo_ExactQualityMatchOnly:=False:C215  //added 25/08/06 - kmw
				
				
				//NG here we need to resize the additional arrays..and populate them.
				//QV_at_DisplayNames;-QV_at_LabelNames. They will default to using the Values of ,QV_at_QualityNames,QV_at_GroupNames.
				If (QV_l_insertExistingGroupPos=-1)  //kmw 31/08/06 no insertion to an already existing group so new items will be added to bottom
					ARRAY TEXT:C222(QV_at_DisplayNames; Size of array:C274(QV_at_QualityNames))
					ARRAY TEXT:C222(QV_at_LabelNames; Size of array:C274(QV_at_GroupNames))
					ARRAY LONGINT:C221(QV_al_LabelOrder; Size of array:C274(QV_at_GroupNames))
				Else 
					INSERT IN ARRAY:C227(QV_at_DisplayNames; QV_l_insertExistingGroupPos; 1)
					INSERT IN ARRAY:C227(QV_at_LabelNames; QV_l_insertExistingGroupPos; 1)
					INSERT IN ARRAY:C227(QV_al_LabelOrder; QV_l_insertExistingGroupPos; 1)
				End if 
				
				$_t_LastLabelName:=""
				For ($_l_index; 1; Size of array:C274(QV_at_DisplayNames))
					If (QV_at_DisplayNames{$_l_index}="")
						If (QV_at_GroupNames{$_l_index}="")
							//This is an item
							QV_at_DisplayNames{$_l_index}:=QV_at_QualityNames{$_l_index}
							QV_at_LabelNames{$_l_index}:=$_t_LastLabelName
						Else 
							//This is a group
							If (QV_at_LabelNames{$_l_index}="")
								QV_at_LabelNames{$_l_index}:=QV_at_GroupNames{$_l_index}
							End if 
							$_t_LastLabelName:=QV_at_LabelNames{$_l_index}
						End if 
					Else 
						If (QV_at_LabelNames{$_l_index}="")
							QV_at_LabelNames{$_l_index}:=$_t_LastLabelName
						End if 
					End if 
				End for 
				$_l_LastSort:=0
				For ($_l_index; 1; Size of array:C274(QV_at_DisplayNames))
					If (QV_al_GroupIDs{$_l_index}#0)
						If (QV_al_LabelOrder{$_l_index}>$_l_LastSort)
							$_l_LastSort:=QV_al_LabelOrder{$_l_index}
							
						End if 
					End if 
				End for 
				For ($_l_index; 1; Size of array:C274(QV_at_DisplayNames))
					If (QV_al_GroupIDs{$_l_index}#0)
						If (QV_al_LabelOrder{$_l_index}=0)
							QV_al_LabelOrder{$_l_index}:=$_l_LastSort+1
							$_l_LastSort:=$_l_LastSort+1
						End if 
					End if 
				End for 
				
				
				QV_T_QualitiesAsText:=""
				
			End if 
			SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_ItemReference)
		End if 
		
	Else 
		//If (SM_l_ReturnQueryID=0)
		//If (ALProEvt=1)  `did user single-click on a line?
		//If ($_l_event=On Clicked )  ` not needed  now 30/06/06 pb
		//$_l_Column:=AL_GetColumn (QV_l_Powerview)
		//$Line:=AL_GetLine (QV_l_Powerview)  `get the line the user selected
		//Case of
		//: ($_l_Column=1) & ($line>0)
		//QV_ai_include{$line}:=Abs(QV_ai_include{$line}-1)
		//If (QV_ai_Exclude{$line}=1)
		//QV_ai_Exclude{$line}:=0
		//End if
		//AL_UpdateArrays (QV_l_Powerview;-2)
		//: ($_l_Column=6) & ($line>0)
		//QV_ai_Exclude{$line}:=Abs(QV_ai_Exclude{$line}-1)
		//If (QV_ai_include{$line}=1)
		//QV_ai_include{$line}:=0
		//End if
		//AL_UpdateArrays (QV_l_Powerview;-2)
		//End case
		//End if   `ALProEvt=1
		//End if
		
End case 
//If (SM_l_ReturnQueryID=0)

//QV_l_PowerviewScript
//End if
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Listbox"; $_t_oldMethodName)
