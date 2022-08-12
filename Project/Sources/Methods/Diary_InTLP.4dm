//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InTLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:35 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; xDelete)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; vButtDisDry; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InTLP")
//LP Diary_InT
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		WS_AutoscreenSize(1; 800; 553; Table name:C256(->[DIARY:12])+"_"+"Diary_inT")
		Diary_InB
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisDry)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		xDelete:=0
		In_ButtCall("Diary_InTLPA"; ""; "Diary_InTLPDel"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary"; "3 9 8 11 19 21"; "Diary_InB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
	: ($_l_Event=On Data Change:K2:15)
		Diary_InD
	: ($_l_Event=On Deactivate:K2:10)
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(1; 385; 553)
		
End case 
ERR_MethodTrackerReturn("Diary_InTLP"; $_t_oldMethodName)