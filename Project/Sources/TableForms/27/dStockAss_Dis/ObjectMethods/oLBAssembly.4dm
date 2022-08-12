If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]dStockAss_Dis.oLBAssembly
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2012 16:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].dStockAss_Dis.oLBAssembly"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
End case 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].dStockAss_Dis.oLBAssembly"; $_t_oldMethodName)
