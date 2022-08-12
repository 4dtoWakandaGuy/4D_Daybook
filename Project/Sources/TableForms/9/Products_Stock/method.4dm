If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_Stock
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
	C_LONGINT:C283($_l_event; vStockLevel; vStockUA)
	C_REAL:C285(vQuantity; vStockVal; vStockValUA; vT1; vT2; vT3; vT4; vTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_Stock"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		Stock_CalcL
		vQuantity:=Round:C94((vStockLevel+vStockUA); 2)
		vTotal:=Round:C94((vStockVal+vStockValUA); 2)
	: ($_l_event=On Printing Break:K2:19)
		
		vT1:=Round:C94((Subtotal:C97(vStockLevel)); 2)
		vT2:=Round:C94((Subtotal:C97(vStockVal)); 2)
		vT3:=Round:C94((Subtotal:C97(vStockUA)); 2)
		vT4:=Round:C94((Subtotal:C97(vStockValUA)); 2)
		vQuantity:=Round:C94((vT1+vT3); 2)
		vTotal:=Round:C94((vT2+vT4); 2)
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].Products_Stock"; $_t_oldMethodName)
