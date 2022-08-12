//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_InLP
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
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(PT_at_PricingBasis;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_REAL:C285(PG_l_PricingClass)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; ACC_t_CurrencyCode; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPriceTable; vText; vTitle; vTitle5)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_InLP")
//PriceT_InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PRICE_TABLE:28]); WIN_t_CurrentInputForm)
		PriceT_InLPB
		In_ButtChkDis(->vButtDisPriceTable)
		
		DB_SetInputFormMenu(Table:C252(->[PRICE_TABLE:28]); "PriceTable_In")
		If (Records in selection:C76([PRICE_TABLE:28])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PRICE_TABLE:28]); "PriceTable_In")
		OpenHelp(Table:C252(->[PRICE_TABLE:28]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisPriceTable)
		If (Records in selection:C76([PRICE_TABLE:28])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PRICE_TABLE:28]); "PriceTable_In")
		In_ButtChkDis(->vButtDisPriceTable)
		If (Records in selection:C76([PRICE_TABLE:28])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall(""; ""; "Minor_DelSinEx"; ->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Company_Code:8; "Price Table"; "12 2"; "PriceT_InLPB"; "Master"; "PriceT_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisPriceTable)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PRICE_TABLE:28]Price_Code:2))
				Check_Minor(->[PRICE_TABLE:28]Price_Code:2; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; "PriceG In"; "Price Group")
				If ([PRICE_TABLE:28]Price_Code:2#"")
					Case of 
						: ([PRICE_GROUPS:18]Price_Based:3)
							PG_l_PricingClass:=1
						Else 
							Case of 
								: ([PRICE_GROUPS:18]PriceGroupClass:9=2)  //Mixed
									PG_l_PricingClass:=2
								: ([PRICE_GROUPS:18]PriceGroupClass:9=3) | ([PRICE_GROUPS:18]PriceGroupClass:9=0)  //Discount=0 if never set and price based=false
									PG_l_PricingClass:=3
								Else 
									PG_l_PricingClass:=1
							End case 
					End case 
					
					If ([PRICE_GROUPS:18]Cost_Prices:4)
						vTitle5:="Cost Prices (PO only)"
					Else 
						vTitle5:="Sales Prices (SO only)"
					End if 
					ARRAY TEXT:C222(PT_at_PricingBasis; 2)
					OBJECT SET VISIBLE:C603(*; "oPricingBasis"; False:C215)
					Case of 
						: (PG_l_PricingClass=1)
							[PRICE_TABLE:28]Pricing_Basis:17:=1
							If ([PRICE_GROUPS:18]Cost_Prices:4)
								vTitle:="Cost Price"
							Else 
								vTitle:="Sales Price"
							End if 
						: (PG_l_PricingClass=2)  //Mixed
							Case of 
								: ([PRICE_TABLE:28]Pricing_Basis:17=1)
									If ([PRICE_GROUPS:18]Cost_Prices:4)
										vTitle:="Cost Price"
									Else 
										vTitle:="Sales Price"
									End if 
								: ([PRICE_TABLE:28]Pricing_Basis:17=3)
									vTitle:="Discount %"
									vTitle5:=""
								Else 
									OBJECT SET VISIBLE:C603(*; "oPricingBasis"; True:C214)
									OBJECT SET VISIBLE:C603(*; "oPricingBasisLabel"; False:C215)
									
									If ([PRICE_GROUPS:18]Cost_Prices:4)
										PT_at_PricingBasis{1}:="Cost Price"
									Else 
										PT_at_PricingBasis{1}:="Sales Price"
									End if 
									PT_at_PricingBasis{1}:="Cost Price"
									PT_at_PricingBasis{2}:="Discount %"
									//its not set
							End case 
						: (PG_l_PricingClass=3)
							[PRICE_TABLE:28]Pricing_Basis:17:=3
							vTitle:="Discount %"
							vTitle5:=""
					End case 
					If (False:C215)
						If ([PRICE_GROUPS:18]Price_Based:3)
							If ([PRICE_GROUPS:18]Cost_Prices:4)
								vTitle:="Cost Price"
							Else 
								vTitle:="Sales Price"
							End if 
						Else 
							vTitle:="Discount %"
						End if 
					Else 
						vTitle:="Price/Disc."
						vTitle5:=""
					End if 
				End if 
				If (([PRICE_GROUPS:18]Price_Code:1#"") & ([PRICE_TABLE:28]Currency_Code:13=""))
					[PRICE_TABLE:28]Currency_Code:13:=[PRICE_GROUPS:18]Currency_Code:8
					RELATE ONE:C42([PRICE_TABLE:28]Currency_Code:13)
					ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
				End if 
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Price_Code:2)
			: (Modified:C32([PRICE_TABLE:28]Group_Code:6))
				Check_MinorNC(->[PRICE_TABLE:28]Group_Code:6; "Group"; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Group_Code:6)
			: (Modified:C32([PRICE_TABLE:28]Brand_Code:7))
				Check_MinorNC(->[PRICE_TABLE:28]Brand_Code:7; "Brand"; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Brand_Code:7)
			: (Modified:C32([PRICE_TABLE:28]Company_Code:8))
				Check_MinorNC(->[PRICE_TABLE:28]Company_Code:8; "Company"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Company_Code:8)
			: (Modified:C32([PRICE_TABLE:28]Product_Code:1))
				If (([PRICE_TABLE:28]Product_Code:1="*Job") | ([PRICE_TABLE:28]Product_Code:1="*Job Stage @"))
					[PRICE_TABLE:28]Product_Code:1:=Uppers2([PRICE_TABLE:28]Product_Code:1)
					vText:=""
				Else 
					Check_ProductNC(->[PRICE_TABLE:28]Product_Code:1; "Product")
					PriceT_InLPProd
				End if 
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Product_Code:1)
			: (Modified:C32([PRICE_TABLE:28]Currency_Code:13))
				Check_MinorNC(->[PRICE_TABLE:28]Currency_Code:13; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Currency_Code:13)
			: (Modified:C32([PRICE_TABLE:28]Product_Further:20))
				Check_Minor(->[PRICE_TABLE:28]Product_Further:20; "Analysis"; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In")
				PriceT_InLPM
				Macro_AccTypePt(->[PRICE_TABLE:28]Product_Further:20)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PRICE_TABLE:28]); "PriceTable_In")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("PriceT_InLP"; $_t_oldMethodName)