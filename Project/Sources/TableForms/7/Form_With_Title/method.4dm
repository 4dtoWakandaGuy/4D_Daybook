If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Form_With_Title
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>TextSize; <>TitleSize; $_l_event)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>TitReg; $_t_oldMethodName; vText)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Form_With_Title"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		SetFontsByPointerParameter(<>TitleSize; ""; 0; ->vTitle)
		//Set_Fonts_ByPointer (◊TitleSize;->vTitle)  `NG March 2006
		//Set_Fonts ("vTitle";◊TitleSize)
		
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitReg; -><>TitDepCo; -><>TitAdd)  //NG March 2006
		
		//Set_Fonts ("◊TitReg+◊TitDepCo+◊TitAdd";◊TextSize)
		//Set_FontsFS ("vText";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
		SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->vText)
End case 

If (Form event code:C388=On Printing Detail:K2:18)
	
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Form_With_Title"; $_t_oldMethodName)
