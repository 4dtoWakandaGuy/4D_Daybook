//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_FontsTitle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>TitleSize)
	C_TEXT:C284(<>TitleLRC; $_t_oldMethodName; vTitle; vTitleL; vTitleR)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_FontsTitle")
Case of 
	: (<>TitleLRC="R")
		SetFontsByPointerParameter(<>TitleSize; ""; 0; ->vTitleR)
		//Set_Fonts ("vTitleR";◊TitleSize)
		vTitleR:=vTitle
		vTitle:=""
		vTitleL:=""
	: (<>TitleLRC="L")
		//Set_Fonts ("vTitleL";◊TitleSize)
		SetFontsByPointerParameter(<>TitleSize; ""; 0; ->vTitleL)
		vTitleL:=vTitle
		vTitle:=""
		vTitleR:=""
	Else 
		vTitleL:=""
		vTitleR:=""
End case 
ERR_MethodTrackerReturn("Set_FontsTitle"; $_t_oldMethodName)