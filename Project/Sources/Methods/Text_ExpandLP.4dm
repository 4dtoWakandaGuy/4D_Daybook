//%attributes = {}
If (False:C215)
	//Project Method Name:      Text_ExpandLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:03 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; NOPROC; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; TE_l_Pageshow)
	C_TEXT:C284($_t_oldMethodName; vButtDisTxt; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Text_ExpandLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		WS_AutoscreenSize(1; 0; 555; Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm)
		If (Not:C34(NOPROC))
			vButtDisTxt:="IMDPMOSSFSSSRCAXT"
			Input_Buttons(->[MODULES:63]; ->vButtDisTxt)  //Modules not Companies to avoid it running a Macro
		End if 
		If (TE_l_Pageshow>0)
			FORM GOTO PAGE:C247(TE_l_Pageshow)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		
		If (Not:C34(NOPROC))
			In_ButtChkDis(->vButtDisTxt)
		End if 
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		If (Not:C34(NOPROC))
			In_ButtCall(""; ""; ""; ->[MODULES:63]; ->[MODULES:63]Module:2; ""; ""; ""; ""; "")
		End if 
	: ($_l_Event=On Data Change:K2:15)
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("Text_ExpandLP"; $_t_oldMethodName)