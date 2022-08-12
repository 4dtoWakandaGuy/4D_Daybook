If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.Invisible Button1
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
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.Invisible Button1"; Form event code:C388)
If (PRD_at_ProductsTab>1)
	PRD_at_ProductsTab:=PRD_at_ProductsTab-1
End if 

If (PRD_at_ProductsTab#FORM Get current page:C276) & (PRD_at_ProductsTab>0)
	FORM GOTO PAGE:C247(PRD_at_ProductsTab)
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.Invisible Button1"; $_t_oldMethodName)
