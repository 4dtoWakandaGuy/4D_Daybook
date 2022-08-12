//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Forms SetFonts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/03/2010 10:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize; <>TextSize; <>TitleSize)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms SetFonts")
SetFontsByPointerParameter(<>TitleSize; ""; 0; ->vTitle)
SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitle1; ->vTitle2; ->vTitle3; ->vTitle4; ->vTitle5; ->vTitle6; ->vTitle7; ->vTitle8; ->vTitle9; ->vTitle10; ->vTitle11; ->vTitle12; ->vTitle13; ->vTitle14; ->vTitle15; ->vTitle16; ->vTitle17; ->vTitle18; ->vTitle19; ->vTitle20)
SetFontsByPointerParameter(<>DataSize; ""; 0; ->vSubtotal; ->vVAT; ->Vtotal; ->Vrate)

//Set_Fonts ("vTitle1+vTitle2+vTitle3+vTitle4+vTitle5+vTitle6+vTitle7"+"+vTitle8+vTitle9+vTitle10";◊TextSize)
//Set_Fonts ("vTitle11+vTitle12+vTitle13+vTitle14+vTitle15+vTitle16+vTitle17"+"+vTitle18+vTitle19+vTitle20";◊TextSize)
//Set_Fonts ("vSubtotal+vVAT+vTotal";◊DataSize)
ERR_MethodTrackerReturn("Forms SetFonts"; $_t_oldMethodName)