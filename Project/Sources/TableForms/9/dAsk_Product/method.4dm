If (False:C215)
	//Table Form Method Name: [PRODUCTS]dAsk_Product
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_lb_Products;0)
	ARRAY LONGINT:C221($_al_ColumnWidths; 0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(PROD_al_ViewableCatalogues;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(PRD_at_Urls;0)
	//ARRAY TEXT(PROD_at_DisplayDetail;0)
	//ARRAY TEXT(PROD_at_ViewableCatalogues;0)
	C_BOOLEAN:C305($_bo_NoDefault; DB_bo_NoLoad; PRD_bo_PictureColumnAdded; PROB_bo_ShowPictures; PROD_bo_ExpandWindow; PROD_bo_HoldWindow)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CharacterPosition; $_l_CurrentSelectedRow; $_l_event; $_l_FormWidth; $_l_offset; $_l_Size; $i; bd1; CAT_l_DefaultCatalogue; PROD_l_BUT1)
	C_LONGINT:C283(PROD_l_But2; PROD_l_BUT3; PROD_l_BUT4; PROD_l_BUT5; PROD_l_BUT6; PROD_l_BUT7; PROD_l_BUT8; PROD_l_BUT9; PROD_l_DisplayedCatalogue; XNew)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_ColumnWidthsSTR; $_t_DisplayName; $_t_oldMethodName; $_t_Width; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PROD_t_COL1; PROD_t_COL2; PROD_t_COL3)
	C_TEXT:C284(PROD_t_COL4; PROD_t_COL5; PROD_t_COL6; PROD_t_COL7; PROD_t_COL8; PROD_t_COL9; PROD_t_HED1; PROD_t_HED2; PROD_t_HED3; PROD_t_HED4; PROD_t_HED5)
	C_TEXT:C284(PROD_t_HED6; PROD_t_HED7; PROD_t_HED8; PROD_t_HED9; PROD_t_DisplayedCatalogue)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].dAsk_Product"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(PRD_at_Urls; 0)
		OBJECT SET VISIBLE:C603(*; "oWebLabel"; False:C215)
		OBJECT SET VISIBLE:C603(PRD_at_Urls; False:C215)
		
		
		
		OBJECT SET VISIBLE:C603(PROB_bo_ShowPictures; False:C215)
		OBJECT SET VISIBLE:C603(PROD_bo_ExpandWindow; False:C215)
		
		ARRAY TEXT:C222(PROD_at_ViewableCatalogues; 0)
		ARRAY LONGINT:C221(PROD_al_ViewableCatalogues; 0)
		PROD_bo_HoldWindow:=False:C215
		PRD_bo_PictureColumnAdded:=False:C215
		
		CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
		If (Size of array:C274(CAT_at_CatalogueNames)=0)
			OBJECT SET VISIBLE:C603(PROD_at_ViewableCatalogues; False:C215)
		End if 
		CREATE SET:C116([PRODUCTS:9]; "DisplayedSelection")
		
		If (Size of array:C274(CAT_at_CatalogueNames)>0)
			//`get default
			
			COPY ARRAY:C226(CAT_al_CatalogueID; PROD_al_ViewableCatalogues)
			COPY ARRAY:C226(CAT_at_CatalogueNames; PROD_at_ViewableCatalogues)
			INSERT IN ARRAY:C227(PROD_al_ViewableCatalogues; Size of array:C274(PROD_al_ViewableCatalogues)+1; 2)
			INSERT IN ARRAY:C227(PROD_at_ViewableCatalogues; Size of array:C274(PROD_at_ViewableCatalogues)+1; 2)
			PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)}:="All Catalogues"
			PROD_at_ViewableCatalogues{Size of array:C274(PROD_at_ViewableCatalogues)-1}:="-"
			$_bo_NoDefault:=True:C214
			If (CAT_l_DefaultCatalogue>0)
				$_l_CurrentSelectedRow:=Find in array:C230(CAT_al_CatalogueID; CAT_l_DefaultCatalogue)
				If ($_l_CurrentSelectedRow>0)
					PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_CurrentSelectedRow}
					PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{$_l_CurrentSelectedRow}
					$_bo_NoDefault:=True:C214
				End if 
			End if 
			If ($_bo_NoDefault)
				$_l_CurrentSelectedRow:=Find in array:C230(CAT_at_CatalogueNames; "All Products")
				If ($_l_CurrentSelectedRow<0)
					PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{1}
					PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{1}
				Else 
					PROD_t_DisplayedCatalogue:=PROD_at_ViewableCatalogues{$_l_CurrentSelectedRow}
					PROD_l_DisplayedCatalogue:=PROD_al_ViewableCatalogues{$_l_CurrentSelectedRow}
					
				End if 
				
			End if 
		Else 
			OBJECT SET VISIBLE:C603(PROD_at_ViewableCatalogues; False:C215)
			
		End if 
		If (PROD_l_DisplayedCatalogue#0)
			//Get records in catalogue
			
			$_l_offset:=0
			QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PROD_l_DisplayedCatalogue)
			$_l_CurrentSelectedRow:=Find in array:C230(CAT_al_CatalogueID; PROD_l_DisplayedCatalogue)
			If ($_l_CurrentSelectedRow>0)  // it should be!!!
				CAT_LoadProducts(PROD_l_DisplayedCatalogue; <>SYS_t_BaseCurrency; False:C215; CAT_al_CatalogueClass{$_l_CurrentSelectedRow}; CAT_at_CatalogueMacro{$_l_CurrentSelectedRow})
				CREATE SET:C116([PRODUCTS:9]; "CurrentCatalogue")
				INTERSECTION:C121("CurrentCatalogue"; "DisplayedSelection"; "CurrentCatalogue")
				//now get those into here
				USE SET:C118("CurrentCatalogue")
				Catalogue_Prices
				
			End if 
		End if 
		ARRAY TEXT:C222(PROD_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[PRODUCTS:9]); ->PROD_at_DisplayDetail)
		$_t_DisplayName:=DB_LoadDisplayPref(Table:C252(->[PRODUCTS:9]); "dAsk_Product")
		$_l_CurrentSelectedRow:=PROD_at_DisplayDetail
		PROD_at_DisplayDetail:=Find in array:C230(PROD_at_DisplayDetail; $_t_DisplayName)
		
		If (PROD_at_DisplayDetail<0)
			PROD_at_DisplayDetail:=$_l_CurrentSelectedRow
		End if 
		$_t_ColumnWidthsSTR:=DB_LoadDisplayPref(Table:C252(->[PRODUCTS:9]); "dAsk_Product"; ""; False:C215; "")
		If ($_t_ColumnWidthsSTR="")
			ARRAY LONGINT:C221($_al_ColumnWidths; 4)
			If ($_al_ColumnWidths{1}=0)
				$_al_ColumnWidths{1}:=131
			End if 
			If ($_al_ColumnWidths{2}=0)
				$_al_ColumnWidths{2}:=57
			End if 
			If ($_al_ColumnWidths{3}=0)
				$_al_ColumnWidths{3}:=191
			End if 
			If ($_al_ColumnWidths{4}=0)
				$_al_ColumnWidths{4}:=80
			End if 
		Else 
			ARRAY LONGINT:C221($_al_ColumnWidths; 0)
			Repeat 
				$_l_CharacterPosition:=Position:C15(","; $_t_ColumnWidthsSTR)
				If ($_l_CharacterPosition>0)
					$_t_Width:=Substring:C12($_t_ColumnWidthsSTR; 1; $_l_CharacterPosition-1)
					$_t_ColumnWidthsSTR:=Substring:C12($_t_ColumnWidthsSTR; $_l_CharacterPosition+1; Length:C16($_t_ColumnWidthsSTR))
				Else 
					$_t_Width:=$_t_ColumnWidthsSTR
					$_t_ColumnWidthsSTR:=""
				End if 
				
				APPEND TO ARRAY:C911($_al_ColumnWidths; Num:C11($_t_Width))
				
				
			Until ($_t_ColumnWidthsSTR="")
		End if 
		ARRAY LONGINT:C221($_al_ColumnWidths; 4)
		
		OpenHelp(Table:C252(->[PRODUCTS:9]); "dAsk_Product")
		Products_Arr(PROD_at_DisplayDetail)
		
		LB_SetupListbox(->PROD_lb_Products; "PROD_t"; "PROD_L"; 1; ->GEN_at_Identity; ->GEN_at_Name; ->GEN_at_RecordCode; ->GEN_ar_Value)
		LB_SetColumnHeaders(->PROD_lb_Products; "PROD_L"; 1; "Code"; "Name"; "Short Code"; PROD_at_DisplayDetail{PROD_at_DisplayDetail})
		
		LB_SetColumnWidths(->PROD_lb_Products; "PROD_t"; 1; $_al_ColumnWidths{1}; $_al_ColumnWidths{2}; $_al_ColumnWidths{3}; $_al_ColumnWidths{4})
		$_l_FormWidth:=20+$_al_ColumnWidths{1}+$_al_ColumnWidths{2}+$_al_ColumnWidths{3}+$_al_ColumnWidths{4}
		LB_SetEnterable(->PROD_lb_Products; False:C215; 0)
		LB_SetScroll(->PROD_lb_Products; -3; -2)
		LB_StyleSettings(->PROD_lb_Products; "Black"; 9; "PROD_t"; ->[ACCOUNTS:32])
		LB_SetFormat(->PROD_lb_Products; 2; ""; 4; 4; 2)
		
		bd1:=Size of array:C274(GEN_at_Name)
		If ((DB_t_CurrentFormUsage2="NC") | ((DB_GetModuleSettingByNUM(Module_Products))=3))
			OBJECT SET VISIBLE:C603(XNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddItem"; False:C215)
			//_O_DISABLE BUTTON(xNew)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_Size:=22+(bd1*14)
		If ($_l_Size<160)
			$_l_Size:=160
		End if 
		WS_AutoscreenSize(2; $_l_Size; $_l_FormWidth)
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(Current process)
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PRODUCTS:9]); "dAsk_Product")
		In_ButtdCall(->[PRODUCTS:9])
End case 
ERR_MethodTrackerReturn("FM:dAsk Product"; $_t_oldMethodName)
