If (False:C215)
	//object Method Name: Object Name:      CONFIG_TABLE.oExport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/09/2012 17:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(TAB_ab_FieldData;0)
	//ARRAY LONGINT(REP_al_Create;0)
	//ARRAY LONGINT(REP_al_ReportElement;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_aptr_ConfigPtrs;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(REP_at_ReportContext;0)
	C_BOOLEAN:C305($_bo_True)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_bo_RepeatedValue; $_l_ColumnNumber; $_l_ColumnWIdth; $_l_Delimeter; $_l_FieldNumber; $_l_FieldsIndex; $_l_HideColumn; $_l_MarginBottom; $_l_MarginLeft)
	C_LONGINT:C283($_l_MarginRight; $_l_MarginTop; $_l_MaxHeight; $_l_MaxLandscape; $_l_MaxLines; $_l_MaxPortrait; $_l_MaxRows; $_l_MaxWidth; $_l_OK; $_l_Percentage; $_l_QRArea)
	C_LONGINT:C283($_l_RecDelimeter; $_l_SelectedContextNumber; $_l_TableNumber; $_l_TotalWidth; $_l_Type; DB_l_DisplayTable; LB_l_CurrentRow)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnFonts; $_ptr_ArrayReferences; $_ptr_Field; $_ptr_HeaderVar; $_ptr_LBTable; $_Ptr_ListBox; $_ptr_Table)
	C_REAL:C285($_r_Percentage)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ButtonObjectPrefix; $_t_ColumnTitle; $_t_DisplayFormat; $_t_DomText; $_t_ExportPath; $_t_Format; $_t_LevelID; $_t_LevelNumberString; $_t_ObjectName)
	C_TEXT:C284($_t_ObjectPrefix; $_t_oldMethodName; $_t_SelectedContextName; $_t_TableName; $_t_VariableName; $_t_XMLelt; $_t_XMLRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/CONFIG_TABLE/oExport"; Form event code:C388)
ARRAY TEXT:C222(REP_at_ReportContext; 3)
ARRAY LONGINT:C221(REP_al_ReportElement; 3)
REP_at_ReportContext{1}:="Delimited"
REP_al_ReportElement{1}:=1
REP_at_ReportContext{2}:="Automated XML"
REP_al_ReportElement{2}:=2
REP_at_ReportContext{3}:="Project Based"
REP_al_ReportElement{3}:=3
REP_al_Create:=0
$_l_SelectedContextNumber:=GEN_RequestViaPopUp(->REP_at_ReportContext; ->REP_al_ReportElement; "Export Requirements"; False:C215; ->REP_al_Create; "Stop"; "Continue"; 1)
//TRACE
$_t_SelectedContextName:=REP_at_ReportContext{$_l_SelectedContextNumber}
//first up-export to tab delimited-QR...this is the same as print current form.
Case of 
	: ($_t_SelectedContextName="Delimited")
		
		$_l_Delimeter:=FldDelimit
		$_l_RecDelimeter:=RecDelimit
		Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
		DIALOG:C40("DB_QR_SetDelimiters")
		CLOSE WINDOW:C154
		
		//DB_l_DisplayTable:=DB_l_DisplayTable
		
		
		
		$_Ptr_ListBox:=DB_aptr_ConfigPtrs{1}
		$_ptr_ArrayReferences:=DB_aptr_ConfigPtrs{9}
		$_ptr_ArrayofColumnFonts:=DB_aptr_ConfigPtrs{16}
		$_t_LevelID:=$_ptr_ArrayReferences->{1}
		$_t_LevelNumberString:=Substring:C12($_t_LevelID; 2; Length:C16($_t_LevelID))
		$_t_ObjectPrefix:="o"+$_t_LevelNumberString
		$_t_ButtonObjectPrefix:="o"+$_t_LevelNumberString+"_L"
		$_ptr_LBTable:=DB_aptr_ConfigPtrs{10}
		$_ptr_ArrayOfColumFormats:=DB_aptr_ConfigPtrs{5}
		$_ptr_ArrayFieldPointers:=DB_aptr_ConfigPtrs{2}
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		
		LISTBOX GET ARRAYS:C832(TAB_ab_FieldData; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=0
		For ($_l_FieldsIndex; 1; Size of array:C274($_at_ColumnNames))
			$_l_TotalWidth:=$_l_TotalWidth+LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_FieldsIndex})
			
		End for 
		$_l_OK:=PRINT_SetSIZE("A4"; "P")
		$_l_QRArea:=QR New offscreen area:C735
		QR SET REPORT TABLE:C757($_l_QRArea; DB_l_DisplayTable)
		$_l_ColumnNumber:=0
		For ($_l_FieldsIndex; 1; Size of array:C274($_at_ColumnNames))
			
			RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_FieldsIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_TableNumber>0) | ($_t_VariableName#"")
				$_l_ColumnNumber:=$_l_ColumnNumber+1
				If ($_l_TableNumber>0)
					$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				Else 
					$_ptr_Field:=Get pointer:C304($_t_VariableName)
				End if 
				//TRACE
				$_ptr_HeaderVar:=$_aptr_HeaderVariables{$_l_FieldsIndex}
				LB_l_CurrentRow:=0
				If (False:C215)
					Case of 
						: (Position:C15("LB_at_"; $_t_VariableName)>0)  // | (Position("text";$_t_VariableName)>0)
							
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetStringData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
						: (Position:C15("LB_abo_"; $_t_VariableName)>0)
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetbooleanData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
						: (Position:C15("LB_ad_"; $_t_VariableName)>0)
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetdateData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
						: (Position:C15("LB_al"; $_t_VariableName)>0) | (Position:C15("inte"; $_t_VariableName)>0)
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetlongData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
						: (Position:C15("LB_ar"; $_t_VariableName)>0)
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetRealData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
						: (Position:C15("LB_ati"; $_t_VariableName)>0)
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; "QR_GetTimeData("+Char:C90(34)+"TAB_ab_FieldData"+Char:C90(34)+";"+String:C10($_l_FieldsIndex)+")")  //$_ptr_Field)"
							
						Else 
							QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; $_t_VariableName)  //$_ptr_Field)"
					End case 
				Else 
					QR INSERT COLUMN:C748($_l_QRArea; $_l_ColumnNumber; $_ptr_Field)
					//QR INSERT COLUMN($_l_QRArea;$_l_ColumnNumber;$_t_VariableName+"{LB_l_CurrentRow}")
				End if 
				
				$_l_Type:=Type:C295(($_ptr_Field)->)
				$_t_Format:=""
				//LB_SetFormat ($_Ptr_ListBox;1;"";$_l_FieldsIndex;$_l_FieldsIndex;3)
				Case of 
					: (($_l_Type=1)) & ($_t_Format="")
						$_t_Format:="|AccountsNZ"
					: (($_l_Type=8)) & ($_t_Format="")
						$_t_Format:="|integers"
					: (($_l_Type=9)) & ($_t_Format="")
						$_t_Format:="|Longint"
						
					: ($_l_Type=Is time:K8:8) & ($_t_Format="")  // 26/06/06
						$_t_Format:="&/5"
					: ($_l_Type=4) & ($_t_Format="")
						$_t_Format:=""
						
					Else 
						$_t_Format:=""
				End case 
				
				QR GET INFO COLUMN:C766($_l_QRArea; $_l_ColumnNumber; $_t_ColumnTitle; $_t_ObjectName; $_l_HideColumn; $_l_ColumnWIdth; $_bo_RepeatedValue; $_t_DisplayFormat)
				$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_FieldsIndex})
				$_l_HideColumn:=Num:C11(($_l_ColumnWIdth=0) | ($_abo_ColumnsVisible{$_l_FieldsIndex}=False:C215))
				
				$_t_ColumnTitle:=OBJECT Get title:C1068($_ptr_HeaderVar->)
				
				QR SET INFO COLUMN:C765($_l_QRArea; $_l_ColumnNumber; $_t_ColumnTitle; $_t_ObjectName; $_l_HideColumn; $_l_ColumnWIdth; 1; $_t_Format)
				QR SET TEXT PROPERTY:C759($_l_QRArea; $_l_ColumnNumber; qr title:K14906:1; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontBold))
				
				QR SET TEXT PROPERTY:C759($_l_QRArea; $_l_ColumnNumber; qr title:K14906:1; qr font size:K14904:2; <>SYS_l_DefaultBoldFontSize)
				QR SET TEXT PROPERTY:C759($_l_QRArea; 1; -1; qr bold:K14904:3; 1)
				//QR SET TEXT PROPERTY($_l_QRArea;1;-1;qr text color;0x0000FF00)
				
				QR SET TEXT PROPERTY:C759($_l_QRArea; $_l_ColumnNumber; qr detail:K14906:2; _O_qr font:K14904:1; _O_Font number:C461(<>SYS_t_DefaultFontPlain))
				QR SET TEXT PROPERTY:C759($_l_QRArea; $_l_ColumnNumber; qr detail:K14906:2; qr font size:K14904:2; <>SYS_l_DefaultPlainFontSize)
				
			End if 
		End for 
		$_l_ColumnNumber:=$_l_ColumnNumber+1
		//QR INSERT COLUMN($_l_QRArea;$_l_ColumnNumber;"QR_AdvanceArray("+Char(34)+"TAB_ab_FieldData"+Char(34)+";"+String(1)+")")
		//QR GET INFO COLUMN($_l_QRArea;$_l_ColumnNumber;$_t_ColumnTitle;$_t_ObjectName;$_l_HideColumn;$_l_ColumnWIdth;$_bo_RepeatedValue;$_t_DisplayFormat)
		//QR SET INFO COLUMN($_l_QRArea;$_l_ColumnNumber;$_t_ColumnTitle;$_t_ObjectName;1;0;1;$_t_Format)
		
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
		QR SET DESTINATION:C745($_l_QRArea; qr text file:K14903:2; "")
		//PRINT SETTINGS
		LB_l_CurrentRow:=1
		
		QR RUN:C746($_l_QRArea)
		QR DELETE OFFSCREEN AREA:C754($_l_QRArea)
		FldDelimit:=$_l_Delimeter
		RecDelimit:=$_l_RecDelimeter
		
	: ($_t_SelectedContextName="Automated XML")
		
		//QR REPORT([Trans_Types];" ")
		//Create an XLS?
		//Print to XML
		$_bo_True:=False:C215
		
		$_ptr_Table:=Table:C252(DB_l_DisplayTable)
		
		$_t_TableName:=Table name:C256(DB_l_DisplayTable)
		$_t_XMLRef:=DOM Create XML Ref:C861("settings-import-export")
		// Export the table "$1" in '4D' binary format, all the records or only the current selection
		//DOM SET XML ATTRIBUTE($_t_XMLRef;"table_no";DB_l_CURRENTDISPLAYEDFORM;"format";"4D";"all_records";False)
		DOM SET XML ATTRIBUTE:C866($_t_XMLRef; "table_no"; DB_l_DisplayTable; "format"; "XML"; "all_records"; False:C215; "char_display_format"; "character"; "platform"; "automatic")  // Definition of fields to export
		//char_display_format="character" platform="automatic"For ($_l_FieldsIndex;1;Get last field number(DB_l_CURRENTDISPLAYEDFORM))
		$_t_XMLelt:=DOM Create XML element:C865($_t_XMLRef; "xml_settings"; "export_dtd_mode"; "generate-outside"; "export_xsl_mode"; "none")
		
		//<xml_settings export_dtd_mode="generate-outside"export_xsl_mode="none"/>
		For ($_l_FieldsIndex; 1; Get last field number:C255(DB_l_DisplayTable))
			If (Is field number valid:C1000(DB_l_DisplayTable; $_l_FieldsIndex))
				$_ptr_Field:=Field:C253(DB_l_DisplayTable; $_l_FieldsIndex)
				$_l_Type:=Type:C295($_ptr_Field->)
				Case of 
					: ($_l_Type=Is alpha field:K8:1)
						$_t_XMLelt:=DOM Create XML element:C865($_t_XMLRef; "field"; "table_no"; DB_l_DisplayTable; "field_no"; $_l_FieldsIndex; "kind"; "alpha")
					: ($_l_Type=Is real:K8:4)
						$_t_XMLelt:=DOM Create XML element:C865($_t_XMLRef; "field"; "table_no"; DB_l_DisplayTable; "field_no"; $_l_FieldsIndex; "kind"; "real")
					: ($_l_Type=Is text:K8:3)
						$_t_XMLelt:=DOM Create XML element:C865($_t_XMLRef; "field"; "table_no"; DB_l_DisplayTable; "field_no"; $_l_FieldsIndex; "kind"; "text")
						
					Else 
						
						$_t_XMLelt:=DOM Create XML element:C865($_t_XMLRef; "field"; "table_no"; DB_l_DisplayTable; "field_no"; $_l_FieldsIndex)
				End case 
			End if 
		End for 
		
		DOM EXPORT TO VAR:C863($_t_XMLRef; $_t_DomText)
		DOM CLOSE XML:C722($_t_XMLRef)
		$_t_ExportPath:=Select folder:C670("Please select the export folder:")
		If (OK=1) & ($_t_ExportPath#"")
			$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".txt"
			EXPORT DATA:C666($_t_ExportPath; $_t_DomText)  //Display of the export dialog box
			Gen_Alert("Export Completed")
			
		End if 
		
		
		
	: ($_t_SelectedContextName="Project Based")
		//This uses the data manager
		EW_ManageProjects(DB_l_DisplayTable)
		
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_TABLE.oExport"; $_t_oldMethodName)
