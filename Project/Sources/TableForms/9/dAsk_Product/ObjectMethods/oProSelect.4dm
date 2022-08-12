If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.oProSelect
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
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(PROD_lb_Products;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(PRD_at_UrlLinks;0)
	//ARRAY TEXT(PRD_at_Urls;0)
	//ARRAY TEXT(PRD_at_WebLinks;0)
	//ARRAY TEXT(PROD_at_DisplayDetail;0)
	C_BOOLEAN:C305(PRD_bo_EditRecord; PRD_bo_ShowAddpicture; PRD_bo_SHowCancelButton; PRD_bo_ShowPicture; PRD_bo_ShowPrices; PRD_bo_ShowSelectButton; PROB_bo_ShowPictures; PROD_bo_HoldWindow)
	C_LONGINT:C283($_l_Column; $_l_ColumnWIdth; $_l_Count; $_l_event; $_l_FieldNumber; $_l_Index; $_l_Parameter; $_l_Row; $_l_TableNumber; PRD_l_CloseButton; PRD_l_SelectButton)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Column)
	C_TEXT:C284($_t_ColumnWIdths; $_t_DisplayName; $_t_oldMethodName; $_t_productCode; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker(" OBJ: [PRODUCTS]dAsk Product.oProSelect"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Header Click:K2:40)
		LISTBOX SELECT ROW:C912(PROD_lb_Products; 1; 0)
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		//ALERT("Stage 1")
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		//ALERT("Stage 2")
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			//ALERT("Stage 3")
			If (Not:C34(PROD_bo_HoldWindow))
				//ALERT("Stage 4")
				MESSAGES OFF:C175
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=GEN_at_Identity{$_l_Row})
				MESSAGES ON:C181
				//ALERT("Stage 5")
				ACCEPT:C269
			Else 
				//ALERT("Stage 3-b")
				LISTBOX GET CELL POSITION:C971(PROD_lb_Products; $_l_Column; $_l_Row)
				//ALERT("Stage 4-b")
				If ($_l_Column=1)
					//ALERT("Stage 5-b")
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "$CURRENTSELECTION")
					//ALERT("Stage 6-b")
					$_t_productCode:=GEN_at_Identity{$_l_Row}
					ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
					//ALERT("Stage 7-b")
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
					//ALERT("Stage 8-b")
					ARRAY TEXT:C222(PRD_at_Urls; 0)
					ARRAY TEXT:C222(CO_at_SearchOptions; 0)
					ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
					CO_LoadWebsearchPrefs(True:C214; Table:C252(->[PRODUCTS:9]))
					//ALERT("Stage 9-b")
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
						QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1)
					Else 
						REDUCE SELECTION:C351([X_URL_LInks:101]; 0)
					End if 
					//ALERT("Stage 10-b")
					SELECTION TO ARRAY:C260([X_URL_LInks:101]URL:3; PRD_at_UrlLinks)
					For ($_l_Index; 1; Size of array:C274(CO_at_SearchOptions))
						APPEND TO ARRAY:C911(PRD_at_Urls; CO_at_SearchOptions{$_l_Index})
					End for 
					//ALERT("Stage 11-b")
					If (Size of array:C274(PRD_at_UrlLinks)>0)
						APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
						For ($_l_Index; 1; Size of array:C274(PRD_at_UrlLinks))
							APPEND TO ARRAY:C911(PRD_at_Urls; PRD_at_UrlLinks{$_l_Index})
						End for 
					End if 
					//ALERT("Stage 12-b")
					WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
					PRD_bo_ShowPrices:=True:C214
					PRD_bo_ShowPicture:=PROB_bo_ShowPictures
					PRD_bo_ShowAddpicture:=False:C215
					PRD_bo_ShowSelectButton:=True:C214
					PRD_bo_SHowCancelButton:=True:C214
					PRD_bo_EditRecord:=False:C215
					PRD_l_SelectButton:=0
					PRD_l_CloseButton:=0
					DIALOG:C40([PRODUCTS:9]; "Products_SimplifiedEntry")
					PRD_bo_ShowPrices:=False:C215
					PRD_bo_ShowPicture:=False:C215
					PRD_bo_ShowAddpicture:=False:C215
					PRD_bo_ShowSelectButton:=False:C215
					PRD_bo_SHowCancelButton:=False:C215
					If (PRD_l_SelectButton=1)
						ACCEPT:C269
					End if 
					PRD_l_SelectButton:=0
				Else 
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "$CURRENTSELECTION")
					$_t_productCode:=GEN_at_Identity{$_l_Row}
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
					ARRAY TEXT:C222(PRD_at_Urls; 0)
					ARRAY TEXT:C222(CO_at_SearchOptions; 0)
					ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
					CO_LoadWebsearchPrefs(True:C214; Table:C252(->[PRODUCTS:9]))
					If ([PRODUCTS:9]Product_Code:1#"")
						QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
						QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1)
					Else 
						REDUCE SELECTION:C351([X_URL_LInks:101]; 0)
					End if 
					SELECTION TO ARRAY:C260([X_URL_LInks:101]URL:3; PRD_at_UrlLinks)
					For ($_l_Index; 1; Size of array:C274(CO_at_SearchOptions))
						APPEND TO ARRAY:C911(PRD_at_Urls; CO_at_SearchOptions{$_l_Index})
					End for 
					If (Size of array:C274(PRD_at_UrlLinks)>0)
						APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
						For ($_l_Index; 1; Size of array:C274(PRD_at_UrlLinks))
							APPEND TO ARRAY:C911(PRD_at_Urls; PRD_at_UrlLinks{$_l_Index})
						End for 
					End if 
					
					
				End if 
				//ALERT("Stage 13-b")
			End if 
		Else 
			LISTBOX SELECT ROW:C912(PROD_lb_Products; 1; 0)
		End if 
	: ($_l_event=On Column Resize:K2:31)
		//ALERT("Column Resize")
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		$_l_Count:=Count parameters:C259-2
		$_t_ColumnWIdths:=""
		LISTBOX GET ARRAYS:C832(PROD_lb_Products; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_Parameter:=2
		For ($_l_Index; 1; Size of array:C274($_aptr_ColumnVariables))
			$_ptr_Column:=$_aptr_ColumnVariables{$_l_Index}
			$_l_Parameter:=$_l_Parameter+1
			$_l_ColumnWIdth:=LISTBOX Get column width:C834($_ptr_Column->)
			If ($_t_ColumnWIdths#"")
				$_t_ColumnWIdths:=$_t_ColumnWIdths+","+String:C10($_l_ColumnWIdth)
			Else 
				$_t_ColumnWIdths:=String:C10($_l_ColumnWIdth)
			End if 
		End for 
		$_t_DisplayName:=DB_LoadDisplayPref(Table:C252(->[PRODUCTS:9]); "dAsk_Product"; PROD_at_DisplayDetail{PROD_at_DisplayDetail}; True:C214; $_t_ColumnWIdths)
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ:[PRODUCTS]dAsk Product.oProSelect"; $_t_oldMethodName)
