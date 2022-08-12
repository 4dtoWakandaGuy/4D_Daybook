//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventRec
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
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoTrack; SYS_bo_NoTrack)
	C_LONGINT:C283(<>ButtProc; <>MenuProc; <>SCPT_l_PaletteWIndow; $_l_ClickPositionX; $_l_ClickPositionY; $_l_WaitTime; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284(<>RecText; $_t_oldMethodName; $_t_ScriptLine)
	C_TIME:C306(<>EvTime; $_ti_EventTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventRec")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventRec")
$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
SYS_bo_NoTrack:=True:C214
On_Event
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//GetMouse ($_l_ClickPositionX;$_l_ClickPositionY)
$_ti_EventTime:=Current time:C178
$_l_WaitTime:=$_ti_EventTime-<>EvTime
$_bo_Continue:=True:C214
If (Substring:C12(<>RecText; Length:C16(<>RecText)-5; 6)="Menu (")
	If (((KeyCode=49) | (Keycode=61)) & (Modifiers>0))
		$_bo_Continue:=False:C215
	Else 
		<>RecText:=Substring:C12(<>RecText; 1; Length:C16(<>RecText)-6)
		// ALERT("Recording Invalid")
	End if 
End if 

If ($_bo_Continue)
	Case of 
		: (Mousedown=1)
			Case of 
				: (MouseProc=<>ButtProc)
					If (($_l_WaitTime>1) & (<>RecText#""))
						If (Frontmost process:C327(*)=<>MenuProc)
							<>RecText:=<>RecText+"     Wait ("+String:C10($_l_WaitTime)+")"+Char:C90(13)
						Else 
							<>RecText:=<>RecText+"     Wait for State (2)"+Char:C90(13)
						End if 
						<>EvTime:=$_ti_EventTime
					End if 
					<>RecText:=<>RecText+"Button ("+String:C10(MouseX)+";"+String:C10(MouseY)+";"+String:C10(Modifiers)+")"+Char:C90(13)
				: (MouseProc=Get_ProcessNumber("Modules_Palette"))
					If (($_l_WaitTime>1) & (<>RecText#""))
						If (Frontmost process:C327(*)=<>MenuProc)
							<>RecText:=<>RecText+"     Wait ("+String:C10($_l_WaitTime)+")"+Char:C90(13)
						Else 
							<>RecText:=<>RecText+"     Wait for State (2)"+Char:C90(13)
						End if 
						<>EvTime:=$_ti_EventTime
					End if 
					If (Length:C16(<>RecText)>15)
						<>RecText:=<>RecText+Char:C90(13)
					End if 
					<>RecText:=<>RecText+"Menu ("
				: (MouseProc=<>SCPT_l_PaletteWIndow)
				Else 
					//  TopWPos ($_l_ClickPositionX;$_l_ClickPositionY)
					//+String($_l_ClickPositionX)+";"+String($_l_ClickPositionY)+";"
					If (($_l_WaitTime>1) & (<>RecText#""))
						If (Frontmost process:C327(*)=<>MenuProc)
							<>RecText:=<>RecText+"     Wait ("+String:C10($_l_WaitTime)+")"+Char:C90(13)
						Else 
							<>RecText:=<>RecText+"     Wait for State (2)"+Char:C90(13)
						End if 
						<>EvTime:=$_ti_EventTime
					End if 
					//  ◊RecText:=◊RecText+"MouseX "+String(MouseX)+" MouseY "+String(MouseY)+Char(13)
					If ((MouseX<-18) | (MouseY<-18)) | ((MouseX>2000) | (MouseY>2000) | (MouseProc=<>MenuProc))  //Menu item`2 were -18
						If (Length:C16(<>RecText)>15)
							<>RecText:=<>RecText+Char:C90(13)
						End if 
						<>RecText:=<>RecText+"Menu ("
					Else 
						
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						$_l_ClickPositionX:=MouseX+$_l_WindowLeft
						$_l_ClickPositionY:=MouseY+$_l_WindowTop
						
						$_t_ScriptLine:="Click ("+String:C10($_l_ClickPositionX)+";"+String:C10($_l_ClickPositionY)+";"+String:C10(Modifiers)+")"+Char:C90(13)
						If ((Modifiers=0) & (<>RecText=("@"+$_t_ScriptLine)))
							<>RecText:=Substring:C12(<>RecText; 1; Length:C16(<>RecText)-Length:C16($_t_ScriptLine))+"Double "+$_t_ScriptLine
						Else 
							<>RecText:=<>RecText+$_t_ScriptLine
						End if 
					End if 
			End case 
			
		: (Mousedown=0)
			
			If (Modifiers#256)  //Get rid of Mouse Up 128 but not if came from Postkey
				Modifiers:=Modifiers-128
			End if 
			
			If (Keycode#0)
				If (($_l_WaitTime>1) & (<>RecText#""))
					If (Frontmost process:C327(*)=<>MenuProc)
						<>RecText:=<>RecText+"     Wait ("+String:C10($_l_WaitTime)+")"+Char:C90(13)
					Else 
						<>RecText:=<>RecText+"     Wait for State (2)"+Char:C90(13)
					End if 
					<>EvTime:=$_ti_EventTime
				End if 
				Case of 
					: (Keycode=3)
						<>RecText:=<>RecText+"Accept"+Char:C90(13)
					: ((Keycode=46) & (Modifiers=256))
						<>RecText:=<>RecText+"Cancel"+Char:C90(13)
					: ((Keycode=8) & (Modifiers=0))
						<>RecText:=<>RecText+"Backspace"+Char:C90(13)
					: ((Keycode=13) & (Modifiers=0))
						<>RecText:=<>RecText+"Return"+Char:C90(13)
					: ((Keycode=9) & (Modifiers=0))
						<>RecText:=<>RecText+"Tab"+Char:C90(13)
						
					Else 
						If ((Keycode>31) & (Keycode#34) & (Keycode#59) & (Keycode#127))
							If (($_l_WaitTime<2) & (<>RecText=("@"+Char:C90(34)+";0)"+Char:C90(13))) & (Modifiers=0))
								<>RecText:=Substring:C12(<>RecText; 1; Length:C16(<>RecText)-5)+Char:C90(Keycode)+Char:C90(34)+";0)"+Char:C90(13)
							Else 
								<>RecText:=<>RecText+"Key ("+Char:C90(34)+Char:C90(Keycode)+Char:C90(34)+";"+String:C10(Modifiers)+")"+Char:C90(13)
							End if 
						Else 
							<>RecText:=<>RecText+"Key ("+String:C10(Keycode)+";"+String:C10(Modifiers)+")"+Char:C90(13)
						End if 
				End case 
			End if 
	End case 
End if 
SYS_bo_NoTrack:=$_bo_NoTrack
//`ERR_MethodTrackerReturn ("On_EventRec";$_t_oldMethodName)
