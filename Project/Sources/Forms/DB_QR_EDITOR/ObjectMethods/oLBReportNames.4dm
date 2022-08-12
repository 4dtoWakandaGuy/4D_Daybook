If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oLBReportNames
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
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	//ARRAY LONGINT(DoC_al_DocumentAccess;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	//ARRAY TEXT(DB_at_Formula;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_exists; DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CanDelete; DB_bo_CanEdit; DB_bo_CurrentReportEdited; DB_bo_ShowSorts; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_access; $_l_Error; $_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_offset; $_l_OK; $_l_Row)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DB_l_CurrentDisplayedForm; DB_l_ReportType; DB_l_SaveReport; DB_l_SetSort; DB_l_ShowTools; DB_l_SRarea)
	C_LONGINT:C283(DBQR_l_EDITORAREA; DBQR_l_ReportCodesColumnWidth; DBQR_l_ReportNamesColumnWidth; DBQR_l_SetPreferences; SEL_l_Delselection)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; DB_T_CurrentReportCode; DB_T_CurrentReportName; DB_t_ScriptBefore; DB_t_ScriptBody; DB_t_ScriptEnd; DB_t_ScriptStart; SR_t_ReportDataXML)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oLBReportNames"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Column Resize:K2:31)
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		LISTBOX GET ARRAYS:C832(*; "oLBReportNames"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		
		DBQR_l_ReportCodesColumnWidth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{1})
		
		
		DBQR_l_ReportNamesColumnWidth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{2})
		
		
		DBQR_SetWindowSettings
	: ($_l_event=On Double Clicked:K2:5)
		//here check if the current form is saved or edited
		$_l_Row:=Self:C308->
		//SELECTION TO ARRAY([DOCUMENTS]LDocument_Code;DB_at_DocumentCodes;[DOCUMENTS]Heading;DB_at_DocumentNames;[DOCUMENTS]Document_Class;DB_al_DOcumentClasses)
		DB_bo_ShowSorts:=False:C215
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
						[DOCUMENTS:7]AddtoListingReportMenu:28:=DB_bo_AddtoListings
						[DOCUMENTS:7]AddtoDataEntryReportMenu:29:=DB_bo_AddtoInput
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
							//$_l_Error:=SR Get Area (DB_l_SRarea;pReportData)
							//If ($_l_Error=0)
							//[DOCUMENTS]Write_:=pReportData
							//End if
							//$_l_Error:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
							$_l_Error:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
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
		Case of 
			: (DB_al_DOcumentClasses{$_l_Row}=SuperReportReport Template)
				$_l_access:=DoC_al_DocumentAccess{$_l_Row}
				If ($_l_access=0) | ($_l_access>1)
					If ($_l_access>=8) | ($_l_access=0)
						DB_bo_CanDelete:=True:C214
					Else 
						DB_bo_CanDelete:=False:C215
					End if 
					If (($_l_access>=4) & ($_l_access<8)) | ($_l_access>=12) | ($_l_access=0)
						
						DB_bo_CanEdit:=True:C214
					Else 
						DB_bo_CanEdit:=False:C215
					End if 
					ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
					ARRAY LONGINT:C221(DB_al_SortOrder; 0)
					DB_t_ScriptBefore:=""
					DB_t_ScriptStart:=""
					DB_t_ScriptBody:=""
					DB_t_ScriptEnd:=""
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_at_DocumentCodes{$_l_Row})
					DB_bo_AddtoListings:=[DOCUMENTS:7]AddtoListingReportMenu:28
					DB_bo_AddtoInput:=[DOCUMENTS:7]AddtoDataEntryReportMenu:29
					
					DB_t_ScriptBefore:=[DOCUMENTS:7]SR_PreMacro:16
					//$_l_Error:=SR Set Area (DB_l_SRarea;[DOCUMENTS]Write_)
					$_l_Error:=SR_LoadReport(DB_l_SRarea; [DOCUMENTS:7]SR_DOCUMENTXML_:34; 0)
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
					DB_T_CurrentReportNAME:=DB_at_DocumentNames{$_l_Row}
					DB_T_CurrentReportCode:=DB_at_DocumentCodes{$_l_Row}
					
					OBJECT SET VISIBLE:C603(DB_l_SRarea; True:C214)
					OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						//$_l_Error:=SR Set Options (DB_l_SRarea;1;1;0;"")
						//SRResult:=SR Set Options (DB_l_SRarea;0;0;32+64;$_t_WindowTitle)
						//SR Set Options(reportArea:L; showReportMenu:L; enableScriptAccess:L; miscReportOpts:L; zoomedWindowTitle:S ) -> resultCode:L
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 1)
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 1)
						//32(SR Options Hide Menubar)– Hide Menubar
						//64(SR Options Hide Toolbar)– Hide Toolbar
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
					Else 
						//$_l_Error:=SR Set Options (DB_l_SRarea;0;0;0;"")
						//SRResult:=SR Set Options (DB_l_SRarea;0;0;32+64;$_t_WindowTitle)
						//SR Set Options(reportArea:L; showReportMenu:L; enableScriptAccess:L; miscReportOpts:L; zoomedWindowTitle:S ) -> resultCode:L
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 0)
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 0)
						//32(SR Options Hide Menubar)– Hide Menubar
						//64(SR Options Hide Toolbar)– Hide Toolbar
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
					End if 
					
					DBQR_bo_MENUSDISPLAYED:=False:C215
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
					OBJECT GET COORDINATES:C663(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_WindowRight:=$_l_WindowWidth-(10)
					If ($_l_ObjectRight>$_l_WindowRight)
						OBJECT MOVE:C664(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-(10); $_l_ObjectBottom; *)
						
					End if 
					OBJECT GET COORDINATES:C663(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
					If ((Int:C8($_l_ObJWidth/2))=($_l_ObJWidth/2))  //even
						OBJECT MOVE:C664(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight-1; $_l_ObjectBottom; *)
						
					Else 
						OBJECT MOVE:C664(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight+1; $_l_ObjectBottom; *)
						
					End if 
					If (Not:C34(DB_bo_CanEdit))
						OBJECT SET ENTERABLE:C238(DB_l_SRarea; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_SaveReport; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_ShowTools; False:C215)
					Else 
						OBJECT SET ENTERABLE:C238(DB_l_SRarea; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SaveReport; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_ShowTools; True:C214)
					End if 
					If (Not:C34(DB_bo_CanDelete))
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
					End if 
				Else 
					
					OBJECT SET ENTERABLE:C238(DB_l_SRarea; False:C215)
					
					OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
					
				End if 
			: (DB_al_DOcumentClasses{$_l_Row}=SuperWrite Report Template)
				$_l_access:=DoC_al_DocumentAccess{$_l_Row}
				If ($_l_access=0) | ($_l_access>1)
					If ($_l_access>=8) | ($_l_access=0)
						DB_bo_CanDelete:=True:C214
					Else 
						DB_bo_CanDelete:=False:C215
					End if 
					If (($_l_access>=4) & ($_l_access<8)) | ($_l_access>=12) | ($_l_access=0)
						DB_bo_CanEdit:=True:C214
					Else 
						DB_bo_CanEdit:=False:C215
					End if 
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_at_DocumentCodes{$_l_Row})
					QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
					DB_bo_AddtoListings:=[DOCUMENTS:7]AddtoListingReportMenu:28
					DB_bo_AddtoInput:=[DOCUMENTS:7]AddtoDataEntryReportMenu:29
					
					DB_bo_CurrentReportEdited:=False:C215
					DB_l_ReportType:=SuperWrite Report Template
					DB_bo_CurrentReportEdited:=False:C215
					DB_T_CurrentReportNAME:=DB_at_DocumentNames{$_l_Row}
					DB_T_CurrentReportCode:=DB_at_DocumentCodes{$_l_Row}
					If (BLOB size:C605([DOCUMENTS:7]Options:32)>0)
						
						ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
						ARRAY LONGINT:C221(DB_al_SortOrder; 0)
						$_l_offset:=0
						BLOB TO VARIABLE:C533([DOCUMENTS:7]Options:32; DB_al_CurrentReportSortColumn; $_l_offset)
						If ($_l_offset<BLOB size:C605([DOCUMENTS:7]Options:32))
							BLOB TO VARIABLE:C533([DOCUMENTS:7]Options:32; DB_al_SortOrder; $_l_offset)
							
						Else 
							ARRAY LONGINT:C221(DB_al_SortOrder; Size of array:C274(DB_al_CurrentReportSortColumn))
							
						End if 
						
					Else 
						ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
						ARRAY LONGINT:C221(DB_al_SortOrder; 0)
						
					End if 
					QR SET SORTS:C752(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_SortOrder)
					OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
					OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
					OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
					OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 0)
					QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; qr view contextual menus:K14905:7; 1)
					DBQR_bo_MENUSDISPLAYED:=False:C215
					OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
					ARRAY TEXT:C222(DB_at_Formula; 0)
					APPEND TO ARRAY:C911(DB_at_Formula; "Get Related")
					APPEND TO ARRAY:C911(DB_at_Formula; "Set Format")
					OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
					OBJECT GET COORDINATES:C663(DBQR_l_EDITORAREA; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_WindowRight:=$_l_WindowWidth-(10)
					If ($_l_ObjectRight>$_l_WindowRight)
						OBJECT MOVE:C664(DBQR_l_EDITORAREA; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-(10); $_l_ObjectBottom; *)
						
					End if 
					If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
						DBQR_ShowSortColumns
					End if 
					If (Not:C34(DB_bo_CanEdit))
						OBJECT SET ENTERABLE:C238(DBQR_l_EDITORAREA; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_SaveReport; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_SetSort; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_ShowTools; False:C215)
						OBJECT SET VISIBLE:C603(DB_l_SetSort; False:C215)
					Else 
						OBJECT SET ENTERABLE:C238(DBQR_l_EDITORAREA; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SaveReport; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_ShowTools; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
						
					End if 
					If (Not:C34(DB_bo_CanDelete))
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
					End if 
					
				End if 
		End case 
End case 

ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oLBReportNames"; $_t_oldMethodName)
