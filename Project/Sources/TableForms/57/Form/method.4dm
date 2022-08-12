If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]Form
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].Form"; Form event code:C388)
//$_l_event:=Form event
//
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		
		
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitReg; ->vTitDepCoP; ->vTitAdd)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vDetails; ->vCompCode; ->vContCode; ->vDelDate; ->vPerson; ->vDetailsD)
		
		//Set_Fonts ("vTitReg+vTitDepCoP+vTitAdd";◊TextSize)
		//Set_Fonts ("vNumber+vDate+vDetails+vCompCode+vContCode+vDelDate+vPerson+vDetailsD";◊DataSize)
		
		PurchOrd_FormLP
End case 

If (Form event code:C388=On Printing Detail:K2:18)
	
	Set_FontsTitle
End if 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS].Form"; $_t_oldMethodName)
