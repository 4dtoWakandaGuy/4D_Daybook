If (False:C215)
	//object Name: [PRODUCTS]Products_inCAT.Variable2
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
	//ARRAY LONGINT(Prod_al_TabPages;0)
	//ARRAY TEXT(Prod_at_TabNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_inCAT.Variable2"; Form event code:C388)
If (Prod_al_TabPages{Prod_at_TabNames}#FORM Get current page:C276) & (Prod_at_TabNames>0)
	FORM GOTO PAGE:C247(Prod_al_TabPages{Prod_at_TabNames})
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_inCAT.Variable2"; $_t_oldMethodName)
