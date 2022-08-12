If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	ARRAY LONGINT:C221($_al_UncopiedLines; 0)
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	ARRAY REAL:C219($_ar_UncopiedPrices; 0)
	ARRAY REAL:C219($_ar_UncopiedQuantities; 0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; 0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_ProductLine; PROD_l_DisplayedCatalogue; PROD_l_DisplayedCatalogueOLD; xNext)
	C_TEXT:C284($_t_oldMethodName; PROD_t_DisplayedCatalogue)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.Variable1"; Form event code:C388)
//NOTE:
//in the load non viewable catalogues should be filtered out
//of the current selection
// a set of non-viewable records to filter from "all" views)
If (PROD_at_ViewableCatalogues>0)
	//AL_ExitCell (CAT_PowerviewPRODS)
	ARRAY LONGINT:C221($_al_UncopiedLines; 100)
	ARRAY REAL:C219($_ar_UncopiedPrices; 100)
	ARRAY REAL:C219($_ar_UncopiedQuantities; 100)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; 100)
	$_l_CurrentRow:=0
	For ($_l_Index; 1; Size of array:C274(PROD_ar_ActualSalesPrice))
		//If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=0)
		If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
			$_l_CurrentRow:=$_l_CurrentRow+1
			If ($_l_CurrentRow>(Size of array:C274($_al_UncopiedLines)))
				INSERT IN ARRAY:C227($_al_UncopiedLines; Size of array:C274($_al_UncopiedLines)+1; 100)
				INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
				INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
				INSERT IN ARRAY:C227($_at_UncopiedProdCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
				
			End if 
			$_al_UncopiedLines{$_l_CurrentRow}:=$_l_Index
			$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
			$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
			$_at_UncopiedProdCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
		Else 
			//If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=0)
			If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
				$_l_CurrentRow:=$_l_CurrentRow+1
				If ($_l_CurrentRow>(Size of array:C274($_al_UncopiedLines)))
					INSERT IN ARRAY:C227($_al_UncopiedLines; Size of array:C274($_al_UncopiedLines)+1; 100)
					INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
					INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
					INSERT IN ARRAY:C227($_at_UncopiedProdCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
					
				End if 
				$_al_UncopiedLines{$_l_CurrentRow}:=$_l_Index
				$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
				$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
				$_at_UncopiedProdCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
			End if 
		End if 
	End for 
	//```
	ARRAY LONGINT:C221($_al_UncopiedLines; $_l_CurrentRow)
	ARRAY REAL:C219($_ar_UncopiedPrices; $_l_CurrentRow)
	ARRAY REAL:C219($_ar_UncopiedQuantities; $_l_CurrentRow)
	ARRAY TEXT:C222($_at_UncopiedProdCodes; $_l_CurrentRow)
	//here ask the user if they want to keep them
	If (Size of array:C274($_al_UncopiedLines)>0)
		Gen_Confirm3("You have lines with quantities/prices that are not copied to the order ?"; "Forget"; "Remember"; "Copy")
		Case of 
			: (xNext=1)
				PROD_CopyQuantitied
				CREATE EMPTY SET:C140([PRODUCTS:9]; "ToRemember")
			: (OK=0)
				For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=PROD_at_ProductCodes{$_al_UncopiedLines{$_l_Index}})
					ADD TO SET:C119([PRODUCTS:9]; "ToRemember")
				End for 
			Else 
				CREATE EMPTY SET:C140([PRODUCTS:9]; "ToRemember")
		End case 
	End if 
	UNION:C120("CurrentSelection"; "ToRemember"; "CurrentSelection")
	USE SET:C118("CurrentSelection")
	PROD_l_DisplayedCatalogueOLD:=PROD_l_DisplayedCatalogue
	PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{PROD_at_ViewableCatalogues}
	//`````
	
	If (PROD_l_DisplayedCatalogue>0)  //A
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
		QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
		If (Records in selection:C76([Catalogue_ProductLink:109])>0)
			RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
		Else 
			REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		End if 
		If (Records in selection:C76([PRODUCTS:9])>0)  //B
			CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
			INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
			//now get those into here
			USE SET:C118("CurrentCatalogue")
			If (Records in selection:C76([PRODUCTS:9])>0)  //C
				Catalogue_Prices
				PROD_palletteSetupArrays
				For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
					$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
					If ($_l_ProductLine>0)  //it should be
						PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
						PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
					End if 
				End for 
			Else   //C
				Gen_Alert("No products matching the search are in this catalogue, reverting to previous"+" catalogue")
				PROD_l_DisplayedCatalogue:=PROD_l_DisplayedCatalogueOLD
				If (PROD_l_DisplayedCatalogue>0)  //D
					QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
					QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
					If (Records in selection:C76([Catalogue_ProductLink:109])>0)
						RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
					Else 
						REDUCE SELECTION:C351([PRODUCTS:9]; 0)
					End if 
					CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
					INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
					USE SET:C118("CurrentCatalogue")
					Catalogue_Prices
					PROD_palletteSetupArrays
					For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
						$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
						If ($_l_ProductLine>0)  //it should be
							PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
							PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
						End if 
					End for 
				Else 
					USE SET:C118("CurrentSelection")
					PROD_palletteSetupArrays
					For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
						$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
						If ($_l_ProductLine>0)  //it should be
							PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
							PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
						End if 
					End for 
				End if   //D
			End if   //C
			//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
			
		Else   //B
			Gen_Alert("No Products are in this catalogue, selection will not be changed")
			PROD_l_DisplayedCatalogue:=PROD_l_DisplayedCatalogue
			If (PROD_l_DisplayedCatalogue>0)  //E
				QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
				QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
				If (Records in selection:C76([Catalogue_ProductLink:109])>0)
					RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
				Else 
					REDUCE SELECTION:C351([PRODUCTS:9]; 0)
				End if 
				CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
				INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
				//now get those into here
				USE SET:C118("CurrentCatalogue")
				Catalogue_Prices
				PROD_palletteSetupArrays
				For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
					$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
					If ($_l_ProductLine>0)  //it should be
						PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
						PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
					End if 
				End for 
			Else   //E
				USE SET:C118("CurrentSelection")
				PROD_palletteSetupArrays
				For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
					$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
					If ($_l_ProductLine>0)  //it should be
						PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
						PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
					End if 
				End for 
				//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
			End if   //E
			
			
		End if   //B
		
	Else   //A
		USE SET:C118("CurrentSelection")
		PROD_palletteSetupArrays
		For ($_l_Index; 1; Size of array:C274($_al_UncopiedLines))
			$_l_ProductLine:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProdCodes{$_l_Index})
			If ($_l_ProductLine>0)  //it should be
				PROD_ar_ActualQty{$_l_ProductLine}:=$_ar_UncopiedQuantities{$_l_Index}
				PROD_ar_ActualSalesPrice{$_l_ProductLine}:=$_ar_UncopiedPrices{$_l_Index}
			End if 
		End for 
		//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
		
	End if   //B
	If (PROD_l_DisplayedCatalogue>0)
		$_l_ProductLine:=Find in array:C230(PROD_al_ViewableCatalogues; PROD_l_DisplayedCatalogue)
		PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_ProductLine}
	Else 
		
		PROD_t_DisplayedCatalogue:="All Catalogues"
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].Prod_SelectionPallette.Variable1"; $_t_oldMethodName)
