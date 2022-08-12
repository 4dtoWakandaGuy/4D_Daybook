If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Report_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR_ReportDataXML)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>SRP262; $_bo_ReloadPreferences; DB_bo_NoLoad; DB_bo_RecordModified; DOC_bo_CopyToprinter; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Error; $_l_event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint; iCancel)
	C_LONGINT:C283(iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; SR_DOCUMENT)
	C_PICTURE:C286(SR_pic_ReportData)
	C_POINTER:C301($_ptr_SRData; $_ptr_SRreportArea; $_ptr_SRReportSource)
	C_TEXT:C284($_t_DocEmailtoSTR; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText)
	C_TEXT:C284(email_t_Role; PAL_BUTTON; Rep_t_docEmailToTxt; SR_t_ReportDataXML; vButtDisREP; vLetterCode; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Report_in"; Form event code:C388)



$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Activate:K2:9)
		
		DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Report_in")
		
		In_ButtChkDis(->vButtDisREP)
		If (Records in selection:C76([DOCUMENTS:7])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		
		DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Report_in")
		In_ButtChkDis(->vButtDisREP)
		If (Records in selection:C76([DOCUMENTS:7])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Outside Call:K2:11)
		
		
		Case of 
			: (DB_l_ButtonClickedFunction=902)
				DB_SubFunctionHandler
				
			: ((DB_l_ButtonClickedFunction#0) | (iOK=1) | (iCancel=1))
				
				$_bo_ReloadPreferences:=((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Next")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Previous")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Last")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("First")))
				
				
				If ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | ($_bo_ReloadPreferences))  //Fri, Feb 10, 2006 bwalia: added to save and reload report print preferences
					
					
				End if 
				
				In_ButtCall("Reports_InLPA"; ""; "Minor_DelSinEx"; ->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; "Documents"; "1"; "Reports_InLPB"; "Master"; "Reports_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisREP)
				
				If ($_bo_ReloadPreferences)  //if next or previous
					
					//Reports_prefsLoad 
					Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
					
					
					EMail_at_DocEmailTo:=Find in array:C230(EMail_at_DocEmailTo; Rep_t_docEmailToTxt)
					If (EMail_at_DocEmailTo<1)
						EMail_at_DocEmailTo:=1
					End if 
					
					If (Size of array:C274(EMail_at_DocEmailTo)>0)
						$_t_DocEmailtoSTR:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
					End if 
					
					email_t_Role:=EMAIL_t_DocEmailRoletoText
					
					Case of 
						: ($_t_DocEmailtoSTR="Contact where Role is")
							OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
							
						Else 
							OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
					End case 
					EMail_at_DocEmailTo:=Find in array:C230(EMail_at_DocEmailTo; Rep_t_docEmailToTxt)
					If (EMail_at_DocEmailTo<1)
						EMail_at_DocEmailTo:=1
					End if 
					
					If (Size of array:C274(EMail_at_DocEmailTo)>0)
						$_t_DocEmailtoSTR:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
					End if 
					
					email_t_Role:=EMAIL_t_DocEmailRoletoText
					
					Case of 
						: ($_t_DocEmailtoSTR="Contact where Role is")
							OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
							
						Else 
							OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
					End case 
					
				End if 
				
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Deactivate:K2:10)
		
		//   PAUSE PROCESS(vProc)
	: ($_l_event=On Data Change:K2:15)
		
		Case of 
			: (Modified:C32([DOCUMENTS:7]Document_Code:1))
				[DOCUMENTS:7]Document_Code:1:=Uppers2([DOCUMENTS:7]Document_Code:1)
				vLetterCode:=[DOCUMENTS:7]Document_Code:1
				DB_bo_RecordModified:=True:C214
				Gen_AutoProc
			: (Modified:C32([DOCUMENTS:7]Heading:2))
				[DOCUMENTS:7]Heading:2:=Uppers2([DOCUMENTS:7]Heading:2)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([DOCUMENTS:7]Write_:5)) | (Modified:C32([DOCUMENTS:7]SR_DOCUMENT_:4))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([DOCUMENTS:7]Person:10))
				Check_MinorNC(->[DOCUMENTS:7]Person:10; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([DOCUMENTS:7]Analysis_Code:12))
				Check_MinorNC(->[DOCUMENTS:7]Analysis_Code:12; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([DOCUMENTS:7]Table_Number:11))
				If (([DOCUMENTS:7]Table_Number:11>0) & ([DOCUMENTS:7]Table_Number:11<=Size of array:C274(<>DB_at_TableNames)))
					$_l_ModuleRow:=Find in array:C230(<>DB_al_TableNums; [DOCUMENTS:7]Table_Number:11)
					vStatus:=<>DB_at_TableNames{$_l_ModuleRow}
					If (<>SRP262)
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_SRData:=->SR_blb_ReportDataBLOB
						$_ptr_SRreportArea:=->[DOCUMENTS:7]SR_DOCUMENT_:4
					Else 
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						
						$_ptr_SRData:=->SR_pic_ReportData
						$_ptr_SRreportArea:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						
					End if 
					//investigate
					//$_l_Error:=SR Get Area ($_ptr_SRreportArea->;$_ptr_SRReport->)
					//$_l_Error:=SR_SaveReport ($_ptr_SRreportArea->;[DOCUMENTS]SR_DOCUMENTXML_;0)
					$_l_Error:=SR_SaveReport($_ptr_SRreportArea->; SR_t_ReportDataXML)
					[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
					//$_l_Error:=SR Main Table ($_ptr_SRReport->;1;[DOCUMENTS]Table_Number;"")
					//$_l_SRError:=SR_SetLongProperty ($_ptr_SRReport->;SRP_DataSource_TableID;[DOCUMENTS]Table_Number)
					//$_l_SRError:=SR_SetTextProperty ($_ptr_SRReport->;SRP_DataSource_Source;"1")
					SR_SetLongProperty($_ptr_SRreportArea->; SR_GetLongProperty($_ptr_SRreportArea->; 1; SRP_Report_DataSource); SRP_DataSource_TableID; [DOCUMENTS:7]Table_Number:11)
					$_l_Error:=SR_SaveReport($_ptr_SRreportArea->; SR_t_ReportDataXML)
					[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
					Reports_InSRStr($_ptr_SRreportArea->)
					$_l_Error:=SR_LoadReport($_ptr_SRreportArea->; [DOCUMENTS:7]SR_DOCUMENTXML_:34; 0)
					
					//$_l_Error:=SR Set Area ($_ptr_SRreportArea->;$_ptr_SRReport->)
					
				Else 
					vStatus:=""
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([DOCUMENTS:7]WF_ActionCode:27))
				Check_MinorNC(->[DOCUMENTS:7]WF_ActionCode:27; "Action"; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
				DB_bo_RecordModified:=True:C214
				
		End case 
		DOC_l_CopyToPrinter:=Num:C11(DOC_bo_CopyToprinter)
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Report_in")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//ALERT("1")
		
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "Report_in")
		WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DOCUMENTS:7])+"_"+"Report_in")
		
		If (True:C214)  //don't need or want this in old emailing system (e.g. v631b120h line) (HOWEVER, this sort of code IS needed in later versions with new emailing so DON'T add anything like this "IF (FALSE)" to versions using new emailing function)
			Reports_PrefsLoadNEW([DOCUMENTS:7]Document_Code:1; "REPORT")  //Added 13/11/08 v631b120g -kmw
			Reports_PrefsSetVisibility  //Added 13/11/08 v631b120g -kmw
			
			
			
		End if 
		
		//
		INT_SetInput(Table:C252(->[DOCUMENTS:7]); "Report_in")
		
		//ALERT("2")
		Reports_InLPB
		//ALERT("3")
		In_ButtChkDis(->vButtDisREP)
		//ALERT("4")
		DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Report_in")
		
		If (Records in selection:C76([DOCUMENTS:7])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (Current user:C182#"Designer")
			OBJECT SET VISIBLE:C603(*; "oexportDefault"; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:Report_in"; $_t_oldMethodName)
