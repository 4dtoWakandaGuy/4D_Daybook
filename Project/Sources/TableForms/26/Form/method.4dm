If (False:C215)
	//Table Form Method Name: [JOBS]Form
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
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>TitPay; <>TitPayB; <>TitReg; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].Form"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vDetails; ->[JOBS:26]Your_Order_Number:5; ->[JOBS:26]Terms:14)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitPay; -><>TitPayB; -><>TitReg; -><>TitDepCo; -><>TitAdd)
		
		//Set_Fonts ("vNumber+vDate+vDetails";◊DataSize)
		//Set_Fonts("[JOBS]Your Order No+[JOBS]Terms";◊DataSize)
		//Set_Fonts ("◊TitPay+◊TitPayB+◊TitReg+◊TitDepCo+◊TitAdd";◊TextSize)
		Jobs_PPFormL2
End case 
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  //(During)
		
		Set_FontsTitle
End case 
ERR_MethodTrackerReturn("FM [JOBS].Form"; $_t_oldMethodName)
