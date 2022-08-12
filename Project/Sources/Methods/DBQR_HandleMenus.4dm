//%attributes = {}
If (False:C215)
	//Project Method Name:      DBQR_HandleMenus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2012 15:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	//ARRAY TEXT(DB_at_Formula;0)
	C_BLOB:C604($_blb_DocumentBlob)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OptionKey; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CurrentReportEdited; DB_bo_ShowSorts; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_Error; $_l_OK; $1; $2; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SetSort; DB_l_SRAREA; DBQR_l_EDITORAREA; DBQR_l_SetPreferences)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_DocumentPath; $_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; SR_t_ReportDataXML)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBQR_HandleMenus")

$_bo_OptionKey:=Gen_Option
Case of 
	: ($2=qr cmd save:K14900:20) & (Not:C34($_bo_OptionKey))
		
		If (DB_T_CurrentReportCode#"")
			
			If (DB_T_CurrentReportName#"")
				Gen_Confirm("Save changes to "+DB_T_CurrentReportName; "Yes"; "No")
				$_l_OK:=OK
			Else 
				Gen_Confirm("Save changes to "+DB_T_CurrentReportCode; "Yes"; "No")
				$_l_OK:=OK
			End if 
			If ($_l_OK=1)
				If (DB_T_CurrentReportCode#"")
					ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
					ARRAY LONGINT:C221(DB_al_SortOrder; 0)
					
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_T_CurrentReportCode)
					Case of 
						: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
							QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
							QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_SortOrder)
							SET BLOB SIZE:C606([DOCUMENTS:7]Options:32; 0)
							VARIABLE TO BLOB:C532(DB_al_CurrentReportSortColumn; [DOCUMENTS:7]Options:32; *)
							VARIABLE TO BLOB:C532(DB_al_SortOrder; [DOCUMENTS:7]Options:32; *)
							
						: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
							
							//$Result:=SR Get Area (DB_l_SRarea; )
							//If ($Result=0)
							//DB_l_SRAREA:=pReportData
							//$_l_Error:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML;0)
							$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
							[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML  //End if
							
					End case 
					<>SYS_t_LastSavedTableName:="DOCUMENTS"
					SAVE RECORD:C53([DOCUMENTS:7])
					
				End if 
			End if 
		Else 
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
					$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
					[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML  //[DOCUMENTS]LDocument_Code:="QR"+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
					
			End case 
			<>SYS_t_LastSavedTableName:="DOCUMENTS"
			SAVE RECORD:C53([DOCUMENTS:7])
			
			APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
			APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
			APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
			DB_T_CurrentReportCode:=[DOCUMENTS:7]Document_Code:1
			DB_T_CurrentReportName:=[DOCUMENTS:7]Heading:2
			
		End if 
		
		
		
	: ($2=qr cmd save as:K14900:21) & (Not:C34($_bo_OptionKey))
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
				$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
				[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
		End case 
		<>SYS_t_LastSavedTableName:="DOCUMENTS"
		SAVE RECORD:C53([DOCUMENTS:7])
		
		APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
		APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
		APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
		DB_T_CurrentReportCode:=[DOCUMENTS:7]Document_Code:1
		DB_T_CurrentReportName:=[DOCUMENTS:7]Heading:2
		
	: ($2=qr cmd new:K14900:18)
		
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
					If (DB_T_CurrentReportCode#"")
						
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_T_CurrentReportCode)
						Case of 
							: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
								QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
							: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
								$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
								[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
						End case 
						<>SYS_t_LastSavedTableName:="DOCUMENTS"
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
							$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
							[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
					End case 
					<>SYS_t_LastSavedTableName:="DOCUMENTS"
					SAVE RECORD:C53([DOCUMENTS:7])
					APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
					APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
					APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
					
					//Update the list of reports here
				End if 
				
			End if 
		End if 
		
		DB_bo_CurrentReportEdited:=False:C215
		
		
		//Quick Report
		DB_l_ReportType:=SuperWrite Report Template
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; qr view contextual menus:K14905:7; 1)
		DBQR_bo_MENUSDISPLAYED:=False:C215
		OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
		OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
		OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
		OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
		OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
		ARRAY TEXT:C222(DB_at_Formula; 0)
		APPEND TO ARRAY:C911(DB_at_Formula; "Get Related")
		APPEND TO ARRAY:C911(DB_at_Formula; "Set Format")
		OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
		
		
		
		
		
		
		
	: ($2=qr cmd open:K14900:19) & (Not:C34($_bo_OptionKey))
		
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
								$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
								[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
						End case 
						<>SYS_t_LastSavedTableName:="DOCUMENTS"
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
							$_l_Error:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
							[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
							
					End case 
					<>SYS_t_LastSavedTableName:="DOCUMENTS"
					SAVE RECORD:C53([DOCUMENTS:7])
					APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
					APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
					APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
					
					//Update the list of reports here
				End if 
				
			End if 
			DB_bo_CurrentReportEdited:=False:C215
		End if 
		
		SET BLOB SIZE:C606($_blb_DocumentBlob; 0)
		ARRAY TEXT:C222($_at_DocumentPaths; 0)
		$_t_DocumentPath:=Select document:C905(DB_GetDocumentPath; "4Qr"; "Select Report to Open"; 0; $_at_DocumentPaths)
		
		If ($_t_DocumentPath#"")
			DOCUMENT TO BLOB:C525($_at_DocumentPaths{1}; $_blb_DocumentBlob)
			QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; $_blb_DocumentBlob)
			DB_bo_CurrentReportEdited:=False:C215
			
			DB_T_CurrentReportName:=Substring:C12($_t_DocumentPath; 1; Length:C16($_t_DocumentPath)-4)
			DB_l_ReportType:=SuperWrite Report Template
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; qr view contextual menus:K14905:7; 1)
			DBQR_bo_MENUSDISPLAYED:=False:C215
			OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
			OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
			OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
			OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
			OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
			ARRAY TEXT:C222(DB_at_Formula; 0)
			APPEND TO ARRAY:C911(DB_at_Formula; "Get Related")
			APPEND TO ARRAY:C911(DB_at_Formula; "Set Format")
			OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
			
		End if 
	: ($2=qr cmd move left:K14900:49)
		QR EXECUTE COMMAND:C791($1; $2)
		If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
			DBQR_ShowSortColumns
		End if 
	: ($2=qr cmd move right:K14900:50)
		QR EXECUTE COMMAND:C791($1; $2)
		If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
			DBQR_ShowSortColumns
		End if 
		
	Else 
		QR EXECUTE COMMAND:C791($1; $2)
End case 
ERR_MethodTrackerReturn("DBQR_HandleMenus"; $_t_oldMethodName)