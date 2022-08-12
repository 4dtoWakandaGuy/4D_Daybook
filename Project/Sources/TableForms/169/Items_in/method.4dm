If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS_ITEMS]Items_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2013 16:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; vButtDis; vButtDisPOI; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS_ITEMS].Items_in"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		INT_SetInput(Table:C252(->[PURCHASE_ORDERS:57]); WIN_t_CurrentInputForm)
	: ($_l_event=On Header:K2:17)
		//WS_AutoscreenSize (2;390;541)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
			QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
		End if 
		
		DB_SetnewToolBar
		WS_AutoscreenSize(2; 595; 570)
		If (DB_GetModuleSettingByNUM(Module_PriceTable)=0)
			OBJECT SET ENTERABLE:C238([PURCHASE_ORDERS_ITEMS:169]Price_Code:9; False:C215)
		End if 
		If (DB_GetModuleSettingByNUM(1)=5)
			OBJECT SET ENTERABLE:C238([PURCHASE_ORDERS_ITEMS:169]Price_Per:12; False:C215)
			OBJECT SET ENTERABLE:C238([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11; False:C215)
		End if 
		vButtDisPOI:="I DPMOS FSSSRCADT"
		Input_Buttons(->[INVOICES:39]; ->vButtDisPOI; "Purchase Order Item")
		INT_SetInput(Table:C252(->[PURCHASE_ORDERS:57]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); "Items_in")
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisPOI)
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); "Items_in")
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisPOI)
	: ($_l_event=On Menu Selected:K2:14)
		
		DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); "Items_in")
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisPOI)
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("Gen_ItemsLPA"; "Gen_ItemsLPA"; ""; ->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; "Purchase Order"; ""; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
		End case 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Product_Name:2))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Product_Name:2)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Description:13))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Description:13)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Print_Description:14))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Print_Description:14)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Quantity:3))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Quantity:3)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Price_Per:12))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Discount:10))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Discount:10)
			: (Modified:C32([PURCHASE_ORDERS_ITEMS:169]Price_Code:9))
				PuOItems_InLPX(->[PURCHASE_ORDERS_ITEMS:169]Price_Code:9)
		End case 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); "Items_in")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS_ITEMS].Items_in"; $_t_oldMethodName)
