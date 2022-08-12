//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_simpleentryLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     03/08/2010 17:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_abo_PriceTables;0)
	//ARRAY LONGINT(SD2_al_Levels;0)
	//ARRAY POINTER(PRD_aptr_SISetup;0)
	C_BOOLEAN:C305($_bo_DisplayButtons; $_bo_NewLevel; $_bo_Visible; DB_bo_NoLoad; PRD_bo_EditRecord; PRD_bo_ShowAddpicture; PRD_bo_SHowCancelButton; PRD_bo_ShowPicture; PRD_bo_ShowPrices; PRD_bo_ShowSelectButton)
	C_LONGINT:C283($_l_Event; $_l_FieldNumber; $_l_Height; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop)
	C_LONGINT:C283($_l_ObjectTop2; $_l_ObjectTop3; $_l_ReuseLevel; $_l_Size; $_l_TableNumber; PRD_l_CloseButton; PRD_l_SelectButton; vALLevels)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285(PROD_R_SupplierPrice)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; $_t_VariableName; PROD_T_CompanyName; PROD_t_SupplierCode; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_simpleentryLP")

$_l_Event:=Form event code:C388
//This method is an additional Form method for the Products simplified entry form..
//the form ALSO uses Products_In LP$_l_event:=Form event

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY POINTER:C280(PRD_aptr_SISetup; 0)
		
		ARRAY LONGINT:C221(SD2_al_Levels; 1)
		$_l_ReuseLevel:=0
		If (Size of array:C274(PRD_aptr_SISetup)=0) & (vALLevels>0)
			If (SD2_al_Levels{1}=0)
				$_bo_NewLevel:=True:C214
				
			Else 
				$_bo_NewLevel:=False:C215
				$_l_ReuseLevel:=SD2_al_Levels{1}
			End if 
		Else 
			$_bo_NewLevel:=False:C215
		End if 
		Products_InLP
		If (Record number:C243([PRODUCTS:9])=-3)  //We are adding a record
			$_bo_Visible:=False:C215
		Else 
			OBJECT SET ENTERABLE:C238([PRODUCTS:9]Product_Code:1; False:C215)
			OBJECT SET ENTERABLE:C238([PRODUCTS:9]Short_Code:19; False:C215)
			
			$_bo_Visible:=True:C214
		End if 
		
		Case of 
			: (DB_GetProductGroupBrand)
				OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oCBEditModel"; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oGroupField"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oModelLabel"; Not:C34($_bo_Visible))
			: (DB_Get_ProductBrandPref)
				OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oCBEditModel"; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; $_bo_Visible)
				OBJECT SET VISIBLE:C603(*; "oGroupField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oBrandField"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oModelField"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; Not:C34($_bo_Visible))
				OBJECT SET VISIBLE:C603(*; "oModelLabel"; Not:C34($_bo_Visible))
				//move the product code to show the group code
				
			Else 
				OBJECT SET VISIBLE:C603([PRODUCTS:9]Product_Code:1; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCBEditModel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oGroupField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oBrandField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oModelField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oGroupBrandLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oModelLabel"; True:C214)
		End case 
		
		
		
		$_l_Size:=0
		If (PRD_bo_ShowPrices)
			$_l_Size:=$_l_Size+1
			ARRAY POINTER:C280(PRD_aptr_SISetup; 0)
			
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			If ([PRODUCTS:9]Group_Code:3#"")
				QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
				If ([PRODUCTS:9]Brand_Code:4#"")
					QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
				Else 
					QUERY:C277([PRICE_TABLE:28])
				End if 
			Else 
				If ([PRODUCTS:9]Brand_Code:4#"")
					QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
				Else 
					QUERY:C277([PRICE_TABLE:28])
				End if 
			End if 
			
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				$_l_Size:=$_l_Size-1
			End if 
			If (Size of array:C274(PRD_aptr_SISetup)=0)
				
				LBi_ArrDefFill(->PRD_aptr_SISetup; ->PRD_abo_PriceTables; ->[PRICE_TABLE:28]Table_Code:12; ->[PRODUCTS:9]Product_Code:1; "211111126"; "SI"; 7; "Price table"; "Prices"; ""; $_bo_NewLevel; $_l_ReuseLevel)
				
			Else 
				
				
				LBi_Prefs11(->PRD_aptr_SISetup)
				//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
				//   : ($c1="P")
				//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
				
				
			End if 
			LBi_LoadSetup(->PRD_aptr_SISetup; "B")
			
			
		End if 
		If (PRD_bo_ShowPicture)
		End if 
		$_bo_DisplayButtons:=False:C215
		If (PRD_bo_ShowSelectButton)
			$_l_Size:=$_l_Size+2
			$_bo_DisplayButtons:=True:C214
			OBJECT SET VISIBLE:C603(PRD_l_SelectButton; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(PRD_l_SelectButton; False:C215)
		End if 
		If (PRD_bo_SHowCancelButton)
			If ($_bo_DisplayButtons=False:C215)
				$_l_Size:=$_l_Size+2
			End if 
			OBJECT SET VISIBLE:C603(PRD_l_CloseButton; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(PRD_l_CloseButton; False:C215)
		End if 
		If (PRD_bo_EditRecord)
		End if 
		FORM GOTO PAGE:C247(4)  //Note that the user can only SEE Page_4
		Case of 
			: ($_l_Size=1)  //  price table no buttons
				WS_AutoscreenSize(2; 342; 584; Table name:C256(->[PRODUCTS:9])+"_"+"Products_SimplifiedEntry")
			: ($_l_Size=2)  //buttons no price table
				OBJECT SET VISIBLE:C603(*; "oPriceTableLabel"; False:C215)
				
				OBJECT SET VISIBLE:C603(PRD_abo_PriceTables; False:C215)
				
				OBJECT GET COORDINATES:C663(PRD_l_SelectButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT GET COORDINATES:C663(PROD_R_SupplierPrice; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT MOVE:C664(PRD_l_SelectButton; $_l_ObjectLeft; ($_l_ObjectBottom2+10); $_l_ObjectRight; (($_l_ObjectBottom2+10)+$_l_Height); *)
				OBJECT GET COORDINATES:C663(PRD_l_SelectButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				
				OBJECT GET COORDINATES:C663(PRD_l_CloseButton; $_l_ObjectLeft; $_l_ObjectTop3; $_l_ObjectRight; $_l_ObjectBottom3)
				OBJECT MOVE:C664(PRD_l_CloseButton; $_l_ObjectLeft; ($_l_ObjectBottom2+10); $_l_ObjectRight; (($_l_ObjectBottom2+10)+$_l_Height); *)
				
				OBJECT GET COORDINATES:C663(PRD_l_SelectButton; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				WS_AutoscreenSize(2; 300; 584; Table name:C256(->[PRODUCTS:9])+"_"+"Products_SimplifiedEntry")
				
			: ($_l_Size=3)  //buttons and price table
				WS_AutoscreenSize(2; 387; 584; Table name:C256(->[PRODUCTS:9])+"_"+"Products_SimplifiedEntry")
				
			Else 
				WS_AutoscreenSize(2; 230; 584; Table name:C256(->[PRODUCTS:9])+"_"+"Products_SimplifiedEntry")
				
		End case 
		
		WIN_t_CurrentInputForm:="Products_SImplifiedEntry"
		INT_SetInput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
		
		
		
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		$_ptr_FocusObject:=Focus object:C278
		
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Products_InLP
		Case of 
			: ($_t_VariableName="PROD_t_SupplierCode")
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
					CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
					[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
					[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
					
				Else 
					FIRST RECORD:C50([PRODUCTS_SUPPLIERS:148])
				End if 
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
				[PRODUCTS_SUPPLIERS:148]Company_Code:1:=PROD_t_SupplierCode
				DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
				ProdSupp_InLPX(->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
				PROD_t_SupplierCode:=[PRODUCTS_SUPPLIERS:148]Company_Code:1
				If ([COMPANIES:2]Company_Code:1#PROD_t_SupplierCode)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=PROD_t_SupplierCode)
				End if 
				PROD_T_CompanyName:=[COMPANIES:2]Company_Name:2
				If ([COMPANIES:2]Company_Code:1#$_t_CompanyCode)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
				End if 
			: ($_t_VariableName="PROD_R_SupplierPrice")
				
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
				
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
					CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
					[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
					[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
					
				Else 
					FIRST RECORD:C50([PRODUCTS_SUPPLIERS:148])
				End if 
				[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=PROD_R_SupplierPrice
				DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
				ProdSupp_InLPX(->[PRODUCTS_SUPPLIERS:148]Cost_Price:2)
				PROD_R_SupplierPrice:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
		End case 
	: ($_l_Event=On Outside Call:K2:11)
		Products_InLP
	: ($_l_Event=On Activate:K2:9)
		Products_InLP
		
End case 
ERR_MethodTrackerReturn("Products_simpleentryLP"; $_t_oldMethodName)
