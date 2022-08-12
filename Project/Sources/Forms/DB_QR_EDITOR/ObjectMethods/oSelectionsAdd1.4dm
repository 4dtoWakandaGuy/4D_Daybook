If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oSelectionsAdd1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/02/2012 11:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CurrentReportEdited)
	C_LONGINT:C283($_l_Error; $_l_event; $_l_OK; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SRarea; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; SR_t_ReportDataXML)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oSelectionsAdd1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//make sure we save first!!
		
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
								//$_l_Error:=SR Get Area (DB_l_SRarea;pReportData)
								//If ($_l_Error=0)
								//[DOCUMENTS]Write_:=pReportData
								//End if
								//$_l_Error:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
								$_l_Error:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
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
		
		If (Gen_Option)
			Gen_Confirm("Load Report from disk?")
			If (OK=1)
				DB_REPLoadReport(False:C215)
				
			End if 
			
		Else 
			DB_REP_NewReport(False:C215)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oSelectionsAdd1"; $_t_oldMethodName)
