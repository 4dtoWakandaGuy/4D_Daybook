If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.oListingChoice1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	//ARRAY TEXT(PROD_at_DisplayDetail;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_LONGINT:C283($_l_CatalogueRow; $_l_offset; PROD_l_DisplayedCatalogue)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PROD_t_DisplayedCatalogue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.oListingChoice1"; Form event code:C388)
PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{PROD_at_ViewableCatalogues}
PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{PROD_at_ViewableCatalogues}

If (PROD_l_DisplayedCatalogue#0)
	//Get records in catalogue
	
	$_l_offset:=0
	QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PROD_l_DisplayedCatalogue)
	$_l_CatalogueRow:=Find in array:C230(CAT_al_CatalogueID; PROD_l_DisplayedCatalogue)
	If ($_l_CatalogueRow>0)  // it should be!!!
		CAT_LoadProducts(PROD_l_DisplayedCatalogue; <>SYS_t_BaseCurrency; False:C215; CAT_al_CatalogueClass{$_l_CatalogueRow}; CAT_at_CatalogueMacro{$_l_CatalogueRow})
		CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
		INTERSECTION:C121("CurrentCatalogue"; "DisplayedSelection"; "CurrentCatalogue")
		//now get those into here
		USE SET:C118("CurrentCatalogue")
		Catalogue_Prices
		
	End if 
End if 


Products_Arr(PROD_at_DisplayDetail)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Product.oListingChoice1"; $_t_oldMethodName)
