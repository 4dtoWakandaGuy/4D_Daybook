If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dAsk_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Documents;0)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(<>Email_bo_Enabled; DB_bo_NoLoad; DOC_bo_LetterDisplayed; DOC_bo_templatesDisplayed)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(<>FaxMode; $_l_event; $_l_Nul; $_l_ObjectBottom; $_l_ObjectRIght; $_l_TableNumber; ADR_l_UseQualifications; bd1; bd4; BSelectTemplate; Bsms)
	C_LONGINT:C283(Bview; ch0; ch5; cLetters; cList; cMerged; cPreview; DIA_l_BUT1; DIA_l_But2; DIA_l_BUT3; DIA_l_BUT4)
	C_LONGINT:C283(DIA_l_BUT5; DIA_l_BUT6; DIA_l_BUT7; DIA_l_BUT8; DIA_l_BUT9; iInv; iInvL; MMEmailClass; MMLetterClass; rComp; rDiary)
	C_LONGINT:C283(rOrd; rState; write; WS_l_Bd5; WS_l_Bd6; xSearch; zComp; zCont)
	C_POINTER:C301(DOC_p_CurrentTablePointer)
	C_TEXT:C284(<>LetCode; <>PER_t_CurrentUserInitials; <>SYS_t_4DWriteType; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DIA_t_COL1; DIA_t_COL2; DIA_t_COL3; DIA_t_COL4)
	C_TEXT:C284(DIA_t_COL5; DIA_t_COL6; DIA_t_COL7; DIA_t_COL8; DIA_t_COL9; DIA_t_HED1; DIA_t_HED2; DIA_t_HED3; DIA_t_HED4; DIA_t_HED5; DIA_t_HED6)
	C_TEXT:C284(DIA_t_HED7; DIA_t_HED8; DIA_t_HED9; MMEmailCOde; MMLetterCOde; vFld; vFrom; vFromPos; vLetterCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dAsk_Print"; Form event code:C388)
//lp dAsk_Print
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DOC_bo_templatesDisplayed:=False:C215
		ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
		ARRAY TEXT:C222(WS_at_TemplateNames; 0)
		ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dAsk_Print")
		If (Not:C34(Is nil pointer:C315(DOC_p_CurrentTablePointer)))
			
			//$_l_TableNumber:=Table(DOC_p_CurrentTablePointer->)
			
			If (Table:C252(DOC_p_CurrentTablePointer)=Table:C252(->[CONTACTS:1]))
				OBJECT SET VISIBLE:C603(Bsms; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(Bsms; False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(Bsms; False:C215)
		End if 
		
		
		OBJECT SET VISIBLE:C603(WS_l_Bd5; False:C215)
		OBJECT SET VISIBLE:C603(WS_l_Bd6; False:C215)
		WS_l_Bd5:=0
		WS_l_Bd6:=0
		
		MMLetterClass:=0
		MMLetterCOde:=""
		MMEmailClass:=0
		MMEmailCOde:=""
		//the above variables are so we can handle mail merge properly with email
		vFld:="Tab"
		Case of 
			: (DB_t_CurrentFormUsage="Invoice")
				OBJECT SET TITLE:C194(cList; "Invoices")
				cList:=1
				iInv:=1
				iInvL:=1
			: (DB_t_CurrentFormUsage="Statement@")
				OBJECT SET TITLE:C194(cList; "Statements")
				If (DB_t_CurrentFormUsage="Statement")
					cList:=1
				End if 
				iInv:=1
				iInvL:=1
				If (DB_t_CurrentFormUsage="StatementA")
					MMLetterClass:=4D Write Letter Template
					vLetterCode:="AUTO"
					cLetters:=1
				End if 
			: (DB_t_CurrentFormUsage="Confirm")
				OBJECT SET TITLE:C194(cList; "Confirmations")
				cList:=1
		End case 
		If (DB_t_CurrentFormUsage2="MergeSp")
			cLetters:=1  //replace with cMerged when it works
		Else 
			If (DB_t_CurrentFormUsage#"StatementA")
				If (DB_t_CurrentFormUsage#"Button")
					If (rDiary=1)
						vLetterCode:="AUTO"
						vFrom:="AUTO"
						cLetters:=1
						OBJECT SET ENABLED:C1123(cMerged; False:C215)
					Else 
						MESSAGES OFF:C175
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
						MESSAGES ON:C181
						vFrom:=[PERSONNEL:11]Name:2
						vFromPos:=[PERSONNEL:11]Job_Title:35
						vLetterCode:=""
					End if 
				Else 
					If (rDiary=1)
						//the letter code is set
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=VletterCOde)
						If (Records in selection:C76([DOCUMENTS:7])>0)
							MMLetterClass:=[DOCUMENTS:7]Document_Class:14
							MMLetterCOde:=VletterCode
							If (MMLetterClass<0)
								OBJECT SET VISIBLE:C603(xSearch; False:C215)
								OBJECT SET VISIBLE:C603(DIA_lb_Documents; False:C215)
								OBJECT SET VISIBLE:C603(Bview; False:C215)
								OBJECT SET VISIBLE:C603(BSelectTemplate; False:C215)
							End if 
							
						End if 
						cLetters:=1
						OBJECT SET ENABLED:C1123(cMerged; False:C215)
					Else 
						cMerged:=1
					End if 
					RELATE ONE:C42([DIARY:12]Person:8)
					vFrom:=[PERSONNEL:11]Name:2
					vFromPos:=[PERSONNEL:11]Job_Title:35
				End if 
			Else 
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
				vFrom:=[PERSONNEL:11]Name:2
				vFromPos:=[PERSONNEL:11]Job_Title:35
			End if 
		End if 
		If (DB_t_CurrentFormUsage#"Button")
			vDate:=<>DB_d_CurrentDate
		Else 
			If ([DIARY:12]Date_Done_From:5=!00-00-00!)
				vDate:=<>DB_d_CurrentDate
			Else 
				vDate:=[DIARY:12]Date_Done_From:5
			End if 
		End if 
		zComp:=1
		If ((DB_GetModuleSettingByNUM(Module_DiaryManager))=0)
			OBJECT SET ENABLED:C1123(ch0; False:C215)
		End if 
		Case of 
			: (rComp=1)
				OBJECT SET ENABLED:C1123(zCont; False:C215)
			: (rDiary=1)
				OBJECT SET TITLE:C194(zCont; "All Diary Items")
				OBJECT SET TITLE:C194(ch0; "'OK' Results")
				ch0:=1
			: (rOrd>0)
				OBJECT SET TITLE:C194(zCont; "All Orderers")
				If (rOrd>1)  //Subscriptions
					OBJECT SET ENABLED:C1123(zComp; False:C215)
					zComp:=0
					zCont:=1
				End if 
			: (rState=2)
				OBJECT SET TITLE:C194(zCont; "All Invoices")
				OBJECT SET ENABLED:C1123(cMerged; False:C215)
				
		End case 
		ADR_l_UseQualifications:=1
		If (<>SYS_t_4DWriteType#"W@")
			OBJECT SET ENABLED:C1123(cPreview; False:C215)
		End if 
		//   If ((◊Write="") | (◊Write="SW"))  `second bit temporary - it crashes right no
		If (<>SYS_t_4DWriteType="")  //second bit temporary - it crashes right now SuperWrite out 24/04/02 pb
			OBJECT SET ENABLED:C1123(cMerged; False:C215)
		End if 
		
		If ((DB_GetModuleSettingByNUM(31))>1)
			If (Records in selection:C76(DOC_p_CurrentTablePointer->)>25)
				ch5:=1
				//   If (rComp#1)
				//  zComp:=0
				//  zCont:=1
				//   DISABLE BUTTON(zComp)
				//  End if
			End if 
		Else 
			OBJECT SET ENABLED:C1123(ch5; False:C215)
		End if 
		
		If ((<>FaxMode>0) & (DB_GetModuleSettingByNUM(Module_FaxManager)>1))
			
		Else 
			OBJECT SET ENABLED:C1123(bd1; False:C215)
		End if 
		
		If (Not:C34(<>Email_bo_Enabled))
			OBJECT SET ENABLED:C1123(bd4; False:C215)
		End if 
		If (VLetterCOde="AUTO")
			MMLetterCode:="AUTO"
		End if 
		
		
		LB_SetupListbox(->DIA_lb_Documents; "DIA_t"; "DIA_L"; 1; ->DOC_al_TemplatesInclude; ->WS_at_TemplateRefs; ->WS_at_TemplateNames)
		LB_SetColumnHeaders(->DIA_lb_Documents; "DIA_L"; 1; "Document select"; "Reference"; "Document Title")
		
		LB_SetColumnWidths(->DIA_lb_Documents; "DIA_t"; 1; 37; 73; 280)
		
		LB_SetEnterable(->DIA_lb_Documents; False:C215; 0)
		LB_SetScroll(->DIA_lb_Documents; -3; -2)
		LB_StyleSettings(->DIA_lb_Documents; "Black"; 9; "DIA_t"; ->[ACCOUNTS:32])
		OBJECT SET VISIBLE:C603(*; "oLetSelect"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oViewTemplateP2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oUseTemplateP2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "OEMAILTEXT"; False:C215)
		OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oEmailTemplateLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oEmailTemplatecode"; False:C215)
		DOC_bo_TemplatesDisplayed:=False:C215
		DOC_bo_LetterDisplayed:=False:C215
		WS_AutoscreenSize(2; 152; 560)
		INT_SetDialog
		
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		If (Not:C34(Is nil pointer:C315(DOC_p_CurrentTablePointer)))
			In_ButtdCall(DOC_p_CurrentTablePointer)
		Else 
			In_ButtdCall(->[DOCUMENTS:7])
		End if 
		vLetterCode:=<>LetCode
		
	: ($_l_event=On Resize:K2:27)
		//TRACE
		
		INT_SetDialog
		If (Current form window:C827=Frontmost window:C447)
			If (False:C215)
				Case of 
					: (FORM Get current page:C276=2)
						OBJECT SET VISIBLE:C603(write; True:C214)
						
						//GET OBJECT RECT(*;"o4DwriteArea";$Left2;$top2;$_l_ObjectRIght2;$_l_ObjectBottom2)
						Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "o4DwriteArea"; "o4DwriteArea"; 5; 8; 0; 10)  //Set object to be inside itself by 0 and go to bottom of window-10
						
						//MOVE OBJECT(*;"o4DwriteArea";$Left2;$top2;$_l_ObjectRIght2;$_l_ObjectBottom;*)
						
						
					: (FORM Get current page:C276=3)
						
						
						Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "o4DwriteArea"; "o4DwriteArea"; 5; 8; 0; 10)  //Set object to be inside itself by 0 and go to bottom of window-10
						
						//GET OBJECT RECT(*;"OEMAILTEXT";$Left2;$top2;$_l_ObjectRIght2;$_l_ObjectBottom2)
						//MOVE OBJECT(*;"OEMAILTEXT";$Left2;$top2;$_l_ObjectRIght2;$_l_ObjectBottom;*)
				End case 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dAsk_Print"; $_t_oldMethodName)
