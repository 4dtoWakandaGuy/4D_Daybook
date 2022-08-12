//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REPLoadReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	ARRAY TEXT:C222($_at_DocPaths; 0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	C_BLOB:C604($_blb_DocumentBLOB)
	C_BOOLEAN:C305($_bo_CheckSave; $_bo_Continue; $1; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CurrentReportEdited)
	C_LONGINT:C283($_l_Error; $_l_OK; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SRAREA; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; SR_t_ReportDataXML)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REPLoadReport")


// ----------------------------------------------------
// User name (OS): Nigel_Greenlee
// Date and time: 09/01/12, 10:23:26
// ----------------------------------------------------
// Method: DB_REPLoadReport
// Description
//
//
// Parameters
// ----------------------------------------------------

If (True:C214)
	If (Count parameters:C259>=1)
		$_bo_CheckSave:=$1
	Else 
		$_bo_CheckSave:=True:C214
	End if 
	If ($_bo_CheckSave)
		
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
						Case of 
							: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
								QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
							: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
								//$Result:=SR Get Area (DB_l_SRarea;pReportData)
								//If ($Result=0)
								//[DOCUMENTS]Write_:=pReportData
								//End if
								//$_l_Error:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML;0)
								$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
								[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
						End case 
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
					Case of 
						: (DB_l_ReportType=SuperWrite Report Template)
							[DOCUMENTS:7]Document_Code:1:="QR "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
							[DOCUMENTS:7]Document_Class:14:=SuperWrite Report Template  //using this as they will never exist
							QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
						: (DB_l_ReportType=SuperReportReport Template)
							[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
							[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
							//$Result:=SR Get Area (DB_l_SRarea;pReportData)
							//If ($Result=0)
							//[DOCUMENTS]Write_:=pReportData
							//End if
							//$_l_Error:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML;0)
							//[DOCUMENTS]LDocument_Code:="QR"+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
							$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
							[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
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
		
	End if 
	
	SET BLOB SIZE:C606($_blb_DocumentBLOB; 0)
	ARRAY TEXT:C222($_at_DocPaths; 0)
	$_t_DocumentPath:=Select document:C905(DB_GetDocumentPath; "4Qr;4SR"; "Select Report to Open"; 0; $_at_DocPaths)
	
	If ($_t_DocumentPath#"")
		DOCUMENT TO BLOB:C525($_at_DocPaths{1}; $_blb_DocumentBLOB)
		QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; $_blb_DocumentBLOB)
		DB_bo_CurrentReportEdited:=False:C215
		
		DB_T_CurrentReportName:=Substring:C12($_t_DocumentPath; 1; Length:C16($_t_DocumentPath)-4)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_REPLoadReport"; $_t_oldMethodName)