If (False:C215)
	//object Name: [USER]Template_manager.oViewTemplate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_ShowTemplate; $_bo_4DWrite; DOC_bo_ShowTemplate)
	C_LONGINT:C283($_l_LetterTemplateDocumentClass; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop2)
	C_LONGINT:C283($_l_ObjectTop3; $_l_TextObjectBottom; $_l_TextObjectLeft; $_l_TextObjectRight; $_l_TextObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_EmailTemplateDocumentClass; $_l_LetterTemplateDocumentClass)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop2)
	C_LONGINT:C283($_l_ObjectTop3; $_l_TextObjectBottom; $_l_TextObjectLeft; $_l_TextObjectRight; $_l_TextObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; WriteTemp)
	C_TEXT:C284(WS_T_EmailBody; $_t_oldMethodName; WS_T_EmailBody)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Template_manager.oViewTemplate"; Form event code:C388)
If (WS_at_TemplateNames>0)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{WS_at_TemplateNames})
	//copy document to area
	$_bo_4DWrite:=False:C215
	$_l_LetterTemplateDocumentClass:=4D Write Letter Template
	$_l_EmailTemplateDocumentClass:=Text Email Template
	
	Case of 
		: ([DOCUMENTS:7]Document_Class:14=$_l_LetterTemplateDocumentClass)
			DOC_SetWriteModifiable(WriteTemp; 1; False:C215)
			
			WR PICTURE TO AREA:P12000:141(WriteTemp; [DOCUMENTS:7]Write_:5)
			// WR Area To Picture (write;1;0)
			OBJECT SET VISIBLE:C603(WriteTemp; True:C214)
			$_bo_4DWrite:=True:C214
			
		: ([DOCUMENTS:7]Document_Class:14=$_l_EmailTemplateDocumentClass)  //emailtemplate
			WS_T_EmailBody:=[DOCUMENTS:7]Text:3
			OBJECT SET VISIBLE:C603([DOCUMENTS:7]Text:3; True:C214)
			FORM GOTO PAGE:C247(2)
		Else 
			OBJECT SET VISIBLE:C603([DOCUMENTS:7]Text:3; True:C214)
	End case 
	DOC_bo_ShowTemplate:=True:C214
	OBJECT GET COORDINATES:C663(WriteTemp; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oViewTemplate"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
	OBJECT GET COORDINATES:C663(*; "oUseTemplate"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowBottom:=Screen height:C188
	
	
	$_l_TextObjectLeft:=$_l_ObjectLeft2
	$_l_TextObjectTop:=$_l_ObjectBottom2+5
	$_l_TextObjectRight:=$_l_ObjectRight3
	$_l_TextObjectBottom:=(($_l_WindowBottom-50)-$_l_WindowTop)-50
	If ($_bo_4DWrite)
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+700; $_l_WindowBottom-50)
		
		//MOVE OBJECT(WriteTemp;$_l_ObjectLeft;($_l_ObjectBottom2+10);($_l_ObjectLeft+650);($_l_ObjectBottom2+$Obj)-($_l_ObjectBottom2+10);*)
		OBJECT MOVE:C664(WriteTemp; 10; $_l_TextObjectTop; 680; $_l_TextObjectBottom; *)
	Else 
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom-50)
		OBJECT MOVE:C664(*; "oTextEmail"; $_l_TextObjectLeft; $_l_TextObjectTop; $_l_TextObjectRight; $_l_TextObjectBottom; *)
	End if 
	
	//reset window size
	
	
	
End if 
ERR_MethodTrackerReturn("OBJ:Template_manager,Bview"; $_t_oldMethodName)
