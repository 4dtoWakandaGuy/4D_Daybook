//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QualGroups_InLP
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

$_t_oldMethodName:=ERR_MethodTracker("QualGroups_InLP")
//Dont think this gets called anymore
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		vButtDisQUAL:=""
		QualGroups_InB
	: ($_l_Event=On Activate:K2:9)
		
		
		In_ButtChkDis(->vButtDisQUAL)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; "Minor_DelSin"; ->[QUALITY_GROUPS:56]; ->[QUALITY_GROUPS:56]Group:1; "Groups"; "1"; "QualGroups_InB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisQUAL)
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([QUALITY_GROUPS:56]Group:1))
				Check_Lists(->[QUALITY_GROUPS:56]Group:1; "Qual Groups")
				// If ([QUALITY GROUPS]Group#"")
				//  SET CHOICE LIST([QUALITY GROUPS]Group;"")
				//  Else
				//   SET CHOICE LIST([QUALITY GROUPS]Group;"Quality Groups")
				//  End if
				Macro_AccTypePt(->[QUALITY_GROUPS:56]Group:1)
			: (Modified:C32([QUALITY_GROUPS:56]SubGroup:2))
				[QUALITY_GROUPS:56]SubGroup:2:=Uppers2([QUALITY_GROUPS:56]SubGroup:2)
				Macro_AccTypePt(->[QUALITY_GROUPS:56]SubGroup:2)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//   PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("QualGroups_InLP"; $_t_oldMethodName)