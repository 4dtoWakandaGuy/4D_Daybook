//%attributes = {}
If (False:C215)
	//Project Method Name:      DBQR_ShowSortColumns
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/12/2011 15:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY BOOLEAN(DBWS_abo_ColumnIsSorted;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_ReportSortDirection;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	//ARRAY LONGINT(DBWS_al_ColumnNumber;0)
	//ARRAY LONGINT(DBWS_al_COlumnSOrtOrder;0)
	//ARRAY LONGINT(DBWS_al_SortDirection;0)
	//ARRAY PICTURE(DBWS_apic_ColumnSortPicture;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(DBWS_At_SortableColumns;0)
	C_BOOLEAN:C305(<>SYS_bo_FieldNamesLoaded)
	C_LONGINT:C283($_l_CharacterPosition; $_l_ColumnHide; $_l_ColumnIndex; $_l_ColumnSize; $_l_FieldNumber; $_l_FieldRow; $_l_NumberofColumns; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_RepeatedValue; $_l_Right; $_l_SortColumn; $_l_TableNumber; $_l_Width; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DBQR_l_EDITORAREA)
	C_LONGINT:C283(SOR_l_BUT1; SOR_l_BUT10; SOR_l_BUT11; SOR_l_BUT12; SOR_l_BUT2; SOR_l_BUT3; SOR_l_BUT4; SOR_l_BUT5; SOR_l_BUT6; SOR_l_BUT7; SOR_l_BUT8)
	C_LONGINT:C283(SOR_l_BUT9)
	C_PICTURE:C286(DW_WS_NulSOrtPicture)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_ColumnObject; $_t_ColumnTitle; $_t_DisplayFormat; $_t_FieldName; $_t_FieldNameRaw; $_t_oldMethodName; $_t_TableName; $_t_TableNameRaw; oRE_HED5; oSOR_COL1; oSOR_COL10)
	C_TEXT:C284(oSOR_COL11; oSOR_COL12; oSOR_COL2; oSOR_COL3; oSOR_COL4; oSOR_COL5; oSOR_COL6; oSOR_COL7; oSOR_COL8; oSOR_COL9; oSOR_HED1)
	C_TEXT:C284(oSOR_HED10; oSOR_HED11; oSOR_HED12; oSOR_HED2; oSOR_HED3; oSOR_HED4; oSOR_HED6; oSOR_HED7; oSOR_HED8; oSOR_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBQR_ShowSortColumns")


ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
ARRAY LONGINT:C221(DB_al_SortOrder; 0)
//```
ARRAY TEXT:C222(DBWS_At_SortableColumns; 0)
ARRAY LONGINT:C221(DBWS_al_ColumnNumber; 0)
ARRAY BOOLEAN:C223(DBWS_abo_ColumnIsSorted; 0)
ARRAY LONGINT:C221(DBWS_al_COlumnSOrtOrder; 0)
ARRAY PICTURE:C279(DBWS_apic_ColumnSortPicture; 0)
ARRAY LONGINT:C221(DBWS_al_SortDirection; 0)
If (Not:C34(<>SYS_bo_FieldNamesLoaded))
	Load_Fields
End if 
$_t_ColumnTitle:=""
$_t_ColumnObject:=""
$_l_ColumnHide:=0
$_l_ColumnSize:=0
$_l_RepeatedValue:=0
$_t_DisplayFormat:=""
$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_ReportSortDirection)
//Note the settings always come from the area
For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
	//QR GET INFO COLUMN(DBQR_l_EDITORAREA;$_l_ColumnIndex;$_t_ColumnTitle;$_t_ColumnObject;$_l_ColumnHide;$_l_ColumnSize;$_l_RepeatedValue;$_t_DisplayFormat)
	QR GET INFO COLUMN:C766(DBQR_l_EDITORAREA; $_l_ColumnIndex; $_t_ColumnTitle; $_t_ColumnObject; $_l_ColumnHide; $_l_ColumnSize; $_l_RepeatedValue; $_t_DisplayFormat)
	///QR GET INFO COLUMN(DBQR_l_EDITORAREA;$_l_ColumnIndex;$_t_ColumnTitle;$_t_ColumnObject;$_l_ColumnHide;$_l_ColumnSize;$_l_RepeatedValue;$_t_DisplayFormat)
	
	If (Length:C16($_t_ColumnObject)>0)
		If ($_t_ColumnObject[[1]]="[")
			$_l_CharacterPosition:=Position:C15("]"; $_t_ColumnObject)
			$_t_TableNameRaw:=Substring:C12($_t_ColumnObject; 1; $_l_CharacterPosition-1)
			$_t_TableNameRaw:=Substring:C12($_t_TableNameRaw; 2)
			$_l_SortColumn:=DB_GetTableNumFromNameString($_t_TableNameRaw)
			If ($_l_SortColumn>0)
				$_t_FieldNameRaw:=Substring:C12($_t_ColumnObject; $_l_CharacterPosition+1)
				$_l_TableNumber:=<>DB_al_TableNums{$_l_SortColumn}
				$_t_TableName:=Table name:C256($_l_TableNumber)
				$_l_FieldRow:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_SortColumn}; $_t_FieldNameRaw)
				If ($_l_FieldRow>0)
					$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_SortColumn}{$_l_FieldRow}
					
					$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
					$_t_FieldName:=Field name:C257($_ptr_Field)
					//Here we can take out _ from field names.
					
					//ARRAY TEXT(DBWS_At_SortableColumns;0)
					//ARRAY LONGINT(DBWS_al_ColumnNumber;0)
					//ARRAY BOOLEAN(DBWS_abo_ColumnIsSorted;0)
					//ARRAY LONGINT(DBWS_al_COlumnSOrtOrder;0)
					//ARRAY PICTURE(DBWS_apic_ColumnSortPicture;0)
					APPEND TO ARRAY:C911(DBWS_At_SortableColumns; $_t_TableName+" "+$_t_FieldName)
					APPEND TO ARRAY:C911(DBWS_al_ColumnNumber; $_l_ColumnIndex)
					APPEND TO ARRAY:C911(DBWS_abo_ColumnIsSorted; False:C215)
					APPEND TO ARRAY:C911(DBWS_al_COlumnSOrtOrder; $_l_NumberofColumns+99)
					APPEND TO ARRAY:C911(DBWS_apic_ColumnSortPicture; DW_WS_NulSOrtPicture)
					APPEND TO ARRAY:C911(DBWS_al_SortDirection; 0)
				Else 
					//APPEND TO ARRAY(DBWS_At_SortableColumns;"Unknown Field")
					//APPEND TO ARRAY(DBWS_al_ColumnNumber;$_l_ColumnIndex)
					//APPEND TO ARRAY(DBWS_abo_ColumnIsSorted;False)
					//APPEND TO ARRAY(DBWS_al_COlumnSOrtOrder;0)
					//APPEND TO ARRAY(DBWS_apic_ColumnSortPicture;DW_WS_NulSOrtPicture)
					
				End if 
			Else 
				//APPEND TO ARRAY(DBWS_At_SortableColumns;"Unknown Field")
				//APPEND TO ARRAY(DBWS_al_ColumnNumber;$_l_ColumnIndex)
				//APPEND TO ARRAY(DBWS_abo_ColumnIsSorted;False)
				//APPEND TO ARRAY(DBWS_al_COlumnSOrtOrder;0)
				//APPEND TO ARRAY(DBWS_apic_ColumnSortPicture;DW_WS_NulSOrtPicture)
				
			End if 
		Else 
			//APPEND TO ARRAY(DBWS_At_SortableColumns;"Unknown Field")
			//APPEND TO ARRAY(DBWS_al_ColumnNumber;$_l_ColumnIndex)
			//APPEND TO ARRAY(DBWS_abo_ColumnIsSorted;False)
			//APPEND TO ARRAY(DBWS_al_COlumnSOrtOrder;0)
			//APPEND TO ARRAY(DBWS_apic_ColumnSortPicture;DW_WS_NulSOrtPicture)
			
		End if 
	Else 
		//its a variable or formula
		//LB_GetRelation("+String(DB_l_CurrentDisplayedForm)+";"+String(DB_al_REPTableNum{$_l_Row})+")")
		$_l_CharacterPosition:=Position:C15("LB_GetRelation"; $_t_ColumnObject)
		//dont add the automated relation fields to the sort columns
		If ($_l_CharacterPosition=0)
			APPEND TO ARRAY:C911(DBWS_At_SortableColumns; "Formula "+$_t_ColumnObject)
			APPEND TO ARRAY:C911(DBWS_al_ColumnNumber; $_l_ColumnIndex)
			APPEND TO ARRAY:C911(DBWS_abo_ColumnIsSorted; False:C215)
			APPEND TO ARRAY:C911(DBWS_al_COlumnSOrtOrder; $_l_NumberofColumns+99)
			APPEND TO ARRAY:C911(DBWS_apic_ColumnSortPicture; DW_WS_NulSOrtPicture)
			APPEND TO ARRAY:C911(DBWS_al_SortDirection; 0)
		End if 
	End if 
	
