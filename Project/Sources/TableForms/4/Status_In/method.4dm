If (False:C215)
	//Table Form Method Name: [STATUS]Status_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2012 22:45
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
	//ARRAY BOOLEAN(LB_lb_usage;0)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_ModuleRow; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; RS_l_BUT1; RS_l_BUT11)
	C_LONGINT:C283(RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17; RS_l_BUT18; RS_l_BUT19; RS_l_BUT2; RS_l_BUT21; RS_l_BUT22)
	C_LONGINT:C283(RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27; RS_l_BUT3; RS_l_BUT4; RS_l_BUT5; RS_l_BUT7; RS_l_BUT8; RS_l_BUT9)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_Index; $_l_ModuleRow; DB_l_WindowCurrentModule; RS_l_BUT10; RS_l_BUT20; RS_l_BUT6)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oRS_COL1; oRS_COL10; oRS_COL11; oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15; oRS_COL17)
	C_TEXT:C284(oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21; oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25; oRS_COL27; oRS_COL3)
	C_TEXT:C284(oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7; oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10; oRS_HED12; oRS_HED13; oRS_HED14)
	C_TEXT:C284(oRS_HED15; oRS_HED16; oRS_HED17; oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25)
	C_TEXT:C284(oRS_HED26; oRS_HED27; oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6; oRS_HED8; oRS_HED9; PAL_BUTTON; WIN_t_CurrentInputForm; $_t_oldMethodName)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oRS_COL16; oRS_COL26; oRS_HED11; oRS_HED21; oRS_HED7; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STATUS].Status_in"; Form event code:C388)
$_l_event:=Form event code:C388
Minor_LP_Ex(->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; ->[STATUS:4]Export:3; ->[STATUS:4]; "Status"; "1"; "Status_InLPCU")

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;230;570)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[STATUS:4]); "Status_in")
		WS_AutoscreenSize(2; 290; 570)
		INT_SetInput(Table:C252(->[STATUS:4]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[STATUS:4]); "Status_in")
		If (Records in selection:C76([STATUS:4])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		ARRAY BOOLEAN:C223(ST_abo_CodeUsed; 0)
		ARRAY BOOLEAN:C223(ST_abo_CodeUsed; Size of array:C274(CU_ai_CodeUsed))
		For ($_l_Index; 1; Size of array:C274(CU_ai_CodeUsed))
			ST_abo_CodeUsed{$_l_Index}:=(CU_ai_CodeUsed{$_l_Index}=1)
		End for 
		
		
		LB_SetupListbox(->LB_lb_usage; "oRS"; "RS_L"; 1; ->ST_abo_CodeUsed; ->CU_at_CodeUse; ->CU_ai_CodeUsed)
		
		
		
		LB_SetColumnHeaders(->LB_lb_usage; "RS_L"; 1; "Use"; "Table")
		
		
		LB_SetColumnWidths(->LB_lb_usage; "oABR"; 1; 50; 80; 0)
		
		LB_SetEnterable(->LB_lb_usage; False:C215; 0)
		LB_SetEnterable(->LB_lb_usage; True:C214; 1)
		
		If ((Size of array:C274(ST_abo_CodeUsed)*16)>90)
			LB_SetScroll(->LB_lb_usage; -3; -2)
		Else 
			LB_SetScroll(->LB_lb_usage; -3; -3)
		End if 
		LB_StyleSettings(->LB_lb_usage; "Black"; 9; "STK_t"; ->[COMPANIES:2])
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[STATUS:4]); "Status_in")
		If (Records in selection:C76([STATUS:4])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[STATUS:4]); "Status_in")
		If (Records in selection:C76([STATUS:4])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[STATUS:4]); "Status_in")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
		
End case 
ERR_MethodTrackerReturn("FM:Status_In"; $_t_oldMethodName)
