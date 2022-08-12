//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 19:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_SalesStats;0)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PROD_al_EditMode;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	C_BOOLEAN:C305($_bo_Visible; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonPressed; $_l_Event; $_l_FieldNumber; $_l_TableNumber; DB_l_ButtonClickedFunction; iCancel; iOK; PRD_l_EditGroupBrandModel; r6; r7)
	C_PICTURE:C286(PROD_apic_ModePictProd)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; $_t_VariableName; $Mand; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; PAL_BUTTON; vButtDisPro; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLP")
//Prod in
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(PRD_at_ModeSupplier; 0)
		ARRAY LONGINT:C221(PROD_al_EditMode; 0)
		LBi_SetListBoxOptions(->PRD_at_ModeSupplier; ->PROD_al_EditMode; ->PROD_apic_ModePictProd)
		
		
		Products_InLPB
		// vBefore2P:=True
		//  Gen_PostKey (1;92;256)
		//: (vBefore2P)
		//   vBefore2P:=False
		Products_InLPß("B")
		
		
		If ([PRODUCTS:9]Group_Code:3="")
			GOTO OBJECT:C206([PRODUCTS:9]Group_Code:3)
		End if 
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
	: ($_l_Event=On Activate:K2:9)
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
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				Case of 
					: (FORM Get current page:C276=1)
						$_l_ButtonPressed:=DB_l_ButtonClickedFunction
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Supplier")
						
					: (FORM Get current page:C276=2)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "FurthAnal")
					: (FORM Get current page:C276=3)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Component")
						
				End case 
				
				
			: (DB_l_ButtonClickedFunction=8888)
				Gen_Confirm3("Do you want to recalculate the Sales and Cost Prices, and the Weight of "+[PRODUCTS:9]Product_Code:1+" from its Components?"; "All"; "None"; "Weight only")
				If (OK=1)
					Prod_CompRecalc
				End if 
				
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				Case of 
					: (DB_GetProductGroupBrand)
						$Mand:="1 3 4 5"
					: (DB_Get_ProductBrandPref)
						$Mand:="1 4 5"
					Else 
						$Mand:="1 5"
				End case 
				In_ButtCall("Products_InLPA"; ""; "Products_InDel"; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; "Products"; $Mand; "Products_InLPß"; "Master"; "Prod_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisPro; ->PRD_aPtr_RelatedConfiguration)
				
		End case 
		
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				Products_InLPD($_l_FieldNumber)
				
			Else 
				Case of 
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
								OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oGroupField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
							: (DB_Get_ProductBrandPref)
								OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
								OBJECT SET VISIBLE:C603(*; "oGroupField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
								OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
								//have to move the product code to not hide the group.
						End case 
						OBJECT SET ENTERABLE:C238([PRODUCTS:9]Short_Code:19; Not:C34($_bo_Visible))
						//SET VISIBLE(*;"oCBEditModel";$_bo_Visible)
						//SET VISIBLE(*;"oModelLabel";Not($_bo_Visible))
						If (Not:C34($_bo_Visible))
							GOTO OBJECT:C206([PRODUCTS:9]Group_Code:3)
						Else 
							GOTO OBJECT:C206([PRODUCTS:9]Product_Name:2)
							
						End if 
						
					: ($_l_Event=On Clicked:K2:4)
						If (PAL_BUTTON#"")
							$_t_PalletButtonName:=PAL_BUTTON
							PAL_BUTTON:=""
							DB_HandleInputFormButtons($_t_PalletButtonName)
							PAL_bo_ButtonSubFunction:=False:C215
						End if 
				End case 
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Products_InLP"; $_t_oldMethodName)
