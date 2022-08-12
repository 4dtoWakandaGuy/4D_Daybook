If (False:C215)
	//Table Form Method Name: [ORDERS]Order Auth
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; <>TextSize; $_l_event)
	C_TEXT:C284(<>TitAuth; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Order Auth"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->Vdate; ->VDetails; ->[ORDERS:24]Person:5; ->[ORDERS:24]Your_Order_Number:10; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Terms:16; ->[ORDERS:24]Order_Date:4)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitAuth; ->vTitReg; ->vTitDepCo; ->vTitAdd)
		//Set_Fonts ("vNumber+vDate+vDetails";◊DataSize)
		//Set_Fonts ("[ORDERS]Person+[ORDERS]Your Order No+[ORDERS]Company Code"+"+[ORDERS]Terms+[ORDERS]Order Date";◊DataSize)
		//Set_Fonts ("◊TitAuth+vTitReg+vTitDepCo+vTitAdd";◊TextSize)
		Orders_PPAuthL2
End case 

If (Form event code:C388=On Printing Detail:K2:18)
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [ORDERS].Order Auth"; $_t_oldMethodName)
