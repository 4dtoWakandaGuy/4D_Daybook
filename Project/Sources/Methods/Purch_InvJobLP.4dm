//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InvJobLP
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
	C_TEXT:C284($_t_oldMethodName; vButtDisPIJOB; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InvJobLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		vButtDisPIJOB:="I       FSSSRCAD "
		Macro_AccType("Load "+String:C10(Table:C252(->[PURCHASE_INVOICES:37])))
		
		
		Input_Buttons(->[PURCHASE_INVOICES:37]; ->vButtDisPIJOB)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPIJOB)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Purch_InvJLPA"; ""; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Purchases"; ""; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPIJOB)
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Purch_InvJobLP"; $_t_oldMethodName)