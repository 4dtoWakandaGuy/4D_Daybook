//%attributes = {}
If (False:C215)
	//Project Method Name:      Groups_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2010 16:54
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
	//C_UNKNOWN(vBAccount)
	//C_UNKNOWN(vPAccount)
	//C_UNKNOWN(vSAccount)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; $_l_ModuleRow; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; $_l_ButtonNumber; $_l_Event; $_l_ModuleRow)
	C_LONGINT:C283(DB_l_WindowCurrentModule)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; vBAccount; vPAccount; vSAccount; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button)
	C_TEXT:C284(DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Groups_InLP")
//Groups_InLP
Minor_LP_Ex(->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2; ->[PRODUCT_GROUPS:10]Export:7; ->[PRODUCT_GROUPS:10]; "Groups"; "1"; "Groups_InLPB")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PRODUCT_GROUPS:10]); WIN_t_CurrentInputForm)
		Groups_InLPB
		
		DB_SetInputFormMenu(Table:C252(->[PRODUCT_GROUPS:10]); "ProductGroup_In")
		If (Records in selection:C76([PRODUCT_GROUPS:10])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PRODUCT_GROUPS:10]); "ProductGroup_In")
		If (Records in selection:C76([PRODUCT_GROUPS:10])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PRODUCT_GROUPS:10]); "ProductGroup_In")
		If (Records in selection:C76([PRODUCT_GROUPS:10])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PRODUCT_GROUPS:10]Sales_Account:4))
				Check_MinorNC(->[PRODUCT_GROUPS:10]Sales_Account:4; "SAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCT_GROUPS:10]Sales_Account:4#"")
					If (Check_AnalAcc(->[PRODUCT_GROUPS:10]Sales_Account:4; ->[PRODUCT_GROUPS:10]Analysis_Code:6; 1))
					End if 
				End if 
				If ([PRODUCT_GROUPS:10]Sales_Account:4="")
					vSAccount:=""
				End if 
				[PRODUCT_GROUPS:10]Export:7:=Export_Stamp2([PRODUCT_GROUPS:10]Export:7)
			: (Modified:C32([PRODUCT_GROUPS:10]Purchase_Account:5))
				Check_MinorNC(->[PRODUCT_GROUPS:10]Purchase_Account:5; "PAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCT_GROUPS:10]Purchase_Account:5#"")
					If (Check_AnalAcc(->[PRODUCT_GROUPS:10]Purchase_Account:5; ->[PRODUCT_GROUPS:10]Analysis_Code:6; 1))
					End if 
				End if 
				If ([PRODUCT_GROUPS:10]Purchase_Account:5="")
					vPAccount:=""
				End if 
				[PRODUCT_GROUPS:10]Export:7:=Export_Stamp2([PRODUCT_GROUPS:10]Export:7)
			: (Modified:C32([PRODUCT_GROUPS:10]Stock_Account:8))
				Check_MinorNC(->[PRODUCT_GROUPS:10]Stock_Account:8; "BAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCT_GROUPS:10]Stock_Account:8#"")
					If (Check_AnalAcc(->[PRODUCT_GROUPS:10]Stock_Account:8; ->[PRODUCT_GROUPS:10]Analysis_Code:6; 1))
					End if 
				End if 
				If ([PRODUCT_GROUPS:10]Stock_Account:8="")
					vBAccount:=""
				End if 
				[PRODUCT_GROUPS:10]Export:7:=Export_Stamp2([PRODUCT_GROUPS:10]Export:7)
			: (Modified:C32([PRODUCT_GROUPS:10]Analysis_Code:6))
				Check_Analysis(->[PRODUCT_GROUPS:10]Analysis_Code:6; "Analysis"; ->[PRODUCT_GROUPS:10]Sales_Account:4; ->[PRODUCT_GROUPS:10]Purchase_Account:5)
				[PRODUCT_GROUPS:10]Export:7:=Export_Stamp2([PRODUCT_GROUPS:10]Export:7)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PRODUCT_GROUPS:10]); "ProductGroup_In")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
End case 
ERR_MethodTrackerReturn("Groups_InLP"; $_t_oldMethodName)
