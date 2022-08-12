//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>SCPT_EXECUTE)
	C_BOOLEAN:C305(<>ScrnSavEv; <>StartProc; $_bo_Command; $_bo_Shift)
	C_LONGINT:C283(<>SCPT_l_ExecutionProcess; <>SYS_l_CancelProcess; $_l_Process; DB_l_ButtonClickedFunction)
	C_TEXT:C284(<>Execute; <>Keys; $_t_Execute; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventW")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventW")

If (<>SCPT_l_ExecutionProcess>0)
	$_l_Process:=<>SCPT_l_ExecutionProcess
Else 
	$_l_Process:=Frontmost process:C327(*)
	
End if 

Case of 
	: (Mousedown=0)
		$_bo_Command:=(((Modifiers\256)%2)=1)
		Case of 
			: ($_bo_Command)
				$_bo_Shift:=(((Modifiers\512)%2)=1)
				Case of 
					: ((Keycode=87) | (Keycode=119))
						On_EventCmdW
					: ((Keycode=102) | (Keycode=70))
						//TRACE
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Find"))
						POST OUTSIDE CALL:C329($_l_Process)
					: ((Keycode=116) | (Keycode=84))
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Sort"))
						POST OUTSIDE CALL:C329($_l_Process)
					: (Keycode=46)
						RESUME PROCESS:C320($_l_Process)
						<>SYS_l_CancelProcess:=$_l_Process
					: ($_bo_Shift)
						Case of 
							: ((Keycode=72) | (Keycode=104))
								On_EventCmdH
							: ((Keycode=83) | (Keycode=115))
								On_EventCmdS
							: (Keycode=109)
								On_EventFKey
						End case 
					: ((Keycode=115) | (Keycode=83))
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Select"))
						POST OUTSIDE CALL:C329($_l_Process)
					: (<>StartProc)
						If ((Keycode=65) | (Keycode=97) | (Keycode=77) | (Keycode=109))
							<>Keys:=<>Keys+"§"+Char:C90(Keycode)
							If (Length:C16(<>Keys)>21)
								<>StartProc:=False:C215
							End if 
						End if 
				End case 
			: (Keycode<0)
				On_EventFKey
			: (<>StartProc)
				<>Keys:=<>Keys+Char:C90(Keycode)
				If (Length:C16(<>Keys)>21)
					<>StartProc:=False:C215
				End if 
			: (<>Execute="Wait @")
				On_Event_Wait
			: (<>SCPT_EXECUTE="Wait @")
				$_t_Execute:=<>SCPT_EXECUTE
				On_Event_Wait($_t_Execute)
		End case 
	: (Mousedown=1)
		Case of 
			: (<>Execute="Wait @")
				On_Event_Wait
			: (<>SCPT_EXECUTE="Wait @")
				$_t_Execute:=<>SCPT_EXECUTE
				On_Event_Wait($_t_Execute)
		End case 
		
End case 
<>ScrnSavEv:=True:C214
//ERR_MethodTrackerReturn ("On_EventW";$_t_oldMethodName)
