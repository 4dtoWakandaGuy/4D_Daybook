If (False:C215)
	//object Name: [PRODUCTS]Products_Out.oProdCatNams
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
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_Selectedcatalogues;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(PROD_at_CatalogueNames;0)
	C_BOOLEAN:C305(PROD_bo_UnfilteredSetKnown)
	C_LONGINT:C283($_l_CatalogueRow; PROD_l_SetID)
	C_TEXT:C284(Prod_T_SelectedCatalogues; $_t_oldMethodName; Prod_T_SelectedCatalogues)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.oProdCatNams"; Form event code:C388)
If (PROD_at_CatalogueNames>0)
	
	Prod_T_SelectedCatalogues:=CAT_at_CatalogueNames{PROD_at_CatalogueNames}
	Catalogue_Prices(CAT_al_CatalogueID{PROD_at_CatalogueNames})
	
	$_l_CatalogueRow:=Find in array:C230(PROD_al_Selectedcatalogues; 1)
	If ($_l_CatalogueRow>0)
		PROD_al_Selectedcatalogues{$_l_CatalogueRow}:=0
	End if 
	PROD_al_Selectedcatalogues{PROD_at_CatalogueNames}:=1
	
	If (Not:C34(PROD_bo_UnfilteredSetKnown))
		//Remember the current selection
		PROD_l_SetID:=0
		PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
		CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
		PROD_bo_UnfilteredSetKnown:=True:C214
		
	Else 
		USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
	End if 
	
	SRCH_Applyfilterstoselection(->[PRODUCTS:9])
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.oProdCatNams"; $_t_oldMethodName)
