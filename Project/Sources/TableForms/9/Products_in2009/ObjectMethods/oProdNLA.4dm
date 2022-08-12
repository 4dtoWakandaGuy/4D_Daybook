If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oProdNLA
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
	C_BOOLEAN:C305(PRD_bo_NLA)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oProdNLA"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PRD_bo_NLA)
			[PRODUCTS:9]x_Product_No_longer_Available:54:=-1
		Else 
			[PRODUCTS:9]x_Product_No_longer_Available:54:=0
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oProdNLA"; $_t_oldMethodName)
