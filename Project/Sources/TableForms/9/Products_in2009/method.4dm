If (False:C215)
	//Table Form Method Name: Object Name:      [PRODUCTS].Products_in2009
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY BOOLEAN(STK_lb_SalesStats;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(Prd_al_ModeRelated;0)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PRD_al_ProductTypes;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY LONGINT(PROD_al_EditMode;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_Moderelated;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	//ARRAY TEXT(PRD_at_ModRelated;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ProductTypes;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_BOOLEAN:C305($_bo_Visible; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; PRD_bo_ClassesSet)
	C_LONGINT:C283(<>AutoProc; $_l_ButtonFunction; $_l_ButtonNumber; $_l_ButtonPressed; $_l_EditBottom; $_l_EditLeft; $_l_EditRight; $_l_editTop; $_l_event; $_l_FieldNumber; $_l_GroupBottom)
	C_LONGINT:C283($_l_GroupLeft; $_l_GroupRight; $_l_GroupTop; $_l_MaxWidth; $_l_ModuleRow; $_l_PCBottom; $_l_PCLeft; $_l_PCRight; $_l_PCTop; $_l_TableNumber; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord; PRD_l_EditGroupBrandModel; r6; r7)
	C_PICTURE:C286(PrdModePict; PROD_apic_ModePictProd)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_FocusObject)
	C_TEXT:C284($_t_Mandatory; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; $_t_VariableName; BAR_t_Button; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(IP_t_MessageReplySTR; PAL_BUTTON; PRD_t_Title3a; PRD_t_Title3B; vButtDisPro; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_in2009"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		If (Current form window:C827=Frontmost window:C447)
			//LBI_Scrollonresize (->e_LB_SI)
			LBI_Scrollonresize(->PRD_lb_ProdFurths)
			LBI_Scrollonresize(->PRD_LB_ProdComponents)
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		
		If (Not:C34(PRD_bo_ClassesSet))
			ARRAY TEXT:C222(PRD_at_ProductTypes; 4)
			ARRAY LONGINT:C221(PRD_al_ProductTypes; 4)
			PRD_at_ProductTypes{1}:="Standard Product"
			PRD_at_ProductTypes{2}:="Iterative Time based Product"
			PRD_at_ProductTypes{3}:="Constructed Product"
			PRD_at_ProductTypes{4}:="Component only Product"
			//Class 7 is purchase only no sales.....
			
			PRD_al_ProductTypes{1}:=0
			PRD_al_ProductTypes{2}:=1
			PRD_al_ProductTypes{3}:=2
			PRD_al_ProductTypes{4}:=3
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
				APPEND TO ARRAY:C911(PRD_at_ProductTypes; "Subscription Product Linked to Iterative time based product(s)")
				APPEND TO ARRAY:C911(PRD_at_ProductTypes; "Subscription Product For Stand Alone Product")
				APPEND TO ARRAY:C911(PRD_al_ProductTypes; 4)
				APPEND TO ARRAY:C911(PRD_al_ProductTypes; 5)
				
			End if 
			PRD_bo_ClassesSet:=True:C214
		End if 
		DB_SetnewToolBar
		ARRAY TEXT:C222(PRD_at_ModeSupplier; 0)
		ARRAY LONGINT:C221(PROD_al_EditMode; 0)
		LBi_SetListBoxOptions(->PRD_at_ModeSupplier; ->PROD_al_EditMode; ->PROD_apic_ModePictProd)
		DB_l_ButtonClickedFunction:=0
		ARRAY TEXT:C222(Prod_at_SupplierOption; 3)
		Prod_at_SupplierOption{1}:="Auto add suppliers to list"
		Prod_at_SupplierOption{2}:="Ask to add suppliers to list"
		Prod_at_SupplierOption{3}:="Do not add suppliers to list"
		ARRAY TEXT:C222(PRD_at_ProductsTab; 0)
		ARRAY LONGINT:C221(PRD_al_ProductsTabPage; 0)
		OBJECT SET FONT:C164(PRD_at_ProductsTab; "arial")
		OBJECT SET FONT STYLE:C166(PRD_at_ProductsTab; 1)
		OBJECT SET FONT SIZE:C165(PRD_at_ProductsTab; 12)
		APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Pricing")
		APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 1)
		APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Accounting")
		APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 2)
		APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Enclosures")
		APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 3)
		APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Components")
		APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 4)
		PRD_at_ProductsTab:=1
		ARRAY TEXT:C222(PRD_at_ModRelated; 0)
		ARRAY LONGINT:C221(Prd_al_ModeRelated; 0)
		//ORD_at_ModeOrders{2}:="Editable"
		LBi_SetListBoxOptions(->PRD_at_ModRelated; ->Prd_al_ModeRelated; ->PrdModePict; True:C214)
		
		WIN_t_CurrentInputForm:="Products_IN2009"
		INT_SetInput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
		
		PRD_inonloadrecord
		PRD_inonloadrelated("B")
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_MaxWidth:=Screen width:C187-$_l_WindowLeft
		If ($_l_MaxWidth>700)
			
			$_l_MaxWidth:=700
		End if 
		WS_AutoscreenSize(1; 625; $_l_MaxWidth; Table name:C256(->[PRODUCTS:9])+"_"+"Products_IN2009")
		If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
			
			$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=3)
						In_ButtChkDis(->vButtDisPro; "Product"; "Component")
					: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=2)
						In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
					: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=1)
						In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
				End case 
			End if 
		Else 
			
			
			In_ButtChkDis(->vButtDisPro)
			
		End if 
		
		DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
		If (Records in selection:C76([PRODUCTS:9])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Load Record:K2:38)
		PRD_inonloadrelated("B")
		
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4) | ($_l_event=On Plug in Area:K2:16) | ($_l_event=On Menu Selected:K2:14)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9])) & (Not:C34($_l_event=On Clicked:K2:4) & ($_l_event#On Menu Selected:K2:14))
				
				Products_InLPD($_l_FieldNumber)
				
			Else 
				Case of 
					: (BAR_t_Button#"")
						$_l_ButtonNumber:=Num:C11(BAR_t_Button)
						If ($_l_ButtonNumber>1)
							ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
							$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
							DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
							DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
						End if 
						BAR_t_Button:=""
					: (PAL_BUTTON#"")
						$_t_PalletButtonName:=PAL_BUTTON
						PAL_BUTTON:=""
						DB_HandleInputFormButtons($_t_PalletButtonName)
						PAL_bo_ButtonSubFunction:=False:C215
					: ($_t_VariableName="r7")
						[PRODUCTS:9]Serial_Numbered:17:=(r7=1)
						$_l_FieldNumber:=Field:C253(->[PRODUCTS:9]Serial_Numbered:17)
						Products_InLPD($_l_FieldNumber)
					: ($_t_VariableName="r6")
						
						$_bo_Visible:=(r6=1)
						OBJECT SET VISIBLE:C603(*; "oStockAccountLabel"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oStockAccountField"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oMinStockLabel"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oMinStockField"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oMaxStockField"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oMaxStockLabel"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(STK_lb_SalesStats; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oStockTurnsGroupBox"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oSalesCalcType"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oStockTurnstypeLabel"; $_bo_Visible)
						OBJECT SET VISIBLE:C603(*; "oStockDetailLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oSalesCalcDetail"; False:C215)
						OBJECT SET VISIBLE:C603(*; "OreportPeriodLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oSalesCalcPeriod"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oFilterDate"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oFilterDateEnd"; False:C215)
						
						
						[PRODUCTS:9]Maintain_Stock:14:=$_bo_Visible
						$_l_FieldNumber:=Field:C253(->[PRODUCTS:9]Maintain_Stock:14)
						Products_InLPD($_l_FieldNumber)
						
						
					: ($_t_VariableName="PRD_l_EditGroupBrandModel")
						$_bo_Visible:=(PRD_l_EditGroupBrandModel=0)
						Case of 
							: (DB_GetProductGroupBrand)
								PRD_t_Title3a:="Group"
								PRD_t_Title3B:="/Brand/"
								OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oGroupField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
							: (DB_Get_ProductBrandPref)
								PRD_t_Title3a:="Group"
								If (Not:C34($_bo_Visible))
									PRD_t_Title3B:="/Brand/"
								Else 
									PRD_t_Title3B:="/"
								End if 
								OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
								OBJECT SET VISIBLE:C603(*; "oGroupField"; True:C214)
								OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; True:C214)
								OBJECT SET VISIBLE:C603(*; "oModelLabel"; Not:C34($_bo_Visible))
								
								//move product code to not cover group group
								If (($_bo_Visible))
									OBJECT GET COORDINATES:C663(*; "oGroupField"; $_l_GroupLeft; $_l_GroupTop; $_l_GroupRight; $_l_GroupBottom)
									OBJECT GET COORDINATES:C663(*; "oCBEditModel"; $_l_EditLeft; $_l_editTop; $_l_EditRight; $_l_EditBottom)
									OBJECT GET COORDINATES:C663(*; "oProductCode"; $_l_PCLeft; $_l_PCTop; $_l_PCRight; $_l_PCBottom)
									OBJECT SET COORDINATES:C1248(*; "oProductCode"; ($_l_GroupRight+3); $_l_PCTop; $_l_EditLeft-3; $_l_PCBottom)
									
								End if 
						End case 
						OBJECT SET ENTERABLE:C238([PRODUCTS:9]Short_Code:19; Not:C34($_bo_Visible))
						//SET VISIBLE(*;"oCBEditModel";$_bo_Visible)
						//SET VISIBLE(*;"oProductCodeLabel";$_bo_Visible)
						//not sure if the following lines were added in to this version of -i have commented them out(not in b73?)
						//SET VISIBLE(*;"oGroupField";Not($_bo_Visible))
						//SET VISIBLE(*;"oBrandField";Not($_bo_Visible))
						//SET VISIBLE(*;"oModelField";Not($_bo_Visible))
						//SET VISIBLE(*;"oGroupBrandLabel";Not($_bo_Visible))
						//SET VISIBLE(*;"oModelLabel";Not($_bo_Visible))
						If (Not:C34($_bo_Visible))
							GOTO OBJECT:C206([PRODUCTS:9]Group_Code:3)
						Else 
							GOTO OBJECT:C206([PRODUCTS:9]Product_Name:2)
							
						End if 
						
					: ($_l_event=On Menu Selected:K2:14)
						
						DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
						If (Records in selection:C76([PRODUCTS:9])<=1)
							OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
							DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
							DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						End if 
						OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
						If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
							
							$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
							If (Size of array:C274($_ptr_ArrayReferences->)>=10)
								$_t_SubItemName:=$_ptr_ArrayReferences->{10}
								Case of 
									: (PRD_at_ProductsTab=3)
										In_ButtChkDis(->vButtDisPro; "Product"; "Component")
									: (PRD_at_ProductsTab=2)
										In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
									: (PRD_at_ProductsTab=1)
										In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
								End case 
							End if 
						Else 
							In_ButtChkDis(->vButtDisPro)
						End if 
				End case 
				
		End case 
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
		If (Records in selection:C76([PRODUCTS:9])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
			
			$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (PRD_at_ProductsTab=3)
						In_ButtChkDis(->vButtDisPro; "Product"; "Component")
					: (PRD_at_ProductsTab=2)
						In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
					: (PRD_at_ProductsTab=1)
						In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
				End case 
			End if 
		Else 
			
			
			In_ButtChkDis(->vButtDisPro)
			
		End if 
		
	: ($_l_event=On Getting Focus:K2:7)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				Case of 
					: (FORM Get current page:C276=1)
						Case of 
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //Suppliers
								//Not necccccessarily
								$_l_ButtonPressed:=DB_l_ButtonClickedFunction
								inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Supplier")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
								$_l_ButtonPressed:=DB_l_ButtonClickedFunction
								inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "FurtherField")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
								Gen_Alert("You may not create a sales order directly from a product")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
								$_l_ButtonPressed:=DB_l_ButtonClickedFunction
								inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Diary")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
								$_l_ButtonPressed:=DB_l_ButtonClickedFunction
								inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Document")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
								Gen_Alert("You may not create a purchase order directly from a product")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))
								Gen_Alert("You may not create a purchase Invoice directly from a product")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161]))
								Gen_Alert("You may not create a sales invoice directly from a product")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
								$_l_ButtonPressed:=DB_l_ButtonClickedFunction
								inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "PriceTable")
							: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
								Gen_Alert("You may not enter a stock movement from this product")
								
						End case 
					: (FORM Get current page:C276=3)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "FurthAnal")
					: (FORM Get current page:C276=4)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Component")
					: (FORM Get current page:C276=6)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "SUBSComponent")
						
				End case 
				
			: (DB_l_ButtonClickedFunction=8888)
				Gen_Confirm3("Do you want to recalculate the Sales and Cost Prices, and the Weight of "+[PRODUCTS:9]Product_Code:1+" from its Components?"; "All"; "None"; "Weight only")
				If (OK=1)
					Prod_CompRecalc
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				Case of 
					: (DB_GetProductGroupBrand)
						$_t_Mandatory:="1 3 4 5"
					: (DB_Get_ProductBrandPref)
						$_t_Mandatory:="1 4 5"
						
					Else 
						$_t_Mandatory:="1 5"
				End case 
				$_l_ButtonFunction:=DB_l_ButtonClickedFunction
				In_ButtCall("Products_InLPA"; ""; "Products_InDel"; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; "Products"; $_t_Mandatory; "Products_InLPß"; "Master"; "Prod_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisPro; ->PRD_aPtr_RelatedConfiguration)
				If ($_l_ButtonFunction=20)
					DB_SetInputFormMenu(Table:C252(->[PRODUCTS:9]); "Products_in2009")
					If (Records in selection:C76([PRODUCTS:9])<=1)
						OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
				End if 
				
			Else 
				If (<>AutoProc=8888)
					<>AutoProc:=0
					Gen_Confirm3("Do you want to recalculate the Sales and Cost Prices, and the Weight of "+[PRODUCTS:9]Product_Code:1+" from its Components?"; "All"; "None"; "Weight only")
					If (OK=1)
						Prod_CompRecalc
					End if 
				End if 
				
				DB_l_ButtonClickedFunction:=0
		End case 
		
		
		
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].Products_in2009"; $_t_oldMethodName)
