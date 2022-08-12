//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_BarPlay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:50 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>K; <>MenuProc; <>RecBarUp; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SCPT_l_RecordEdit; <>SYS_l_CancelProcess; $_l_FrontmostProcess; $1; $Bar; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(xPlus; xSearch; xSelect)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; DB_t_ButtonClickedFunction; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarPlay")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (vStatus="Play@")
	xSearch:=1
Else 
	If (<>RecText#"")
		<>SCPT_l_currentScriptProcess:=0
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Mer On"; 0)
		End if 
		
		If (vStatus="PlayPaused")
			BRING TO FRONT:C326(Frontmost process:C327(*))
			RESUME PROCESS:C320(<>SCPT_l_PlayerActive)
		Else 
			If (Count parameters:C259=1)  //called from Listing Palette, so same process poss
				$_l_FrontmostProcess:=Frontmost process:C327(*)
				If (([SCRIPTS:80]Same_Process:6) & ($_l_FrontmostProcess#<>MenuProc) & ($_l_FrontmostProcess#<>RecBarUp))
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("M:"))
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_t_ButtonClickedFunction; "M:"+[SCRIPTS:80]Script_Code:1)
					RESUME PROCESS:C320($_l_FrontmostProcess)
					DelayTicks(60)
					POST OUTSIDE CALL:C329($_l_FrontmostProcess)
					xSearch:=1
					vStatus:="Play"
				Else 
					<>SYS_l_CancelProcess:=0
					<>SCPT_l_PlayerActive:=New process:C317("Record_PlayP"; <>K*4; "Macro Playback"; [SCRIPTS:80]Script_Code:1)
					OBJECT SET ENABLED:C1123(xPlus; False:C215)
					OBJECT SET ENABLED:C1123(xSelect; False:C215)
					//_O_DISABLE BUTTON(xPlus)
					//_O_DISABLE BUTTON(xSelect)
					xSearch:=1
					vStatus:="Play"
				End if 
			Else 
				<>SYS_l_CancelProcess:=0
				<>SCPT_l_PlayerActive:=New process:C317("Record_PlayP"; <>K*4; "Macro Playback"; [SCRIPTS:80]Script_Code:1)
				//_O_DISABLE BUTTON(xPlus)
				//_O_DISABLE BUTTON(xSelect)
				OBJECT SET ENABLED:C1123(xPlus; False:C215)
				OBJECT SET ENABLED:C1123(xSelect; False:C215)
				
				xSearch:=1
				vStatus:="Play"
			End if 
		End if 
	Else 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Short On"; 0)
		End if 
		xSearch:=0
		If (<>SCPT_l_RecordEdit>0)
			xSelect:=1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_BarPlay"; $_t_oldMethodName)