If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELD_DEFINITiONS]CustomFieldDef_In
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
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; vButtDis; vButtDisFFD; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELD_DEFINITiONS].CustomFieldDef_In"; Form event code:C388)
//FurthFldD_InLP
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 300; 570)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "CustomFieldDef_In")
		WS_AutoscreenSize(2; 300; 570)
		INT_SetInput(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); WIN_t_CurrentInputForm)
		Load_Fields
		
		FurthFldD_InLPB
		vButtDisFFD:="I DPMO  FSSSRCADT"
		Input_Buttons(->[CUSTOM_FIELD_DEFINITiONS:99]; ->vButtDisFFD; "Field")
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "CustomFieldDef_In")
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisFFD)
		
		
		
	: (($_l_event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "CustomFieldDef_In")
		OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "CustomFieldDef_In")
		vFromIn:=(On Unload:K2:2=$_l_event)
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		In_ButtChkDis(->vButtDisFFD)
		
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "CustomFieldDef_In")
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisFFD)
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		//TRACE
		In_ButtCall(""; ""; ""; ->[CUSTOM_FIELD_DEFINITiONS:99]; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; "Field Defs"; ""; "FurthFldD_InLPB"; "Master"; ""; ""; ->[CUSTOM_FIELD_DEFINITiONS:99]; ->vButtDis)
		DB_l_ButtonClickedFunction:=9
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2))
				FurthFldD_InLPX(->[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)
			: (Modified:C32([CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3))
				FurthFldD_InLPX(->[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3)
			: (Modified:C32([CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4))
				FurthFldD_InLPX(->[CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4)
			: (Modified:C32([CUSTOM_FIELD_DEFINITiONS:99]List_Name:5))
				FurthFldD_InLPX(->[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5)
			: (Modified:C32([CUSTOM_FIELD_DEFINITiONS:99]Type:6))
				FurthFldD_InLPX(->[CUSTOM_FIELD_DEFINITiONS:99]Type:6)
		End case 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Order_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
		
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:CustomFieldDef_In"; $_t_oldMethodName)
