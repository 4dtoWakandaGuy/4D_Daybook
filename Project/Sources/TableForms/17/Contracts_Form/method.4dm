If (False:C215)
	//Table Form Method Name: [CONTRACTS]Contracts_Form
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
	C_TEXT:C284(<>TitAdd; <>TitDepCoS; <>TitReg; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACTS].Contracts_Form"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDates; ->vContType; ->vDetails; ->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17]Contract_Text:8)
		//Set_Fonts ("vNumber+vDates+vContType+vDetails";◊DataSize)
		//Set_Fonts ("[CONTRACTS]Company Code+[CONTRACTS]Contract Text";◊DataSize)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitDepCoS; -><>TitAdd; -><>TitReg)
		//Set_Fonts ("◊TitDepCoS+◊TitAdd+◊TitReg";◊TextSize)
		Contr_PPFormLP
End case 
If (Form event code:C388=On Printing Detail:K2:18)
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [CONTRACTS].Contracts_Form"; $_t_oldMethodName)
