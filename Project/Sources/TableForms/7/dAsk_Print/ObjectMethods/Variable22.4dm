If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
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
	C_BOOLEAN:C305($_bo_noEmailAlertDisplayed; DOC_bo_templatesDisplayed; DOC_bo_TemplateSelected; DOC_bo_NoChangeLetter)
	C_LONGINT:C283(<>AutoProc; <>SYS_l_WindowTop; $_l_AsciiChar; $_l_BottomMax; $_l_DocClass; $_l_Index; $_l_Listboxbottom; $_l_Nul; $_l_OK; $_l_PrintBoxBottom; $_l_PrintBoxLeft)
	C_LONGINT:C283($_l_PrintBoxRight; $_l_PrintBoxTop; $_l_Size; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; bd4; BselectTemplate; Bview; MMCurrentTemplates)
	C_LONGINT:C283(MMLetterClass; WS_l_TEMPLATEMGRCONTEXT)
	C_TEXT:C284($_t_oldMethodName; DOC_t_TemplateReference; WS_T_EmailBody; WS_t_TemplateType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Variable22"; Form event code:C388)
<>AutoProc:=Current process:C322

//if DOC_bo_NoChangeLetter is true we are
//coming to this from the diary with a document selected
//so you can change the letter
//the value is set to true when you click the
//email button(which also sets this to visible)

//ZLetters_Mod
MMCurrentTemplates:=0
Case of 
	: (MMLetterClass=4D Write Letter Template) | (MMLetterClass=4D Write Letter) | (MMLetterClass=0)
		$_l_OK:=0
		If (bd4=1)  //Email is selected
			If (Not:C34(DOC_bo_NoChangeLetter))
				CONFIRM:C162("Which Template"; "Email"; "Letter")
				$_l_OK:=OK
			Else 
				$_l_OK:=1  //email templates only
			End if 
			
		End if 
		If ($_l_OK=0)  //notLETTER template
			MMCurrentTemplates:=4D Write Letter Template
			MESSAGES OFF:C175
			$_l_DocClass:=4D Write Letter Template
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=$_l_DocClass; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Status:15>-100)  //deleted templates will get a status of status-100
			MESSAGES ON:C181
			If (Records in selection:C76([DOCUMENTS:7])=0)
				//must be not updated so need to create the templates
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214)
				If (Records in selection:C76([DOCUMENTS:7])=0)
					//         ALERT("There are no templates in this database")
					Gen_Alert("There are no templates in this database")
				Else 
					//need to check these have data in the picture field!
					CREATE EMPTY SET:C140([DOCUMENTS:7]; "WriteTemplates")
					For ($_l_Index; 1; Records in selection:C76([DOCUMENTS:7]))
						IDLE:C311  //7/04/03 pb
						If (Picture size:C356([DOCUMENTS:7]Write_:5)>0)
							ADD TO SET:C119([DOCUMENTS:7]; "WriteTemplates")
						End if 
						NEXT RECORD:C51([DOCUMENTS:7])
					End for 
				End if 
			Else 
				CREATE SET:C116([DOCUMENTS:7]; "WriteTemplates")
				USE SET:C118("WriteTemplates")
				CLEAR SET:C117("WriteTemplates")
			End if 
			//20001=no check
			//20002=some check
			//2004-check
			If (Records in selection:C76([DOCUMENTS:7])=0)
				//there are no 4D write templates
				//       ALERT("There are no  letter templates in this database")
				Gen_Alert("There are no  letter templates in this database")
			Else 
				SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
				SORT ARRAY:C229(WS_at_TemplateNames; WS_at_TemplateRefs)
				
				WS_at_TemplateNames:=0
				WS_at_TemplateRefs:=0
				DOC_al_TemplatesInclude:=0
				WS_t_TemplateType:="Word Processor Templates"
				WS_l_TemplateMgrContext:=1
				DOC_bo_TemplateSelected:=False:C215
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
				$_l_AsciiChar:=Character code:C91("•")
				//need to handle cross platform
				INT_SetLongintCheckFormat(->DOC_al_TemplatesInclude)
				
				
				OBJECT SET VISIBLE:C603(DIA_lb_Documents; True:C214)
				OBJECT SET VISIBLE:C603(WS_T_EmailBody; False:C215)
				
				OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
				
				OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Text2"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oViewTemplate"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oUseTemplate"; True:C214)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_Nul:=0
				//TRACE
				
				$_l_Nul:=0
				If (FORM Get current page:C276=1)
					$_l_Size:=152+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 560)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements"; "oLetSelect"; 2; 8; 10; 32)
				Else 
					$_l_Size:=221+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 590)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oLetSelect"; 2; 8; 10; 32)
				End if 
				
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
				DOC_bo_TemplatesDisplayed:=True:C214
				
				
			End if 
			
		Else 
			MMCurrentTemplates:=Text Email Template
			$_l_DocClass:=Text Email Template
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=$_l_DocClass; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0; *)
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
						IDLE:C311  //7/04/03 pb
						If ([DOCUMENTS:7]Text:3#"")
							ADD TO SET:C119([DOCUMENTS:7]; "WriteTemplates")
						End if 
						NEXT RECORD:C51([DOCUMENTS:7])
					End for 
					USE SET:C118("EMAILTemplates")
					CLEAR SET:C117("EMAILTemplates")
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
				//      ALERT("There are no  Email templates in this database")
				Gen_Alert("There are no eMail templates in this database")
			Else 
				SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
				WS_at_TemplateNames:=0
				WS_at_TemplateRefs:=0
				DOC_al_TemplatesInclude:=0
				WS_t_TemplateType:="Email Templates"
				WS_l_TemplateMgrContext:=3
				DOC_bo_TemplateSelected:=False:C215
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
				$_l_AsciiChar:=Character code:C91("•")
				//need to handle cross platform
				OBJECT SET VISIBLE:C603(DIA_lb_Documents; True:C214)
				OBJECT SET VISIBLE:C603(WS_T_EmailBody; False:C215)
				
				OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
				
				OBJECT SET FORMAT:C236(DOC_al_TemplatesInclude; "²;;")
				OBJECT SET VISIBLE:C603(DOC_al_TemplatesInclude; True:C214)
				OBJECT SET VISIBLE:C603(DOC_al_TemplatesInclude; True:C214)
				OBJECT SET VISIBLE:C603(WS_at_TemplateNames; True:C214)
				OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Text2"; True:C214)
				OBJECT SET VISIBLE:C603(Bview; True:C214)
				OBJECT SET VISIBLE:C603(BselectTemplate; True:C214)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_BottomMax:=Screen height:C188
				$_l_WindowBottom:=$_l_WindowTop+540
				If ($_l_WindowBottom>$_l_BottomMax)
					If ($_l_WindowTop>(<>SYS_l_WindowTop+60))
						$_l_WindowTop:=<>SYS_l_WindowTop+60
						$_l_WindowBottom:=$_l_WindowTop+540
					End if 
					If ($_l_WindowBottom>$_l_BottomMax)
						$_l_WindowBottom:=Screen height:C188-10
					End if 
				End if 
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				If (FORM Get current page:C276=1)
					$_l_Size:=152+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 560)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements"; "oLetSelect"; 2; 8; 10; 32)
				Else 
					$_l_Size:=221+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 590)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oLetSelect"; 2; 8; 10; 32)
				End if 
				
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
				DOC_bo_TemplatesDisplayed:=True:C214
			End if 
		End if 
		
	: (MMLetterClass=Text Email Template) | (MMLetterClass=Text Email)
		MMCurrentTemplates:=Text Email Template
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template; *)
		QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Status:15>-100)  //deleted templates will get a status of status-100
		MESSAGES ON:C181
		$_bo_noEmailAlertDisplayed:=False:C215
		If (Records in selection:C76([DOCUMENTS:7])=0)
			//must be not updated so need to create the templates
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Text:3#"")
			If (Records in selection:C76([DOCUMENTS:7])=0)
				$_bo_noEmailAlertDisplayed:=True:C214
				Gen_Alert("There are no eMail templates in this database")
			Else   //need to check these have data in the picture field!
				CREATE EMPTY SET:C140([DOCUMENTS:7]; "EmailTemplates")
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Text:3#"")
				If (False:C215)
					For ($_l_Index; 1; Records in selection:C76([DOCUMENTS:7]))
						IDLE:C311  //7/04/03 pb
						If ([DOCUMENTS:7]Text:3#"")
							ADD TO SET:C119([DOCUMENTS:7]; "EmailTemplates")
						End if 
						NEXT RECORD:C51([DOCUMENTS:7])
					End for 
				Else 
					CREATE SET:C116([DOCUMENTS:7]; "EmailTemplates")
				End if 
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
			If (Not:C34($_bo_noEmailAlertDisplayed))
				//    ALERT("There are no  Email templates in this database")
				Gen_Alert("There are no eMail templates in this database")
			End if 
		Else 
			SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
			WS_at_TemplateNames:=0
			WS_at_TemplateRefs:=0
			DOC_al_TemplatesInclude:=0
			WS_t_TemplateType:="Email Templates"
			WS_l_TemplateMgrContext:=3
			DOC_bo_TemplateSelected:=False:C215
			OBJECT SET VISIBLE:C603(DIA_lb_Documents; True:C214)
			OBJECT SET VISIBLE:C603(WS_T_EmailBody; False:C215)
			OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
			ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
			ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
			$_l_AsciiChar:=Character code:C91("•")
			//need to handle cross platform
			OBJECT SET FORMAT:C236(DOC_al_TemplatesInclude; "²;;")
			OBJECT SET VISIBLE:C603(DOC_al_TemplatesInclude; True:C214)
			OBJECT SET VISIBLE:C603(DOC_al_TemplatesInclude; True:C214)
			OBJECT SET VISIBLE:C603(WS_at_TemplateNames; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text3"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text2"; True:C214)
			OBJECT SET VISIBLE:C603(Bview; True:C214)
			OBJECT SET VISIBLE:C603(BselectTemplate; True:C214)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663(*; "oPrintRequirements"; $_l_PrintBoxLeft; $_l_PrintBoxTop; $_l_PrintBoxRight; $_l_PrintBoxBottom)
			If (Size of array:C274(WS_at_TemplateRefs)>0)
				$_l_BottomMax:=Screen height:C188
				$_l_WindowBottom:=$_l_WindowTop+540
				If ($_l_WindowBottom>$_l_BottomMax)
					If ($_l_WindowTop>(<>SYS_l_WindowTop+60))
						$_l_WindowTop:=<>SYS_l_WindowTop+60
						$_l_WindowBottom:=$_l_WindowTop+540
					End if 
					If ($_l_WindowBottom>$_l_BottomMax)
						$_l_WindowBottom:=Screen height:C188-10
					End if 
				End if 
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_Listboxbottom:=($_l_WindowBottom-$_l_WindowTop)-29
				If (FORM Get current page:C276=1)
					$_l_Size:=152+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 560)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements"; "oLetSelect"; 2; 8; 10; 32)
				Else 
					$_l_Size:=221+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
					If ($_l_Size>Screen height:C188)
						$_l_Size:=Screen height:C188-25
					End if 
					
					WS_AutoscreenSize(2; $_l_Size; 590)
					Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oLetSelect"; 2; 8; 10; 32)
				End if 
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
				Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
				DOC_bo_TemplatesDisplayed:=True:C214
			Else 
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowTop+($_l_PrintBoxBottom-$_l_PrintBoxLeft)+10)
				//hide the area
			End if 
			
			
			INT_SetDialog
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:dAsk_Print,xSearch"; $_t_oldMethodName)
