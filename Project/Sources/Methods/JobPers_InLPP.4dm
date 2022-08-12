//%attributes = {}
If (False:C215)
	//Project Method Name:      JobPers_InLPP
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
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; vButtDisJPers; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers_InLPP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOB PERSONNEL:48]); WIN_t_CurrentInputForm)
		vButtDisJPers:="I  PMO  FSSSRCADT"
		Input_Buttons(->[JOB PERSONNEL:48]; ->vButtDisJPers)
		JobPers_InLP
		In_ButtChkDis(->vButtDisJPers)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[JOB PERSONNEL:48]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[JOB PERSONNEL:48]); "JobPers_in")
		If (Records in selection:C76([JOB PERSONNEL:48])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisJPers)
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[JOB PERSONNEL:48]); "JobPers_in")
		If (Records in selection:C76([JOB PERSONNEL:48])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		In_ButtChkDis(->vButtDisJPers)
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Gen_ItemsLPA"; "Gen_ItemsLPA"; "Minor_DelSin"; ->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]Job_Code:1; "JobPers"; "1 2 3"; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisJPers)
	: ($_l_Event=On Data Change:K2:15)
		JobPers_InLP
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("JobPers_InLPP"; $_t_oldMethodName)