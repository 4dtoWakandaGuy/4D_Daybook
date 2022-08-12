If (False:C215)
	//Table Form Method Name: Object Name:      [ORDER_ITEMS].Items_Su
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_abo_PowerviewSubs;0)
	//ARRAY LONGINT(AL_l_ModeSubs;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORD_at_ModSubs;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_PICTURE:C286(PRD_pic_ModeSubs)
	C_REAL:C285(vAmount; vTot; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPro; vDates; vLetterDate; vLocation; vLongDate)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items_Su"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  //| ($_l_event=On Resize)
		//WS_AutoscreenSize(2;460;560)
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->ORD_abo_PowerviewSubs)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items_Su")
		WS_AutoscreenSize(2; 570; 560)
		ARRAY TEXT:C222(OI_at_OrderItemTabs; 2)
		OBJECT SET FONT:C164(OI_at_OrderItemTabs; "arial")
		OBJECT SET FONT STYLE:C166(OI_at_OrderItemTabs; 1)
		OBJECT SET FONT SIZE:C165(OI_at_OrderItemTabs; 12)
		OI_at_OrderItemTabs{1}:="   1  "
		OI_at_OrderItemTabs{2}:="   2  "
		OI_at_OrderItemTabs:=1
		ARRAY TEXT:C222(ORD_at_ModSubs; 0)
		ARRAY LONGINT:C221(AL_l_ModeSubs; 0)
		
		//ORD_at_ModSubs{2}:="Edit"
		//ORD_at_ModSubs{1}:="Select"
		
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		ARRAY POINTER:C280(SUBS_aPtr_LBSettings; 0)
		
		ORD_LoadSubscriptions
		LBi_SetListBoxOptions(->ORD_at_ModSubs; ->AL_l_ModeSubs; ->PRD_pic_ModeSubs)
		
		vTotal:=Round:C94(Sum:C1([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8); 2)
		vAmount:=Round:C94(([ORDER_ITEMS:25]Sales_Amount:7-vTotal); 2)
		vTot:=0
		vDates:=DayName([PRODUCTS:9]First_Issue_Date:32)
		Case of 
			: ([PRODUCTS:9]Unit_Number:29=7)
				vLetterDate:="Week(s)"
			: ([PRODUCTS:9]Unit_Number:29=1)
				vLetterDate:="Day(s)"
			: ([PRODUCTS:9]Unit_Number:29=31)
				vLetterDate:="Month(s)"
			: ([PRODUCTS:9]Unit_Number:29=365)
				vLetterDate:="Year(s)"
		End case 
		Case of 
			: ([PRODUCTS:9]Start_Number:30=7)
				vLongDate:="same day of week"
			: ([PRODUCTS:9]Start_Number:30=31)
				vLongDate:="same day of month"
			: ([PRODUCTS:9]Start_Number:30=0)
				vLongDate:="date as applicable"
		End case 
		Case of 
			: ([PRODUCTS:9]First_Day_Month:33=1)
				vLocation:="1st Issue Date"
			: ([PRODUCTS:9]First_Day_Month:33=0)
				vLocation:="Order Date + "+String:C10([PRODUCTS:9]Start_Days:31)
		End case 
		
		vButtDisPro:="IID  O  FSS R ADT"
		Input_Buttons(->[PRODUCTS:9]; ->vButtDisPro; "Subscription"; "Issue Date")
		
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "Items_Su")
		If (Records in selection:C76([SUBSCRIPTIONS:93])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		Macro_AccType("Load "+String:C10(Table:C252(->[ORDER_ITEMS:25])))
		INT_SetInput(Table:C252(->[ORDER_ITEMS:25]); "Items_Su")
		
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items_Su")
		DB_SetnewToolBar
		In_ButtChkDis(->vButtDisPro; "Subscription")
		
	: ($_l_event=On Outside Call:K2:11)
		//TRACE
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; ->[ORDER_ITEMS:25]; "Items_Su")
				
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				In_ButtCall("R:Products_SuLPA"; ""; ""; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Product_Code:2; "Items"; ""; ""; "Master"; ""; ""; ->[SUBSCRIPTIONS:93]; ->vButtDisPro)
				
		End case 
		
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "Items_in")
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (vTot=1)
				vTotal:=Round:C94(Sum:C1([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8); 2)
				vAmount:=Round:C94(([ORDER_ITEMS:25]Sales_Amount:7-vTotal); 2)
				vTot:=0
		End case 
		
		
		
	: ($_l_event=On Deactivate:K2:10)
		
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:Items_Su"; $_t_oldMethodName)
