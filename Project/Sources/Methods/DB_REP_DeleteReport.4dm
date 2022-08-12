//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_DeleteReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_AvailableReports;0)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	//ARRAY LONGINT(DoC_al_DocumentAccess;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	//ARRAY TEXT(DB_at_Formula;0)
	C_BOOLEAN:C305(DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CanDelete; DB_bo_CanEdit; DB_bo_CurrentReportEdited; DB_bo_ShowSorts; DBAR_bo_SetSorts; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_AccessLevel; $_l_Column; $_l_Error; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_offset; $_l_Result; $_l_Right)
	C_LONGINT:C283($_l_Row; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DB_l_ReportType; DB_l_SaveReport; DB_l_SetSort; DB_l_ShowTools; DB_l_SRAREA)
	C_LONGINT:C283(DBQR_l_EDITORAREA; DBQR_l_SetPreferences; SEL_l_Delselection)
	C_TEXT:C284($_t_oldMethodName; DB_T_CurrentReportCode; DB_T_CurrentReportName; DB_t_ScriptBefore; DB_t_ScriptBody; DB_t_ScriptEnd; DB_t_ScriptStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REP_DeleteReport")


//TRACE
//investigate
LISTBOX GET CELL POSITION:C971(DB_lb_AvailableReports; $_l_Column; $_l_Row)
If ($_l_Row>0)
	//TRACE
	READ WRITE:C146([DOCUMENTS:7])
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DB_at_DocumentCodes{$_l_Row})
	DELETE RECORD:C58([DOCUMENTS:7])
	
	LISTBOX DELETE ROWS:C914(DB_lb_AvailableReports; $_l_Row)
	DB_bo_CurrentReportEdited:=False:C215
	DB_T_CurrentReportName:=""
	If ($_l_Row>Size of array:C274(DB_at_DocumentCodes))
		$_l_Row:=Size of array:C274(DB_at_DocumentCodes)
	End if 
	
	If ($_l_Row>0)
		Case of 
			: (DB_al_DOcumentClasses{$_l_Row}=SuperReportReport Template)
				$_l_AccessLevel:=DoC_al_DocumentAccess{$_l_Row}
				If ($_l_AccessLevel=0) | ($_l_AccessLevel>1)
					If ($_l_AccessLevel>=8) | ($_l_AccessLevel=0)
						DB_bo_CanDelete:=True:C214
					End if 
					If (($_l_AccessLevel>=4) & ($_l_AccessLevel<8)) | ($_l_AccessLevel>=12) | ($_l_AccessLevel=0)
						
						DB_bo_CanEdit:=True:C214
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
					//$_l_Result:=SR Set Area (DB_l_SRarea;[DOCUMENTS]Write_)
					$_l_Error:=SR_LoadReport(DB_l_SRAREA; [DOCUMENTS:7]SR_DOCUMENTXML_:34; 0)
					$_l_Result:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_StartScript; ->DB_t_ScriptStart)
					$_l_Result:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_BodyScript; ->DB_t_ScriptBody)
					$_l_Result:=SR_GetPtrProperty(DB_l_SRarea; 0; SRP_DataSource_EndScript; ->DB_t_ScriptEnd)
					
					//$_l_Result:=SR Get Scripts (DB_l_SRarea;DB_t_ScriptStart;DB_t_ScriptBody;DB_t_ScriptEnd)
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
					OBJECT SET VISIBLE:C603(DBAR_bo_SetSorts; False:C215)
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						//$_l_Error:=SR Set Options (DB_l_SRarea;1;1;0;"")
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 1)
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 1)
						//32(SR Options Hide Menubar)– Hide Menubar
						//64(SR Options Hide Toolbar)– Hide Toolbar
						SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
					Else 
						//$_l_Error:=SR Set Options (DB_l_SRarea;0;0;0;"")
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
					$_l_Right:=$_l_WindowWidth-(10)
					If ($_l_ObjectRight>$_l_Right)
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
				If ($_l_AccessLevel=0) | ($_l_AccessLevel>1)
					If ($_l_AccessLevel>=8) | ($_l_AccessLevel=0)
						DB_bo_CanDelete:=True:C214
					End if 
					If (($_l_AccessLevel>=4) & ($_l_AccessLevel<8)) | ($_l_AccessLevel>=12) | ($_l_AccessLevel=0)
						DB_bo_CanEdit:=True:C214
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
					$_l_Right:=$_l_WindowWidth-(10)
					If ($_l_ObjectRight>$_l_Right)
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
					Else 
						OBJECT SET ENTERABLE:C238(DBQR_l_EDITORAREA; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SaveReport; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_SetSort; True:C214)
						OBJECT SET VISIBLE:C603(DB_l_ShowTools; True:C214)
					End if 
					If (Not:C34(DB_bo_CanDelete))
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
					Else 
						OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
					End if 
					
				End if 
		End case 
		
		
	Else 
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_REP_DeleteReport"; $_t_oldMethodName)