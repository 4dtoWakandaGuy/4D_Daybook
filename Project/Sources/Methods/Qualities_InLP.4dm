//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:16 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDisQUAL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		Qualities_InLPB
		vButtDisQUAL:="I  PMO  FSSSRCADT"
		Input_Buttons(->[INFORMATION:55]; ->vButtDisQUAL)
	: ($_l_Event=On Activate:K2:9)
		
		
		In_ButtChkDis(->vButtDisQUAL)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; "Minor_DelSin"; ->[INFORMATION:55]; ->[INFORMATION:55]Contact_Code:1; "Qualities"; ""; "Qualities_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisQUAL)
	: ($_l_Event=On Data Change:K2:15)
		Qualities_InLPD
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Qualities_InLP"; $_t_oldMethodName)