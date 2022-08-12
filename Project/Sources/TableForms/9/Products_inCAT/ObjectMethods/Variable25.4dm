If (False:C215)
	//object Name: [PRODUCTS]Products_inCAT.Variable25
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
	//ARRAY LONGINT(PRD_al_CatalogueID;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_inCAT.Variable25"; Form event code:C388)
If ([PRODUCTS:9]X_ID:43=0)
	[PRODUCTS:9]X_ID:43:=AA_GetNextIDinMethod(->[PRODUCTS:9]X_ID:43)
End if 
CAT_ProdUpdateCats(->PRD_al_CatalogueID; [PRODUCTS:9]X_ID:43)
PROD_LoadCats([PRODUCTS:9]X_ID:43)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_inCAT.Variable25"; $_t_oldMethodName)