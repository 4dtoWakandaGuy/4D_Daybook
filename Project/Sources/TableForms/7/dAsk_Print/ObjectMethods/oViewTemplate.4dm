If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.oViewTemplate
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
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_LetterDisplayed)
	C_LONGINT:C283($_l_Nul; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ScreenHeight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; MMCurrentTemplates)
	C_LONGINT:C283(Write)
	C_TEXT:C284($_t_oldMethodName; WS_T_EmailBody)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.oViewTemplate"; Form event code:C388)
If (WS_at_TemplateNames>0)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{WS_at_TemplateNames})
	//copy document to area
	DOC_bo_LetterDisplayed:=True:C214
	Case of 
		: (MMCurrentTemplates=4D Write Letter Template)
			DOC_SetWriteModifiable(Write; 1; False:C215)
			OBJECT SET VISIBLE:C603(write; True:C214)
			$_l_ScreenHeight:=Screen height:C188
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_WindowLeft+640>Screen width:C187)
				$_l_WindowLeft:=60
				If ($_l_WindowLeft+640)>Screen width:C187
					$_l_WindowRight:=Screen width:C187-20
				Else 
					$_l_WindowRight:=$_l_WindowLeft+640
				End if 
			Else 
				$_l_WindowRight:=$_l_WindowLeft+640
			End if 
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_ScreenHeight-10)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_Nul:=0
			//TRACE
			
			$_l_Nul:=0
			
			OBJECT GET COORDINATES:C663(*; "oLetSelect"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			Gen_SetobjectPositionByname("oLetSelect"; $_l_ObjectTop; 0; $_l_ObjectTop+100; ($_l_WindowRight-$_l_WindowLeft)-20)
			
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
			
			OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; True:C214)
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oViewTemplate"; "o4DwriteArea"; 8; 8; 5)
			
			
			//GET OBJECT RECT(*;"o4DwriteArea";$_l_ObjectLeft2;$_l_ObjectTop2;$_l_ObjectRight2;$_l_ObjectBottom2)
			//MOVE OBJECT(*;"o4DwriteArea";$_l_ObjectLeft2;$_l_ObjectTop2;$_l_ObjectRight2;($_l_ScreenHeight)-10;*)
		: (MMCurrentTemplates=Text Email Template)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{WS_at_TemplateNames})
			WS_T_EmailBody:=[DOCUMENTS:7]Text:3
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			//SET WINDOW RECT($_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_ScreenHeight-10)
			//GOTO PAGE(3)
			//GET OBJECT RECT(*;"oViewTemplateP3";$oLeft1;$oTop1;$oRight1;$oBottom1)
			//GET OBJECT RECT(*;"OEMAILTEXT";$_l_ObjectLeft2;$_l_ObjectTop2;$_l_ObjectRight2;$_l_ObjectBottom2)
			//MOVE OBJECT(*;"OEMAILTEXT";$_l_ObjectLeft2;$oBottom1+5;$_l_ObjectRight2;($_l_WindowBottom-$_l_WindowTop)-10;*)
			OBJECT GET COORDINATES:C663(*; "oLetSelect"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			Gen_SetobjectPositionByname("oLetSelect"; $_l_ObjectTop; 0; $_l_ObjectTop+100; ($_l_WindowRight-$_l_WindowLeft)-20)
			
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
			OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "OEMAILTEXT"; True:C214)
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oViewTemplate"; "OEMAILTEXT"; 8; 8; 5)
			
	End case 
	
	
	
End if 


//reset window size
ERR_MethodTrackerReturn("OBJ:dAsk_Print,Bview"; $_t_oldMethodName)
