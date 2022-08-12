//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PrintForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/02/2012 10:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	C_BOOLEAN:C305($_bo_Over; $_bo_printok; $_bo_UseContext; DB_bo_RootTabDefined; DB_bo_ShowArrayBased)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_bo_ColumnHide; $_l_ColumnNumber; $_l_ColumnWidth; $_l_ContextRow; $_l_DataType; $_l_FieldNumber; $_l_Index; $_l_MarginBottom; $_l_MarginLeft)
	C_LONGINT:C283($_l_MarginRight; $_l_MarginTop; $_l_MaxHeight; $_l_MaxLandscape; $_l_MaxLines; $_l_MaxPortrait; $_l_MaxRows; $_l_MaxWidth; $_l_NumberOfLines; $_l_OK; $_l_PrintPages)
	C_LONGINT:C283($_l_QRQarea; $_l_RepeatedValue; $_l_Size; $_l_TableNumber; $_l_Total; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DB_l_LBOutputForm; DB_l_RootTabTable)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnFonts; $_ptr_ArrayReferences; $_ptr_Field; $_ptr_LBParentTable; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisHeaderVariable)
	C_REAL:C285($_r_Percentage; DB_Lb_PrintFields)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ButtonPrefix; $_t_ColumnTitle; $_t_CurrentFormat; $_t_DisplayFormat; $_t_FieldName; $_t_LevelID; $_t_LevelID2; $_t_ObjectName; $_t_ObjectPrefix)
	C_TEXT:C284($_t_oldMethodName; $_t_TItle; $_t_VariableName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PrintForm")


// ----------------------------------------------------
// User name (OS): Nigel_Greenlee
// Date and time: 30/12/11, 23:24:00
// ----------------------------------------------------
// Method: DB_PrintForm
// Description
// use from generic output form will use the setup to create a report based on the current columnns
//
//
// Parameters
// ----------------------------------------------------
If (DB_l_CurrentDisplayedForm>0)
	If (DB_bo_ShowArrayBased)
		//DB_SetFormSize (DB_l_CurrentDisplayedForm;->DB_lb_OutputArrays;90;60;DB_bo_DisplayFilters)
		If (False:C215)
			If (DB_t_CurrentContext#"")
				$_bo_UseContext:=True:C214
				If (DB_bo_RootTabDefined)
					$_bo_UseContext:=False:C215
					If (DB_l_RootTabTable=DB_l_CurrentDisplayedForm)
						$_bo_UseContext:=True:C214
					End if 
				End if 
				If ($_bo_UseContext)
					$_l_ContextRow:=Find in array:C230(DB_at_ContextNames; DB_t_CurrentContext)
				Else 
					$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
				End if 
			Else 
				$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
			End if 
			
			$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ContextRow}
			$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
			$_t_LevelID:=$_ptr_ArrayReferences->{1}
			$_t_LevelID2:=Substring:C12($_t_LevelID; 2; Length:C16($_t_LevelID))
			$_t_ObjectPrefix:="o"+$_t_LevelID2
			$_t_ButtonPrefix:="o"+$_t_LevelID2+"_L"
			$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
			$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
			$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		End if 
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		
		LISTBOX GET ARRAYS:C832(DB_lb_OutputArrays; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=0
		For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
			$_l_TotalWidth:=$_l_TotalWidth+LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index})
			
		End for 
		$_l_OK:=PRINT_SetSIZE("A4"; "P")
		If (False:C215)
			GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxPortrait)
			If ($_l_TotalWidth>$_l_MaxPortrait)
				$_l_OK:=PRINT_SetSIZE("A4"; "L")
				GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxLandscape)
				If ($_l_MaxLandscape<$_l_TotalWidth)
					$_r_Percentage:=Int:C8($_l_MaxLandscape/($_l_TotalWidth/100))
					
					
					If ($_r_Percentage<100)
						SET PRINT OPTION:C733(Scale option:K47:3; $_r_Percentage)
					End if 
				End if 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			Else 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			End if 
			$_l_MaxLines:=Int:C8($_l_MaxHeight/16)
			
			PRINT SETTINGS:C106
			$_l_NumberOfLines:=0
			$_l_PrintPages:=0
			If (OK=1)
				//LB_StyleSettings ($_ptr_ListboxArea;$_ptr_ArrayReferences->{2};$_ptr_ArrayofColumnFonts->{1};$_t_ObjectPrefix;$_ptr_LBTable;256;"Black";1)  // set colours, fonts etc. 29/06/06 pb
				
				OPEN PRINTING JOB:C995
				FORM LOAD:C1103("DB_OutputForm")
				$_bo_Over:=False:C215
				Repeat 
					
					$_bo_printok:=Print object:C1095(DB_bo_ShowArrayBased; $_l_MarginLeft; $_l_MarginTop; $_l_MaxWidth; $_l_MaxHeight)
					LISTBOX GET PRINT INFORMATION:C1110(DB_bo_ShowArrayBased; lk printing is over:K53:14; $_bo_Over)
					//$_bo_Over:=TRUE
					$_l_NumberOfLines:=$_l_NumberOfLines+1
					If ($_l_NumberOfLines>=$_l_MaxLines)
						PAGE BREAK:C6
						$_l_NumberOfLines:=0
						$_l_PrintPages:=$_l_PrintPages+1
					End if 
				Until ($_bo_Over) | ($_l_PrintPages>4)
				
				CLOSE PRINTING JOB:C996
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			End if 
		Else 
			$_l_QRQarea:=QR New offscreen area:C735
			QR SET REPORT TABLE:C757($_l_QRQarea; DB_l_CurrentDisplayedForm)
			$_l_ColumnNumber:=0
			For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
				
				RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				If ($_l_TableNumber>0) | ($_t_VariableName#"")
					$_l_ColumnNumber:=$_l_ColumnNumber+1
					If ($_l_TableNumber>0)
						$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
					Else 
						$_Ptr_Field:=Get pointer:C304($_t_VariableName)
					End if 
					$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_Index}
					QR INSERT COLUMN:C748($_l_QRQarea; $_l_ColumnNumber; $_Ptr_Field)
					
					$_l_DataType:=Type:C295(($_Ptr_Field)->)
					$_t_DisplayFormat:=""
					//LB_SetFormat ($_ptr_ListboxArea;1;"";$_l_Index;$_l_Index;3)
					Case of 
						: (($_l_DataType=1)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|AccountsNZ"
						: (($_l_DataType=8)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|integers"
						: (($_l_DataType=9)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|Longint"
							
						: ($_l_DataType=Is time:K8:8) & ($_t_DisplayFormat="")  // 26/06/06
							$_t_DisplayFormat:="&/5"
						: ($_l_DataType=4) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:=""
							
						Else 
							$_t_DisplayFormat:=""
					End case 
					
					QR GET INFO COLUMN:C766($_l_QRQarea; $_l_ColumnNumber; $_t_TItle; $_t_ObjectName; $_bo_ColumnHide; $_l_Size; $_l_RepeatedValue; $_t_DisplayFormat)
					$_l_ColumnWidth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index})
					$_bo_ColumnHide:=Num:C11(($_l_ColumnWidth=0) | ($_abo_ColumnsVisible{$_l_Index}=False:C215))
					
					$_t_ColumnTitle:=OBJECT Get title:C1068($_Ptr_ThisHeaderVariable->)
					
					QR SET INFO COLUMN:C765($_l_QRQarea; $_l_ColumnNumber; $_t_ColumnTitle; $_t_ObjectName; $_bo_ColumnHide; $_l_ColumnWidth; 1; $_t_DisplayFormat)
					If (True:C214)
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr title:K14906:1; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontBold))
						
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr title:K14906:1; qr font size:K14904:2; <>SYS_l_DefaultBoldFontSize)
						QR SET TEXT PROPERTY:C759($_l_QRQarea; 1; -1; qr bold:K14904:3; 1)
						//QR SET TEXT PROPERTY($_l_QRQarea;1;-1;qr text color;0x0000FF00)
						
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr detail:K14906:2; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontPlain))
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr detail:K14906:2; qr font size:K14904:2; <>SYS_l_DefaultPlainFontSize)
					End if 
				End if 
			End for 
			If ($_l_TotalWidth>$_l_MaxPortrait)
				$_l_OK:=PRINT_SetSIZE("A4"; "L")
				GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxLandscape)
				If ($_l_MaxLandscape<$_l_TotalWidth)
					Gen_Confirm("Format to one sheet wide?"; "Yes"; "No")
					If (OK=1)
						$_r_Percentage:=Int:C8($_l_MaxLandscape/($_l_TotalWidth/100))
						
						
						If ($_r_Percentage<100)
							SET PRINT OPTION:C733(Scale option:K47:3; $_r_Percentage)
						End if 
					End if 
				End if 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			Else 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			End if 
			$_l_MaxLines:=Int:C8($_l_MaxHeight/16)
			
			//PRINT SETTINGS
			QR RUN:C746($_l_QRQarea)
			QR DELETE OFFSCREEN AREA:C754($_l_QRQarea)
		End if 
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		
		
		If (DB_t_CurrentContext#"")
			$_bo_UseContext:=True:C214
			If (DB_bo_RootTabDefined)
				$_bo_UseContext:=False:C215
				If (DB_l_RootTabTable=DB_l_CurrentDisplayedForm)
					$_bo_UseContext:=True:C214
				End if 
			End if 
			If ($_bo_UseContext)
				$_l_ContextRow:=Find in array:C230(DB_at_ContextNames; DB_t_CurrentContext)
			Else 
				$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
			End if 
		Else 
			$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		End if 
		
		$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ContextRow}
		$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
		$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
		$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
		$_t_LevelID:=$_ptr_ArrayReferences->{1}
		$_t_LevelID2:=Substring:C12($_t_LevelID; 2; Length:C16($_t_LevelID))
		$_t_ObjectPrefix:="o"+$_t_LevelID2
		$_t_ButtonPrefix:="o"+$_t_LevelID2+"_L"
		$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
		$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
		$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		
		LISTBOX GET ARRAYS:C832(DB_l_LBOutputForm; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=0
		For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
			$_l_TotalWidth:=$_l_TotalWidth+LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index})
			
		End for 
		$_l_OK:=PRINT_SetSIZE("A4"; "P")
		If (False:C215)  // Tried this it works however seems very slow
			GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxPortrait)
			If ($_l_TotalWidth>$_l_MaxPortrait)
				$_l_OK:=PRINT_SetSIZE("A4"; "L")
				GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxLandscape)
				If ($_l_MaxLandscape<$_l_TotalWidth)
					$_r_Percentage:=Int:C8(($_l_TotalWidth/100)*(($_l_TotalWidth/1.2)/$_l_MaxLandscape))
					$_r_Percentage:=Int:C8($_r_Percentage/2.1)
					
					
					If ($_r_Percentage<100)
						SET PRINT OPTION:C733(Scale option:K47:3; $_r_Percentage)
					End if 
				End if 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			Else 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			End if 
			$_l_MaxLines:=Int:C8($_l_MaxHeight/16)
			
			PRINT SETTINGS:C106
			$_l_NumberOfLines:=0
			$_l_PrintPages:=0
			If (OK=1)
				//LB_StyleSettings ($_ptr_ListboxArea;$_ptr_ArrayReferences->{2};$_ptr_ArrayofColumnFonts->{1};$_t_ObjectPrefix;$_ptr_LBTable;256;"Black";1)  // set colours, fonts etc. 29/06/06 pb
				
				OPEN PRINTING JOB:C995
				FORM LOAD:C1103("DB_PrintOutputForm")
				$_bo_Over:=False:C215
				Repeat 
					
					$_bo_printok:=Print object:C1095(DB_Lb_PrintFields; $_l_MarginLeft; $_l_MarginTop; $_l_MaxWidth; $_l_MaxHeight)
					LISTBOX GET PRINT INFORMATION:C1110(DB_Lb_PrintFields; lk printing is over:K53:14; $_bo_Over)
					//$_bo_Over:=TRUE
					$_l_NumberOfLines:=$_l_NumberOfLines+1
					If ($_l_NumberOfLines>=$_l_MaxLines)
						PAGE BREAK:C6
						$_l_NumberOfLines:=0
						$_l_PrintPages:=$_l_PrintPages+1
					End if 
				Until ($_bo_Over) | ($_l_PrintPages>4)
				
				CLOSE PRINTING JOB:C996
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				
				
			End if 
			
			//LB_StyleSettings ($_ptr_ListboxArea;$_ptr_ArrayReferences->{2};$_ptr_ArrayofColumnFonts->{1};$_t_ObjectPrefix;$_ptr_LBTable)  // set colours, fonts etc. 29/06/06
		Else 
			//Create a quick report
			$_l_QRQarea:=QR New offscreen area:C735
			//START_SetTablesAndFields (True)  //set the names to the structure names
			QR SET REPORT TABLE:C757($_l_QRQarea; DB_l_CurrentDisplayedForm)
			$_l_ColumnNumber:=0
			For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
				
				RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				If ($_l_TableNumber>0) | ($_t_VariableName#"")
					$_l_ColumnNumber:=$_l_ColumnNumber+1
					If ($_l_TableNumber>0)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
					Else 
						$_ptr_Field:=->$_t_VariableName
					End if 
					$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_Index}
					//TRACE  //$_t_FieldName:=
					QR INSERT COLUMN:C748($_l_QRQarea; $_l_ColumnNumber; $_ptr_Field)
					$_t_FieldName:=Field name:C257($_ptr_Field)
					
					$_l_DataType:=Type:C295(($_ptr_ArrayFieldPointers->{$_l_Index})->)
					$_t_DisplayFormat:=$_ptr_ArrayOfColumFormats->{$_l_Index}
					LB_SetFormat($_ptr_ListboxArea; 1; ""; $_l_Index; $_l_Index; 3)
					Case of 
						: (($_l_DataType=1)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|AccountsNZ"
						: (($_l_DataType=8)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|integers"
						: (($_l_DataType=9)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|Longint"
							
						: ($_l_DataType=Is time:K8:8) & ($_t_DisplayFormat="")  // 26/06/06
							$_t_DisplayFormat:="&/5"
						: ($_l_DataType=4) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:=""
							
						Else 
							
					End case 
					
					QR GET INFO COLUMN:C766($_l_QRQarea; $_l_ColumnNumber; $_t_TItle; $_t_ObjectName; $_bo_ColumnHide; $_l_Size; $_l_RepeatedValue; $_t_CurrentFormat)
					$_l_ColumnWidth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index})
					$_bo_ColumnHide:=Num:C11(($_l_ColumnWidth=0) | ($_abo_ColumnsVisible{$_l_Index}=False:C215))
					
					$_t_ColumnTitle:=OBJECT Get title:C1068($_Ptr_ThisHeaderVariable->)
					
					QR SET INFO COLUMN:C765($_l_QRQarea; $_l_ColumnNumber; $_t_FieldName; $_ptr_Field; $_bo_ColumnHide; $_l_ColumnWidth; 1; $_t_DisplayFormat)
					If (True:C214)
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr title:K14906:1; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontBold))
						
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr title:K14906:1; qr font size:K14904:2; <>SYS_l_DefaultBoldFontSize)
						QR SET TEXT PROPERTY:C759($_l_QRQarea; 1; -1; qr bold:K14904:3; 1)
						//QR SET TEXT PROPERTY($_l_QRQarea;1;-1;qr text color;0x0000FF00)
						
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr detail:K14906:2; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontPlain))
						QR SET TEXT PROPERTY:C759($_l_QRQarea; $_l_ColumnNumber; qr detail:K14906:2; qr font size:K14904:2; <>SYS_l_DefaultPlainFontSize)
					End if 
				End if 
			End for 
			If ($_l_TotalWidth>$_l_MaxPortrait)
				$_l_OK:=PRINT_SetSIZE("A4"; "L")
				GET PRINTABLE AREA:C703($_l_MaxRows; $_l_MaxLandscape)
				If ($_l_MaxLandscape<$_l_TotalWidth)
					Gen_Confirm("Format to one sheet wide?"; "Yes"; "No")
					If (OK=1)
						$_r_Percentage:=Int:C8($_l_MaxLandscape/($_l_TotalWidth/100))
						
						//$_r_Percentage:=Int($_r_Percentage/2.1)
						
						If ($_r_Percentage<100)
							SET PRINT OPTION:C733(Scale option:K47:3; $_r_Percentage)
						End if 
					End if 
				End if 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			Else 
				GET PRINTABLE MARGIN:C711($_l_MarginLeft; $_l_MarginTop; $_l_MarginRight; $_l_MarginBottom)
				GET PRINTABLE AREA:C703($_l_MaxHeight; $_l_MaxWidth)
			End if 
			$_l_MaxLines:=Int:C8($_l_MaxHeight/16)
			
			//PRINT SETTINGS
			QR RUN:C746($_l_QRQarea)
			QR DELETE OFFSCREEN AREA:C754($_l_QRQarea)
			//START_SetTablesAndFields
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_PrintForm"; $_t_oldMethodName)