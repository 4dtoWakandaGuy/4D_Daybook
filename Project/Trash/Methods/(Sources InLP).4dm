//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sources_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 10:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_usage;0)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_Index; $_l_ModuleRow; $1; DB_l_WindowCurrentModule; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9)
	C_LONGINT:C283(RS_l_BUT1; RS_l_BUT10; RS_l_BUT11; RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17; RS_l_BUT18; RS_l_BUT19)
	C_LONGINT:C283(RS_l_BUT2; RS_l_BUT20; RS_l_BUT21; RS_l_BUT22; RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27; RS_l_BUT3; RS_l_BUT4)
	C_LONGINT:C283(RS_l_BUT5; RS_l_BUT6; RS_l_BUT7; RS_l_BUT8; RS_l_BUT9; vCP; vCT)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oRS_COL1; oRS_COL10; oRS_COL11; oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15)
	C_TEXT:C284(oRS_COL16; oRS_COL17; oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21; oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25)
	C_TEXT:C284(oRS_COL26; oRS_COL27; oRS_COL3; oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7; oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10)
	C_TEXT:C284(oRS_HED11; oRS_HED12; oRS_HED13; oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17; oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20)
	C_TEXT:C284(oRS_HED21; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27; oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6)
	C_TEXT:C284(oRS_HED7; oRS_HED8; oRS_HED9; PAL_BUTTON; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources_InLP")
Minor_LP_Ex(->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; ->[SOURCES:6]Export:13; ->[SOURCES:6]; "Sources"; "1"; "Sources_InLPCU")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 


Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;420;590)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SOURCES:6]); WIN_t_CurrentInputForm)
		Sources_InLPCU
		WS_AutoscreenSize(2; 455; 565)
		INT_SetInput(Table:C252(->[SOURCES:6]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[SOURCES:6]); "Sources_In13")
		If (Records in selection:C76([SOURCES:6])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
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
		
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[SOURCES:6]); "Sources_In13")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([SOURCES:6]Publication_Code:12))
				If ((vCP=1) | (vCT=1))
					Check_MinorNC(->[SOURCES:6]Publication_Code:12; "Layer"; ->[PUBLICATIONS:52]; ->[PUBLICATIONS:52]Publication_Code:1; ->[PUBLICATIONS:52]Publication_Name:2; "Publication")
				Else 
					Check_Minor(->[SOURCES:6]Publication_Code:12; "Layer"; ->[PUBLICATIONS:52]; ->[PUBLICATIONS:52]Publication_Code:1; ->[PUBLICATIONS:52]Publication_Name:2; "Public In"; "Publication")
					
				End if 
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Publication_Code:12)
			: (Modified:C32([SOURCES:6]Product_Code:6))
				If ((vCP=1) | (vCT=1))
					Check_ProductNC(->[SOURCES:6]Product_Code:6; "Product")
				Else 
					Check_Product(->[SOURCES:6]Product_Code:6; "Product")
				End if 
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Product_Code:6)
			: (Modified:C32([SOURCES:6]Person:9))
				Check_MinorNC(->[SOURCES:6]Person:9; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Personnel In")
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Person:9)
			: (Modified:C32([SOURCES:6]Source_Date:3))
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Source_Date:3)
			: (Modified:C32([SOURCES:6]Cost:4))
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Cost:4)
			: (Modified:C32([SOURCES:6]Description:5))
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Description:5)
			: (Modified:C32([SOURCES:6]Format:7))
				Check_Lists(->[SOURCES:6]Format:7; "Ad Formats")
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Format:7)
			: (Modified:C32([SOURCES:6]Colour:8))
				Check_Lists(->[SOURCES:6]Colour:8; "Ad Colours")
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Colour:8)
			: (Modified:C32([SOURCES:6]Source_Position:10))
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Source_Position:10)
			: (Modified:C32([SOURCES:6]Target_Leads:11))
				Sources_InLPM
				Macro_AccTypePt(->[SOURCES:6]Target_Leads:11)
		End case 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[SOURCES:6]); "Sources_In13")
		SD2_SetDiaryPopup
		If (Records in selection:C76([SOURCES:6])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[SOURCES:6]); "Sources_In13")
		SD2_SetDiaryPopup
		If (Records in selection:C76([SOURCES:6])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
End case 
ERR_MethodTrackerReturn("Sources_InLP"; $_t_oldMethodName)