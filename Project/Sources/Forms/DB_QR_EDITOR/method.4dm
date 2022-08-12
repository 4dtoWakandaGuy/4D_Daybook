If (False:C215)
	//Project Form Method Name:      DB_QR_EDITOR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 12:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(o_qr view color toolbar)
	//C_UNKNOWN(o_qr view column toolbar)
	//C_UNKNOWN(o_qr view menubar)
	//C_UNKNOWN(o_qr view operators toolbar)
	//C_UNKNOWN(o_qr view standard toolbar)
	//C_UNKNOWN(o_qr view style toolbar)
	//C_UNKNOWN(SR_Register)
	//C_UNKNOWN(SR_SaveReport)
	//C_UNKNOWN(SR_SetLongProperty)
	//C_UNKNOWN(SRQRHorizontalSPliter)
	//C_UNKNOWN(SRQRVerticalSPliter)
	//ARRAY BOOLEAN(DB_abo_Expanded;0)
	//ARRAY BOOLEAN(DB_abo_HasRelated;0)
	//ARRAY BOOLEAN(DB_lb_AvailableFields;0)
	//ARRAY BOOLEAN(DB_lb_AvailableFunctions;0)
	//ARRAY BOOLEAN(DB_lb_AvailableReports;0)
	//ARRAY BOOLEAN(DB_lb_QRSetSorts;0)
	ARRAY LONGINT:C221($_al_RelatedRepFieldNum; 0)
	ARRAY LONGINT:C221($_al_ReportAccess; 0)
	//ARRAY LONGINT(DB_al_DOcumentClasses;0)
	//ARRAY LONGINT(DB_al_RelatedToFieldNum;0)
	//ARRAY LONGINT(DB_al_RELRelationFieldNum;0)
	//ARRAY LONGINT(DB_al_REpFieldNum;0)
	//ARRAY LONGINT(DB_al_REPTableNum;0)
	//ARRAY LONGINT(DB_al_RowNumber;0)
	//ARRAY LONGINT(DBQR_al_FunctionType;0)
	//ARRAY LONGINT(DoC_al_DocumentAccess;0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	//ARRAY PICTURE(DB_apic_ExpandCollapse;0)
	//ARRAY PICTURE(DB_apic_ExpandPicture;0)
	ARRAY TEXT:C222($_at_FunctionCodes; 0)
	ARRAY TEXT:C222($_at_FunctionNames; 0)
	ARRAY TEXT:C222($_at_IncludeReports; 0)
	ARRAY TEXT:C222($_at_RelatedRepFieldName; 0)
	//ARRAY TEXT(BD_at_FldsFunctions;0)
	//ARRAY TEXT(DB_at_DocumentCodes;0)
	//ARRAY TEXT(DB_at_DocumentNames;0)
	//ARRAY TEXT(DB_at_ExpandCollapse;0)
	//ARRAY TEXT(DB_at_ExpandPicture;0)
	//ARRAY TEXT(DB_at_ExpandValue;0)
	//ARRAY TEXT(DB_at_ExpandValue2;0)
	//ARRAY TEXT(DB_at_RepFieldName;0)
	//ARRAY TEXT(DB_at_RowName;0)
	//ARRAY TEXT(DBQR_at_FunctionCode;0)
	//ARRAY TEXT(DBQR_at_FunctionNames;0)
	//ARRAY TEXT(QR_at_BorderStyles;0)
	C_BOOLEAN:C305($_bo_AutoMany; $_bo_AutoOne; $_bo_Continue; $_bo_Delete; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_HasRelated; $_bo_RelatedFIeldIndex; $_bo_RelatedFIeldInvisible; $_bo_RelatedFIeldUnique; $_t_FieldInvisible)
	C_BOOLEAN:C305(DB_bo_AddtoInput; DB_bo_AddtoListings; DB_bo_CanDelete; DB_bo_CanEdit; DB_bo_CurrentReportEdited; DB_bo_NoLoad; DB_bo_ShowSorts; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BoxBottom; $_l_ChoiceField; $_l_Distance; $_l_event; $_l_FIeldLength; $_l_FieldType; $_l_FunctionIndex; $_l_GroupAccesRow; $_l_GroupAccess; $_l_InsertsCount)
	C_LONGINT:C283($_l_NewHLLIst; $_l_NewHLLIst2; $_l_NewHLLIst3; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectLeft4; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_ObjectWidth; $_l_OK)
	C_LONGINT:C283($_l_OneField; $_l_OneTable; $_l_PersonalAccess; $_l_PersonelGroupID; $_l_PersonRow; $_l_RegistrationResult; $_l_RelatedDataType; $_l_RelatedFIeldLength; $_l_RelatedFieldsIndex; $_l_RelativeHeight; $_l_ReportFieldCount)
	C_LONGINT:C283($_l_ReportFieldIndex; $_l_ReportIndex; $_l_ReportRow; $_l_ReportTable; $_l_RepTableIndex; $_l_ResizeAmount; $_l_Result; CCM_l_BUT1; CCM_l_BUT10; CCM_l_BUT11; CCM_l_BUT12)
	C_LONGINT:C283(CCM_l_BUT13; CCM_l_BUT14; CCM_l_BUT15; CCM_l_BUT16; CCM_l_BUT17; CCM_l_BUT18; CCM_l_BUT19; CCM_l_BUT2; CCM_l_BUT20; CCM_l_BUT21; CCM_l_BUT22)
	C_LONGINT:C283(CCM_l_BUT23; CCM_l_BUT24; CCM_l_BUT25; CCM_l_BUT26; CCM_l_BUT27; CCM_l_BUT3; CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8)
	C_LONGINT:C283(CCM_l_BUT9; DB_l_CurrentDisplayedForm; DB_l_CurrentMenuTable; DB_l_CurrentReportSortFIeld; DB_l_CurrentReportSortTable; DB_l_NextObjectID; DB_l_ReportType; DB_l_SRarea; DB_T_ReportContext; DBQR_l_EDITORAREA; DBQR_l_HorizontalSplitterPos)
	C_LONGINT:C283(DBQR_l_ReportCodesColumnWidth; DBQR_l_ReportNamesColumnWidth; DBQR_l_SetPreferences; DBQr_l_VerticalSplitterPos; FUN_l_BUT1; FUN_l_BUT10; FUN_l_BUT11; FUN_l_BUT12; FUN_l_BUT2; FUN_l_BUT3; FUN_l_BUT4)
	C_LONGINT:C283(FUN_l_BUT5; FUN_l_BUT6; FUN_l_BUT7; FUN_l_BUT8; FUN_l_BUT9; PAL_BUTTON_1; PAL_BUTTON_2; REP_l_BUT1; REP_l_BUT10; REP_l_BUT11; REP_l_BUT12)
	C_LONGINT:C283(REP_l_BUT2; REP_l_BUT3; REP_l_BUT4; REP_l_BUT5; REP_l_BUT6; REP_l_BUT7; REP_l_BUT8; REP_l_BUT9)
	C_PICTURE:C286($_pic_CollapsePicture; $_Pic_ExpandPicture; $_pic_NoPicture)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_Collapse; $_t_Expand; $_t_LicencePath; $_t_NameToInsert; $_t_oldMethodName; $_t_RelatedFieldName; $_t_ReportName; $_t_SRPLicencePath; $_t_TableName; $_t_WindowTitle)
	C_TEXT:C284(DB_T_CurrentMenuContext; DB_T_CurrentReportCode; DB_t_CUrrentReportMenuReference; DB_T_CurrentReportName; DB_t_CurRepEditMenuReference; DB_t_CurRepFileMenuReference; DB_t_CurRepOptMenuReference; DB_T_QRNAme; oCCM_COL1; oCCM_COL10; oCCM_COL11)
	C_TEXT:C284(oCCM_COL12; oCCM_COL13; oCCM_COL14; oCCM_COL15; oCCM_COL16; oCCM_COL17; oCCM_COL18; oCCM_COL19; oCCM_COL2; oCCM_COL20; oCCM_COL21)
	C_TEXT:C284(oCCM_COL22; oCCM_COL23; oCCM_COL24; oCCM_COL25; oCCM_COL26; oCCM_COL27; oCCM_COL3; oCCM_COL4; oCCM_COL5; oCCM_COL6; oCCM_COL7)
	C_TEXT:C284(oCCM_COL8; oCCM_COL9; oCCM_HED1; oCCM_HED10; oCCM_HED11; oCCM_HED12; oCCM_HED13; oCCM_HED14; oCCM_HED15; oCCM_HED16; oCCM_HED17)
	C_TEXT:C284(oCCM_HED18; oCCM_HED19; oCCM_HED2; oCCM_HED20; oCCM_HED21; oCCM_HED22; oCCM_HED23; oCCM_HED24; oCCM_HED25; oCCM_HED26; oCCM_HED27)
	C_TEXT:C284(oCCM_HED3; oCCM_HED4; oCCM_HED5; oCCM_HED6; oCCM_HED7; oCCM_HED8; oCCM_HED9; oFUN_COL1; oFUN_COL10; oFUN_COL11; oFUN_COL12)
	C_TEXT:C284(oFUN_COL2; oFUN_COL3; oFUN_COL4; oFUN_COL5; oFUN_COL6; oFUN_COL7; oFUN_COL8; oFUN_COL9; oFUN_HED1; oFUN_HED10; oFUN_HED11)
	C_TEXT:C284(oFUN_HED12; oFUN_HED2; oFUN_HED3; oFUN_HED4; oFUN_HED6; oFUN_HED7; oFUN_HED8; oFUN_HED9; oRE_HED5; oREP_COL1; oREP_COL10)
	C_TEXT:C284(oREP_COL11; oREP_COL12; oREP_COL2; oREP_COL3; oREP_COL4; oREP_COL5; oREP_COL6; oREP_COL7; oREP_COL8; oREP_COL9; oREP_HED1)
	C_TEXT:C284(oREP_HED10; oREP_HED11; oREP_HED12; oREP_HED2; oREP_HED3; oREP_HED4; oREP_HED6; oREP_HED7; oREP_HED8; oREP_HED9; PAL_BUTTON)
	C_TEXT:C284(SR_t_ReportDataXML)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DB_QR_EDITOR"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		QR NEW AREA:C1320(->DBQR_l_EDITORAREA)
		
		
		If (DB_l_ReportType=0)
			DB_l_ReportType:=SuperWrite Report Template
		End if 
		
		If (DB_t_CUrrentReportMenuReference#"")
			RELEASE MENU:C978(DB_t_CUrrentReportMenuReference)
		End if 
		
		If (DB_t_CurRepFileMenuReference#"")
			RELEASE MENU:C978(DB_t_CurRepFileMenuReference)
		End if 
		DB_t_CUrrentReportMenuReference:=Create menu:C408  //Create  New Menu
		
		
		DB_t_CurRepFileMenuReference:=Create menu:C408
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Load From Disk")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REPLoadReport")
		//SET MENU ITEM MARK(DB_t_CurRepFileMenuReference;1;"DB_REPLoadReport")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "New Report")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_NewReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Save Report")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_SaveReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "(-")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Delete Report")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_DeleteReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "(-")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Export Report")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_ExportReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Print Report")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_PrintReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "(-")
		
		INSERT MENU ITEM:C412(DB_t_CurRepFileMenuReference; -1; "Exit Window")
		SET MENU ITEM METHOD:C982(DB_t_CurRepFileMenuReference; -1; "DB_REP_CloseReport")
		SET MENU ITEM MARK:C208(DB_t_CurRepFileMenuReference; 1; "")
		
		DB_t_CurRepEditMenuReference:=DB_MenuCreateEditMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
		
		
		DB_t_CurRepOptMenuReference:=Create menu:C408
		
		INSERT MENU ITEM:C412(DB_t_CurRepOptMenuReference; -1; "Set Sort Options")
		SET MENU ITEM METHOD:C982(DB_t_CurRepOptMenuReference; -1; "DB_REP_SetReportSorts")
		SET MENU ITEM MARK:C208(DB_t_CurRepOptMenuReference; 1; "")
		
		INSERT MENU ITEM:C412(DB_t_CurRepOptMenuReference; -1; "(-")
		
		INSERT MENU ITEM:C412(DB_t_CurRepOptMenuReference; -1; "Report Tools")
		SET MENU ITEM METHOD:C982(DB_t_CurRepOptMenuReference; -1; "DB_REP_ReportTools")
		SET MENU ITEM MARK:C208(DB_t_CurRepOptMenuReference; 1; "")
		
		//INSERT MENU ITEM(DB_t_CurRepOptMenuReference;-1;"(-")
		
		//INSERT MENU ITEM(DB_t_CurRepOptMenuReference;-1;"Save Report")
		//SET MENU ITEM METHOD(DB_t_CurRepOptMenuReference;-1;"DB_REP_NewReport")
		//SET MENU ITEM MARK(DB_t_CurRepOptMenuReference;1;"")
		
		
		INSERT MENU ITEM:C412(DB_t_CUrrentReportMenuReference; -1; Get indexed string:C510(79; 1); DB_t_CurRepFileMenuReference)
		INSERT MENU ITEM:C412(DB_t_CUrrentReportMenuReference; -1; Get indexed string:C510(79; 5); DB_t_CurRepEditMenuReference)
		INSERT MENU ITEM:C412(DB_t_CUrrentReportMenuReference; -1; "Options"; DB_t_CurRepOptMenuReference)
		SET MENU BAR:C67(DB_t_CUrrentReportMenuReference)
		
		DBQR_GetWindowSettings
		DB_bo_ShowSorts:=False:C215
		DB_l_NextObjectID:=0
		If (False:C215)
			//$_l_Sr_Reg_Result:=SR Register ("OvHipP-166215-652289-334141")
			//$_l_Sr_Reg_Result:=SR Register ("xDiCTw-049256-750407-254025")
			//$_l_Sr_Reg_Result:=SR Register("bOfYmT-052153-105799-154037")
		Else 
			$_t_LicencePath:=Get 4D folder:C485(Licenses folder:K5:11)
			$_t_SRPLicencePath:=$_t_LicencePath+"SRP3.license4Dplugin"
			If (Test path name:C476($_t_SRPLicencePath)=Is a document:K24:1)
				
			Else 
				$_l_RegistrationResult:=SR_Register("004614-PARTNER CLEARDAY-4Ud1QmwtUbVdHPMah5JqvfWWem8joYYp")
			End if 
			
		End if 
		//DB_l_ReportType:=SuperReportReport Template
		//DB_l_ReportType:=SuperWrite Report Template
		ARRAY LONGINT:C221(DB_al_REPTableNum; 0)
		ARRAY LONGINT:C221(DB_al_REpFieldNum; 0)
		ARRAY TEXT:C222(DB_at_RepFieldName; 0)
		//```````````
		ARRAY TEXT:C222(DB_at_DocumentCodes; 0)
		ARRAY TEXT:C222(DB_at_DocumentNames; 0)
		ARRAY LONGINT:C221(DB_al_DOcumentClasses; 0)
		
		If (False:C215)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 0)
			QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 0)
		End if 
		//QR SET AREA PROPERTY(DBQR_l_EDITORAREA;qr view contextual menus;1)
		
		
		
		
		
		
		
		QR ON COMMAND:C790(DBQR_l_EDITORAREA; "DBQR_HandleMenus")
		
		DBQR_bo_MENUSDISPLAYED:=False:C215
		OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
		READ WRITE:C146([DOCUMENTS:7])
		
		If (DB_T_QRNAme#"")
			//load the QR format from a blob
			Case of 
				: (DB_l_ReportType=SuperReportReport Template)
					
					OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; False:C215)
					OBJECT SET VISIBLE:C603(DB_l_SRarea; True:C214)
					
					
				: (DB_l_ReportType=SuperWrite Report Template)
					
					OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
					OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
					
			End case 
		Else 
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template; *)
			QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperWrite Report Template; *)
			
			
			QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Code:1="SR @")
			If (DB_l_CurrentDisplayedForm>0)
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=DB_l_CurrentDisplayedForm)
			Else 
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=Table:C252(->[COMPANIES:2]))
				
			End if 
			ARRAY TEXT:C222($_at_IncludeReports; 0)
			ARRAY LONGINT:C221($_al_ReportAccess; 0)
			//TRACE
			For ($_l_RepTableIndex; 1; Records in selection:C76([DOCUMENTS:7]))
				DOC_LoadAccess([DOCUMENTS:7]Document_Code:1)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
				$_l_PersonelGroupID:=[PERSONNEL_GROUPS:92]x_ID:12
				$_l_GroupAccesRow:=Find in array:C230(DOC_Al_GroupsAccess; $_l_PersonelGroupID)
				$_l_GroupAccess:=0
				$_l_PersonalAccess:=0
				If ($_l_GroupAccesRow>0)
					$_l_GroupAccess:=DOC_al_GroupAccessLevel{$_l_GroupAccesRow}
				End if 
				$_l_PersonRow:=Find in array:C230(DOC_al_PersonAccess; <>PER_l_CurrentUserID)
				If ($_l_PersonRow>0)
					$_l_PersonalAccess:=DOC_al_PersonAccessLevel{$_l_PersonRow}
				End if 
				If ($_l_PersonalAccess>0)
					If ($_l_PersonalAccess#$_l_GroupAccess)
						$_l_GroupAccess:=$_l_PersonalAccess
					End if 
				End if 
				If ($_l_GroupAccess>1)
					APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
					APPEND TO ARRAY:C911($_al_ReportAccess; $_l_PersonalAccess)
				Else 
					If ($_l_GroupAccess=0)
						APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
						APPEND TO ARRAY:C911($_al_ReportAccess; $_l_PersonalAccess)
					End if 
				End if 
				NEXT RECORD:C51([DOCUMENTS:7])
				
			End for 
			QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_IncludeReports)
			SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; DB_at_DocumentCodes; [DOCUMENTS:7]Heading:2; DB_at_DocumentNames; [DOCUMENTS:7]Document_Class:14; DB_al_DOcumentClasses)
			ARRAY LONGINT:C221(DoC_al_DocumentAccess; Size of array:C274(DB_at_DocumentCodes))
			For ($_l_ReportIndex; 1; Size of array:C274(DB_at_DocumentCodes))
				$_l_ReportRow:=Find in array:C230($_at_IncludeReports; DB_at_DocumentCodes{$_l_ReportIndex})
				If ($_l_ReportRow>0)
					$_l_PersonalAccess:=$_al_ReportAccess{$_l_ReportRow}
					DoC_al_DocumentAccess{$_l_ReportIndex}:=$_al_ReportAccess{$_l_ReportRow}
					
				End if 
			End for 
			Case of 
				: (DB_l_ReportType=SuperReportReport Template)
					
					OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; False:C215)
					OBJECT SET VISIBLE:C603(DB_l_SRarea; True:C214)
					$_t_WindowTitle:=Get window title:C450
					//SRResult:=SR Set Options (DB_l_SRarea;0;0;32+64;$_t_WindowTitle)
					//SR Set Options(reportArea:L; showReportMenu:L; enableScriptAccess:L; miscReportOpts:L; zoomedWindowTitle:S ) -> resultCode:L
					SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 0)
					SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 0)
					//32(SR Options Hide Menubar)– Hide Menubar
					//64(SR Options Hide Toolbar)– Hide Toolbar
					SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
					
				: (DB_l_ReportType=SuperWrite Report Template)
					
					OBJECT SET VISIBLE:C603(DBQR_l_EDITORAREA; True:C214)
					OBJECT SET VISIBLE:C603(DB_l_SRarea; False:C215)
					
			End case 
		End if 
		Case of 
			: (DB_l_CurrentDisplayedForm>0)
				$_l_ReportTable:=DB_l_CurrentDisplayedForm
			Else 
				$_l_ReportTable:=Table:C252(->[COMPANIES:2])
		End case 
		TRACE:C157  //$_l_ReportTable:=Table(->[COMPANIES])
		ARRAY TEXT:C222(DB_at_RepFieldName; 0)
		ARRAY LONGINT:C221(DB_al_REpFieldNum; 0)
		ARRAY LONGINT:C221(DB_al_RELRelationFieldNum; 0)
		ARRAY LONGINT:C221(DB_al_RelatedToFieldNum; 0)
		QR SET REPORT TABLE:C757(DBQR_l_EDITORAREA; $_l_ReportTable)
		GET FIELD TITLES:C804(Table:C252($_l_ReportTable)->; DB_at_RepFieldName; DB_al_REpFieldNum)
		SORT ARRAY:C229(DB_at_RepFieldName; DB_al_REpFieldNum)
		
		If (Current user:C182#"designer")
			For ($_l_ReportFieldIndex; Size of array:C274(DB_at_RepFieldName); 1; -1)
				$_bo_Delete:=False:C215
				If (DB_at_RepFieldName{$_l_ReportFieldIndex}="X@")
					$_bo_Delete:=True:C214
				Else 
					
					GET FIELD PROPERTIES:C258($_l_ReportTable; DB_al_REpFieldNum{$_l_ReportFieldIndex}; $_l_FieldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_t_FieldInvisible)
					If ($_t_FieldInvisible)
						$_bo_Delete:=True:C214
					End if 
				End if 
				If ($_bo_Delete)
					DELETE FROM ARRAY:C228(DB_at_RepFieldName; $_l_ReportFieldIndex)
					DELETE FROM ARRAY:C228(DB_al_REpFieldNum; $_l_ReportFieldIndex)
				End if 
				
			End for 
		End if 
		$_t_Collapse:=Char:C90(5125)
		$_t_Expand:=Char:C90(5121)
		$_l_ReportFieldCount:=Size of array:C274(DB_at_RepFieldName)
		ARRAY LONGINT:C221(DB_al_REPTableNum; $_l_ReportFieldCount)
		ARRAY LONGINT:C221(DB_al_RELRelationFieldNum; $_l_ReportFieldCount)
		ARRAY LONGINT:C221(DB_al_RelatedToFieldNum; $_l_ReportFieldCount)
		ARRAY TEXT:C222(DB_at_ExpandValue; $_l_ReportFieldCount)
		ARRAY TEXT:C222(DB_at_ExpandValue2; $_l_ReportFieldCount)
		ARRAY TEXT:C222(DB_at_ExpandPicture; $_l_ReportFieldCount)
		ARRAY PICTURE:C279(DB_apic_ExpandPicture; $_l_ReportFieldCount)
		//GET PICTURE FROM LIBRARY(22553; $_pic_CollapsePicture)
		$_pic_CollapsePicture:=Get_Picture(22553)
		//GET PICTURE FROM LIBRARY(22554; $_Pic_ExpandPicture)
		$_Pic_ExpandPicture:=Get_Picture(22554)
		//GET PICTURE FROM LIBRARY(417; $_pic_NoPicture)
		$_pic_NoPicture:=Get_Picture(417)
		For ($_l_ReportFieldIndex; Size of array:C274(DB_al_REPTableNum); 1; -1)
			DB_at_ExpandValue{$_l_ReportFieldIndex}:=Table name:C256($_l_ReportTable)
			DB_apic_ExpandPicture{$_l_ReportFieldIndex}:=$_pic_NoPicture
			DB_at_ExpandPicture{$_l_ReportFieldIndex}:=""
			DB_al_REPTableNum{$_l_ReportFieldIndex}:=$_l_ReportTable
			GET RELATION PROPERTIES:C686($_l_ReportTable; DB_al_REpFieldNum{$_l_ReportFieldIndex}; $_l_OneTable; $_l_OneField; $_l_ChoiceField; $_bo_AutoOne; $_bo_AutoMany)
			If ($_l_OneTable#0) & ($_l_OneTable#$_l_ReportTable)
				//```
				DB_at_ExpandValue2{$_l_ReportFieldIndex}:=Field name:C257($_l_ReportTable; DB_al_REpFieldNum{$_l_ReportFieldIndex})
				DB_apic_ExpandPicture{$_l_ReportFieldIndex}:=$_pic_CollapsePicture
				DB_at_ExpandPicture{$_l_ReportFieldIndex}:=$_t_Collapse
				GET FIELD TITLES:C804(Table:C252($_l_OneTable)->; $_at_RelatedRepFieldName; $_al_RelatedRepFieldNum)
				$_l_InsertsCount:=0
				For ($_l_RelatedFieldsIndex; 1; Size of array:C274($_at_RelatedRepFieldName))
					GET FIELD PROPERTIES:C258($_l_OneTable; $_al_RelatedRepFieldNum{$_l_RelatedFieldsIndex}; $_l_RelatedDataType; $_l_RelatedFIeldLength; $_bo_RelatedFIeldIndex; $_bo_RelatedFIeldUnique; $_bo_RelatedFIeldInvisible)
					If (Not:C34($_bo_RelatedFIeldInvisible))
						$_t_RelatedFieldName:=Field name:C257($_l_OneTable; $_al_RelatedRepFieldNum{$_l_RelatedFieldsIndex})
						If ($_t_RelatedFieldName#"X@")
							$_l_InsertsCount:=$_l_InsertsCount+1
							$_t_TableName:=Table name:C256($_l_OneTable)
							$_t_TableName:=Replace string:C233($_t_TableName; "_"; " ")
							INSERT IN ARRAY:C227(DB_al_REPTableNum; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_at_RepFieldName; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_al_REpFieldNum; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_al_RELRelationFieldNum; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_al_RelatedToFieldNum; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_at_ExpandValue; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_at_ExpandValue2; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_apic_ExpandPicture; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							INSERT IN ARRAY:C227(DB_at_ExpandPicture; $_l_ReportFieldIndex+$_l_InsertsCount; 1)
							DB_at_ExpandValue{$_l_ReportFieldIndex+$_l_InsertsCount}:=DB_at_ExpandValue{$_l_RelatedFieldsIndex}
							DB_at_ExpandValue2{$_l_ReportFieldIndex+$_l_InsertsCount}:=Field name:C257($_l_ReportTable; DB_al_REpFieldNum{$_l_RelatedFieldsIndex})
							DB_al_REPTableNum{$_l_ReportFieldIndex+$_l_InsertsCount}:=$_l_OneTable
							$_t_NameToInsert:=$_t_TableName+" "+$_t_RelatedFieldName
							DB_at_RepFieldName{$_l_ReportFieldIndex+$_l_InsertsCount}:=$_t_NameToInsert
							DB_al_REpFieldNum{$_l_ReportFieldIndex+$_l_InsertsCount}:=$_al_RelatedRepFieldNum{$_l_RelatedFieldsIndex}
							DB_al_RELRelationFieldNum{$_l_ReportFieldIndex+$_l_InsertsCount}:=DB_al_REpFieldNum{$_l_ReportFieldIndex}  //$_l_ReportFieldIndex
							DB_al_RelatedToFieldNum{$_l_ReportFieldIndex+$_l_InsertsCount}:=$_l_OneField  //Tells us what the related field is..
							DB_at_ExpandPicture{$_l_ReportFieldIndex+$_l_InsertsCount}:=""
							DB_apic_ExpandPicture{$_l_ReportFieldIndex+$_l_InsertsCount}:=$_pic_NoPicture
						Else 
							DB_at_ExpandValue2{$_l_ReportFieldIndex}:=Table name:C256($_l_ReportTable)
						End if 
					Else 
						DB_at_ExpandValue2{$_l_ReportFieldIndex}:=Table name:C256($_l_ReportTable)
					End if 
					//``
				End for 
			Else 
				DB_at_ExpandValue2{$_l_ReportFieldIndex}:=Table name:C256($_l_ReportTable)
			End if 
		End for 
		ARRAY BOOLEAN:C223(DB_abo_Expanded; 0)
		ARRAY TEXT:C222(DB_at_ExpandCollapse; 0)
		ARRAY PICTURE:C279(DB_apic_ExpandCollapse; 0)
		ARRAY TEXT:C222(DB_at_ExpandCollapse; 0)
		ARRAY TEXT:C222(DB_at_RowName; 0)
		ARRAY LONGINT:C221(DB_al_RowNumber; 0)
		ARRAY BOOLEAN:C223(DB_abo_HasRelated; 0)
		//
		//U+1405
		$_t_Collapse:=Char:C90(5125)
		$_t_Expand:=Char:C90(5121)
		//U+1401
		For ($_l_RepTableIndex; 1; Size of array:C274(DB_al_REPTableNum))
			If (DB_al_REPTableNum{$_l_RepTableIndex}=$_l_ReportTable)
				If ($_l_RepTableIndex<Size of array:C274(DB_al_REPTableNum))
					If (DB_al_REPTableNum{$_l_RepTableIndex+1}#$_l_ReportTable)
						$_bo_HasRelated:=True:C214
					Else 
						$_bo_HasRelated:=False:C215
					End if 
				Else 
					$_bo_HasRelated:=False:C215
				End if 
				If ($_bo_HasRelated)
					APPEND TO ARRAY:C911(DB_abo_HasRelated; True:C214)
					APPEND TO ARRAY:C911(DB_apic_ExpandCollapse; $_pic_CollapsePicture)
					APPEND TO ARRAY:C911(DB_at_ExpandCollapse; $_t_Collapse)
				Else 
					APPEND TO ARRAY:C911(DB_abo_HasRelated; False:C215)
					APPEND TO ARRAY:C911(DB_apic_ExpandCollapse; $_pic_NoPicture)
					APPEND TO ARRAY:C911(DB_at_ExpandCollapse; "")
				End if 
				APPEND TO ARRAY:C911(DB_abo_Expanded; False:C215)
				APPEND TO ARRAY:C911(DB_at_RowName; DB_at_RepFieldName{$_l_RepTableIndex})
				APPEND TO ARRAY:C911(DB_al_RowNumber; $_l_RepTableIndex)
			End if 
			
		End for 
		SORT ARRAY:C229(DB_at_RowName; DB_al_RowNumber; DB_abo_Expanded; DB_at_ExpandCollapse; DB_abo_HasRelated)
		
		ARRAY TEXT:C222(QR_at_BorderStyles; 0)
		APPEND TO ARRAY:C911(QR_at_BorderStyles; "No Borders")
		APPEND TO ARRAY:C911(QR_at_BorderStyles; "Very Light")
		APPEND TO ARRAY:C911(QR_at_BorderStyles; "Light")
		APPEND TO ARRAY:C911(QR_at_BorderStyles; "Medium")
		APPEND TO ARRAY:C911(QR_at_BorderStyles; "Heavy")
		$_l_NewHLLIst:=New list:C375
		APPEND TO LIST:C376($_l_NewHLLIst; "No Borders"; 10000)
		APPEND TO LIST:C376($_l_NewHLLIst; "Very Light"; 10001)
		APPEND TO LIST:C376($_l_NewHLLIst; "Light"; 10002)
		APPEND TO LIST:C376($_l_NewHLLIst; "Medium"; 10003)
		APPEND TO LIST:C376($_l_NewHLLIst; "Heavy"; 10004)
		APPEND TO LIST:C376($_l_NewHLLIst; "Custom Borders"; 10005)
		
		$_l_NewHLLIst2:=New list:C375
		APPEND TO LIST:C376($_l_NewHLLIst2; "Set Presentation"; 20000)
		
		
		$_l_NewHLLIst3:=New list:C375
		APPEND TO LIST:C376($_l_NewHLLIst3; "Set Headers and Footers"; 30000)
		
		
		DBQR_l_SetPreferences:=New list:C375
		
		APPEND TO LIST:C376(DBQR_l_SetPreferences; "Borders"; 1000; $_l_NewHLLIst; False:C215)
		APPEND TO LIST:C376(DBQR_l_SetPreferences; "Presentation"; 2000; $_l_NewHLLIst2; False:C215)
		APPEND TO LIST:C376(DBQR_l_SetPreferences; "Headers and Footers"; 3000; $_l_NewHLLIst3; False:C215)
		SELECT LIST ITEMS BY POSITION:C381(DBQR_l_SetPreferences; 0)
		
		ARRAY TEXT:C222(BD_at_FldsFunctions; 2)
		BD_at_FldsFunctions{1}:="Fields"
		BD_at_FldsFunctions{2}:="Formulas"
		BD_at_FldsFunctions:=1
		
		
		
		LB_SetupListbox(->DB_lb_AvailableFields; "oCCM"; "CCM_L"; 1; ->DB_at_ExpandCollapse; ->DB_at_RowName; ->DB_al_RowNumber; ->DB_abo_HasRelated)
		
		
		LB_SetColumnHeaders(->DB_lb_AvailableFields; "CCM_L"; 1; ""; ""; ""; "")
		LB_SetColumnWidths(->DB_lb_AvailableFields; "oCCM"; 1; 25; 140; 0; 0)
		LB_SetScroll(->DB_lb_AvailableFields; -2; -2)
		LB_SetEnterable(->DB_lb_AvailableFields; False:C215; 0; "")
		LBi_InclSetupJustStyle(->DB_lb_AvailableFields)
		ARRAY TEXT:C222(DBQR_at_FunctionNames; 0)
		ARRAY LONGINT:C221(DBQR_al_FunctionType; 0)  //1 =method `2=macro script `3= formula
		
		ARRAY TEXT:C222(DBQR_at_FunctionCode; 0)
		
		Case of 
			: ($_l_ReportTable=Table:C252(->[COMPANIES:2]))
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Company Sales")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetSales")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Last Order Date")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetRecentSaleDate")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Company Purchases")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetSales")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Last Purchase Date")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetRecentPucDate")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Current Due Debt")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetCurrentDebt")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Current Due Credit")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetCurrentCredit")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Current Stock Holding")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetStockValue")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Contact Count")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetContactsCount")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Convert Currency")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_ConvertCurrency")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Default Contact")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetContact")
			: ($_l_ReportTable=Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Contact Sales")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetSales")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Last Order Date")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetRecentSaleDate")
			: ($_l_ReportTable=Table:C252(->[ACCOUNT_BALANCES:34]))
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Convert Currency")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_ConvertCurrency")
			: ($_l_ReportTable=Table:C252(->[ACCOUNTS:32]))
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Account Balance")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetAccountBalance")
				
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Convert Currency")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_ConvertCurrency")
				
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "List ApplicableLayers")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_AccLayersList")
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "List ApplicableAnalysis")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_AccAnalist")
			: ($_l_ReportTable=Table:C252(->[ACTIONS:13]))
				APPEND TO ARRAY:C911(DBQR_at_FunctionNames; "Get Action Attributes")
				APPEND TO ARRAY:C911(DBQR_al_FunctionType; 1)
				APPEND TO ARRAY:C911(DBQR_at_FunctionCode; "REPFUNC_GetActionAtributes")
			: ($_l_ReportTable=Table:C252(->[ANALYSES:36]))
			: ($_l_ReportTable=Table:C252(->[AREAS:3]))
			: ($_l_ReportTable=Table:C252(->[PRODUCT_BRANDS:8]))
			: ($_l_ReportTable=Table:C252(->[CATALOGUE:108]))
			: ($_l_ReportTable=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				
		End case 
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=DB_al_REPTableNum; *)
		QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Same_Process:6=True:C214; *)
		//C_LONGINT(WF Macros)
		//WF Macros:=-909
		
		QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Class:11=WF Macros)
		QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_status:13=Active in Testing; *)
		QUERY SELECTION:C341([SCRIPTS:80];  | ; [SCRIPTS:80]Script_status:13=Active)
		
		
		SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; $_at_FunctionCodes; [SCRIPTS:80]Script_Name:2; $_at_FunctionNames)
		SORT ARRAY:C229($_at_FunctionNames; $_at_FunctionCodes)
		For ($_l_FunctionIndex; 1; Size of array:C274($_at_FunctionNames))
			APPEND TO ARRAY:C911(DBQR_at_FunctionNames; $_at_FunctionNames{$_l_FunctionIndex})
			APPEND TO ARRAY:C911(DBQR_al_FunctionType; 2)
			APPEND TO ARRAY:C911(DBQR_at_FunctionCode; $_at_FunctionCodes{$_l_FunctionIndex})
		End for 
		OBJECT SET VISIBLE:C603(DB_lb_AvailableFunctions; False:C215)
		If (Size of array:C274(DBQR_at_FunctionCode)=0)
			OBJECT SET VISIBLE:C603(BD_at_FldsFunctions; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(BD_at_FldsFunctions; True:C214)
			//OBJECT SET VISIBLE(DB_lb_AvailableFunctions;True)
			BD_at_FldsFunctions:=1
		End if 
		LB_SetupListbox(->DB_lb_AvailableFunctions; "oFUN"; "FUN_L"; 1; ->DBQR_at_FunctionNames; ->DBQR_al_FunctionType; ->DBQR_at_FunctionCode)
		LB_SetColumnHeaders(->DB_lb_AvailableFunctions; "FUN_L"; 1; ""; ""; "")
		LB_SetColumnWidths(->DB_lb_AvailableFunctions; "oFUN"; 1; 140; 0; 0)
		LB_SetScroll(->DB_lb_AvailableFunctions; -2; -2)
		LB_SetEnterable(->DB_lb_AvailableFunctions; False:C215; 0; "")
		LBi_InclSetupJustStyle(->DB_lb_AvailableFunctions)
		
		
		
		
		LB_SetupListbox(->DB_lb_AvailableReports; "oREP"; "REP_L"; 1; ->DB_at_DocumentCodes; ->DB_at_DocumentNames; ->DB_al_DOcumentClasses; ->DoC_al_DocumentAccess)
		LB_SetColumnHeaders(->DB_lb_AvailableReports; "REP_L"; 1; "Code"; "Name"; "")
		LB_SetColumnWidths(->DB_lb_AvailableReports; "oREP"; 1; DBQR_l_ReportCodesColumnWidth; DBQR_l_ReportNamesColumnWidth; 0; 0)
		LB_SetScroll(->DB_lb_AvailableReports; -2; -2)
		LB_SetEnterable(->DB_lb_AvailableReports; False:C215; 0; "")
		LBi_InclSetupJustStyle(->DB_lb_AvailableReports)
		
		
		//````
		OBJECT GET COORDINATES:C663(*; "oDBQRVerticalSplitter"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		If ($_l_ObjectLeft#DBQr_l_VerticalSplitterPos)
			If (False:C215)
				$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
				//if we move the splitter we must move other objects as well
				OBJECT GET COORDINATES:C663(DBQR_l_EDITORAREA; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectLeft2-$_l_ObjectLeft
				OBJECT MOVE:C664(DBQR_l_EDITORAREA; DBQr_l_VerticalSplitterPos+$_l_RelativeHeight; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				OBJECT MOVE:C664(DB_l_SRarea; DBQr_l_VerticalSplitterPos+$_l_RelativeHeight; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				OBJECT MOVE:C664(*; "oDBQRVerticalSplitter"; DBQr_l_VerticalSplitterPos; $_l_ObjectTop; DBQr_l_VerticalSplitterPos+$_l_ObjectWidth; $_l_ObjectBottom; *)
				OBJECT GET COORDINATES:C663(DB_lb_AvailableReports; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT GET COORDINATES:C663(*; "oDBQRHorizontalSplitter"; $_l_ObjectLeft2; $_l_ObjectTop3; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectLeft-$_l_ObjectRight2
				OBJECT MOVE:C664(*; "oDBQRHorizontalSplitter"; $_l_ObjectLeft2; $_l_ObjectTop3; DBQr_l_VerticalSplitterPos-$_l_RelativeHeight; $_l_ObjectBottom2; *)
				OBJECT GET COORDINATES:C663(*; "oLBReportNames"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectLeft-$_l_ObjectRight2
				$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				OBJECT MOVE:C664(*; "oLBReportNames"; $_l_ObjectLeft2; $_l_ObjectTop2; (DBQr_l_VerticalSplitterPos-$_l_RelativeHeight); ($_l_ObjectTop2+$_l_ObjectHeight); *)
				
				OBJECT GET COORDINATES:C663(BD_at_FldsFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectLeft-$_l_ObjectRight2
				OBJECT MOVE:C664(BD_at_FldsFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; DBQr_l_VerticalSplitterPos-$_l_RelativeHeight; $_l_ObjectBottom2; *)
				OBJECT GET COORDINATES:C663(DB_lb_AvailableFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectLeft-$_l_ObjectRight2
				OBJECT MOVE:C664(DB_lb_AvailableFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; DBQr_l_VerticalSplitterPos-$_l_RelativeHeight; $_l_ObjectBottom2; *)
				OBJECT MOVE:C664(DB_lb_AvailableFields; $_l_ObjectLeft2; $_l_ObjectTop2; DBQr_l_VerticalSplitterPos-$_l_RelativeHeight; $_l_ObjectBottom2; *)
				
			Else 
				If ($_l_ObjectLeft>DBQr_l_VerticalSplitterPos)
					//$Move:=
					SRQRVerticalSPliter:=$_l_ObjectLeft-DBQr_l_VerticalSplitterPos
				Else 
					SRQRVerticalSPliter:=DBQr_l_VerticalSplitterPos-$_l_ObjectLeft
				End if 
			End if 
		End if 
		OBJECT GET COORDINATES:C663(*; "oDBQRHorizontalSplitter"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		If ($_l_ObjectTop#DBQR_l_HorizontalSplitterPos)
			If (False:C215)
				OBJECT GET COORDINATES:C663(BD_at_FldsFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectTop2-$_l_ObjectTop
				OBJECT MOVE:C664(BD_at_FldsFunctions; $_l_ObjectLeft2; DBQR_l_HorizontalSplitterPos+$_l_RelativeHeight; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				OBJECT GET COORDINATES:C663(DB_lb_AvailableFunctions; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_RelativeHeight:=$_l_ObjectTop2-$_l_ObjectTop
				OBJECT MOVE:C664(DB_lb_AvailableFunctions; $_l_ObjectLeft2; DBQR_l_HorizontalSplitterPos+$_l_RelativeHeight; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				OBJECT MOVE:C664(DB_lb_AvailableFields; $_l_ObjectLeft2; DBQR_l_HorizontalSplitterPos+$_l_RelativeHeight; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				OBJECT MOVE:C664(*; "oDBQRHorizontalSplitter"; $_l_ObjectLeft; DBQR_l_HorizontalSplitterPos; $_l_ObjectRight; (DBQR_l_HorizontalSplitterPos+$_l_ObjectHeight); *)
				OBJECT GET COORDINATES:C663(*; "oLBReportNames"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT GET COORDINATES:C663(*; "oSelectionsdel"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSelectionsAccess"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				
				$_l_Distance:=$_l_ObjectTop3-$_l_ObjectBottom2
				$_l_ObjectHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
				$_l_RelativeHeight:=$_l_ObjectTop-$_l_ObjectBottom2
				$_l_ResizeAmount:=DBQR_l_HorizontalSplitterPos-$_l_ObjectTop
				OBJECT MOVE:C664(*; "oLBReportNames"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; ($_l_ObjectBottom2+$_l_ResizeAmount); *)
				$_l_BoxBottom:=$_l_ObjectBottom2+$_l_ResizeAmount
				OBJECT MOVE:C664(*; "oSelectionsdel"; $_l_ObjectLeft3; ($_l_BoxBottom+$_l_Distance); $_l_ObjectRight3; ($_l_BoxBottom+$_l_Distance)+$_l_ObjectHeight; *)
				OBJECT GET COORDINATES:C663(*; "oSelectionsAccess"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				
				OBJECT MOVE:C664(*; "oSelectionsAccess"; $_l_ObjectLeft4; ($_l_BoxBottom+$_l_Distance); $_l_ObjectRight4; ($_l_BoxBottom+$_l_Distance)+$_l_ObjectHeight; *)
				
				OBJECT GET COORDINATES:C663(*; "oSelectionsAdd1"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT MOVE:C664(*; "oSelectionsAdd1"; $_l_ObjectLeft3; ($_l_BoxBottom+$_l_Distance); $_l_ObjectRight3; ($_l_BoxBottom+$_l_Distance)+$_l_ObjectHeight; *)
			Else 
				//SRQRHorizontalSPliter
				If ($_l_ObjectTop>DBQR_l_HorizontalSplitterPos)
					SRQRHorizontalSPliter:=$_l_ObjectTop-DBQR_l_HorizontalSplitterPos
				Else 
					SRQRHorizontalSPliter:=DBQR_l_HorizontalSplitterPos-$_l_ObjectTop
				End if 
			End if 
			
		End if 
		OBJECT SET VISIBLE:C603(DB_lb_QRSetSorts; False:C215)
		
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (PAL_BUTTON_2=1)  //accept
				
				
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
										
										//$_l_Result:=SR Get Area (DB_l_SRarea;pReportData)
										//If ($_l_Result=0)
										//[DOCUMENTS]Write_:=pReportData
										//End if
										$_l_Result:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
										[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
										
										//$_l_Result:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
										
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
									
									[DOCUMENTS:7]Document_Code:1:="QR"+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
									[DOCUMENTS:7]Document_Class:14:=SuperWrite Report Template  //using this as they will never exist
									
									QR REPORT TO BLOB:C770(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
								: (DB_l_ReportType=SuperReportReport Template)
									
									[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
									[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
									//$_l_Result:=SR Get Area (DB_l_SRarea;pReportData)
									//If ($_l_Result=0)
									//[DOCUMENTS]Write_:=pReportData
									//End if
									$_l_Result:=SR_SaveReport(DB_l_SRarea; SR_t_ReportDataXML)
									[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
									
									
									//$_l_Result:=SR_SaveReport (DB_l_SRarea;[DOCUMENTS]SR_DOCUMENTXML;0)
									[DOCUMENTS:7]Document_Code:1:="QR"+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
									
							End case 
							SAVE RECORD:C53([DOCUMENTS:7])
							APPEND TO ARRAY:C911(DB_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
							APPEND TO ARRAY:C911(DB_at_DocumentNames; [DOCUMENTS:7]Heading:2)
							APPEND TO ARRAY:C911(DB_al_DOcumentClasses; [DOCUMENTS:7]Document_Class:14)
							
							//Update the list of reports here
						End if 
						
					End if 
					DB_bo_CurrentReportEdited:=False:C215
				End if 
				
				
				PAL_BUTTON_2:=0
				PAL_BUTTON:=""
				ACCEPT:C269
			: (PAL_BUTTON_1=1)
				PAL_BUTTON:=""
				PAL_BUTTON_1:=0
				CANCEL:C270
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM DB_QR_EDITOR"; $_t_oldMethodName)
