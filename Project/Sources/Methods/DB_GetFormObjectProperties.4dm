//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetFormObjectProperties
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2013 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PagesArray; 0)
	ARRAY LONGINT:C221($_al_UniquePages; 0)
	//ARRAY LONGINT(DB_al_FormObjectFIeld;0)
	//ARRAY LONGINT(DB_al_FormObjectPage;0)
	//ARRAY LONGINT(DB_al_FormObjectTable;0)
	ARRAY POINTER:C280($_aPtr_VariablesArray; 0)
	ARRAY TEXT:C222($_at_ObjectsArray; 0)
	//ARRAY TEXT(DB_at_FOrmObjectNames;0)
	//ARRAY TEXT(DB_at_FormTableFIeldNames;0)
	//ARRAY TEXT(DB_at_FormVariableNames;0)
	C_BOOLEAN:C305($_bo_AutomaticDrag; $_bo_AutomaticDrop; $_bo_Draggable; $_bo_Droppable; $_bo_FixedHeight; $_bo_FixedWidth; $_bo_FocusInvisible; $_bo_HasSpellCheck; $_bo_IsEnabled; $_bo_IsEnterable; $_bo_isVisible)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_Alignment; $_l_FieldNumber; $_l_FontSize; $_l_FontStyle; $_l_Height; $_l_Index; $_l_Index2; $_l_NumPages; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_TableNumber; $_l_Width; DB_l_CurrentTable)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_ChoiceListName; $_t_Filter; $_t_FontName; $_t_HelpTip; $_t_ObjectTitle; $_t_oldMethodName; $_t_Title; $_t_VariableName; DB_t_CurrentformName)
	C_TIME:C306(DOC_ti_Output)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetFormObjectProperties"; Form event code:C388)