End for 
For ($_l_ColumnIndex; 1; Size of array:C274(DB_al_CurrentReportSortColumn))
	$_l_SortColumn:=Find in array:C230(DBWS_al_ColumnNumber; DB_al_CurrentReportSortColumn{$_l_ColumnIndex})
	If ($_l_SortColumn>0)
		//GET PICTURE FROM LIBRARY(22222+DB_al_ReportSortDirection{$_l_ColumnIndex}; DBWS_apic_ColumnSortPicture{$_l_SortColumn})
		DBWS_apic_ColumnSortPicture{$_l_SortColumn}:=Get_Picture(22222+DB_al_ReportSortDirection{$_l_ColumnIndex})
		
		DBWS_al_COlumnSOrtOrder{$_l_SortColumn}:=$_l_ColumnIndex
		DBWS_al_SortDirection{$_l_SortColumn}:=DB_al_ReportSortDirection{$_l_ColumnIndex}
		DBWS_abo_ColumnIsSorted{$_l_SortColumn}:=True:C214
	End if 
End for 
SORT ARRAY:C229(DBWS_al_COlumnSOrtOrder; DBWS_At_SortableColumns; DBWS_al_ColumnNumber; DBWS_abo_ColumnIsSorted; DBWS_al_SortDirection; DBWS_apic_ColumnSortPicture)
LB_SetupListbox(->DB_lb_QRSetSorts; "oSOR"; "SOR_L"; 1; ->DBWS_At_SortableColumns; ->DBWS_abo_ColumnIsSorted; ->DBWS_apic_ColumnSortPicture; ->DBWS_al_ColumnNumber; ->DBWS_al_COlumnSOrtOrder; ->DBWS_al_SortDirection)
LB_SetColumnHeaders(->DB_lb_QRSetSorts; "SOR_L"; 1; "Sortable Column"; "Include"; "Direction")
LB_SetColumnWidths(->DB_lb_QRSetSorts; "oSOR"; 1; 150; 20; 20; 0; 0; 0)
LB_SetScroll(->DB_lb_QRSetSorts; -2; -2)
LB_SetEnterable(->DB_lb_QRSetSorts; False:C215; 0; "")
LB_SetEnterable(->DB_lb_QRSetSorts; True:C214; 2; "")
LB_SetEnterable(->DB_lb_QRSetSorts; True:C214; 3; "")
LBi_InclSetupJustStyle(->DB_lb_QRSetSorts)


//ARRAY LONGINT(DBQR_al_SortTable;0)
//ARRAY LONGINT(DBQR_al_SortField;0)
//ARRAY BOOLEAN(DBQR_aB_CurrentSort;0)
//ARRAY TEXT(DBQR_at_FieldName;0)
$_l_Width:=210
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; True:C214)
OBJECT GET COORDINATES:C663(DBQR_l_EDITORAREA; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_Right:=$_l_WindowWidth-($_l_Width+10)
If ($_l_ObjectRight>$_l_Right)
	OBJECT MOVE:C664(DBQR_l_EDITORAREA; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-($_l_Width+10); $_l_ObjectBottom; *)
	
End if 
OBJECT MOVE:C664(DB_lb_QRSetSorts; $_l_WindowWidth-($_l_Width+5); $_l_ObjectTop; ($_l_WindowWidth-($_l_Width+5))+$_l_Width; $_l_ObjectBottom; *)
ERR_MethodTrackerReturn("DBQR_ShowSortColumns"; $_t_oldMethodName)
