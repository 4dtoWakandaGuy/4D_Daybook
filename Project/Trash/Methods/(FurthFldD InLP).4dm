//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldD InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   25/02/2011 18:09 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(CUS_aptr_LBSetup;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; vFromIn)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; vButtDis; vButtDisFF; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD InLP")
//FurthFldD InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); WIN_t_CurrentInputForm)
		FurthFldD_InLPß("B")
		In_ButtChkDis(->vButtDisFF)
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); WIN_t_CurrentInputForm)
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisFF)
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open")))
				inButtSubHandle(FORM Get current page:C276; ->[CUSTOM_FIELD_DEFINITiONS:99]; WIN_t_CurrentInputForm)
			Else 
				In_ButtCall(""; ""; ""; ->[CUSTOM_FIELD_DEFINITiONS:99]; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; "Field Defs"; ""; "FurthFldD_InLPß"; "Master"; ""; ""; ->[CUSTOM_FIELD_DEFINITiONS:99]; ->vButtDis; ->CUS_aptr_LBSetup)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FurthFldD InLP"; $_t_oldMethodName)