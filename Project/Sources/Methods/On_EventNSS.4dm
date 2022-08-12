//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventNSS
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
	C_BOOLEAN:C305(<>StartProc; $_bo_Command; $_bo_Shift)
	C_LONGINT:C283(<>SYS_l_CancelProcess; DB_l_ButtonClickedFunction)
	C_TEXT:C284(<>Keys; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventNSS")

//$_t_oldMethodName:=ERR_MethodTracker (On_EventNSS)
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
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Find"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: ((Keycode=116) | (Keycode=84))
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Sort"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: (Keycode=46)
						RESUME PROCESS:C320(Frontmost process:C327(*))
						<>SYS_l_CancelProcess:=Frontmost process:C327(*)
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
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Select"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
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
		End case 
End case 
//ERR_MethodTrackerReturn (On_EventNSS;$_t_oldMethodName)
