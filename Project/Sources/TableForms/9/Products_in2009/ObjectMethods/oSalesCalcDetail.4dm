If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oSalesCalcDetail
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
	//ARRAY TEXT(STK_at_FilterBy;0)
	//ARRAY TEXT(STK_at_DetailTypes;0)
	//ARRAY TEXT(STK_at_HistoryTypes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oSalesCalcDetail"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		STK_FillHistoryBytype(STK_at_HistoryTypes; STK_at_DetailTypes; STK_at_FilterBy)
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oSalesCalcDetail"; $_t_oldMethodName)
