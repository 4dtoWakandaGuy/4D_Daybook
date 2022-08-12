//%attributes = {}
If (False:C215)
	//Project Method Name:      MAcro_exportConVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_noStop; $_bo_window; SCPT_bo_NoStop)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; $_l_CaseLevelNow; $_l_CharacterPosition; $_l_CharPosition; $_l_CurrentCaseLevel; $_l_CurrentIFLevel; $_l_CurrentProcess; $_l_IfLevelNOW; $_l_Index; $_l_PlayerActive; $_l_Process)
	C_LONGINT:C283($_l_wLevel; $_l_wLevelNow)
	C_TEXT:C284($_l_Result; $_t_Function; $_t_oldMethodName; $_t_Parameter1; $_t_Parameter2; $_t_Parameter3; $_t_pathName; $_t_TextToProcess; $1; Macro_F; SCPT_t_Description1)
	C_TEXT:C284(SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5; Vcomments; vMT; VMT2; VmTitle2; vMtitle3)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAcro_exportConVersion")
$_t_pathName:=$1

For ($_l_Index; 1; Records in selection:C76([SCRIPTS:80]))
	If (Is macOS:C1572)
		$_ti_DocumentRef:=DB_CreateDocument($_t_pathName+": "+[SCRIPTS:80]Script_Code:1; "TEXT")
	Else 
		$_ti_DocumentRef:=DB_CreateDocument($_t_pathName+"\\"+[SCRIPTS:80]Script_Code:1; "TEXT")
	End if 
	//`````````````
	SEND PACKET:C103($_ti_DocumentRef; "`Macro Code "+[SCRIPTS:80]Script_Code:1+Char:C90(13))
	SEND PACKET:C103($_ti_DocumentRef; "COMPILER_MACROS "+Char:C90(13))
	
	//SEND PACKET($_ti_DocumentRef;[MACROS]Recording Text)
	// Based onRecord_Play
	
	$_bo_window:=False:C215
	vMT:=[SCRIPTS:80]Recording_Text:4
	$_l_PlayerActive:=0
	$_l_CurrentIFLevel:=0
	$_l_IfLevelNOW:=0
	$_l_CurrentCaseLevel:=0
	$_l_CaseLevelNow:=0
	$_l_wLevel:=0
	$_l_wLevelNow:=0
	SCPT_t_Description1:=""
	SCPT_t_Description2:=""
	SCPT_t_Description3:=""
	SCPT_t_Description4:=""
	SCPT_t_Description5:=""
	<>SCPT_l_PlayerActive:=0
	SCPT_bo_NoStop:=$_bo_noStop
	If (<>SCPT_l_PlayerActive=686868)
		$_bo_noStop:=True:C214
		If ($_l_PlayerActive=0)
			<>SCPT_l_PlayerActive:=0
		End if 
	Else 
		$_bo_noStop:=False:C215
	End if 
	SCPT_bo_NoStop:=$_bo_noStop
	
	If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
		$_l_Process:=0
		$_l_CurrentProcess:=Current process:C322
		//$Right:=0
		
		// If (Length(Vmt)<255)
		//`  MESSAGE(Vmt)
		//Else
		//  Repeat
		//  If (Length(VMT2)>250)
		//   $TEXT:=Substring(VMT2;1;250)
		//  VMT2:=Substring(VMT2;251;Length(VMT2))
		// MESSAGE($text)
		//End if
		// Until (Length(VMT2)<251)
		// MESSAGE(VMT2)
		//End if
		Vcomments:=Vmt
		DISPLAY RECORD:C105([COMPANIES:2]; *)
		VMT2:=""
		
		While (Length:C16(vMT)>3)
			IDLE:C311  // 7/04/03 pb
			
			$_l_CharacterPosition:=Position:C15(Char:C90(13); vMT)
			If ($_l_CharacterPosition>0)
				$_t_TextToProcess:=Substring:C12(vMT; 1; $_l_CharacterPosition)
			Else 
				$_t_TextToProcess:=vMT
			End if 
			Macro_F:=""
			Record_PlayLine(->Macro_F)
			$_t_Function:=Macro_F
			Case of 
					
				: ($_t_Function="`@")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="*@")
					$_t_TextToProcess:="Macro_Reply "+"("+Char:C90(34)+vMtitle3+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="ITX @")
					$_t_TextToProcess:="Macro_ITXPLAY "+"("+Char:C90(34)+$_t_Function+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="IMA @")
					$_t_TextToProcess:="Macro_IMAPLAY"+"("+Char:C90(34)+VmTitle2+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Case of")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="End case")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="If")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Else")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="End If")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="While")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="End while")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="For")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
					
				: ($_t_Function="ForCont")
					
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="End for")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Repeat")
					
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Until")
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Message")
					$_bo_window:=True:C214
					$_t_TextToProcess:="C_LONGINT(CURMACWINDOW)"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)  //NEED TO MAKE SURE IT CLOSES!
					$_t_Parameter1:=First_Param(vMTitle2)
					$_t_TextToProcess:="Macro_MessagePLAY"+"("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Message End")
					$_bo_window:=False:C215
					$_t_TextToProcess:="MACRO_MESSAGEEND"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
					
				: ($_t_Function="Key")
					
					$_t_Parameter1:=First_Param(vMTitle2)
					$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
					If ($_t_Parameter1#"")
						If ($_t_Parameter1[[1]]=Char:C90(34))
							$_t_TextToProcess:="MACRO_KEY("+$_t_Parameter1+";"+$_t_Parameter2+")"+Char:C90(13)
						Else 
							$_t_TextToProcess:="MACRO_KEY("+Char:C90(34)+$_t_Parameter1+Char:C90(34)+";"+$_t_Parameter2+Char:C90(34)+")"+Char:C90(13)
						End if 
					End if 
					
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Click")
					$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
					$_t_TextToProcess:="MACRO_CLICK("+$_t_Parameter1+";"+$_t_Parameter2+";"+$_t_Parameter3+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Button")
					$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
					$_t_TextToProcess:="MACRO_BUTTON("+$_t_Parameter1+";"+$_t_Parameter2+";"+$_t_Parameter3+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: (($_t_Function="Confirm") | ($_t_Function="ConfirmT") | ($_t_Function="Confirm3") | ($_t_Function="Alert") | ($_t_Function="Request"))
					$_t_Parameter1:=First_Param(vMTitle2)
					$_t_TextToProcess:="GEN"+" "+$_t_Function+"("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Wait for State")
					$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
					$_t_TextToProcess:="MACRO_WaitforState ("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Wait")
					$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
					$_t_TextToProcess:="MACRO_Wait("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Pause")
					$_t_TextToProcess:="Record_PlayPaus"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Wait on Event")
					$_t_Parameter1:=First_Param(vMTitle2)
					$_t_TextToProcess:="Record_PlayWoE("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Double Click")
					$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
					$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
					$_t_TextToProcess:="Macro_DoubleClick("+$_t_Parameter1+";"+$_t_Parameter2+";"+$_t_Parameter3+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Menu")
					$_t_Parameter1:=(First_Param(vMTitle2))
					$_t_Parameter2:=(First_Param(vMTitle2))
					$_t_Parameter3:=(First_Param(vMTitle2))
					$_t_TextToProcess:="Record_PlayMenu("+$_t_Parameter1+";"+Char:C90(34)+$_t_Parameter2+";"+$_t_Parameter3+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Execute")
					$_l_CharPosition:=Position:C15("("; vMTitle3)
					If ($_l_CharPosition>0)
						$_t_Parameter1:=Substring:C12(vMTitle3; $_l_CharPosition+1; Length:C16(vMTitle3)-$_l_CharPosition-1)
						If ($_t_Parameter1#"")
							If (Record_PlayExec($_t_Parameter1))  //validate it
								$_t_TextToProcess:="$_t_Parameter1"+Char:C90(13)
								SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
							End if 
						End if 
					End if 
					
				: ($_t_Function="Evaluate")  //`Evaluate
					$_t_Parameter1:=""
					$_l_CharPosition:=Position:C15("("; vMTitle3)
					
					If ($_l_CharPosition>0)
						$_t_Parameter1:=Substring:C12(vMTitle3; $_l_CharPosition+1; Length:C16(vMTitle3)-$_l_CharPosition-1)
					End if 
					
					$_t_TextToProcess:="Record_PlayEval("+$_t_Parameter1+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Accept")
					$_t_TextToProcess:="Macro_Accept"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Cancel")
					$_t_TextToProcess:="Macro_CANCEL"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Return")
					$_t_TextToProcess:="Macro_return"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Tab")
					$_t_TextToProcess:="Macro_tab"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="New Record")
					$_t_TextToProcess:="Macro_newrecord"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: (($_t_Function="Next") | ($_t_Function="Previous") | ($_t_Function="Last") | ($_t_Function="First") | ($_t_Function="Find") | ($_t_Function="Select") | ($_t_Function="Sort") | ($_t_Function="Count"))
					$_t_TextToProcess:="Record_PlayButt("+Char:C90(34)+$_t_Function+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Find More Choices")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"FindO"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Select Inverse")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"SelectO"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Set Functions")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"Set"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Report Generator")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"Report"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Graph Generator")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"Graph"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Global Change")
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"Apply"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Dial@")  //Dial Optons is a second choice but is not currently used
					$_t_TextToProcess:="Record_PlayButt ("+Char:C90(34)+"Tel"+Char:C90(34)+")"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
					
				: ($_t_Function="Menus")
					$_t_TextToProcess:="Macro_MenusButton"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				: ($_t_Function="Backspace")
					$_t_TextToProcess:="Macro_Backspace"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
				Else 
					
					SEND PACKET:C103($_ti_DocumentRef; $_t_TextToProcess)
			End case 
			VMT2:=VMT2+$_t_TextToProcess
			Vcomments:=VMT2+Vmt
			DISPLAY RECORD:C105([COMPANIES:2]; *)
			
		End while 
		
		If ($_bo_window)
			SEND PACKET:C103($_ti_DocumentRef; "Close window"+Char:C90(13))
			
		End if 
		vMT:=$_l_Result
		//SCPT_t_Description1:=$Desc1
		//SCPT_t_Description2:=$Desc2
		//SCPT_t_Description3:=$Desc3
		//SCPT_t_Description4:=$Desc4
		//SCPT_t_Description5:=$Desc5
		
		//```````````````
	End if 
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	NEXT RECORD:C51([SCRIPTS:80])
End for 
ERR_MethodTrackerReturn("MAcro_exportConVersion"; $_t_oldMethodName)
