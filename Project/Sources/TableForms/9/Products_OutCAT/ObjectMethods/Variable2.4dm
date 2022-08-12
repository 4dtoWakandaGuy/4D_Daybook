If (False:C215)
	//object Name: [PRODUCTS]Products_OutCAT.Variable2
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
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_LONGINT:C283(PROD_l_DisplayedCatalogue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_OutCAT.Variable2"; Form event code:C388)
If (PROD_at_ViewableCatalogues>0)
	PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{PROD_at_ViewableCatalogues}
	If (Gen_Option)
		Prod_Sel
		CREATE SET:C116([PRODUCTS:9]; "QueryResult")
		If (PROD_l_DisplayedCatalogue>0)
			QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
			QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
			If (Records in selection:C76([PRODUCTS:9])>0)
				RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
			Else 
				REDUCE SELECTION:C351([PRODUCTS:9]; 0)
			End if 
			CREATE SET:C116([PRODUCTS:9]; "CatalogueResult")
			INTERSECTION:C121("CatalogueResult"; "QueryResult"; "CatalogueResult")
			USE SET:C118("CatalogueResult")
		End if 
		
	Else 
		If (PROD_at_ViewableCatalogues>0)
			PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{PROD_at_ViewableCatalogues}
			If (PROD_l_DisplayedCatalogue>0)
				QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
				QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
				If (Records in selection:C76([PRODUCTS:9])>0)
					RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
				Else 
					REDUCE SELECTION:C351([PRODUCTS:9]; 0)
				End if 
				CREATE SET:C116([PRODUCTS:9]; "CatalogueResult")
				INTERSECTION:C121("CatalogueResult"; "QueryResult"; "CatalogueResult")
				USE SET:C118("CatalogueResult")
			Else 
				USE SET:C118("QueryResult")
				
				
			End if 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_OutCAT.Variable2"; $_t_oldMethodName)
