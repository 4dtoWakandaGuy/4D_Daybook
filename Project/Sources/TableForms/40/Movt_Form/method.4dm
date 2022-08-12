If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]Movt_Form
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
	C_TEXT:C284(<>TitPayB; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].Movt_Form"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENTS:40]Company_From:2; ->[STOCK_MOVEMENTS:40]Type_Number:4; ->[STOCK_MOVEMENTS:40]Movement_Date:5; ->vDetails)
		SetFontsByPointerParameter(<>TextSize; ""; 0; -><>TitPayB; ->vTitReg; ->vTitDepCo; ->vTitAdd)
		
		//Set_Fonts ("[STOCK MOVEMENTS]Movement Code+[STOCK MOVEMENTS]Company From+"+"[STOCK MOVEMENTS]Type No";◊DataSize)
		//Set_Fonts ("[STOCK MOVEMENTS]Movement Date+vDetails";◊DataSize)
		//Set_Fonts ("◊TitPayB+vTitReg+vTitDepCo+vTitAdd";◊TextSize)
		Movt_FormLP
End case 

If (Form event code:C388=On Printing Detail:K2:18)
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENTS].Movt_Form"; $_t_oldMethodName)
