If (False:C215)
	//Table Form Method Name: [USER]Template_manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 17:56
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
	C_BOOLEAN:C305(DB_bo_NoLoad; DOC_bo_AutoPrint; DOC_bo_ShowTemplate)
	C_LONGINT:C283($_l_CharacterCode; $_l_event; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectRight2; $_l_ObjectRIght3; $_l_ObjectTop2; $_l_ObjectTop3; $_l_WIndowBottom)
	C_LONGINT:C283($_l_WIndowHeight; $_l_WIndowLeft; $_l_WIndowTop; BPreview; Buse; Bview; DIA_l_BUT1; DIA_l_But2; DIA_l_BUT3; DIA_l_BUT4; DIA_l_BUT5)
	C_LONGINT:C283(DIA_l_BUT6; DIA_l_BUT7; DIA_l_BUT8; DIA_l_BUT9; DOC_but_Cancel; write; writetemp)
	C_TEXT:C284($_t_oldMethodName; DIA_t_COL1; DIA_t_COL2; DIA_t_COL3; DIA_t_COL4; DIA_t_COL5; DIA_t_COL6; DIA_t_COL7; DIA_t_COL8; DIA_t_COL9; DIA_t_HED1)
	C_TEXT:C284(DIA_t_HED2; DIA_t_HED3; DIA_t_HED4; DIA_t_HED5; DIA_t_HED6; DIA_t_HED7; DIA_t_HED8; DIA_t_HED9; DOC_t_CancelText; DOC_t_PreviewText; DOC_t_useText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Template_manager"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Template_manager")
		DOC_bo_ShowTemplate:=False:C215
		OBJECT SET VISIBLE:C603(*; "o4dWriteArea"; False:C215)
		If (DOC_t_CancelText="")
			DOC_t_CancelText:="Cancel"
		End if 
		If (DOC_t_PreviewText="")
			OBJECT SET VISIBLE:C603(*; "oPreview"; False:C215)
		End if 
		If (DOC_t_useText#"")
			OBJECT SET TITLE:C194(*; "oUseTemplate"; DOC_t_useText)
		End if 
		
		
		
		OBJECT SET TITLE:C194(*; "oCancel"; DOC_t_CancelText)
		
		WS_AutoscreenSize(2; 220; 490)  //widened Rollo 27/8/2004
		
		ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
		ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
		$_l_CharacterCode:=Character code:C91("???")
		//need to handle cross platform
		
		INT_SetLongintCheckFormat(->DOC_al_TemplatesInclude)
		
		WS_at_TemplateRefs:=0
		WS_at_TemplateNames:=0
		DOC_al_TemplatesInclude:=0
		
		LB_SetupListbox(->DIA_lb_Documents; "DIA_t"; "DIA_L"; 1; ->WS_at_TemplateRefs; ->WS_at_TemplateNames)
		LB_SetColumnHeaders(->DIA_lb_Documents; "DIA_L"; 1; "Reference"; "Document Title")
		
		LB_SetColumnWidths(->DIA_lb_Documents; "DIA_t"; 1; 121; 335)
		
		LB_SetEnterable(->DIA_lb_Documents; False:C215; 0)
		LB_SetScroll(->DIA_lb_Documents; -3; -2)
		LB_StyleSettings(->DIA_lb_Documents; "Black"; 9; "DIA_t"; ->[ACCOUNTS:32])
		
		INT_SetDialog
		
	: ($_l_event=On Resize:K2:27)
		INT_SetDialog
		Case of 
			: (FORM Get current page:C276=1)
				If (DOC_bo_ShowTemplate)  //&??(False)
					//Template is showing
					GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowHeight; $_l_WIndowBottom)
					$_l_WindowHeight:=$_l_WIndowBottom-$_l_WIndowTop
					OBJECT GET COORDINATES:C663(*; "o4dWriteArea"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					OBJECT GET COORDINATES:C663(*; "oViewTemplate"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRIght3; $_l_ObjectBottom3)
					
					OBJECT MOVE:C664(*; "o4dWriteArea"; $_l_ObjectLeft2; $_l_ObjectBottom3+10; $_l_ObjectRight2; $_l_ObjectBottom2; *)
				End if 
			: (FORM Get current page:C276=2)
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:Template_manager"; $_t_oldMethodName)
