If (False:C215)
	//Table Form Method Name: [COMPANIES]dAlert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; $_bo_Large; DB_bo_AlertReply; DB_bo_AlertTimeOut; DB_bo_NoLoad; SYS_bo_NoTrack)
	C_LONGINT:C283($_l_CharacterPosition; $_l_event; $_l_LineCount; $_l_MaxLength; DB_l_FormTImeCalled; DB_l_SetTimeOut)
	C_TEXT:C284(<>ButtOK; $_t_Confirm; $_t_Line; $_t_oldMethodName; Vconfirm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES]dAlert"; Form event code:C388)

If (Not:C34(SYS_bo_NoTrack))
	$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAlert"; Form event code:C388)
End if 
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Timer:K2:25)
		SHOW PROCESS:C325(Current process:C322)
		If (Frontmost process:C327(*)#Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		If (DB_bo_AlertTimeOut)
			
			
			If ((BP_Timestamp-DB_l_FormTImeCalled)>=DB_l_SetTimeOut)
				DB_bo_AlertReply:=True:C214  // this is set so the system knows it auto cancelled
				CANCEL:C270
			End if 
			
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//OpenHelp (Table(->[COMPANIES]);"dAlert")
		SET TIMER:C645(120)
		DB_l_FormTImeCalled:=BP_Timestamp
		
		$_l_MaxLength:=0
		$_l_LineCount:=1
		$_t_Confirm:=Vconfirm
		If ($_t_Confirm#"")
			Repeat 
				$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Confirm; *)
				If ($_l_CharacterPosition>0)
					$_l_LineCount:=$_l_LineCount+1
					$_t_Line:=Substring:C12($_t_Confirm; 1; $_l_CharacterPosition-1)
					$_t_Confirm:=Substring:C12($_t_Confirm; $_l_CharacterPosition+1; Length:C16($_t_Confirm))
					If (Length:C16($_t_Line)>$_l_MaxLength)
						$_l_MaxLength:=Length:C16($_t_Line)
					End if 
				Else 
					If (Length:C16($_t_Confirm)>$_l_MaxLength)
						$_l_MaxLength:=Length:C16($_t_Confirm)
					End if 
				End if 
				
			Until ($_l_CharacterPosition=0)
			$_bo_Large:=False:C215
		Else 
			$_l_MaxLength:=0
			$_bo_Large:=False:C215
		End if 
		
		If ($_l_MaxLength>200) | ($_l_LineCount>5)
			
			$_bo_Large:=True:C214
		End if 
		
		If ($_bo_Large)
			//HIDE WINDOW
			WS_AutoscreenSize(3; 224; 370)
			FORM GOTO PAGE:C247(2)
			//SHOW WINDOW
		Else 
			//HIDE WINDOW
			WS_AutoscreenSize(3; 156; 330)
			FORM GOTO PAGE:C247(1)
			//SHOW WINDOW
			
		End if 
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Alert"; 0)
		End if 
		INT_SetDialog(True:C214)
		
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
		//: (Outside call)
		//   In_ButtdCall
End case 
ERR_MethodTrackerReturn("FM:dAlert"; $_t_oldMethodName)
