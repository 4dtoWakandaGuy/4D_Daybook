If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]Form_Sub
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
	C_LONGINT:C283(<>DataSize; $_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].Form_Sub"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vProduct; ->vLocation; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; ->vQuantity; ->vAmount)
		
		//Set_Fonts("vProduct+vLocation+[STOCK ITEMS]Serial No+vQuantity+vAmount";◊DataSize)
		Movt_FormItLP
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].Form_Sub"; $_t_oldMethodName)
