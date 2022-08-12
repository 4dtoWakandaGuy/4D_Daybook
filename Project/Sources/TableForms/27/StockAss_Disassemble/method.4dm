If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]StockAss_Disassemble
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 14:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; STK_bo_ProductFound)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; ch1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord; s1; s2; vSNo)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; vButtDisstockI; vProdName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].StockAss_Disassemble"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)  //aWS_AutoscreenSize (2;439;553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		vProdName:=""
		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
		OBJECT SET ENABLED:C1123(s1; False:C215)
		OBJECT SET ENABLED:C1123(s2; False:C215)
		OBJECT SET ENABLED:C1123(ch1; False:C215)
		OBJECT SET FORMAT:C236(vSNo; "Choose 'Trial Disassembly' to calculate")
		GOTO OBJECT:C206([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
		End if 
		vButtDisstockI:="I DPMO  FSSSRCADT"
		Input_Buttons(->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisstockI; "Stock Movement Item")
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
		WS_AutoscreenSize(2; 439; 553)
		INT_SetInput(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisstockI; "Stock Movement Item")
		
		
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
		
		In_ButtChkDis(->vButtDisstockI; "Stock Movement Item")
		
		SD2_SetDiaryPopup
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		In_ButtChkDis(->vButtDisstockI; "Stock Movement Item")
		SD2_SetDiaryPopup
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall("R:StockAss_DisLPA"; ""; ""; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; "StockI"; "1"; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisstockI)
		End case 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13))  // first cos doesn't clear the SNo
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Movement_Type:6))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Movement_Type:6; "Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
				If ([MOVEMENT_TYPES:60]Assembly_Type:23=False:C215)
					Gen_Alert("That Movement Type is not 'Used for Assembly/Disassembly'"; "Try again")
					REJECT:C38([STOCK_MOVEMENTS:40]Movement_Type:6)
				End if 
				Move_InType
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
				STK_bo_ProductFound:=False:C215
				Check_Product(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; "Product"; ->STK_bo_ProductFound)
				If (STK_bo_ProductFound)
					vProdName:=[PRODUCTS:9]Product_Name:2
					StockAss_SNoZD
					DB_bo_RecordModified:=True:C214
				End if 
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
				If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=Uppercase:C13([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				If (([STOCK_MOVEMENT_ITEMS:27]Quantity:12>1) & ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#""))
					Gen_Alert("Serial Numbered Items can only be Disassembled in ones"; "OK")
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
				End if 
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Analysis_Code:9))
				Check_Analysis(->[STOCK_MOVEMENTS:40]Analysis_Code:9; "Analysis")
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Currency_Code:10))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Currency_Code:10; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				If ([STOCK_MOVEMENTS:40]Currency_Code:10="")
					[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
				End if 
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Layer_Code:11))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Layer_Code:11; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
				Layer_Fill(->[STOCK_MOVEMENTS:40]Layer_Code:11)
				StockAss_SNoZD
				DB_bo_RecordModified:=True:C214
				
		End case 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_Disassemble")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_event=On Deactivate:K2:10)
	: ($_l_event=On Activate:K2:9)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:StockAss_Dis13"; $_t_oldMethodName)
