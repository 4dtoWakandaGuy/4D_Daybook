If (False:C215)
	//Table Form Method Name: [PRODUCT_GROUPS]Groups_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; <>TextSize)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; $_t_oldMethodName; vTitle3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCT_GROUPS].Groups_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Header:K2:17)
		SetFontsByPointerParameter(20; ""; 0; ->vTitle3)
		//Set_Fonts ("vTitle3";20)
	: (Form event code:C388=On Printing Detail:K2:18)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2)
		//Set_Fonts ("[GROUPS]Group Code+[GROUPS]Group Name";◊DataSize)
	: (Form event code:C388=On Printing Footer:K2:20)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vTitle4)
		//Set_Fonts ("vTitle4";◊DataSize)
		//Set_Fonts ("◊TitDepCo+◊TitAdd+vPPage";◊TextSize)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitDepCo; -><>TitAdd; ->vPPage)
End case 
ERR_MethodTrackerReturn("FM [PRODUCT_GROUPS].Groups_List"; $_t_oldMethodName)
