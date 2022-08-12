If (False:C215)
	//Table Form Method Name: [PRODUCTS]Price_Front
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
	C_LONGINT:C283(<>TextSize)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>UserName; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Price_Front"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(32; ""; 0; -><>UserName; ->vTitle; ->vLetterDate)  //NG March 2006
	//Set_Fonts ("◊UserName+vTitle+vLetterDate";32)
	SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitDepCo; -><>TitAdd)  //NG March 2006
	//Set_Fonts ("◊TitDepCo+◊TitAdd";◊TextSize)
End if 
ERR_MethodTrackerReturn("FM [PRODUCTS].Price_Front"; $_t_oldMethodName)
