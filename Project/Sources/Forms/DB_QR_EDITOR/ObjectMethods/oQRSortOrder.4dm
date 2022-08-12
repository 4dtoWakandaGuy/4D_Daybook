If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oQRSortOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 13:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY BOOLEAN(DBWS_abo_ColumnIsSorted;0)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_ReportSortDirection;0)
	//ARRAY LONGINT(DBWS_al_ColumnNumber;0)
	//ARRAY LONGINT(DBWS_al_COlumnSOrtOrder;0)
	//ARRAY LONGINT(DBWS_al_SortDirection;0)
	//ARRAY PICTURE(DBWS_apic_ColumnSortPicture;0)
	//ARRAY TEXT(DBWS_At_SortableColumns;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Index; $_l_NumberofColumns; $_l_Row; $_l_SortOrder; $_l_SourceProcess; $_l_SourceRow; DBQR_l_EDITORAREA)
	C_PICTURE:C286(DW_WS_NulSOrtPicture)
	C_POINTER:C301($_ptr_sourceObject)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oQRSortOrder"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(DB_lb_QRSetSorts; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				//set it sorted
				$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
				
				If (DBWS_abo_ColumnIsSorted{$_l_Row})
					$_l_SortOrder:=0
					For ($_l_Index; 1; Size of array:C274(DBWS_al_COlumnSOrtOrder))
						If (DBWS_al_COlumnSOrtOrder{$_l_Index}<$_l_NumberofColumns)
							If (DBWS_al_COlumnSOrtOrder{$_l_Index}>$_l_SortOrder)
								$_l_SortOrder:=DBWS_al_COlumnSOrtOrder{$_l_Index}
							End if 
						End if 
					End for 
					DBWS_al_COlumnSOrtOrder{$_l_Row}:=$_l_SortOrder+1
					//GET PICTURE FROM LIBRARY(22222+Num(DBWS_al_SortDirection{$_l_Row}); DBWS_apic_ColumnSortPicture{$_l_Row})
					DBWS_apic_ColumnSortPicture{$_l_Row}:=Get_Picture(22222+Num:C11(DBWS_al_SortDirection{$_l_Row}))
				Else 
					DBWS_apic_ColumnSortPicture{$_l_Row}:=DW_WS_NulSOrtPicture
					DBWS_al_COlumnSOrtOrder{$_l_Row}:=$_l_NumberofColumns+99
				End if 
			: ($_l_Column=3)
				If (DBWS_abo_ColumnIsSorted{$_l_Row})
					DBWS_al_SortDirection{$_l_Row}:=Abs:C99(DBWS_al_SortDirection{$_l_Row}-1)
				Else 
					DBWS_abo_ColumnIsSorted{$_l_Row}:=True:C214
				End if 
				///GET PICTURE FROM LIBRARY(22222+Num(DBWS_al_SortDirection{$_l_Row}); DBWS_apic_ColumnSortPicture{$_l_Row})
				DBWS_apic_ColumnSortPicture{$_l_Row}:=Get_Picture(22222+Num:C11(DBWS_al_SortDirection{$_l_Row}))
				
				
		End case 
		SORT ARRAY:C229(DBWS_al_COlumnSOrtOrder; DBWS_At_SortableColumns; DBWS_al_ColumnNumber; DBWS_abo_ColumnIsSorted; DBWS_al_SortDirection; DBWS_apic_ColumnSortPicture)
		
		ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
		ARRAY LONGINT:C221(DB_al_ReportSortDirection; 0)
		For ($_l_Index; 1; Size of array:C274(DBWS_abo_ColumnIsSorted))
			If (DBWS_abo_ColumnIsSorted{$_l_Index})
				APPEND TO ARRAY:C911(DB_al_CurrentReportSortColumn; DBWS_al_ColumnNumber{$_l_Index})
				APPEND TO ARRAY:C911(DB_al_ReportSortDirection; DBWS_al_SortDirection{$_l_Index})
			End if 
		End for 
		QR SET SORTS:C752(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_ReportSortDirection)
	: ($_l_event=On Row Moved:K2:32)
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
		If (True:C214)  //($_ptr_sourceObject->=->DB_lb_QRSetSorts)
			
			LISTBOX GET CELL POSITION:C971(DB_lb_QRSetSorts; $_l_Column; $_l_Row)
			
			$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
			
			DBWS_al_COlumnSOrtOrder{$_l_Row}:=0
			
			For ($_l_Index; 1; Size of array:C274(DBWS_al_COlumnSOrtOrder))
				If (DBWS_al_COlumnSOrtOrder{$_l_Index}<$_l_NumberofColumns)
					DBWS_al_COlumnSOrtOrder{$_l_Index}:=$_l_Index
					DBWS_abo_ColumnIsSorted{$_l_Index}:=True:C214
					//GET PICTURE FROM LIBRARY(22222+Num(DBWS_al_SortDirection{$_l_Row}); DBWS_apic_ColumnSortPicture{$_l_Row})
					DBWS_apic_ColumnSortPicture{$_l_Row}:=Get_Picture(22222+Num:C11(DBWS_al_SortDirection{$_l_Row}))
					
				End if 
			End for 
			SORT ARRAY:C229(DBWS_al_COlumnSOrtOrder; DBWS_At_SortableColumns; DBWS_al_ColumnNumber; DBWS_abo_ColumnIsSorted; DBWS_al_SortDirection; DBWS_apic_ColumnSortPicture)
			ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
			ARRAY LONGINT:C221(DB_al_ReportSortDirection; 0)
			For ($_l_Index; 1; Size of array:C274(DBWS_abo_ColumnIsSorted))
				If (DBWS_abo_ColumnIsSorted{$_l_Index})
					APPEND TO ARRAY:C911(DB_al_CurrentReportSortColumn; DBWS_al_ColumnNumber{$_l_Index})
					APPEND TO ARRAY:C911(DB_al_ReportSortDirection; DBWS_al_SortDirection{$_l_Index})
				End if 
			End for 
			QR SET SORTS:C752(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_ReportSortDirection)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oQRSortOrder"; $_t_oldMethodName)
