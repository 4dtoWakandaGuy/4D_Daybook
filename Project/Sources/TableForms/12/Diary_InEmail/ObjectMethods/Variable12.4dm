If (False:C215)
	//object Name: [DIARY]Diary_InEmail.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_TemplateSelected; EMAIL_bo_DonotChangeSubject)
	C_LONGINT:C283($_l_DocClass; $_l_Index; $_l_TemplatesRow; $_l_WindowBottom; $_l_WindowCentreVertical; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_LONGINT:C283(WS_l_TEMPLATEMGRCONTEXT)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocumentCode; DOC_t_TemplateReference; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_InsText; vWT_EmailBodyOLD; WIN_t_CurrentInputForm; WS_t_TemplateType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InEmail.Variable12"; Form event code:C388)
//here we want to find document templates and COPY one to here

If (Old:C35([DIARY:12]Action_Code:9)="")
	//an unsaved letter
	Case of 
		: (WIN_t_CurrentInputForm="Diary_InEmail")  //CREATING An EMAIL
			//the following few lines are so we can revert the document
			If (DOC_bo_TemplateSelected)
				//a template had already been selected
				$_l_TemplatesRow:=Find in array:C230(DOC_al_TemplatesInclude; 1)
				If ($_l_TemplatesRow>0)
					DOC_t_TemplateReference:=WS_at_TemplateRefs{$_l_TemplatesRow}
				End if 
			End if 
			vWT_EmailBodyOLD:=[DIARY:12]Email_Text:42
			MESSAGES OFF:C175
			$_l_DocClass:=Text Email Template
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=$_l_DocClass; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Status:15>-100)  //deleted templates will get a status of status-100
			MESSAGES ON:C181
			If (Records in selection:C76([DOCUMENTS:7])=0)
				//must be not updated so need to create the templates
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Text:3#"")
				If (Records in selection:C76([DOCUMENTS:7])=0)
					//         ALERT("There are no eMail templates in this database")
					Gen_Alert("There are no eMail templates in this database")
				Else 
					//need to check these have data in the picture field!
					CREATE EMPTY SET:C140([DOCUMENTS:7]; "EmailTemplates")
					For ($_l_Index; 1; Records in selection:C76([DOCUMENTS:7]))
						If ([DOCUMENTS:7]Text:3#"")
							ADD TO SET:C119([DOCUMENTS:7]; "EmailTemplates")
						End if 
						NEXT RECORD:C51([DOCUMENTS:7])
					End for 
					USE SET:C118("EmailTemplates")
					CLEAR SET:C117("EmailTemplates")
				End if 
			Else 
				CREATE SET:C116([DOCUMENTS:7]; "EMailTemplates")
				USE SET:C118("EMAILTemplates")
				CLEAR SET:C117("EMAILTemplates")
			End if 
			//20001=no check
			//20002=some check
			//2004-check
			If (Records in selection:C76([DOCUMENTS:7])=0)
				//there are no eMail templates
				//       ALERT("There are no  Email templates in this database")
				Gen_Alert("There are no eMail templates in this database")
			Else 
				SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
				WS_at_TemplateNames:=0
				WS_at_TemplateRefs:=0
				DOC_al_TemplatesInclude:=0
				WS_t_TemplateType:="Email Templates"
				WS_l_TemplateMgrContext:=3
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_WindowCentreVertical:=$_l_WindowLeft+($_l_WindowWidth/2)
				DOC_bo_TemplateSelected:=False:C215
				WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				
				WIN_l_CurrentWinRef:=Open window:C153((440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; (440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
				
				
				DIALOG:C40([USER:15]; "Template_Manager")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
				
				If (DOC_bo_TemplateSelected)
					// A TEMPLATE WAS SELECTED
					$_l_TemplatesRow:=Find in array:C230(DOC_al_TemplatesInclude; 1)
					If ($_l_TemplatesRow>0)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{$_l_TemplatesRow})
						DUPLICATE RECORD:C225([DOCUMENTS:7])
						Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
						[DOCUMENTS:7]Standard:9:=False:C215
						[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						If (Not:C34(EMAIL_bo_DonotChangeSubject))  //BSW 6/08/02
							[DIARY:12]Email_Subject:40:=[DOCUMENTS:7]Heading:2
						End if 
						[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
						[DOCUMENTS:7]Document_Status:15:=1
						EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
						EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
						EMAIL_T_EmailSignature:=GetEmailSignature
						//            EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char(13)+EMAIL_T_EmailSignature  `BSW 24/06
						EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //BSW + pb 26/06/02
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						DB_MenuAction("Functions"; "Add Product items"; 3; "")
					End if 
				Else 
					REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
					If (DOC_t_TemplateReference#"")
						//a Document template was previously selected
						//so get the template again and all that
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{$_l_TemplatesRow})
						DUPLICATE RECORD:C225([DOCUMENTS:7])
						Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
						[DOCUMENTS:7]Standard:9:=False:C215
						[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
						[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
						[DOCUMENTS:7]Document_Status:15:=1
						DB_MenuAction("Functions"; "Add Product items"; 3; "")
						
						EMAIL_t_EmailBody:=vWT_EmailBodyOLD
						[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
						
					End if 
					//revert to previous view
					//
				End if 
			End if 
			
		Else 
			
			
	End case 
	
Else 
	//a saved letter-make a copy
	CONFIRM:C162("Do you wish to modify this letter, a revised copy of the letter will be made"; "No"; "Yes")
	
	If (OK=0)
		DUPLICATE RECORD:C225([DIARY:12])
		[DIARY:12]x_ID:50:=0
		DiarySetCode
		//the document should be loaded
		If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
		End if 
		Set_DocumentCode(3)
		[DOCUMENTS:7]Standard:9:=False:C215
		[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
		[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
		[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
		[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
		[DOCUMENTS:7]Document_Status:15:=1
		EMAIL_t_EmailBody:=[DOCUMENTS:7]Text:3
		EMAIL_t_InsText:=Char:C90(13)+"----------------------"+Char:C90(13)+Char:C90(13)
		EMAIL_T_EmailSignature:=GetEmailSignature
		//   EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char(13)+EMAIL_T_EmailSignature  `BSW +Char(13)+vWT_
		EMAIL_t_EmailBody:=EMAIL_t_EmailBody+Char:C90(13)+Char:C90(13)+EMAIL_T_EmailSignature  //BSW +PB 26/06/02
		[DIARY:12]Email_Text:42:=EMAIL_t_EmailBody
		DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
		DB_MenuAction("Functions"; "See 4D Write Text"; 3; "")
		DB_MenuAction("Functions"; "Preview"; 3; "")
		// ENABLE MENU ITEM(2050;3)
		// DISABLE MENU ITEM(2050;4)
		// DISABLE MENU ITEM(2050;6)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Diary_InEmail,BgetTemplate"; $_t_oldMethodName)
