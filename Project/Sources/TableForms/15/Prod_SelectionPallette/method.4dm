If (False:C215)
	//Table Form Method Name: [USER]Prod_SelectionPallette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	ARRAY LONGINT:C221($_al_uncopiedLines; 0)
	ARRAY REAL:C219($_ar_UncopiedPrices; 0)
	ARRAY REAL:C219($_ar_UncopiedQuantities; 0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	ARRAY TEXT:C222($_at_UncopiedProductCodes; 0)
	//ARRAY TEXT(PROD_at_ProductCodes;0)
	C_BOOLEAN:C305(CAT_bo_ArraywidthsSet; DB_bo_NoLoad; PROD_bo_Exit; PROD_bo_ViewExpand)
	C_LONGINT:C283($_l_ClickedFunction; $_l_Column; $_l_CurrentRow; $_l_event; $_l_HLHeight; $_l_Index; $_l_MinumumWidth; $_l_NewWindowBottom; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_offset; $_l_ProductCodeRow; $_l_Retries; $_l_Row; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(Prod_l_CallBackItemID; PROD_l_CallBackMProcess; PROD_l_CallingItem; PROD_l_CallingProcess; PROD_l_CollapsedHeight; PROD_l_DisplayedCatalogue; xNext)
	C_PICTURE:C286(PRD_pic_Extendinfo)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; CAT_t_CatViewCurrency; PROD_S20_ViewCurrency; PROD_T_Query; PROD_t_UseSetName; PROD_TQuery; SRCH_t_SearchValue; SRCH_t_SearchValueOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Prod_SelectionPallette"; Form event code:C388)
//Form method User:Prod_SelectionPalltette
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//PROD_bo_WinObjectsSet:=False
		OpenHelp(Table:C252(->[USER:15]); "Prod_SelectionPallette")
		CAT_bo_ArraywidthsSet:=False:C215
		PROD_bo_Exit:=False:C215
		//we already have a selection of products
		//and we have the the catalog pop-ups setup
		//what we need is to put the catlogue items into the PV area
		// and set that up
		$_l_MinumumWidth:=80+170+80+80+50+50+40+30+20+50+50+50
		WS_AutoscreenSize(2; 410; $_l_MinumumWidth)
		//GET PICTURE FROM LIBRARY(15518+(Num(PROD_bo_ViewExpand)); PRD_pic_Extendinfo)
		PRD_pic_Extendinfo:=Get_Picture(15518+(Num:C11(PROD_bo_ViewExpand)))
		OBJECT GET COORDINATES:C663(*; "oPROD_T_CatalogueGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		
		$_l_HLHeight:=$_l_ObjectBottom-$_l_ObjectTop
		Prod_SetProductDetail
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_NewWindowBottom:=(Screen height:C188-5)-$_l_windowTop
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_NewWindowBottom)
		PROD_bo_ViewExpand:=False:C215
		Case of 
			: (PROD_bo_ViewExpand)  //view is expanded
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			Else 
				//view is collapsed
				FORM GOTO PAGE:C247(2)
				
		End case 
		
		CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
		If (PROD_S20_ViewCurrency#"")  //currency passed from the order
			CAT_t_CatViewCurrency:=PROD_S20_ViewCurrency
		End if 
		
		EW_LoadPrefs
		If (PROD_l_DisplayedCatalogue>0)
			$_l_offset:=0
			QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PROD_l_DisplayedCatalogue)
			QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
			QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
			RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
			CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
			INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
			
			//now get those into here
			Catalogue_Prices
		End if 
		
		PROD_palletteSetupArrays
		//The following set is used between searches to remember products
		SRCH_LoadSearchParameters(->[PRODUCTS:9])
		
		CREATE EMPTY SET:C140([PRODUCTS:9]; "ToRemember")
		BRING TO FRONT:C326(Current process:C322)
		
		INT_SetDialog
		
	: ($_l_event=On Resize:K2:27)
		Prod_PalletteSetObjects
		
		INT_SetDialog
		
	: ($_l_event=On Outside Call:K2:11)
		$_l_ClickedFunction:=DB_l_ButtonClickedFunction
		Case of 
			: (PROD_bo_Exit)
				CANCEL:C270
				
			: ($_l_ClickedFunction=DB_GetButtonFunction("DragCopy"))
				LISTBOX GET CELL POSITION:C971(CAT_lb_Products; $_l_Column; $_l_Row)
				PROD_CopyHighlighted($_l_Row)
		End case 
		If (Prod_l_CallBackItemID#PROD_l_CallingItem)
			//the outside call is changing the line
			$_l_Retries:=0
			While (Semaphore:C143("SelectorBusy"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			USE SET:C118(PROD_t_UseSetName)
			CREATE SET:C116([PRODUCTS:9]; "CurrentSelection")
			PROD_l_CallBackMProcess:=PROD_l_CallingProcess
			PROD_l_CallingProcess:=0
			Prod_l_CallBackItemID:=PROD_l_CallingItem
			PROD_l_CallingItem:=0
			CLEAR SEMAPHORE:C144("SelectorBusy")
			CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
			If (PROD_S20_ViewCurrency#"")  //currency passed from the order
				CAT_t_CatViewCurrency:=PROD_S20_ViewCurrency
			End if 
			EW_LoadPrefs
			If (PROD_l_DisplayedCatalogue>0)
				$_l_offset:=0
				QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PROD_l_DisplayedCatalogue)
				QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
				QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
				RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
				CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
				INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
				
				//now get those into here
				Catalogue_Prices
			End if 
			
			PROD_palletteSetupArrays
			//The following set is used between searches to remember products
			BRING TO FRONT:C326(Current process:C322)
			
			
		Else 
			BRING TO FRONT:C326(Current process:C322)
			GOTO OBJECT:C206(PROD_T_Query)
			
			
		End if 
		DB_l_ButtonClickedFunction:=0
		
	: ($_l_event=On Timer:K2:25)
		SRCH_r_Timer:=((Current time:C178*1)*60)
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				If (SRCH_t_SearchValue#"")
					If (SRCH_t_SearchValue="*ALL")
						
						ALL RECORDS:C47([PRODUCTS:9])
						//SRCH_StandardSearch (Table(->[COMPANIES]);"")
						SRCH_t_SearchValue:=""
					Else 
						
					End if 
					//``
					//```
					PROD_T_Query:=SRCH_t_SearchValue
					If (PROD_T_Query#"")
						$_l_Row:=CAT_lb_Products
						If ($_l_Row>0)
							Case of 
								: ($_l_Row<Size of array:C274(PROD_ar_ActualQty))
									EDIT ITEM:C870(PROD_ar_ActualQty{$_l_Row+1})
								: ($_l_Row>1)
									EDIT ITEM:C870(PROD_ar_ActualQty{$_l_Row+1})
							End case 
						End if 
						//HERE WE MUST LEAVE THE CELL FIRST!
						//AL_ExitCell (CAT_PowerViewProds)
						ARRAY LONGINT:C221($_al_uncopiedLines; 100)
						ARRAY REAL:C219($_ar_UncopiedPrices; 100)
						ARRAY REAL:C219($_ar_UncopiedQuantities; 100)
						ARRAY TEXT:C222($_at_UncopiedProductCodes; 100)
						$_l_CurrentRow:=0
						For ($_l_Index; 1; Size of array:C274(PROD_ar_ActualSalesPrice))
							//If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=0)
							If ((PROD_ar_ActualSalesPrice{$_l_Index}#0) & (PROD_ar_ActualQty{$_l_Index}#0)) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
								$_l_CurrentRow:=$_l_CurrentRow+1
								If ($_l_CurrentRow>(Size of array:C274($_al_uncopiedLines)))
									INSERT IN ARRAY:C227($_al_uncopiedLines; Size of array:C274($_al_uncopiedLines)+1; 100)
									INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
									INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
									INSERT IN ARRAY:C227($_at_UncopiedProductCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
									
								End if 
								$_al_uncopiedLines{$_l_CurrentRow}:=$_l_Index
								$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
								$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
								$_at_UncopiedProductCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
							Else 
								//If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=0)
								If (PROD_ar_ActualQty{$_l_Index}#0) & (PROD_abo_PVCopied{$_l_Index}=False:C215)
									$_l_CurrentRow:=$_l_CurrentRow+1
									If ($_l_CurrentRow>(Size of array:C274($_al_uncopiedLines)))
										INSERT IN ARRAY:C227($_al_uncopiedLines; Size of array:C274($_al_uncopiedLines)+1; 100)
										INSERT IN ARRAY:C227($_ar_UncopiedPrices; Size of array:C274($_ar_UncopiedPrices)+1; 100)
										INSERT IN ARRAY:C227($_ar_UncopiedQuantities; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
										INSERT IN ARRAY:C227($_at_UncopiedProductCodes; Size of array:C274($_ar_UncopiedQuantities)+1; 100)
										
									End if 
									$_al_uncopiedLines{$_l_CurrentRow}:=$_l_Index
									$_ar_UncopiedQuantities{$_l_CurrentRow}:=PROD_ar_ActualQty{$_l_Index}
									$_ar_UncopiedPrices{$_l_CurrentRow}:=PROD_ar_ActualSalesPrice{$_l_Index}
									$_at_UncopiedProductCodes{$_l_CurrentRow}:=PROD_at_ProductCodes{$_l_Index}
								End if 
							End if 
						End for 
						
						ARRAY LONGINT:C221($_al_uncopiedLines; $_l_CurrentRow)
						ARRAY REAL:C219($_ar_UncopiedPrices; $_l_CurrentRow)
						ARRAY REAL:C219($_ar_UncopiedQuantities; $_l_CurrentRow)
						ARRAY TEXT:C222($_at_UncopiedProductCodes; $_l_CurrentRow)
						//here ask the user if they want to keep them
						If (Size of array:C274($_al_uncopiedLines)>0)
							Gen_Confirm3("You have lines with quantities/prices that are not copied to the order ?"; "Forget"; "Remember"; "Copy")
							Case of 
								: (xNext=1)
									//copy
									//   ALERT("COPY")
									PROD_CopyQuantitied
									CREATE EMPTY SET:C140([PRODUCTS:9]; "ToRemember")
								: (OK=0)
									//remember
									//  ALERT("REMEMBER")
									//CREATE EMPTY SET([PRODUCTS];"ToRemember")<--created in load
									For ($_l_Index; 1; Size of array:C274($_al_uncopiedLines))
										QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=PROD_at_ProductCodes{$_al_uncopiedLines{$_l_Index}})
										ADD TO SET:C119([PRODUCTS:9]; "ToRemember")
									End for 
									
								Else 
									//   ALERT("FORGET")
									CREATE EMPTY SET:C140([PRODUCTS:9]; "ToRemember")
							End case 
							xNext:=0
						End if 
						Prod_Sel2(PROD_T_Query; "@")
						CREATE SET:C116([PRODUCTS:9]; "CurrentSelection")
						UNION:C120("CurrentSelection"; "ToRemember"; "CurrentSelection")
						USE SET:C118("CurrentSelection")
						If (PROD_l_DisplayedCatalogue>0)
							$_l_offset:=0
							QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PROD_l_DisplayedCatalogue)
							QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=PROD_l_DisplayedCatalogue; *)
							QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
							RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])
							CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
							INTERSECTION:C121("CurrentCatalogue"; "CurrentSelection"; "CurrentCatalogue")
							//now get those into here
							USE SET:C118("CurrentCatalogue")
							
							Catalogue_Prices
						End if 
						PROD_palletteSetupArrays
						//Now put back in the data
						
						For ($_l_Index; 1; Size of array:C274($_al_uncopiedLines))
							$_l_ProductCodeRow:=Find in array:C230(PROD_at_ProductCodes; $_at_UncopiedProductCodes{$_l_Index})
							If ($_l_ProductCodeRow>0)  //it should be
								PROD_ar_ActualQty{$_l_ProductCodeRow}:=$_ar_UncopiedQuantities{$_l_Index}
								PROD_ar_ActualSalesPrice{$_l_ProductCodeRow}:=$_ar_UncopiedPrices{$_l_Index}
							End if 
							
						End for 
						//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
					End if 
					
					
					
					//```
					
					
				Else 
					
				End if 
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
		
		//```
End case 
ERR_MethodTrackerReturn("FM [USER].Prod_SelectionPallette"; $_t_oldMethodName)
