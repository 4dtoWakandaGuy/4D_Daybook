//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; ch1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord; r1; r2; s1; s2; vSNo; vStockLevel)
	C_REAL:C285($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisASS; vProdName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_InLP")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(2; 384; 553)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		If ([PRODUCTS:9]Product_Code:1="")
			vProdName:=""
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
			OBJECT SET ENABLED:C1123(r1; False:C215)
			OBJECT SET ENABLED:C1123(r2; False:C215)
			OBJECT SET ENABLED:C1123(s1; False:C215)
			OBJECT SET ENABLED:C1123(s2; False:C215)
			OBJECT SET ENABLED:C1123(ch1; False:C215)
			OBJECT SET FORMAT:C236(vSNo; "Choose 'Trial Assembly' to calculate")
			GOTO OBJECT:C206([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		Else 
			r2:=1
			s2:=1
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			vProdName:=[PRODUCTS:9]Product_Name:2
			//_O_OBJECT SET COLOR(vSNo;-62211)
			UTIL_setObjectByColour(0; "vSNo"; -62211)
			
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; False:C215)
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
			GOTO OBJECT:C206([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Currency_Code:10; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Layer_Code:11; False:C215)
		End if 
		vButtDisASS:="I DPMO  FSSSRCADT"
		Input_Buttons(->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisASS)
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_in")
		WS_AutoscreenSize(2; 384; 553)
		INT_SetInput(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_in")
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisASS)
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_in")
		In_ButtChkDis(->vButtDisASS)
		SD2_SetDiaryPopup
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_in")
		In_ButtChkDis(->vButtDisASS)
		SD2_SetDiaryPopup
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<=1)
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
				In_ButtCall("R:StockAss_InLPA"; ""; ""; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8; "StockI"; "1"; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisASS)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([STOCK_MOVEMENTS:40]Movement_Type:6))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Movement_Type:6; "Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
				If ([MOVEMENT_TYPES:60]Assembly_Type:23=False:C215)
					Gen_Alert("That Movement Type is not 'Used for Assembly/Disassembly'"; "Try again")
					REJECT:C38([STOCK_MOVEMENTS:40]Movement_Type:6)
				End if 
				Move_InType
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
				Check_Product(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; "Product")
				vProdName:=[PRODUCTS:9]Product_Name:2
				If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
					QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
					
					If (Records in selection:C76([COMPONENTS:86])>0)
						If ([PRODUCTS:9]Bundle_Assembly:36)
							Gen_Alert("That Product is a Bundle, and cannot be Assembled"; "Try again")
							[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=""
							vProdName:=""
							REJECT:C38([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
						Else 
							vStockLevel:=1
							StockAss_LevCal
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=vStockLevel
						End if 
					Else 
						Gen_Alert("That Product does not have any Components"; "Try again")
						[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=""
						vProdName:=""
						REJECT:C38([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
					End if 
				End if 
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Analysis_Code:9))
				Check_Analysis(->[STOCK_MOVEMENTS:40]Analysis_Code:9; "Analysis")
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Currency_Code:10))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Currency_Code:10; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				If ([STOCK_MOVEMENTS:40]Currency_Code:10="")
					[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
				End if 
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENTS:40]Layer_Code:11))
				Check_MinorNC(->[STOCK_MOVEMENTS:40]Layer_Code:11; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
				Layer_Fill(->[STOCK_MOVEMENTS:40]Layer_Code:11)
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
				
			: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13))
				StockAss_SNoZ
				DB_bo_RecordModified:=True:C214
				
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "StockAss_in")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("StockAss_InLP"; $_t_oldMethodName)
