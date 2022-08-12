If (False:C215)
	//Table Form Method Name: [TIME_BILLING_CATEGORIES]Categories_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2012 05:00
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TIME_BILLING_CATEGORIES].Categories_In"; Form event code:C388)
$_l_event:=Form event code:C388

Minor_LP(->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Name:2; ->[TIME_BILLING_CATEGORIES:46]; "Categories"; "1"; ""; "")

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetInputFormMenu(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_In")
		If (Records in selection:C76([TIME_BILLING_CATEGORIES:46])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_In")
		If (Records in selection:C76([TIME_BILLING_CATEGORIES:46])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_In")
		If (Records in selection:C76([TIME_BILLING_CATEGORIES:46])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 225; 560)
		INT_SetInput(Table:C252(->[TIME_BILLING_CATEGORIES:46]); WIN_t_CurrentInputForm)
	: (Modified:C32([TIME_BILLING_CATEGORIES:46]Sales_Rate:3))
		DB_bo_RecordModified:=True:C214
	: (Modified:C32([TIME_BILLING_CATEGORIES:46]Cost_Rate:4))
		DB_bo_RecordModified:=True:C214
	: ($_l_event=On Outside Call:K2:11)
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[TIME_BILLING_CATEGORIES:46]); "Categories_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:Categories_In"; $_t_oldMethodName)
