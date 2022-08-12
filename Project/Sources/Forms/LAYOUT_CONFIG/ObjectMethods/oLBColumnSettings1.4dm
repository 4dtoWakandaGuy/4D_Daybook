If (False:C215)
	//object Method Name: Object Name:      LAYOUT_CONFIG.oLBColumnSettings1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 20:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	//ARRAY BOOLEAN(LAY_lb_ColumnSettings;0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY LONGINT(LL_al_FieldAccess;0)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY LONGINT(LL_al_TableAccess;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	C_BOOLEAN:C305($_bo_MoveMade; DB_bo_RecordModified; LAB_cb_BoldFont; LAB_cb_ItalicFont; LAB_cb_PlainFont; LAB_cb_UnerlineFont; LAY_bo_AddRecord; LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_LONGINT:C283($_l_Column; $_l_ColumnIndex; $_l_ColumnIndex2; $_l_ColumnNumber; $_l_ColumnWIdth; $_l_DataType; $_l_event; $_l_FieldColumn; $_l_FieldNumber; $_l_FieldsIndex; $_l_LastNumber)
	C_LONGINT:C283($_l_NewColumnNumber; $_l_NewNextNumber; $_l_NextNumber; $_l_offset; $_l_OldColumnNumber; $_l_PreviousRow; $_l_RecordNumber; $_L_RecordNumberRow; $_l_Row; $_l_SelectedRecordNumber; $_l_TableNumber)
	C_LONGINT:C283($_l_TableNumberRow; $_l_TableRow; $_l_TotalWidth; LAY_l_ConfigCancel; LAY_l_ConfigSave; LAY_l_CurrentColumnsWidth; LAY_l_LoadedRecord)
	C_POINTER:C301($_Ptr_ArrayPointer; $_ptr_Field)
	C_TEXT:C284($_t_ColumnTitle; $_t_oldMethodName; $_t_VariableName; AL_T_Formula; LL_t_FieldName; LL_t_FieldName2; LL_t_TableName; LL_t_TableName2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.oLBColumnSettings1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Column Moved:K2:30)
		//SELECTION TO ARRAY([LIST LAYOUTS]Order;LAY_al_ColumnNumber;[LIST LAYOUTS]Title;LAY_at_ColumnTitle;[LIST LAYOUTS];LAY_al_RecordNumbers)
		
		If (LAY_bo_RecordEdited=True:C214)
			//do we want to save the current loaded first
			Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
			If (OK=1)
				Lay_bo_SetupEdited:=True:C214
				DB_SaveRecord(->[LIST_LAYOUTS:96])
			End if 
			LAY_bo_RecordEdited:=False:C215
			$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
			$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
			$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
			$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
			If ($_L_RecordNumberRow<0)
				$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
			End if 
			LAY_al_ColumnNumber{$_L_RecordNumberRow}:=$_l_ColumnNumber
			LAY_at_ColumnTitle{$_L_RecordNumberRow}:=$_t_ColumnTitle
			LAY_al_RecordNumbers{$_L_RecordNumberRow}:=$_l_RecordNumber
			SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
			$_l_LastNumber:=0
			For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
				If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
					LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
				End if 
				If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
					//its a clash
					If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
						LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
						GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
						[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
						DB_SaveRecord(->[LIST_LAYOUTS:96])
					Else 
						$_l_offset:=0
						For ($_l_ColumnIndex2; $_l_ColumnIndex; 1; -1)
							If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
								LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
								GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
								[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
								DB_SaveRecord(->[LIST_LAYOUTS:96])
							End if 
							$_l_offset:=$_l_offset+1
						End for 
					End if 
				End if 
				$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
			End for 
			SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
			$_l_ColumnNumber:=0
			For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
				$_l_ColumnNumber:=$_l_ColumnIndex
				If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
					GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
					LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
					[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
					DB_SaveRecord(->[LIST_LAYOUTS:96])
					
				End if 
			End for 
			LAY_bo_RecordEdited:=False:C215
			OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
			OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
			//``````
		End if 
		DB_bo_RecordModified:=True:C214
		//TRACE
		LISTBOX MOVED COLUMN NUMBER:C844(LAY_lb_Columns; $_l_OldColumnNumber; $_l_NewColumnNumber)
		$_l_NextNumber:=0
		$_bo_MoveMade:=False:C215
		If (False:C215)
			For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
				Case of 
					: ($_l_ColumnIndex=$_l_OldColumnNumber) & ($_bo_MoveMade=False:C215)  //COlumn has been moved to the right
						If ($_l_NewColumnNumber>$_l_OldColumnNumber)
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_NewColumnNumber})
							[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7-1
							DB_SaveRecord(->[LIST_LAYOUTS:96])
							LAY_al_ColumnNumber{$_l_NewColumnNumber}:=[LIST_LAYOUTS:96]Order:7
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_OldColumnNumber})
							[LIST_LAYOUTS:96]Order:7:=$_l_NewColumnNumber
							DB_SaveRecord(->[LIST_LAYOUTS:96])
							LAY_al_ColumnNumber{$_l_OldColumnNumber}:=$_l_NewColumnNumber
							For ($_l_ColumnIndex2; $_l_NewColumnNumber; 1; -1)
								If ($_l_ColumnIndex2>$_l_OldColumnNumber)
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex2})
									LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex2}-1
									[LIST_LAYOUTS:96]Order:7:=LAY_al_ColumnNumber{$_l_ColumnIndex2}
									DB_SaveRecord(->[LIST_LAYOUTS:96])
								End if 
							End for 
							For ($_l_ColumnIndex2; $_l_ColumnIndex+1; Size of array:C274(LAY_al_ColumnNumber))
								If ($_l_ColumnIndex2#$_l_OldColumnNumber)
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex2})
									LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex2}+1
									[LIST_LAYOUTS:96]Order:7:=LAY_al_ColumnNumber{$_l_ColumnIndex2}
									DB_SaveRecord(->[LIST_LAYOUTS:96])
								End if 
							End for 
						Else 
							$_bo_MoveMade:=True:C214
						End if 
						$_l_NextNumber:=$_l_OldColumnNumber+1
						
					: ($_l_ColumnIndex=$_l_NewColumnNumber) & ($_bo_MoveMade=False:C215)
						If ($_l_OldColumnNumber>$_l_NewColumnNumber)
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_OldColumnNumber})
							[LIST_LAYOUTS:96]Order:7:=$_l_NewColumnNumber
							DB_SaveRecord(->[LIST_LAYOUTS:96])
							LAY_al_ColumnNumber{$_l_OldColumnNumber}:=$_l_NewColumnNumber
							GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
							[LIST_LAYOUTS:96]Order:7:=[LIST_LAYOUTS:96]Order:7+1
							DB_SaveRecord(->[LIST_LAYOUTS:96])
							LAY_al_ColumnNumber{$_l_ColumnIndex}:=[LIST_LAYOUTS:96]Order:7
							$_l_NextNumber:=$_l_NewColumnNumber+1
							For ($_l_ColumnIndex2; $_l_ColumnIndex+1; Size of array:C274(LAY_al_ColumnNumber))
								If ($_l_ColumnIndex2#$_l_OldColumnNumber)
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex2})
									LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex2}+1
									[LIST_LAYOUTS:96]Order:7:=LAY_al_ColumnNumber{$_l_ColumnIndex2}
									DB_SaveRecord(->[LIST_LAYOUTS:96])
								End if 
							End for 
						End if 
						$_bo_MoveMade:=True:C214
					Else 
						If (False:C215)
							If ($_l_ColumnIndex#$_l_NewColumnNumber)
								If ($_l_NextNumber>0)
									$_l_NewNextNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
									LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_NextNumber
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
									[LIST_LAYOUTS:96]Order:7:=$_l_NextNumber
									DB_SaveRecord(->[LIST_LAYOUTS:96])
									$_l_NextNumber:=$_l_NextNumber+1
								End if 
							End if 
						End if 
				End case 
			End for 
			SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
			$_l_ColumnNumber:=0
			For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
				$_l_ColumnNumber:=$_l_ColumnIndex
				If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
					GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
					LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
					[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
					DB_SaveRecord(->[LIST_LAYOUTS:96])
					
				End if 
			End for 
		Else 
			If ($_l_OldColumnNumber#$_l_NewColumnNumber)
				READ WRITE:C146([LIST_LAYOUTS:96])
				$_l_PreviousRow:=LAY_al_ColumnNumber{$_l_NewColumnNumber-1}
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_OldColumnNumber})
				[LIST_LAYOUTS:96]Order:7:=$_l_PreviousRow+1
				LAY_al_ColumnNumber{$_l_OldColumnNumber}:=[LIST_LAYOUTS:96]Order:7
				$_l_PreviousRow:=$_l_PreviousRow+1
				Lay_bo_SetupEdited:=True:C214
				DB_SaveRecord(->[LIST_LAYOUTS:96])
				Case of 
					: ($_l_OldColumnNumber>$_l_NewColumnNumber)
						For ($_l_ColumnIndex; $_l_NewColumnNumber; Size of array:C274(LAY_al_RecordNumbers))
							If ($_l_ColumnIndex#$_l_OldColumnNumber)
								GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
								[LIST_LAYOUTS:96]Order:7:=$_l_PreviousRow+1
								$_l_PreviousRow:=$_l_PreviousRow+1
								LAY_al_ColumnNumber{$_l_ColumnIndex}:=[LIST_LAYOUTS:96]Order:7
								Lay_bo_SetupEdited:=True:C214
								DB_SaveRecord(->[LIST_LAYOUTS:96])
							End if 
						End for 
						
						
					: ($_l_OldColumnNumber<$_l_NewColumnNumber)
						$_l_PreviousRow:=0
						For ($_l_ColumnIndex; 1; $_l_NewColumnNumber)
							If ($_l_ColumnIndex#$_l_OldColumnNumber)
								GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
								[LIST_LAYOUTS:96]Order:7:=$_l_PreviousRow+1
								LAY_al_ColumnNumber{$_l_ColumnIndex}:=[LIST_LAYOUTS:96]Order:7
								$_l_PreviousRow:=$_l_PreviousRow+1
								Lay_bo_SetupEdited:=True:C214
								DB_SaveRecord(->[LIST_LAYOUTS:96])
							End if 
						End for 
				End case 
				$_l_Row:=$_l_NewColumnNumber
				SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
				//LISTBOX SORT COLUMNS(LAY_lb_ColumnSettings;1)
				LISTBOX SELECT ROW:C912(LAY_lb_ColumnSettings; $_l_Row)
				
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_Row})
				LOAD RECORD:C52([LIST_LAYOUTS:96])
				Case of 
					: ([LIST_LAYOUTS:96]X_Font_Style:19=0)
						LAB_cb_PlainFont:=True:C214
						LAB_cb_BoldFont:=False:C215
						LAB_cb_ItalicFont:=False:C215
						LAB_cb_UnerlineFont:=False:C215
					: ([LIST_LAYOUTS:96]X_Font_Style:19=1)
						LAB_cb_PlainFont:=False:C215
						LAB_cb_BoldFont:=True:C214
						LAB_cb_ItalicFont:=False:C215
						LAB_cb_UnerlineFont:=False:C215
					: ([LIST_LAYOUTS:96]X_Font_Style:19=2)
						LAB_cb_PlainFont:=True:C214
						LAB_cb_BoldFont:=False:C215
						LAB_cb_ItalicFont:=True:C214
						LAB_cb_UnerlineFont:=False:C215
					: ([LIST_LAYOUTS:96]X_Font_Style:19=3)
						LAB_cb_PlainFont:=False:C215
						LAB_cb_BoldFont:=True:C214
						LAB_cb_ItalicFont:=True:C214
						LAB_cb_UnerlineFont:=False:C215
					: ([LIST_LAYOUTS:96]X_Font_Style:19=4)
						LAB_cb_PlainFont:=True:C214
						LAB_cb_BoldFont:=False:C215
						LAB_cb_ItalicFont:=False:C215
						LAB_cb_UnerlineFont:=True:C214
					: ([LIST_LAYOUTS:96]X_Font_Style:19=5)
						LAB_cb_PlainFont:=False:C215
						LAB_cb_BoldFont:=True:C214
						LAB_cb_ItalicFont:=False:C215
						LAB_cb_UnerlineFont:=True:C214
					: ([LIST_LAYOUTS:96]X_Font_Style:19=6)
						LAB_cb_PlainFont:=True:C214
						LAB_cb_BoldFont:=False:C215
						LAB_cb_ItalicFont:=True:C214
						LAB_cb_UnerlineFont:=True:C214
					: ([LIST_LAYOUTS:96]X_Font_Style:19=7)
						LAB_cb_PlainFont:=False:C215
						LAB_cb_BoldFont:=True:C214
						LAB_cb_ItalicFont:=True:C214
						LAB_cb_UnerlineFont:=True:C214
				End case 
				OBJECT SET VISIBLE:C603(*; "oFontNamesPopup"; True:C214)
				LAY_bo_RecordEdited:=False:C215
				LAY_bo_AddRecord:=False:C215
				LAY_l_LoadedRecord:=Record number:C243([LIST_LAYOUTS:96])
				If ([LIST_LAYOUTS:96]Table_Number:2#0)
					LL_LoadFieldNamePrefs([LIST_LAYOUTS:96]Table_Number:2)
					$_l_TableNumberRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
					ARRAY TEXT:C222(LL_at_TableNames2; 0)
					LL_t_TableName2:=""
					LL_t_FieldName2:=""
					For ($_l_ColumnIndex; 1; Size of array:C274(LL_al_TableIDs))
						If (User in group:C338(Current user:C182; "Designer"))
							APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
							
						Else 
							If (LL_al_TableAccess{$_l_ColumnIndex}>0)
								APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
								
							End if 
						End if 
					End for 
					LL_t_TableName:=LL_at_TableNames{$_l_TableNumberRow}
				Else 
					$_l_TableNumberRow:=0
					LL_t_TableName:=""
				End if 
				If ($_l_TableNumberRow>0)
					ARRAY LONGINT:C221(LL_al_FieldNums; 0)
					ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
					ARRAY TEXT:C222(LL_at_FieldName; 0)
					ARRAY TEXT:C222(LL_at_FieldName2; 0)
					For ($_l_ColumnIndex; 1; Size of array:C274(LL_al_FieldNos{$_l_TableNumberRow}))
						If (User in group:C338(Current user:C182; "Designer"))
							APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
							APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
							APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
							APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
							
						Else 
							If (LL_al_FieldAccess{$_l_TableNumberRow}{$_l_ColumnIndex}>0)
								APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
								APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
								APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
								APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
								
							End if 
						End if 
						
					End for 
					SORT ARRAY:C229(LL_at_FieldName; LL_al_FieldNums)
					SORT ARRAY:C229(LL_at_FieldName2; LL_al_FieldNums2)
					$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberRow}; [LIST_LAYOUTS:96]Field_Number:3)
					If ($_l_FieldColumn>0)
						LL_t_FieldName:=LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldColumn}
					Else 
						LL_t_FieldName:="???"
					End if 
				End if 
				If (([LIST_LAYOUTS:96]Footer:14=0) | ([LIST_LAYOUTS:96]Footer:14>6))
					[LIST_LAYOUTS:96]Footer:14:=1
				End if 
				AL_T_Formula:=[LIST_LAYOUTS:96]Formula:9
				If ([LIST_LAYOUTS:96]Table_Number:2>0) & ([LIST_LAYOUTS:96]Field_Number:3>0)
					
					$_ptr_Field:=Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)
					$_l_DataType:=Type:C295($_ptr_Field->)
					If ($_l_DataType=Is picture:K8:10) | ($_l_DataType=Is text:K8:3)
						OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]X_Rollover:20; True:C214)
					Else 
						OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]X_Rollover:20; False:C215)
					End if 
				Else 
					OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]X_Rollover:20; False:C215)
					
				End if 
				OBJECT SET ENTERABLE:C238(LL_t_TableName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_TableNames; True:C214)
				OBJECT SET ENTERABLE:C238(LL_t_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Enterable:8; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Title:4; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Format:6; True:C214)
				OBJECT SET VISIBLE:C603(SVS_at_PreviewDateString; True:C214)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
				
			End if 
			
			
		End if 
		
	: ($_l_event=On Column Resize:K2:31)
		
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		
		LISTBOX GET ARRAYS:C832(LAY_lb_Columns; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Column:=Find in array:C230($_aptr_ColumnVariables; Self:C308)
		
		Case of 
			: ($_l_Column>0)
				DB_bo_RecordModified:=True:C214
				$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
				
				$_l_ColumnNumber:=Find in array:C230(LAY_al_ColumnNumber; $_l_Column)
				$_l_SelectedRecordNumber:=LAY_al_RecordNumbers{$_l_ColumnNumber}
				If ($_l_RecordNumber#$_l_SelectedRecordNumber)
					
					
					DB_SaveRecord(->[LIST_LAYOUTS:96])
					If (LAY_bo_RecordEdited=True:C214)
						//do we want to save the current loaded first
						Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
						If (OK=1)
							Lay_bo_SetupEdited:=True:C214
							
							DB_SaveRecord(->[LIST_LAYOUTS:96])
						End if 
						LAY_bo_RecordEdited:=False:C215
						$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
						$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
						$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
						$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
						If ($_L_RecordNumberRow<0)
							$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
						End if 
						LAY_al_ColumnNumber{$_L_RecordNumberRow}:=$_l_ColumnNumber
						LAY_at_ColumnTitle{$_L_RecordNumberRow}:=$_t_ColumnTitle
						LAY_al_RecordNumbers{$_L_RecordNumberRow}:=$_l_RecordNumber
						SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
						$_l_LastNumber:=0
						For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
							If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
								LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
							End if 
							If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
								//its a clash
								If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
									LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
									GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
									[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
									DB_SaveRecord(->[LIST_LAYOUTS:96])
								Else 
									$_l_offset:=0
									For ($_l_ColumnIndex2; $_l_ColumnIndex; 1; -1)
										If (LAY_al_ColumnNumber{$_l_ColumnIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
											LAY_al_ColumnNumber{$_l_ColumnIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
											GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
											[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
											DB_SaveRecord(->[LIST_LAYOUTS:96])
										End if 
										$_l_offset:=$_l_offset+1
									End for 
								End if 
							End if 
							$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
						End for 
						SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
						$_l_ColumnNumber:=0
						For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
							$_l_ColumnNumber:=$_l_ColumnIndex
							If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
								GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
								LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
								[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
								DB_SaveRecord(->[LIST_LAYOUTS:96])
								
							End if 
						End for 
						LAY_bo_RecordEdited:=False:C215
						OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; False:C215)
						OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; False:C215)
						//``````
					End if 
					
					GOTO RECORD:C242([LIST_LAYOUTS:96]; $_l_SelectedRecordNumber)
					LOAD RECORD:C52([LIST_LAYOUTS:96])
					
					LAY_bo_RecordEdited:=False:C215
					LAY_bo_AddRecord:=False:C215
					LAY_l_LoadedRecord:=Record number:C243([LIST_LAYOUTS:96])
					If ([LIST_LAYOUTS:96]Table_Number:2#0)
						LL_LoadFieldNamePrefs([LIST_LAYOUTS:96]Table_Number:2)
						$_l_TableRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
						ARRAY TEXT:C222(LL_at_TableNames2; 0)
						LL_t_TableName2:=""
						LL_t_FieldName2:=""
						For ($_l_ColumnIndex; 1; Size of array:C274(LL_al_TableIDs))
							If (User in group:C338(Current user:C182; "Designer"))
								APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
								
							Else 
								If (LL_al_TableAccess{$_l_ColumnIndex}>0)
									APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
									
								End if 
							End if 
						End for 
						LL_t_TableName:=LL_at_TableNames{$_l_TableRow}
					Else 
						$_l_TableRow:=0
						LL_t_TableName:=""
					End if 
					If ($_l_TableRow>0)
						ARRAY LONGINT:C221(LL_al_FieldNums; 0)
						ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
						ARRAY TEXT:C222(LL_at_FieldName; 0)
						ARRAY TEXT:C222(LL_at_FieldName2; 0)
						For ($_l_FieldsIndex; 1; Size of array:C274(LL_al_FieldNos{$_l_TableRow}))
							If (User in group:C338(Current user:C182; "Designer"))
								APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableRow}{$_l_FieldsIndex})
								APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableRow}{$_l_FieldsIndex})
								APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableRow}{$_l_FieldsIndex})
								APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableRow}{$_l_FieldsIndex})
								
							Else 
								If (LL_al_FieldAccess{$_l_ColumnNumber}{$_l_ColumnIndex}>0)
									APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableRow}{$_l_FieldsIndex})
									APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableRow}{$_l_FieldsIndex})
									APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableRow}{$_l_FieldsIndex})
									APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableRow}{$_l_FieldsIndex})
									
								End if 
							End if 
							
						End for 
						SORT ARRAY:C229(LL_at_FieldName; LL_al_FieldNums)
						SORT ARRAY:C229(LL_at_FieldName2; LL_al_FieldNums2)
						$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos{$_l_TableRow}; [LIST_LAYOUTS:96]Field_Number:3)
						If ($_l_FieldColumn>0)
							LL_t_FieldName:=LL_at_FieldNames{$_l_TableRow}{$_l_FieldColumn}
						Else 
							LL_t_FieldName:="???"
						End if 
					End if 
					If (([LIST_LAYOUTS:96]Footer:14=0) | ([LIST_LAYOUTS:96]Footer:14>6))
						[LIST_LAYOUTS:96]Footer:14:=1
					End if 
					
				Else 
					//its the current record
				End if 
				$_Ptr_ArrayPointer:=$_aptr_ColumnVariables{$_l_Column}
				[LIST_LAYOUTS:96]Width:5:=LISTBOX Get column width:C834($_Ptr_ArrayPointer->)
				OBJECT SET ENTERABLE:C238(LL_t_TableName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_TableNames; True:C214)
				OBJECT SET ENTERABLE:C238(LL_t_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Enterable:8; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Title:4; True:C214)
				OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Format:6; True:C214)
				OBJECT SET VISIBLE:C603(SVS_at_PreviewDateString; True:C214)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
				LAY_bo_RecordEdited:=True:C214
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
				$_l_TotalWidth:=20
				$_l_ColumnWIdth:=0
				//ALERT("SIZE3")
				For ($_l_ColumnNumber; 1; Size of array:C274($_aptr_ColumnVariables))
					If ($_abo_ColumnsVisible{$_l_ColumnNumber}=True:C214)
						LB_GetWidths(->LAY_lb_Columns; $_l_ColumnNumber; ->$_l_ColumnWIdth)
						$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWIdth
					End if 
				End for 
				LAY_l_CurrentColumnsWidth:=$_l_TotalWidth
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oLBColumnSettings1"; $_t_oldMethodName)
