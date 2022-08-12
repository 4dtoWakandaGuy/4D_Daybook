//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_NewReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	//ARRAY TEXT(DB_at_Formula;0)
	C_BOOLEAN:C305($_bo_CheckSave; $_bo_Continue; $1; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CurrentReportEdited; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_Error; $_l_OK; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SaveReport; DB_l_SetSort; DB_l_SRAREA; DBQR_l_EDITORAREA; DBQR_l_SetPreferences)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; DB_t_ScriptBefore; DB_t_ScriptBody; DB_t_ScriptEnd; DB_t_ScriptStart; SR_t_ReportDataXML)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REP_NewReport")
//TRACE
//investigated
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
							//$_l_Error:=SR Get Area (DB_l_SRarea;pReportData)
							//If ($_l_Error=0)
							//[DOCUMENTS]Write_:=pReportData
							//End if
							//TRACE
							$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
							[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
							//$_l_Error:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML;0)
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
						//$_l_Error:=SR Get Area (DB_l_SRarea;[DOCUMENTS]Write_)
						//[DOCUMENTS]LDocument_Code:="QR "+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
						$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
						
						//$_l_Error:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML)
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

Gen_Confirm("Quickreport or Superreport?"; "QR"; "SR")
If (OK=1)
	//Quick Report
	DB_l_ReportType:=SuperWrite Report Template
	QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 1)
	QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 1)
	//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view style toolbar;0)
	//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view operators toolbar;0)
	//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view color toolbar;0)
	//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view column toolbar;0)
	//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view contextual menus;1)
	DBQR_bo_MENUSDISPLAYED:=False:C215
	OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
	OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
	OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
	OBJECT SET ENTERABLE:C238(DBQR_l_EDITORAREA; True:C214)
	
	OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
	OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
	OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
	ARRAY TEXT:C222(DB_at_Formula; 0)
	APPEND TO ARRAY:C911(DB_at_Formula; "Get Related")
	APPEND TO ARRAY:C911(DB_at_Formula; "Set Format")
	OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
	OBJECT SET VISIBLE:C603(DB_l_SaveReport; True:C214)
	
	DB_bo_CurrentReportEdited:=False:C215
	DB_l_ReportType:=SuperWrite Report Template
	DB_T_CurrentReportNAME:=""
	DB_T_CurrentReportCode:=""
	
Else 
	OK:=1
	//superreport
	DB_t_ScriptBefore:=""
	DB_t_ScriptStart:=""
	DB_t_ScriptBody:=""
	DB_t_ScriptEnd:=""
	UNLOAD RECORD:C212([DOCUMENTS:7])
	
	//QUERY([DOCUMENTS];[DOCUMENTS]LDocument_Code=DB_at_DocumentCodes{$_l_Row})
	//DB_t_ScriptBefore:=[DOCUMENTS]SR_PreMacro
	//$_l_Error:=SR Set Area (DB_l_SRarea;[DOCUMENTS]d)
	SR_LoadReport(DB_l_SRarea; SR_GetTextProperty(0; 0; SRP_Area_NewReport))
	//$_l_Error:=SR_NewReport (DB_l_SRarea;"";0)
	$_l_Error:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_StartScript; ->DB_t_ScriptStart)
	$_l_Error:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_BodyScript; ->DB_t_ScriptBody)
	$_l_Error:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_EndScript; ->DB_t_ScriptEnd)
	
	//$_l_Error:=SR Get Scripts (DB_l_SRarea;DB_t_ScriptStart;DB_t_ScriptBody;DB_t_ScriptEnd)
	ARRAY TEXT:C222(DB_at_Formula; 0)
	APPEND TO ARRAY:C911(DB_at_Formula; "Before Report")
	APPEND TO ARRAY:C911(DB_at_Formula; "Header Script")
	APPEND TO ARRAY:C911(DB_at_Formula; "Body Script")
	APPEND TO ARRAY:C911(DB_at_Formula; "End Script")
	APPEND TO ARRAY:C911(DB_at_Formula; "Get Related")
	APPEND TO ARRAY:C911(DB_at_Formula; "Set Format")
	
	OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; False:C215)
	OBJECT SET VISIBLE:C603(DB_l_SetSort; False:C215)
	OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; False:C215)
	DB_bo_CurrentReportEdited:=False:C215
	DB_l_ReportType:=SuperReportReport Template
	DB_T_CurrentReportNAME:=""
	DB_T_CurrentReportCode:=""
	
	OBJECT SET VISIBLE:C603(DB_l_SRarea; True:C214)
	OBJECT SET ENTERABLE:C238(DB_l_SRarea; True:C214)
	OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
	OBJECT SET VISIBLE:C603(DB_l_SaveReport; True:C214)
End if 
ERR_MethodTrackerReturn("DB_REP_NewReport"; $_t_oldMethodName)