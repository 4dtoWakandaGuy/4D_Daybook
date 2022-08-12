//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_ApptsLP
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
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDis)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_ApptsLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_Appointments")
		vButtDis:="A                "
		Input_Buttons(->[COMPANIES:2]; ->vButtDis)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_Appointments")
		
		In_ButtChkDis(->vButtDis)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; ""; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary"; ""; ""; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDis)
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
End case 
ERR_MethodTrackerReturn("Diary_ApptsLP"; $_t_oldMethodName)