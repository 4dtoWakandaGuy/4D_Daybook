If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oopenReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/02/2012 14:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	C_BLOB:C604($_blb_DocumentBLOB)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_CurrentReportEdited)
	C_LONGINT:C283($_l_OK; $_l_SaveReport; DB_l_SRarea; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; SR_t_ReportDataXML)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oopenReport"; Form event code:C388)
//Here check status of current report

If (DB_bo_CurrentReportEdited)
	If (DB_T_CurrentReportName#"")
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
				Case of 
					: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
						QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
					: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
						
						$_l_SaveReport:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
						
						[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
						
						//$_l_SaveReport:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
						
				End case 
				SAVE RECORD:C53([DOCUMENTS:7])
			End if 
		End if 
		//save changes here
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
			$_t_ReportName:=Gen_Request("Please Name the current report"; "")
			If ($_t_ReportName="")
				$_t_ReportName:="TempReport"
			End if 
			
			CREATE RECORD:C68([DOCUMENTS:7])
			//[DOCUMENTS]AddtoDataEntryReportMenu
			//[DOCUMENTS]AddtoListingReportMenu
			//[DOCUMENTS]LDocument_Code
			[DOCUMENTS:7]Heading:2:=$_t_ReportName
			[DOCUMENTS:7]Document_Class:14:=SuperWrite Report Template  //using this as they will never exist
			QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
			//Update the list of reports here
		End if 
		
	End if 
	DB_bo_CurrentReportEdited:=False:C215
End if 
SET BLOB SIZE:C606($_blb_DocumentBLOB; 0)
ARRAY TEXT:C222($_at_DocumentPaths; 0)

$_t_DocumentPath:=Select document:C905(DB_GetDocumentPath; "4Qr"; "Select Report to Open"; 0; $_at_DocumentPaths)

If ($_t_DocumentPath#"")
	DOCUMENT TO BLOB:C525($_at_DocumentPaths{1}; $_blb_DocumentBLOB)
	QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; $_blb_DocumentBLOB)
	DB_bo_CurrentReportEdited:=False:C215
	
	DB_T_CurrentReportName:=Substring:C12($_t_DocumentPath; 1; Length:C16($_t_DocumentPath)-4)
	
	
End if 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oopenReport"; $_t_oldMethodName)
