If (False:C215)
	//Table Form Method Name: [ORDERS]Delivery_Note
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
	//C_UNKNOWN(<>TextSize)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>TextSize; $_l_event; <>DataSize; $_l_event)
	C_TEXT:C284($_t_oldMethodName; <>TitPayB; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Delivery_Note"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->[ORDERS:24]Person:5; ->vDelDate; ->vDetails; ->vOurRef; ->[ORDERS:24]Order_Date:4; ->[ORDERS:24]Your_Order_Number:10; ->[ORDERS:24]Delivery_Method:19; ->[ORDERS:24]Company_Code:1)
		//Set_Fonts ("vNumber+vDate+[ORDERS]Person+vDelDate+vDetails+vOurRef";◊DataSize)
		//Set_Fonts ("[ORDERS]Order Date+[ORDERS]Your Order No"+"+[ORDERS]Delivery Method"+"+[ORDERS]Company Code";◊DataSize)
		//Set_Fonts ("◊TitPayB+vTitReg+vTitDepCo+vTitAdd";◊TextSize)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitPayB; ->vTitReg; ->vTitDepCo; ->vTitAdd)
		Orders_PPDelL2
End case 
If (Form event code:C388=On Printing Detail:K2:18)
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [ORDERS].Delivery_Note"; $_t_oldMethodName)
