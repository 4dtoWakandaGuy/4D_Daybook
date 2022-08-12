If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oPrintReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CurrentReportEdited)
	C_LONGINT:C283($_l_Error; $_l_OK; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SRarea; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; SR_t_ReportDataXML)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oPrintReport"; Form event code:C388)
If (DB_bo_CurrentReportEdited)
	If (DB_T_CurrentReportCode#"")
		If (DB_T_CurrentReportName#"")
			Gen_Confirm("Save changes to "+DB_T_CurrentReportName; "Yes"; "No")
			$_l_OK:=OK
		Else 
			Gen_Confirm("Save changes to "+DB_T_CurrentReportCode; "Yes"; "No")
			$_l_OK:=OK
		End if 
		If ($_l_OK=1)
			//save changes here
			If (DB_T_CurrentReportCode#"")
				
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_T_CurrentReportCode)
				ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
				ARRAY LONGINT:C221(DB_al_SortOrder; 0)
				
				Case of 
					: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
						QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
						QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_SortOrder)
						SET BLOB SIZE:C606([DOCUMENTS:7]Options:32; 0)
						VARIABLE TO BLOB:C532(DB_al_CurrentReportSortColumn; [DOCUMENTS:7]Options:32; *)
						VARIABLE TO BLOB:C532(DB_al_SortOrder; [DOCUMENTS:7]Options:32; *)
						
					: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
						//$_l_Error:=SR Get Area (DB_l_SRarea;pReportData)
						//If ($_l_Error=0)
						//[DOCUMENTS]Write_:=pReportData
						//End if
						//$_l_Error:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
						$_l_Error:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
						[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
						
						
				End case 
				//[DOCUMENTS]Options:=String(DB_l_CurrentReportSortTable)+":"+String(DB_l_CurrentReportSortFIeld)
				SAVE RECORD:C53([DOCUMENTS:7])
				
			End if 
		End if 
	Else 
		Gen_Confirm("Would you like to save the current report settings"; "Yes"; "No")
		If (OK=0)
			$_bo_Continue:=False:C215
			Gen_Confirm("These settings will be lost"; "Continue"; "Stop")
			If (OK=1)
				$_bo_Continue:=True:C214
			End if 
		Else 
			$_bo_Continue:=True:C214
			$_t_ReportName:=Gen_Request("Please name the current report"; "")
			If ($_t_ReportName="")
				$_t_ReportName:="TempReport"
			End if 
			
			CREATE RECORD:C68([DOCUMENTS:7])
			[DOCUMENTS:7]AddtoDataEntryReportMenu:29:=DB_bo_AddtoInput
			[DOCUMENTS:7]AddtoListingReportMenu:28:=DB_bo_AddtoListings
			//[DOCUMENTS]LDocument_Code
			[DOCUMENTS:7]Heading:2:=$_t_ReportName
			[DOCUMENTS:7]Table_Number:11:=DB_l_CurrentDisplayedForm
			ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
			ARRAY LONGINT:C221(DB_al_SortOrder; 0)
			
			Case of 
				: (DB_l_ReportType=SuperWrite Report Template)
					[DOCUMENTS:7]Document_Code:1:="QR "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
					[DOCUMENTS:7]Document_Class:14:=SuperWrite Report Template  //using this as they will never exist
					QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
					QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_SortOrder)
					SET BLOB SIZE:C606([DOCUMENTS:7]Options:32; 0)
					VARIABLE TO BLOB:C532(DB_al_CurrentReportSortColumn; [DOCUMENTS:7]Options:32; *)
					VARIABLE TO BLOB:C532(DB_al_SortOrder; [DOCUMENTS:7]Options:32; *)
					
				: (DB_l_ReportType=SuperReportReport Template)
					[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
					[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
					//$_l_Error:=SR Get Area (DB_l_SRarea;SR_t_ReportDataXML)
					//If ($_l_Error=0)
					//[DOCUMENTS]Write_:=pReportData
					//End if
					$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
					[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
					//[DOCUMENTS]LDocument_Code:="QR"+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
					
			End case 
			SAVE RECORD:C53([DOCUMENTS:7])
			APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
			APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
			APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
			
			//Update the list of reports here
		End if 
		
	End if 
End if 
DB_bo_CurrentReportEdited:=False:C215
DB_REP_PrintReport
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oPrintReport"; $_t_oldMethodName)
