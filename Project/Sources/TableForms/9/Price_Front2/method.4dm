If (False:C215)
	//Table Form Method Name: [PRODUCTS]Price_Front2
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
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName; vText; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Price_Front2"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		vTitle:=[PRODUCT_GROUPS:10]Group_Name:2
		vText:=[PRODUCT_GROUPS:10]Group_Comments:3
		SetFontsByPointerParameter(20; ""; 0; ->vTitle)  //NG March 2006
		//Set_Fonts ("vTitle";20)
		//Set_Fonts ("vText";◊DataSize)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vText)  //NG March 2006
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].Price_Front2"; $_t_oldMethodName)
