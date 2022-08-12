//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceG InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/10/2010 22:57
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_WindowCurrentModule; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceG InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRICE_GROUPS:18]); WIN_t_CurrentInputForm)
		Minor_LP_Ex(->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; ->[PRICE_GROUPS:18]Export:7; ->[PRICE_GROUPS:18]; "Price Groups"; "1"; "PriceG_InLPB")
		
		PriceG_InLPB
		
		DB_SetInputFormMenu(Table:C252(->[PRICE_GROUPS:18]); "PriceG In13")
		If (Records in selection:C76([PRICE_GROUPS:18])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PRICE_GROUPS:18]); "PriceG In13")
		OpenHelp(Table:C252(->[PRICE_GROUPS:18]); WIN_t_CurrentInputForm)
		Minor_LP_Ex(->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; ->[PRICE_GROUPS:18]Export:7; ->[PRICE_GROUPS:18]; "Price Groups"; "1"; "PriceG_InLPB")
		If (Records in selection:C76([PRICE_GROUPS:18])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PRICE_GROUPS:18]); "PriceG In13")
		Minor_LP_Ex(->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; ->[PRICE_GROUPS:18]Export:7; ->[PRICE_GROUPS:18]; "Price Groups"; "1"; "PriceG_InLPB")
		If (Records in selection:C76([PRICE_GROUPS:18])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		Minor_LP_Ex(->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; ->[PRICE_GROUPS:18]Export:7; ->[PRICE_GROUPS:18]; "Price Groups"; "1"; "PriceG_InLPB")
		
	: ($_l_Event=On Data Change:K2:15)
		Minor_LP_Ex(->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2; ->[PRICE_GROUPS:18]Export:7; ->[PRICE_GROUPS:18]; "Price Groups"; "1"; "PriceG_InLPB")
		
		Case of 
			: (Modified:C32([PRICE_GROUPS:18]Currency_Code:8))
				Check_MinorNC(->[PRICE_GROUPS:18]Currency_Code:8; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PRICE_GROUPS:18]Currency_Code:8)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PRICE_GROUPS:18]); "PriceG In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
End case 
ERR_MethodTrackerReturn("PriceG InLP"; $_t_oldMethodName)