If ($1)
	
	
	
	
	
	
	
	If (DB_l_CurrentTable>0)
		
		$_ptr_Table:=Table:C252(DB_l_CurrentTable)
		FORM GET PROPERTIES:C674($_ptr_Table->; DB_t_CurrentformName; $_l_Width; $_l_Height; $_l_NumPages; $_bo_FixedWidth; $_bo_FixedHeight; $_t_Title)
		SEND PACKET:C103(DOC_ti_Output; Char:C90(13)+DB_t_CurrentformName+Char:C90(13))
		SEND PACKET:C103(DOC_ti_Output; "Width"+Char:C90(9)+"Height"+Char:C90(9)+"Number of Pages"+Char:C90(9)+"Has Spell Check"+Char:C90(9)+"Fixed width(1=True)"+Char:C90(9)+"Fixed Height"+"TITLE"+Char:C90(13))
		SEND PACKET:C103(DOC_ti_Output; "Form Properties"+Char:C90(13)+String:C10($_l_Width)+Char:C90(9)+String:C10($_l_Height)+Char:C90(9)+String:C10($_l_NumPages)+Char:C90(9)+String:C10(Num:C11($_bo_FixedWidth))+Char:C90(9)+String:C10(Num:C11($_bo_FixedHeight))+Char:C90(9)+($_t_Title)+Char:C90(9))
		
		
		
		
	Else 
		//FORM GET PROPERTIES(DB_t_CurrentformName;$_l_Width;$_l_Height;$_l_NumPages;$_bo_FixedWidth;$_bo_FixedHeight;$_t_Title)
		
	End if 
	//FORM GET VERTICAL RESIZING ( resize {; minHeight {; maxHeight}} )
	//FORM GET HORIZONTAL RESIZING ( resize {; minWidth {; maxWidth}} )
	//FORM GET PARAMETER ( {aTable ;} form ; selector ; value )
	
	
	
	
	SEND PACKET:C103(DOC_ti_Output; "Page Number"+Char:C90(9)+"Object Name"+Char:C90(9)+"Variable or Field Name"+Char:C90(9)+"Has Spell Check"+Char:C90(9)+"Choice List name"+Char:C90(9))
	SEND PACKET:C103(DOC_ti_Output; "Left Position"+Char:C90(9)+"Top"+Char:C90(9)+"Right"+Char:C90(9)+"Bottom"+Char:C90(9)+"Draggable"+Char:C90(9))
	SEND PACKET:C103(DOC_ti_Output; "Auto Drag"+Char:C90(9)+"Droppable"+Char:C90(9)+"Auto Drop"+Char:C90(9)+"Enabled"+Char:C90(9))
	SEND PACKET:C103(DOC_ti_Output; "Enterable"+Char:C90(9)+"Filter"+Char:C90(9)+"Focus Invisible"+Char:C90(9)+"Font"+Char:C90(9)+"Font Soze"+Char:C90(9)+"Font SIze"+Char:C90(9)+"Text"+Char:C90(13))
	
	
	
	
	ARRAY TEXT:C222(DB_at_FOrmObjectNames; 0)
	ARRAY TEXT:C222(DB_at_FormVariableNames; 0)
	ARRAY TEXT:C222(DB_at_FormTableFIeldNames; 0)
	ARRAY LONGINT:C221(DB_al_FormObjectTable; 0)
	ARRAY LONGINT:C221(DB_al_FormObjectFIeld; 0)
	ARRAY LONGINT:C221(DB_al_FormObjectPage; 0)
	FORM GET OBJECTS:C898($_at_ObjectsArray; $_aPtr_VariablesArray; $_al_PagesArray)
	
	
	
	ARRAY LONGINT:C221($_al_UniquePages; 0)
	
	
	For ($_l_Index; 1; Size of array:C274($_al_PagesArray))
		If (Find in array:C230($_al_UniquePages; $_al_PagesArray{$_l_Index})<0)
			APPEND TO ARRAY:C911($_al_UniquePages; $_al_PagesArray{$_l_Index})
			
			
		End if 
	End for 
	
	For ($_l_Index; 1; Size of array:C274($_al_UniquePages))
		FORM GOTO PAGE:C247($_al_UniquePages{$_l_Index})
		
		For ($_l_Index2; 1; Size of array:C274($_at_ObjectsArray))
			If ($_al_PagesArray{$_l_Index2}=$_al_UniquePages{$_l_Index})
				
				
				SEND PACKET:C103(DOC_ti_Output; String:C10($_al_PagesArray{$_l_Index2})+Char:C90(9))
				
				SEND PACKET:C103(DOC_ti_Output; $_at_ObjectsArray{$_l_Index2}+Char:C90(9))
				RESOLVE POINTER:C394($_aPtr_VariablesArray{$_l_Index2}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				If ($_t_VariableName#"")
					SEND PACKET:C103(DOC_ti_Output; $_t_VariableName+Char:C90(9))
				Else 
					If ($_l_FieldNumber>0)
						SEND PACKET:C103(DOC_ti_Output; (Table name:C256($_l_TableNumber)+" "+Field name:C257($_l_TableNumber; $_l_FieldNumber))+Char:C90(9))
					Else 
						SEND PACKET:C103(DOC_ti_Output; Char:C90(9))
						
					End if 
				End if 
				$_bo_HasSpellCheck:=OBJECT Get auto spellcheck:C1174(*; $_at_ObjectsArray{$_l_Index2})
				If ($_bo_HasSpellCheck)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; Char:C90(9))
				End if 
				
				$_t_ChoiceListName:=OBJECT Get list name:C1072(*; $_at_ObjectsArray{$_l_Index2})
				If ($_t_ChoiceListName#"")
					SEND PACKET:C103(DOC_ti_Output; $_t_ChoiceListName+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; Char:C90(9))
				End if 
				OBJECT GET COORDINATES:C663(*; $_at_ObjectsArray{$_l_Index2}; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				
				SEND PACKET:C103(DOC_ti_Output; String:C10($_l_ObjectLeft)+Char:C90(9))
				SEND PACKET:C103(DOC_ti_Output; String:C10($_l_ObjectTop)+Char:C90(9))
				SEND PACKET:C103(DOC_ti_Output; String:C10($_l_ObjectRight)+Char:C90(9))
				SEND PACKET:C103(DOC_ti_Output; String:C10($_l_ObjectBottom)+Char:C90(9))
				
				OBJECT GET DRAG AND DROP OPTIONS:C1184(*; $_at_ObjectsArray{$_l_Index2}; $_bo_Draggable; $_bo_AutomaticDrag; $_bo_Droppable; $_bo_AutomaticDrop)
				If ($_bo_Draggable)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				If ($_bo_AutomaticDrag)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				If ($_bo_Droppable)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				If ($_bo_AutomaticDrop)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_bo_IsEnabled:=OBJECT Get enabled:C1079(*; $_at_ObjectsArray{$_l_Index2})
				If ($_bo_IsEnabled)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_bo_IsEnterable:=OBJECT Get enterable:C1067(*; $_at_ObjectsArray{$_l_Index2})
				If ($_bo_IsEnterable)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_t_Filter:=OBJECT Get filter:C1073(*; $_at_ObjectsArray{$_l_Index2})
				If ($_t_Filter#"")
					SEND PACKET:C103(DOC_ti_Output; $_t_Filter+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_bo_FocusInvisible:=OBJECT Get focus rectangle invisible:C1178(*; $_at_ObjectsArray{$_l_Index2})
				If ($_bo_FocusInvisible)
					SEND PACKET:C103(DOC_ti_Output; "Focus Invisible"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_t_FontName:=OBJECT Get font:C1069(*; $_at_ObjectsArray{$_l_Index2})
				If ($_t_FontName#"")
					SEND PACKET:C103(DOC_ti_Output; $_t_FontName+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				$_l_FontSize:=OBJECT Get font size:C1070(*; $_at_ObjectsArray{$_l_Index2})
				
				If ($_l_FontSize#0)
					SEND PACKET:C103(DOC_ti_Output; String:C10($_l_FontSize)+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				
				$_l_FontStyle:=OBJECT Get font style:C1071(*; $_at_ObjectsArray{$_l_Index2})
				
				
				If ($_t_FontName#"")
					SEND PACKET:C103(DOC_ti_Output; String:C10($_l_FontStyle)+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				
				$_t_ObjectTitle:=OBJECT Get title:C1068(*; $_at_ObjectsArray{$_l_Index2})
				SEND PACKET:C103(DOC_ti_Output; $_t_ObjectTitle+Char:C90(9))
				
				$_bo_isVisible:=OBJECT Get visible:C1075(*; $_at_ObjectsArray{$_l_Index2})
				
				If ($_bo_isVisible)
					SEND PACKET:C103(DOC_ti_Output; "Yes"+Char:C90(9))
				Else 
					SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(9))
				End if 
				
				$_l_Alignment:=OBJECT Get vertical alignment:C1188(*; $_at_ObjectsArray{$_l_Index2})
				Case of 
					: ($_l_Alignment=2)
						SEND PACKET:C103(DOC_ti_Output; "Vertical Align Top"+Char:C90(9))
					: ($_l_Alignment=3)
						SEND PACKET:C103(DOC_ti_Output; "Vertical Align Centre"+Char:C90(9))
					: ($_l_Alignment=4)
						SEND PACKET:C103(DOC_ti_Output; "Vertical Align Bottom"+Char:C90(9))
					: ($_l_Alignment=0)
						SEND PACKET:C103(DOC_ti_Output; "Vertical Not Applicable"+Char:C90(9))
				End case 
				
				$_l_Alignment:=OBJECT Get horizontal alignment:C707(*; $_at_ObjectsArray{$_l_Index2})
				Case of 
					: ($_l_Alignment=2)
						SEND PACKET:C103(DOC_ti_Output; "Horizontal Align Left"+Char:C90(9))
					: ($_l_Alignment=3)
						SEND PACKET:C103(DOC_ti_Output; "Horizontal Align Centre"+Char:C90(9))
					: ($_l_Alignment=4)
						SEND PACKET:C103(DOC_ti_Output; "Horizontal Align Right"+Char:C90(9))
					: ($_l_Alignment=1)
						SEND PACKET:C103(DOC_ti_Output; "Horizontal Align Default"+Char:C90(9))
				End case 
				
				$_t_HelpTip:=OBJECT Get help tip:C1182(*; $_at_ObjectsArray{$_l_Index2})
				
				SEND PACKET:C103(DOC_ti_Output; $_t_HelpTip+Char:C90(9))
				
				SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(13))
				
				
			End if 
			
		End for 
	End for 
	SEND PACKET:C103(DOC_ti_Output; ""+Char:C90(13))
	
	
End if 
ERR_MethodTrackerReturn("DB_GetFormObjectProperties"; $_t_oldMethodName)