If (False:C215)
	//Table Form Method Name: [PROBLEMS]Problems_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 14:59
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
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY TEXT(PROB_at_ProblemAction;0)
	//ARRAY TEXT(PROB_at_ProblemActions;0)
	//ARRAY TEXT(PROB_at_Problemtypes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; $_l_ButtonNumber)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PROBLEMS].Problems_In"; Form event code:C388)
$_l_event:=Form event code:C388

Minor_LP(->[PROBLEMS:22]Problem_Code:1; ->[PROBLEMS:22]Problem_Name:2; ->[PROBLEMS:22]; "Problems"; "1"; ""; "")

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;340;570)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PROBLEMS:22]); "Problems_In")
		WS_AutoscreenSize(2; 340; 570)
		INT_SetInput(Table:C252(->[PROBLEMS:22]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[PROBLEMS:22]); "Problems_In")
		If (Records in selection:C76([PROBLEMS:22])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		SVS_LoadproblemTypes
		ARRAY TEXT:C222(PROB_at_Problemtypes; 0)
		COPY ARRAY:C226(SD2_at_ProblemTypeNames; PROB_at_Problemtypes)
		APPEND TO ARRAY:C911(PROB_at_Problemtypes; "-")
		APPEND TO ARRAY:C911(PROB_at_Problemtypes; "Configure problem Types")
		ARRAY TEXT:C222(PROB_at_ProblemAction; 0)
		
		PROB_at_Problemtypes:=0
		If ([PROBLEMS:22]ProblemTypeID:3>0)
			$_l_ModuleRow:=Find in array:C230(SD2_al_ProblemTypeIDs; [PROBLEMS:22]ProblemTypeID:3)
			If ($_l_ModuleRow>0)
				PROB_at_Problemtypes:=$_l_ModuleRow
				For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions{$_l_ModuleRow}))
					APPEND TO ARRAY:C911(PROB_at_ProblemActions; SD_at_ProblemTypeActions{$_l_ModuleRow}{$_l_Index})
				End for 
				
			End if 
			
		End if 
	: ($_l_event=On Outside Call:K2:11)
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PROBLEMS:22]); "Problems_In")
		If (Records in selection:C76([PROBLEMS:22])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PROBLEMS:22]); "Problems_In")
		If (Records in selection:C76([PROBLEMS:22])<=1)
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
					DB_SetInputFormMenu(Table:C252(->[PROBLEMS:22]); "Problems_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:Problems_In"; $_t_oldMethodName)
