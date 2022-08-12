//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 05:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUS_lb_FurtherFields;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; vAutoFind; vFromIn)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $_l_SizeofArray; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; Furth_l_BUT1; Furth_l_BUT2; Furth_l_BUT3; iCancel; iOK)
	C_LONGINT:C283(ModuleNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; oFurth_COL1; oFurth_COL2; oFurth_COL3; oFurth_HED1; oFurth_HED2; oFurth_HED3; PAL_BUTTON; vButtDisFF)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_InLP")
//FurthFld_InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); WIN_t_CurrentInputForm)
		WS_AutoscreenSize(2; 400; 570)
		INT_SetInput(Table:C252(->[CUSTOM_FIELDS:98]); WIN_t_CurrentInputForm)
		LB_SetupListbox(->CUS_lb_FurtherFields; "oFurth"; "FF_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->FUR_at_CustomFieldTypes)
		LB_SetScroll(->CUS_lb_FurtherFields; -2; -2)
		DB_SetnewToolBar
		
		LB_SetColumnHeaders(->CUS_lb_FurtherFields; "FF_L"; 1; "Field Name"; "Field Value"; "Type")
		LB_SetColumnWidths(->CUS_lb_FurtherFields; "oFurth"; 1; 150; 310; 35)  // dont need to worry about the invisible ones
		LB_StyleSettings(->CUS_lb_FurtherFields; "black"; 9; "oFurth"; ->[CUSTOM_FIELDS:98])
		OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldNames; False:C215)
		If (vAutoFind=False:C215)
			OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; False:C215)
		End if 
		OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldTypes; False:C215)
		LB_SetFormat(->CUS_lb_FurtherFields; 2; ""; 3; 0; Align center:K42:3)
		$_l_SizeofArray:=Size of array:C274(FUR_at_CustomFieldNames)
		
		
		
		DB_bo_RecordModified:=False:C215
		vButtDisFF:="I DPMOSSFSSSRCAXT"
		Input_Buttons(->[CUSTOM_FIELDS:98]; ->vButtDisFF)
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELDS:98]); "dFurthFld")
		PAL_bo_ButtonSubFunction:=False:C215
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); WIN_t_CurrentInputForm)
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisFF)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("P:FurthFld_InLPA:D:FurthFld_InLPCa"; ""; ""; ->[CUSTOM_FIELDS:98]; ->[CUSTOM_FIELDS:98]Custom_Code:1; "Further Fields"; ""; ""; "Master"; ""; ""; ->[CUSTOM_FIELDS:98]; ->vButtDisFF)
	: ($_l_Event=On Outside Call:K2:11)
		
	: ($_l_Event=On Data Change:K2:15)
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_Event=On Clicked:K2:4)  // | ($_l_Event=On Data Change )
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELDS:98]); "dFurthFld")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
		End case 
End case 
ERR_MethodTrackerReturn("FurthFld_InLP"; $_t_oldMethodName)