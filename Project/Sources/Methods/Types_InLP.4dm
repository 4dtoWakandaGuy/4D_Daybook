//%attributes = {}
If (False:C215)
	//Project Method Name:      Types_InLP
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
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; $_bo_UpdateisDone; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; $_l_ModuleRow; $_l_Type; $_l_UpdateTypes; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; TYP_l_DefaultWorkAddress)
	C_LONGINT:C283(TYP_l_nonDefaultAddress; $_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $_l_Type; $_l_UpdateTypes; DB_l_WindowCurrentModule; TYP_l_DefaultHomeAddress; TYP_l_DefaultWorkAddress; TYP_l_nonDefaultAddress)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Types_InLP")
Minor_LP_Ex(->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; ->[TYPES:5]Export:3; ->[TYPES:5]; "Types"; "1"; "Types_InLPCU")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;380;590)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		$_bo_UpdateisDone:=SYS_isUpdateDone(1; (Table:C252(->[TYPES:5])+0)+100)
		
		If (Not:C34($_bo_UpdateisDone))
			[TYPES:5]UseAsCompanyType:7:=True:C214
			SAVE RECORD:C53([TYPES:5])
			
			$_l_UpdateTypes:=New process:C317("TYP_UpdateFlags"; 12000; "Update Company Types"; True:C214; 1; (Table:C252(->[TYPES:5])+0)+100)
			
		End if 
		
		OpenHelp(Table:C252(->[TYPES:5]); "Types_In")
		Types_InLPCU
		WS_AutoscreenSize(2; 380; 590)
		INT_SetInput(Table:C252(->[TYPES:5]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[TYPES:5]); "Types_In")
		
		If (Records in selection:C76([TYPES:5])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		TYP_l_nonDefaultAddress:=0
		TYP_l_DefaultWorkAddress:=0
		TYP_l_DefaultHomeAddress:=0
		
		OBJECT SET VISIBLE:C603(*; "oNonDefaultAddress"; [TYPES:5]UseAsAddressType:8)
		OBJECT SET VISIBLE:C603(*; "oDefaultWorkAddress"; [TYPES:5]UseAsAddressType:8)
		OBJECT SET VISIBLE:C603(*; "oDefaultHomeAddress"; [TYPES:5]UseAsAddressType:8)
		If ([TYPES:5]UseAsAddressType:8)
			If (Not:C34([TYPES:5]TypeAttributes:9.addresstypedefault=Null:C1517))
				
				$_l_Type:=[TYPES:5]TypeAttributes:9.addresstypedefault
				TYP_l_nonDefaultAddress:=Num:C11($_l_Type=0)
				TYP_l_DefaultWorkAddress:=Num:C11($_l_Type=1)
				TYP_l_DefaultHomeAddress:=Num:C11($_l_Type=2)
			Else 
				TYP_l_nonDefaultAddress:=1
				TYP_l_DefaultWorkAddress:=0
				TYP_l_DefaultHomeAddress:=0
			End if 
		End if 
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([TYPES:5]SO_Price_Group:4))
				Check_MinorNC(->[TYPES:5]SO_Price_Group:4; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
				Macro_AccTypePt(->[TYPES:5]SO_Price_Group:4)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TYPES:5]PO_Price_Group:6))
				Check_MinorNC(->[TYPES:5]PO_Price_Group:6; "POPriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
				Macro_AccTypePt(->[TYPES:5]PO_Price_Group:6)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TYPES:5]Omit_Job_Title:5))
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[TYPES:5]); "Types_In")
		If (Records in selection:C76([TYPES:5])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[TYPES:5]); "Types_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[TYPES:5]); "Types_In")
		If (Records in selection:C76([TYPES:5])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
End case 
ERR_MethodTrackerReturn("Types_InLP"; $_t_oldMethodName)
