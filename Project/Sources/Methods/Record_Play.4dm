//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_Play
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Record_Play
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_2DConjuctions; 0; 0)
	ARRAY TEXT:C222($_at_2DParameters; 0; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
	ARRAY TEXT:C222($_at_Commands; 0)
	ARRAY TEXT:C222($_at_ExternalBlocks; 0)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; $_bo_Continue; $_bo_End; $_bo_ExecuteOnServer; $_bo_InternetServer; $_bo_MinMacroOLD; $_bo_modified; $_bo_noStop; $_bo_OverrideScriptAccess; $_bo_WindowOpen; $3)
	C_BOOLEAN:C305(SCPT_bo_miniwindow; vMModified)
	C_LONGINT:C283(<>SYS_l_CancelProcess; <>SYS_l_WindowTop; $_l_BracketCheck1; $_l_BracketCheck2; $_l_BracketCounter; $_l_BracketPosition; $_l_CaseLevelNow; $_l_CharacterPosition; $_l_CloseCount; $_l_CountParameters; $_l_CurrentCaseLevel)
	C_LONGINT:C283($_l_CurrentIFLevel; $_l_CurrentProcess; $_l_IfLevelNOW; $_l_IndexLines; $_l_Memory; $_l_Mousey; $_l_NumberofLines; $_l_offset; $_l_Position; $_l_Position2; $_l_Position3)
	C_LONGINT:C283($_l_Position4; $_l_Process; $_l_ProcessNumber; $_l_Right; $_l_ScriptParsingProcess; $_l_StringLength; $_l_WLevel; $_l_WLevelNow; $_t_ScriptFunctionound; $1; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(MAC_l_MessageWindow; vMPage)
	C_OBJECT:C1216($_obj_NewScript)
	C_POINTER:C301($_ptr_Data; WS_P_FILEPOINTER)
	C_TEXT:C284(<>ButtDis; <>ButtPress; <>RecText; <>vMacroCode; $_t_Character; $_t_CheckString; $_t_CommandName; $_t_Commands; $_t_Conjunction; $_t_Description1; $_t_Description2)
	C_TEXT:C284($_t_Description3; $_t_Description4; $_t_Description5; $_t_ErrorMethodName; $_t_ExecuteText; $_t_MethodName; $_t_Mtitle3; $_t_oldMethodName; $_t_Parameter1; $_t_Parameter2; $_t_Parameter3)
	C_TEXT:C284($_t_Parameter4; $_t_ProcessVariable; $_t_Res; $_t_Result; $_t_ScriptFunction; $_t_ScriptText; $_t_TableNameWithBrackets; $_t_Text; $2; $4; Mac_T_MacroName)
	C_TEXT:C284(Mac_T_rErrorLineString; S_C_P_t_Return; SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5; vMT; vMTitle2; vMTitle3; vMTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_Play")
//Record_Play

If (Count parameters:C259>=4)
	Mac_T_MacroName:=$4
Else 
	Mac_T_MacroName:=[SCRIPTS:80]Script_Code:1
	
End if 
If (Count parameters:C259>=3)
	$_bo_OverrideScriptAccess:=$3
End if 

AAAM
$_bo_MinMacroOLD:=SCPT_bo_miniwindow
SCPT_bo_miniwindow:=True:C214
$_bo_WindowOpen:=False:C215
MESSAGES OFF:C175

$_t_Res:=vMT
$_bo_Continue:=True:C214
If (Count parameters:C259>=4)
	//TRACE
	If ([SCRIPTS:80]Script_Code:1#$4)
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$4)
	End if 
	
	//TRACE
	If (False:C215)
		If (True:C214)
			If ([SCRIPTS:80]ParsedStamp:24=0)  //| (True)
				READ WRITE:C146([SCRIPTS:80])
				LOAD RECORD:C52([SCRIPTS:80])
				
				[SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4)
				[SCRIPTS:80]Recording_Text:4:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
				If ([SCRIPTS:80]Recording_Text:4#"")
					MACRO_ParseForCode([SCRIPTS:80]Script_Code:1; False:C215)
				End if 
				SAVE RECORD:C53([SCRIPTS:80])
			Else 
				//`TRACE
				If ([SCRIPTS:80]ParsedStamp:24<([SCRIPTS:80]ModifiedStamp:23-100))
					READ WRITE:C146([SCRIPTS:80])
					LOAD RECORD:C52([SCRIPTS:80])
					[SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4)
					[SCRIPTS:80]Recording_Text:4:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
					If ([SCRIPTS:80]Recording_Text:4#"")
						MACRO_ParseForCode([SCRIPTS:80]Script_Code:1; False:C215)
					End if 
					SAVE RECORD:C53([SCRIPTS:80])
				End if 
			End if 
			If ([SCRIPTS:80]ParsedStamp:24>=([SCRIPTS:80]ModifiedStamp:23-100))
				//the parsed stamp will be slighty behind the modified stamp
				$_bo_Continue:=False:C215
				ARRAY TEXT:C222($_at_Commands; 0)
				ARRAY TEXT:C222($_at_ExternalBlocks; 0)
				ARRAY TEXT:C222($_at_2DParameters; 0; 0)
				ARRAY TEXT:C222($_at_2DConjuctions; 0; 0)
				ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
				$_l_offset:=0
				BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_l_NumberofLines; $_l_offset)
				ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
				ARRAY TEXT:C222($_at_2DConjuctions; $_l_NumberofLines; 0)
				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
				For ($_l_IndexLines; 1; $_l_NumberofLines)
					BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DTextBlocks{$_l_IndexLines}; $_l_offset)
				End for 
				BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_Commands; $_l_offset)
				BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_ExternalBlocks; $_l_offset)
				For ($_l_IndexLines; 1; $_l_NumberofLines)
					BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DParameters{$_l_IndexLines}; $_l_offset)
				End for 
				For ($_l_IndexLines; 1; $_l_NumberofLines)
					BLOB TO VARIABLE:C533([SCRIPTS:80]Parsed_Script:20; $_at_2DConjuctions{$_l_IndexLines}; $_l_offset)
				End for 
				
				
				
				//Record_Play (1;◊RecText)
				//Gen_Confirm ("old or new";"NEW";"OLD")
				
				If (OK=1)
					Mac_T_MacroName:=[SCRIPTS:80]Script_Code:1
					If (False:C215)
						
						If (DB_GetModuleSettingByNUM(Module_Macros)>1) | ($_bo_OverrideScriptAccess)
							Macro_Play(0; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_2DConjuctions)
							If (MAC_l_MessageWindow>0)
								MAC_l_MessageWindow:=0
								CLOSE WINDOW:C154
							End if 
						End if 
					Else 
						ON ERR CALL:C155("Error_Macro")
						Compiler_Variables
						Compiler_Variables_Inter
						$_bo_InternetServer:=((DB_GetModuleSettingByNUM(Module_IntServer))>1)
						[SCRIPTS:80]Recording_Text:4:=SCRIPT_Parse([SCRIPTS:80]Recording_Text:4)
						
						//$_obj_NewScript:=[SCRIPTS]Recording_Text
						
					End if 
				Else 
					$_bo_Continue:=True:C214
				End if 
				
				
				OK:=1
				
			Else 
				$_l_ScriptParsingProcess:=New process:C317("SCPT_UpdateParsing"; 256000; "Script Parse"; *)
				
				$_bo_Continue:=True:C214
			End if 
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
$_t_ErrorMethodName:=Method called on error:C704
If ($_bo_Continue)
	If (Count parameters:C259>=2)  //Rollo 8/10/2004
		//Gen_Alert (String(Length($2)))
		$_t_ScriptText:=$2
	Else 
		//ng april 2020 where is this set
		$_t_ScriptText:=<>RecText  //first to minimise risk of conflict
	End if 
	$_t_ScriptText:=Macro_PlatformTranslate(->$_t_ScriptText; 0)
	If (False:C215)
		$_l_CharacterPosition:=Position:C15(Char:C90(13)+Char:C90(13); vMT)
		If ($_l_CharacterPosition>0)
			Repeat 
				//IDLE
				vMT:=Replace string:C233(vMT; Char:C90(13)+Char:C90(13); Char:C90(13))
				
			Until (Position:C15(Char:C90(13)+Char:C90(13); vMT)=0)
		End if 
		
		$_t_Description1:=SCPT_t_Description1
		$_t_Description2:=SCPT_t_Description2
		$_t_Description3:=SCPT_t_Description3
		$_t_Description4:=SCPT_t_Description4
		$_t_Description5:=SCPT_t_Description5
		
		$_l_CountParameters:=Count parameters:C259
		If (Count parameters:C259>=1)
			$_l_CountParameters:=$1
		End if 
		
		ON ERR CALL:C155("Error_Macro")
		
		$_l_CurrentIFLevel:=0
		$_l_IfLevelNOW:=0
		$_l_CurrentCaseLevel:=0
		$_l_CaseLevelNow:=0
		$_l_WLevel:=0
		$_l_WLevelNow:=0
		SCPT_t_Description1:=""
		SCPT_t_Description2:=""
		SCPT_t_Description3:=""
		SCPT_t_Description4:=""
		SCPT_t_Description5:=""
		
		$_bo_noStop:=True:C214
		
		
		If (DB_GetModuleSettingByNUM(Module_Macros)>1) | ($_bo_OverrideScriptAccess)
			
			$_l_Process:=0
			$_l_CurrentProcess:=Current process:C322
			$_l_Right:=0
			
			While ((Length:C16(vMT)>3) & (($_bo_noStop)) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
				$_t_ScriptFunction:=""
				Record_PlayLine(->$_t_ScriptFunction)
				$_t_ScriptFunction:=$_t_ScriptFunction
				Mac_T_rErrorLineString:=$_t_ScriptFunction
				
				Case of 
						
					: ($_t_ScriptFunction="`@")
					: ($_t_ScriptFunction="*@")
						If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
							
							IME_Reply(vMTitle3)
						End if 
						
					: ($_t_ScriptFunction="ITX @")
						If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
							
							IME_ITXPlay($_t_ScriptFunction)
						End if 
						
					: ($_t_ScriptFunction="IMA @")
						If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
							
							IME_IMAPlay($_t_ScriptFunction)
						End if 
						
					: ($_t_ScriptFunction="Case of")
						$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
						$_l_CaseLevelNow:=$_l_CurrentCaseLevel
						$_l_IfLevelNOW:=$_l_CurrentIFLevel
						$_bo_End:=False:C215
						$_t_Text:=""
						$_t_ScriptFunctionound:=0
						While ((Length:C16(vMT)>3) & (($_bo_noStop)) & ($_bo_End=False:C215))
							IDLE:C311  // 7/04/03 pb
							$_t_ScriptFunction:=""
							Record_PlayLine(->$_t_ScriptFunction)
							$_t_ScriptFunction:=$_t_ScriptFunction
							Case of 
								: ($_t_ScriptFunction=":")
									If ($_l_CaseLevelNow=$_l_CurrentCaseLevel)
										If ($_t_ScriptFunctionound=1)
											$_t_ScriptFunctionound:=2
										Else 
											If ($_t_ScriptFunctionound=0)
												$_l_BracketPosition:=Position:C15("("; vMTitle3)
												If ($_l_BracketPosition>0)
													$_t_Conjunction:=""
													vMModified:=False:C215
													Repeat 
														$_l_Position2:=0
														$_l_CloseCount:=0
														For ($_l_BracketCounter; $_l_BracketPosition+1; Length:C16(vMTitle3))
															$_t_CheckString:=Substring:C12(vmTitle3; $_l_BracketCounter; Length:C16(vmTitle3))
															$_l_BracketCheck1:=Position:C15("("; $_t_CheckString)
															If ($_l_BracketCheck1>0)
																//is an opening bracket
																$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
																If ($_l_BracketCheck2>0)
																	//is a closing bracket
																	If ($_l_BracketCheck2<$_l_BracketCheck1)
																		//closing bracket is before opening bracket(goto closing bracket)
																		$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
																	Else 
																		//closing bracket is after opening bracket(go to opening bracket)
																		$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
																	End if 
																Else 
																	//no closing brackets..go to opening bracket
																	$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
																End if 
															Else 
																//No opening brackets
																$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
																If ($_l_BracketCheck2>0)
																	$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
																Else 
																	//no more brackets
																	$_l_BracketCounter:=Length:C16(VmTitle3)
																End if 
															End if 
															
															
															If (vMTitle3[[$_l_BracketCounter]]="(")
																$_l_CloseCount:=$_l_CloseCount+1
															End if 
															If (vMTitle3[[$_l_BracketCounter]]=")")
																If ($_l_CloseCount=0)
																	$_l_BracketPosition:=$_l_BracketCounter
																	$_l_BracketCounter:=Length:C16(vMTitle3)
																Else 
																	$_l_CloseCount:=$_l_CloseCount-1
																End if 
															End if 
														End for 
														
														//$_l_Position2:=Position(")";vMTitle3)
														If ($_l_BracketPosition=0)
															$_l_BracketPosition:=Length:C16(VMTITLE3)
														End if 
														$_t_Mtitle3:=Substring:C12(VMTITLE3; $_l_BracketPosition+1; Length:C16(VMTITLE3))
														$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; $_l_BracketPosition-($_l_BracketPosition+1))
														If ($_t_Parameter1#"")
															
															MESSAGES OFF:C175
															Case of 
																: ($_t_Conjunction="&")
																	$_bo_modified:=vMModified
																	EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
																	vMModified:=vMModified & $_bo_modified
																: ($_t_Conjunction="|")
																	$_bo_modified:=vMModified
																	EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
																	vMModified:=vMModified | $_bo_modified
																Else 
																	EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
															End case 
														End if 
														If ($_t_Mtitle3#"")
															VMTITLE3:=$_t_Mtitle3
															$_t_Mtitle3:=""
															$_l_BracketPosition:=Position:C15("("; vMTitle3)
															If ($_l_BracketPosition>0)
																$_t_Conjunction:=Substring:C12(VMTITLE3; 1; $_l_BracketPosition-1)
																Case of 
																	: (Position:C15("&"; $_t_Conjunction)>0)
																		$_t_Conjunction:="&"
																	: (Position:C15("|"; $_t_Conjunction)>0)
																		$_t_Conjunction:="|"
																	Else 
																		//NO CONJUCTION SO IGNORE THE STATEMENT
																		VMTITLE3:=""
																End case 
															Else 
																VMTITLE3:=""
															End if 
														Else 
															VMTITLE3:=""
														End if 
													Until (VMTITLE3="")
													If (vMModified)
														$_t_ScriptFunctionound:=1
													Else 
														
													End if 
													
												End if 
											End if 
										End if 
									Else 
										If ($_t_ScriptFunctionound=1)
											$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
										End if 
									End if 
									
								: ($_t_ScriptFunction="Case of")
									$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
									If ($_t_ScriptFunctionound=1)
										$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
									End if 
								: ($_t_ScriptFunction="If")
									$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
									If ($_t_ScriptFunctionound=1)
										$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
									End if 
								: ($_t_ScriptFunction="Else")
									If (($_l_CurrentIFLevel=$_l_IfLevelNOW) & ($_l_CurrentCaseLevel=$_l_CaseLevelNow) & ($_t_ScriptFunctionound=0))
										$_t_ScriptFunctionound:=1
									Else 
										If (($_l_CurrentIFLevel=$_l_IfLevelNOW) & ($_l_CurrentCaseLevel=$_l_CaseLevelNow) & ($_t_ScriptFunctionound=1))
											$_t_ScriptFunctionound:=2
										Else 
											If ($_t_ScriptFunctionound=1)
												$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
											End if 
										End if 
									End if 
								: ($_t_ScriptFunction="End case")
									If ($_l_CurrentCaseLevel=$_l_CaseLevelNow)
										$_bo_End:=True:C214
									Else 
										$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel-1
										If ($_t_ScriptFunctionound=1)
											$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
										End if 
									End if 
								: ($_t_ScriptFunction="End If")
									$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
									If ($_t_ScriptFunctionound=1)
										$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
									End if 
								Else 
									If ($_t_ScriptFunctionound=1)
										$_t_Text:=$_t_Text+vMTitle3+Char:C90(13)
									End if 
							End case 
						End while 
						vMT:=$_t_Text+vMT
						
					: ($_t_ScriptFunction="End case")
						
					: ($_t_ScriptFunction="If")
						$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
						$_l_BracketPosition:=Position:C15("("; vMTitle3)
						
						//``````
						If ($_l_BracketPosition>0)
							$_t_Conjunction:=""
							vMModified:=False:C215
							Repeat 
								$_l_CloseCount:=0
								$_l_BracketPosition:=0
								For ($_l_BracketCounter; $_l_BracketPosition+1; Length:C16(vMTitle3))
									$_t_CheckString:=Substring:C12(vmTitle3; $_l_BracketCounter; Length:C16(vmTitle3))
									$_l_BracketCheck1:=Position:C15("("; $_t_CheckString)
									
									If ($_l_BracketCheck1>0)
										//is an opening bracket
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											//is a closing bracket
											If ($_l_BracketCheck2<$_l_BracketCheck1)
												//closing bracket is before opening bracket(goto closing bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
											Else 
												//closing bracket is after opening bracket(go to opening bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
											End if 
										Else 
											//no closing brackets..go to opening bracket
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
										End if 
									Else 
										//No opening brackets
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
										Else 
											//no more brackets
											$_l_BracketCounter:=Length:C16(VmTitle3)
										End if 
									End if 
									
									If (vMTitle3[[$_l_BracketCounter]]="(")
										$_l_CloseCount:=$_l_CloseCount+1
									End if 
									If (vMTitle3[[$_l_BracketCounter]]=")")
										If ($_l_CloseCount=0)
											$_l_BracketPosition:=$_l_BracketCounter
											$_l_BracketCounter:=Length:C16(vMTitle3)
										Else 
											$_l_CloseCount:=$_l_CloseCount-1
										End if 
									End if 
								End for 
								//$_l_Position2:=Position(")";vMTitle3)
								
								If ($_l_BracketPosition=0)
									$_l_BracketPosition:=Length:C16(VMTITLE3)
								End if 
								$_t_Mtitle3:=Substring:C12(VMTITLE3; $_l_BracketPosition+1; Length:C16(VMTITLE3))
								$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; $_l_BracketPosition-($_l_BracketPosition+1))
								If ($_t_Parameter1#"")
									
									MESSAGES OFF:C175
									Case of 
										: ($_t_Conjunction="&")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified & $_bo_modified
										: ($_t_Conjunction="|")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified | $_bo_modified
										Else 
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
									End case 
								End if 
								If ($_t_Mtitle3#"")
									VMTITLE3:=$_t_Mtitle3
									$_t_Mtitle3:=""
									$_l_BracketPosition:=Position:C15("("; vMTitle3)
									If ($_l_BracketPosition>0)
										$_t_Conjunction:=Substring:C12(VMTITLE3; 1; $_l_BracketPosition-1)
										Case of 
											: (Position:C15("&"; $_t_Conjunction)>0)
												$_t_Conjunction:="&"
											: (Position:C15("|"; $_t_Conjunction)>0)
												$_t_Conjunction:="|"
											Else 
												//NO CONJUCTION SO IGNORE THE STATEMENT
												VMTITLE3:=""
										End case 
									Else 
										VMTITLE3:=""
									End if 
								Else 
									VMTITLE3:=""
								End if 
							Until (VMTITLE3="")
							If (vMModified=False:C215)
								$_l_IfLevelNOW:=$_l_CurrentIFLevel
								$_l_CaseLevelNow:=$_l_CurrentCaseLevel
								$_bo_End:=False:C215
								While ((Length:C16(vMT)>3) & (($_bo_noStop)) & ($_bo_End=False:C215))
									IDLE:C311  // 7/04/03 pb
									$_t_ScriptFunction:=""
									Record_PlayLinS(->$_t_ScriptFunction)
									$_t_ScriptFunction:=$_t_ScriptFunction
									
									Case of 
										: ($_t_ScriptFunction="If")
											$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
										: ($_t_ScriptFunction="Case of")
											$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
										: ($_t_ScriptFunction="Else")
											If (($_l_CurrentIFLevel=$_l_IfLevelNOW) & ($_l_CurrentCaseLevel=$_l_CaseLevelNow))
												$_bo_End:=True:C214
											End if 
										: ($_t_ScriptFunction="End If")
											If ($_l_CurrentIFLevel=$_l_IfLevelNOW)
												$_bo_End:=True:C214
											End if 
											$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
										: ($_t_ScriptFunction="End case")
											$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel-1
									End case 
								End while 
							End if 
							
							
						End if 
						
						//```````
						
						
					: ($_t_ScriptFunction="Else")
						$_l_IfLevelNOW:=$_l_CurrentIFLevel
						$_bo_End:=False:C215
						While ((Length:C16(vMT)>3) & (($_bo_noStop)) & ($_bo_End=False:C215))
							IDLE:C311  // 7/04/03 pb
							$_t_ScriptFunction:=""
							Record_PlayLinS(->$_t_ScriptFunction)
							$_t_ScriptFunction:=$_t_ScriptFunction
							Case of 
								: ($_t_ScriptFunction="If")
									$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
								: ($_t_ScriptFunction="End If")
									If ($_l_CurrentIFLevel=$_l_IfLevelNOW)
										$_bo_End:=True:C214
									End if 
									$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
							End case 
						End while 
						
					: ($_t_ScriptFunction="End If")
						$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
						
					: ($_t_ScriptFunction="While")
						$_l_WLevel:=$_l_WLevel+1
						$_l_BracketPosition:=Position:C15("("; vMTitle3)
						
						If ($_l_BracketPosition>0)
							$_t_Conjunction:=""
							vMModified:=False:C215
							Repeat 
								$_l_CloseCount:=0
								$_l_BracketPosition:=0
								For ($_l_BracketCounter; $_l_BracketPosition+1; Length:C16(vMTitle3))
									$_t_CheckString:=Substring:C12(vmTitle3; $_l_BracketCounter; Length:C16(vmTitle3))
									$_l_BracketCheck1:=Position:C15("("; $_t_CheckString)
									If ($_l_BracketCheck1>0)
										//is an opening bracket
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											//is a closing bracket
											If ($_l_BracketCheck2<$_l_BracketCheck1)
												//closing bracket is before opening bracket(goto closing bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
											Else 
												//closing bracket is after opening bracket(go to opening bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
											End if 
										Else 
											//no closing brackets..go to opening bracket
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
										End if 
									Else 
										//No opening brackets
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
										Else 
											//no more brackets
											$_l_BracketCounter:=Length:C16(VmTitle3)
										End if 
									End if 
									
									
									If (vMTitle3[[$_l_BracketCounter]]="(")
										$_l_CloseCount:=$_l_CloseCount+1
									End if 
									If (vMTitle3[[$_l_BracketCounter]]=")")
										If ($_l_CloseCount=0)
											$_l_BracketPosition:=$_l_BracketCounter
											$_l_BracketCounter:=Length:C16(vMTitle3)
										Else 
											$_l_CloseCount:=$_l_CloseCount-1
										End if 
									End if 
								End for 
								//$_l_BracketPosition:=Position(")";vMTitle3)
								If ($_l_BracketPosition=0)
									$_l_BracketPosition:=Length:C16(VMTITLE3)
								End if 
								$_t_Mtitle3:=Substring:C12(VMTITLE3; $_l_BracketPosition+1; Length:C16(VMTITLE3))
								$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; $_l_BracketPosition-($_l_BracketPosition+1))
								If ($_t_Parameter1#"")
									
									MESSAGES OFF:C175
									Case of 
										: ($_t_Conjunction="&")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified & $_bo_modified
										: ($_t_Conjunction="|")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified | $_bo_modified
										Else 
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
									End case 
								End if 
								If ($_t_Mtitle3#"")
									VMTITLE3:=$_t_Mtitle3
									$_t_Mtitle3:=""
									$_l_BracketPosition:=Position:C15("("; vMTitle3)
									If ($_l_BracketPosition>0)
										$_t_Conjunction:=Substring:C12(VMTITLE3; 1; $_l_BracketPosition-1)
										Case of 
											: (Position:C15("&"; $_t_Conjunction)>0)
												$_t_Conjunction:="&"
											: (Position:C15("|"; $_t_Conjunction)>0)
												$_t_Conjunction:="|"
											Else 
												//NO CONJUCTION SO IGNORE THE STATEMENT
												VMTITLE3:=""
										End case 
									Else 
										VMTITLE3:=""
									End if 
								Else 
									VMTITLE3:=""
								End if 
							Until (VMTITLE3="")
							If (vMModified)
								$_ptr_Data:=Get pointer:C304("vMDesc"+String:C10($_l_WLevel))
								$_ptr_Data->:="While ("+$_t_Parameter1+")"+Char:C90(13)+vMT
							Else 
								$_l_WLevel:=Record_PlayWEnd($_l_WLevel)
							End if 
							
							
							
							
							
							
						End if 
						
					: ($_t_ScriptFunction="End while")
						If ($_l_WLevel>0)
							Record_PlayvMT($_l_WLevel)
							$_l_WLevel:=$_l_WLevel-1
						End if 
						
					: ($_t_ScriptFunction="For")
						$_t_Parameter1:=First_Param(vMTitle2)
						$_t_Parameter2:=First_Param(vMTitle2)
						$_t_Parameter3:=First_Param(vMTitle2)
						$_t_Parameter4:=First_Param(vMTitle2)
						If (($_t_Parameter1#"") & ($_t_Parameter2#"") & ($_t_Parameter3#""))
							MESSAGES OFF:C175
							EXECUTE FORMULA:C63("vMPage:="+$_t_Parameter3)
							$_l_Position3:=vMPage
							If ($_t_Parameter4="")
								$_l_Position4:=1
							Else 
								MESSAGES OFF:C175
								EXECUTE FORMULA:C63("vMPage:="+$_t_Parameter4)
								$_l_Position4:=vMPage
								If ($_l_Position4=0)
									$_l_Position4:=1
								End if 
							End if 
							MESSAGES OFF:C175
							EXECUTE FORMULA:C63($_t_Parameter1+":="+$_t_Parameter2)
							EXECUTE FORMULA:C63("vMPage:="+$_t_Parameter1)
							$_l_WLevel:=$_l_WLevel+1
							If (((vMPage<=$_l_Position3) & ($_l_Position4>=0)) | ((vMPage>=$_l_Position3) & ($_l_Position4<0)))
								$_ptr_Data:=Get pointer:C304("vMDesc"+String:C10($_l_WLevel))
								$_ptr_Data->:="ForCont ("+$_t_Parameter1+";1;"+String:C10($_l_Position3)+";"+String:C10($_l_Position4)+")"+Char:C90(13)+vMT
							Else 
								$_l_WLevel:=Record_PlayWEnd($_l_WLevel)
							End if 
						End if 
						
					: ($_t_ScriptFunction="ForCont")
						$_t_Parameter1:=First_Param(vMTitle2)
						$_t_Parameter2:=First_Param(vMTitle2)
						$_t_Parameter3:=First_Param(vMTitle2)
						$_t_Parameter4:=First_Param(vMTitle2)
						If (($_t_Parameter1#"") & ($_t_Parameter2#"") & ($_t_Parameter3#""))
							$_l_Position3:=Num:C11($_t_Parameter3)
							$_l_Position4:=Num:C11($_t_Parameter4)
							MESSAGES OFF:C175
							EXECUTE FORMULA:C63($_t_Parameter1+":="+$_t_Parameter1+"+"+$_t_Parameter4)
							EXECUTE FORMULA:C63("vMPage:="+$_t_Parameter1)
							If (((vMPage<=$_l_Position3) & ($_l_Position4>=0)) | ((vMPage>=$_l_Position3) & ($_l_Position4<0)))
							Else 
								$_l_WLevel:=Record_PlayWEnd($_l_WLevel)
							End if 
						End if 
						
					: ($_t_ScriptFunction="End for")
						If ($_l_WLevel>0)
							Record_PlayvMT($_l_WLevel)
						End if 
						
					: ($_t_ScriptFunction="Repeat")
						$_l_WLevel:=$_l_WLevel+1
						$_ptr_Data:=Get pointer:C304("vMDesc"+String:C10($_l_WLevel))
						$_ptr_Data->:=vMT
						
					: ($_t_ScriptFunction="Until")
						$_l_BracketPosition:=Position:C15("("; vMTitle3)
						
						If ($_l_BracketPosition>0)
							$_t_Conjunction:=""
							vMModified:=False:C215
							Repeat 
								$_l_CloseCount:=0
								$_l_BracketPosition:=0
								For ($_l_BracketCounter; $_l_BracketPosition+1; Length:C16(vMTitle3))
									$_t_CheckString:=Substring:C12(vmTitle3; $_l_BracketCounter; Length:C16(vmTitle3))
									$_l_BracketCheck1:=Position:C15("("; $_t_CheckString)
									If ($_l_BracketCheck1>0)
										//is an opening bracket
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											//is a closing bracket
											If ($_l_BracketCheck2<$_l_BracketCheck1)
												//closing bracket is before opening bracket(goto closing bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
											Else 
												//closing bracket is after opening bracket(go to opening bracket)
												$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
											End if 
										Else 
											//no closing brackets..go to opening bracket
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck1-1)
										End if 
									Else 
										//No opening brackets
										$_l_BracketCheck2:=Position:C15(")"; $_t_CheckString)
										If ($_l_BracketCheck2>0)
											$_l_BracketCounter:=$_l_BracketCounter+($_l_BracketCheck2-1)
										Else 
											//no more brackets
											$_l_BracketCounter:=Length:C16(VmTitle3)
										End if 
									End if 
									
									
									If (vMTitle3[[$_l_BracketCounter]]="(")
										$_l_CloseCount:=$_l_CloseCount+1
									End if 
									If (vMTitle3[[$_l_BracketCounter]]=")")
										If ($_l_CloseCount=0)
											$_l_BracketPosition:=$_l_BracketCounter
											$_l_BracketCounter:=Length:C16(vMTitle3)
										Else 
											$_l_CloseCount:=$_l_CloseCount-1
										End if 
									End if 
								End for 
								
								//$_l_Position2:=Position(")";vMTitle3)
								If ($_l_BracketPosition=0)
									$_l_BracketPosition:=Length:C16(VMTITLE3)
								End if 
								$_t_Mtitle3:=Substring:C12(VMTITLE3; $_l_BracketPosition+1; Length:C16(VMTITLE3))
								$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; $_l_BracketPosition-($_l_BracketPosition+1))
								If ($_t_Parameter1#"")
									
									MESSAGES OFF:C175
									Case of 
										: ($_t_Conjunction="&")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified & $_bo_modified
										: ($_t_Conjunction="|")
											$_bo_modified:=vMModified
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
											vMModified:=vMModified | $_bo_modified
										Else 
											EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
									End case 
								End if 
								If ($_t_Mtitle3#"")
									VMTITLE3:=$_t_Mtitle3
									$_t_Mtitle3:=""
									$_l_BracketPosition:=Position:C15("("; vMTitle3)
									If ($_l_BracketPosition>0)
										$_t_Conjunction:=Substring:C12(VMTITLE3; 1; $_l_BracketPosition-1)
										Case of 
											: (Position:C15("&"; $_t_Conjunction)>0)
												$_t_Conjunction:="&"
											: (Position:C15("|"; $_t_Conjunction)>0)
												$_t_Conjunction:="|"
											Else 
												//NO CONJUCTION SO IGNORE THE STATEMENT
												VMTITLE3:=""
										End case 
									Else 
										VMTITLE3:=""
									End if 
								Else 
									VMTITLE3:=""
								End if 
							Until (VMTITLE3="")
							If (vMModified=False:C215)
								Record_PlayvMT($_l_WLevel)
								$_l_WLevel:=$_l_WLevel+1
							End if 
							
							
							
							
							
							
						End if 
						
						
						
						$_l_WLevel:=$_l_WLevel-1
						
					: ($_t_ScriptFunction="Message")
						$_bo_WindowOpen:=True:C214
						$_t_Parameter1:=First_Param(vMTitle2)
						$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
						If ($_l_Right=0)
							$_l_Right:=Record_MessWin($_t_Parameter2)
						End if 
						If ($_t_Parameter1#"")
							vMTitle3:=""
							MESSAGES OFF:C175
							EXECUTE FORMULA:C63("vMTitle3:="+$_t_Parameter1)
							If (vMTitle3#"")
								vMTitle4:=vMTitle3
								HIGHLIGHT TEXT:C210(vMTitle4; 32000; 32000)
								DISPLAY RECORD:C105([SCRIPTS:80])
							End if 
						End if 
						
					: ($_t_ScriptFunction="Message End")
						$_bo_WindowOpen:=False:C215
						$_l_Right:=0
						CLOSE WINDOW:C154
						
					: ($_t_ScriptFunction="Key")
						$_t_Parameter1:=First_Param(vMTitle2)
						$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
						If ($_t_Parameter1#"")
							If (Character code:C91(Substring:C12($_t_Parameter1; 1; 1))=34)
								$_t_Parameter1:=STR_RemQuote($_t_Parameter1)
								If (Length:C16($_t_Parameter1)=1)
									$_l_Mousey:=Num:C11($_t_Parameter2)
									If (($_l_Mousey/256)=Abs:C99($_l_Mousey/256))
										If (<>SCPT_bo_NoAutoScripts=False:C215)
											If ($_t_Parameter1=" ")
												PLAY:C290("Key Space")
											Else 
												PLAY:C290("Key 1")
											End if 
										End if 
										Gen_PostKey(0; Character code:C91($_t_Parameter1); $_l_Position2)
									End if 
								Else 
									If (<>SCPT_bo_NoAutoScripts=False:C215)
										Play_Words($_t_Parameter1)
									End if 
									$_l_Position:=1
									While ($_l_Mousey<=Length:C16($_t_Parameter1))
										Gen_PostKey(0; Character code:C91(Substring:C12($_t_Parameter1; $_l_Position; 1)); 0)
										$_l_Position:=$_l_Position+1
									End while 
								End if 
							Else 
								$_l_Position:=Num:C11($_t_Parameter1)
								$_l_Position2:=Num:C11($_t_Parameter2)
								If (($_l_Position>0) & ($_l_Position<256) & (($_l_Position2=0) | (($_l_Position2/256)=Abs:C99($_l_Position2/256))))
									$_l_Position2:=Num:C11($_t_Parameter2)
									If (<>SCPT_bo_NoAutoScripts=False:C215)
										If ($_l_Position=32)
											PLAY:C290("Key Space")
										Else 
											PLAY:C290("Key 1")
										End if 
									End if 
									Gen_PostKey(0; $_l_Position; $_l_Position2)
								End if 
							End if 
						End if 
						
					: ($_t_ScriptFunction="Click")
						//
						
						$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
						$_l_BracketPosition:=0
						$_l_Position2:=0
						$_l_BracketPosition:=$_l_BracketPosition+Num:C11($_t_Parameter1)
						$_l_Position2:=$_l_Position2+Num:C11($_t_Parameter2)
						$_l_Position3:=Num:C11($_t_Parameter3)
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Click"; 0)
						End if 
						//PostClick (0;$_l_Position2;$_l_BracketPosition;$_l_Position3)
						POST CLICK:C466($_l_Position2; $_l_BracketPosition)
					: ($_t_ScriptFunction="Button")
						//
						
						$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
						$_l_BracketPosition:=Num:C11($_t_Parameter1)+2
						$_l_Position2:=Num:C11($_t_Parameter2)+22+<>SYS_l_WindowTop
						$_l_Position3:=Num:C11($_t_Parameter3)
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Click"; 0)
						End if 
						//PostClick (0;$_l_Position2;$_l_BracketPosition;$_l_Position3)
						If ($_l_Position3>0)
							
						End if 
						
						POST CLICK:C466($_l_Position2; $_l_BracketPosition)
						POST CLICK:C466($_l_Position2; $_l_BracketPosition)
					: (($_t_ScriptFunction="Confirm") | ($_t_ScriptFunction="ConfirmT") | ($_t_ScriptFunction="Confirm3") | ($_t_ScriptFunction="Alert") | ($_t_ScriptFunction="Request"))
						vMTitle2:="Gen "+vMTitle2
						MESSAGES OFF:C175
						EXECUTE FORMULA:C63(vmTitle2)
						
					: ($_t_ScriptFunction="Wait for State")
						Record_PlayWfS($_bo_noStop)
						
					: ($_t_ScriptFunction="Wait")
						$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
						MESSAGES OFF:C175
						EXECUTE FORMULA:C63("vMPage:="+$_t_Parameter1)
						If (vMPage>0)
							DELAY PROCESS:C323($_l_CurrentProcess; vMPage*60)
						End if 
						
					: ($_t_ScriptFunction="Pause")
						Record_PlayPaus
						
					: ($_t_ScriptFunction="Wait on Event")
						Record_PlayWoE
						
					: ($_t_ScriptFunction="Double Click")
						
						$_t_Parameter1:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter2:=STR_RemQuote(First_Param(vMTitle2))
						$_t_Parameter3:=STR_RemQuote(First_Param(vMTitle2))
						$_l_BracketPosition:=0
						$_l_Position2:=0
						$_l_Position:=$_l_Position+Num:C11($_t_Parameter1)
						$_l_Position2:=$_l_Position2+Num:C11($_t_Parameter2)
						$_l_Position3:=Num:C11($_t_Parameter3)
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Double-Click"; 0)
						End if 
						// PostClick (0;$_l_Position2;$_l_BracketPosition;$_l_Position3)
						If ($_l_Position3>0)
							
						End if 
						
						POST CLICK:C466($_l_Position; $_l_Position2)
						//PostClick (0;$_l_Position2;$_l_BracketPosition;$_l_Position3)
						If ($_l_Position3>0)
							
						End if 
						
						POST CLICK:C466($_l_Position; $_l_Position2)
					: ($_t_ScriptFunction="Menu")
						Record_PlayMenu
						
					: ($_t_ScriptFunction="Execute")
						MESSAGES OFF:C175
						Record_PlayExec
					: ($_t_ScriptFunction="Evaluate")
						Record_PlayEval
						
					: ($_t_ScriptFunction="Accept")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Key Enter")
						End if 
						Gen_PostKey(0; 3; 0)
					: ($_t_ScriptFunction="Cancel")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Key 1")
						End if 
						Gen_PostKey(0; 46; 256)
					: ($_t_ScriptFunction="Return")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Key Return"; 0)
						End if 
						Gen_PostKey(0; 13; 0)
					: ($_t_ScriptFunction="Tab")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Key Tab")
						End if 
						Gen_PostKey(0; 9; 0)
						
					: ($_t_ScriptFunction="New Record")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Click"; 0)
						End if 
						If (<>ButtDis="In@")
							Gen_PostKey(1; 9; 256)
						Else 
							<>ButtPress:="Plus"
							If (Application type:C494#4D Server:K5:6)
								$_l_Process:=Frontmost process:C327(*)
								SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
								
								
								POST OUTSIDE CALL:C329($_l_Process)
							End if 
						End if 
						
					: (($_t_ScriptFunction="Next") | ($_t_ScriptFunction="Previous") | ($_t_ScriptFunction="Last") | ($_t_ScriptFunction="First") | ($_t_ScriptFunction="Find") | ($_t_ScriptFunction="Select") | ($_t_ScriptFunction="Sort") | ($_t_ScriptFunction="Count"))
						Record_PlayButt($_t_ScriptFunction)
					: ($_t_ScriptFunction="Find More Choices")
						Record_PlayButt("FindO")
					: ($_t_ScriptFunction="Select Inverse")
						Record_PlayButt("SelectO")
					: ($_t_ScriptFunction="Set Functions")
						Record_PlayButt("Set")
					: ($_t_ScriptFunction="Report Generator")
						Record_PlayButt("Report")
					: ($_t_ScriptFunction="Graph Generator")
						Record_PlayButt("Graph")
					: ($_t_ScriptFunction="Global Change")
						Record_PlayButt("Apply")
					: ($_t_ScriptFunction="Dial@") & ($_t_ScriptFunction#"DIALOG")  //Dial Optons is a second choice but is not currently used
						Record_PlayButt("Tel")
					: ($_t_ScriptFunction="Menus")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Click"; 0)
						End if 
						Menus_Button
					: ($_t_ScriptFunction="Backspace")
						If (<>SCPT_bo_NoAutoScripts=False:C215)
							PLAY:C290("Key 1")
						End if 
						Gen_PostKey(0; 8; 0)
					: ($_t_ScriptFunction="New Process") | ($_t_ScriptFunction="EXECUTE ON SERVER")
						$_l_CharacterPosition:=Position:C15(":="; vMTitle2)
						If ($_l_CharacterPosition>0)  // it should be! as we checked it before
							$_t_ProcessVariable:=Substring:C12(vmTItle2; 1; $_l_CharacterPosition-1)
							$_l_CharacterPosition:=Position:C15("NEW PROCESS"; vMTitle2)
							$_l_StringLength:=Length:C16("NEW PROCESS")
							$_bo_ExecuteOnServer:=False:C215
							If ($_l_CharacterPosition=0)
								$_l_CharacterPosition:=Position:C15("EXECUTE ON SERVER"; vMTitle2)
								
								$_l_StringLength:=Length:C16("EXECUTE ON SERVER")
								$_bo_ExecuteOnServer:=True:C214
							End if 
							If ($_l_CharacterPosition>0)
								$_t_Commands:=Substring:C12(vMTitle2; $_l_CharacterPosition+$_l_StringLength+1; Length:C16(vMTitle2))
								If ($_t_Commands#"")
									//other wise line is rubbish
									$_l_CharacterPosition:=Position:C15("("; $_t_Commands)
									If ($_l_CharacterPosition>0)
										$_t_Commands:=Substring:C12($_t_Commands; $_l_CharacterPosition; Length:C16($_t_Commands))
										$_l_CharacterPosition:=Position:C15(";"; $_t_Commands)
										If ($_l_CharacterPosition>0)
											$_t_MethodName:=Substring:C12($_t_Commands; 1; $_l_CharacterPosition-1)
											
											If ($_t_MethodName#"")
												$_t_Commands:=Substring:C12($_t_Commands; $_l_CharacterPosition+1; Length:C16($_t_Commands))
												$_l_CharacterPosition:=Position:C15(";"; $_t_Commands)
												If ($_l_CharacterPosition>0)
													$_l_Memory:=Num:C11(Substring:C12($_t_Commands; 1; $_l_CharacterPosition-1))
													If ($_l_Memory=0)
														$_l_Memory:=DB_ProcessMemoryinit(4)
													End if 
													$_t_Commands:=Substring:C12($_t_Commands; $_l_CharacterPosition+1; Length:C16($_t_Commands))
													$_l_CharacterPosition:=Length:C16($_t_Commands)
													Repeat 
														$_t_Character:=$_t_Commands[[$_l_CharacterPosition]]
														$_l_CharacterPosition:=$_l_CharacterPosition-1
													Until ($_t_Character=")") | ($_l_CharacterPosition=0)
													If ($_l_CharacterPosition>0)
														$_t_CommandName:=Substring:C12($_t_Commands; 1; $_l_CharacterPosition)
														//$_t_CommandName may contain extra parameters but the will be fine...
														If ($_t_CommandName="")
															$_t_CommandName:="PROCESS"
														End if 
														If ($_bo_ExecuteOnServer=False:C215)
															$_l_ProcessNumber:=New process:C317($_t_MethodName; $_l_Memory; $_t_CommandName)
															//EXECUTE("$_t_ProcessVariable:=$_l_ProcessNumber")
														Else 
															$_l_ProcessNumber:=Execute on server:C373($_t_MethodName; $_l_Memory; $_t_CommandName)
															//EXECUTE("$_t_ProcessVariable:=$_l_ProcessNumber")
														End if 
														
													End if 
													
												End if 
											End if 
											
										End if 
									End if 
								End if 
							End if 
						End if 
					Else 
						If ((vMTitle2#"") & (vMTitle2#"`@"))
							If (vMTitle2="@◊aMod{@") | (vMTitle2="@<>Mod_al_ModuleAccessType{@")
								Gen_Alert("You are not allowed to Execute a statement containing the ◊aMod array"; "Sorry")
							Else 
								If ((vMTitle2="Macro@") | (vMTitle2="@Macro_Result@"))
									If ($_bo_WindowOpen)
										$_bo_WindowOpen:=False:C215
										$_l_Right:=0
										CLOSE WINDOW:C154
									End if 
									
									MESSAGES OFF:C175
									EXECUTE FORMULA:C63(vMTitle2)
									ON ERR CALL:C155("Error_Macro")
									
								Else 
									If (Position:C15("QUERY SELECTION"; vMTitle2)>0)
										//
										$_l_CharacterPosition:=Position:C15("QUERY SELECTION BY FORMULA"; vMTitle2)
										If ($_l_CharacterPosition=0)
											$_l_CharacterPosition:=Position:C15("QUERY SELECTION WITH ARRAY"; vMTitle2)
											If ($_l_CharacterPosition=0)
												
												$_l_CharacterPosition:=Position:C15("QUERY SELECTION"; vMTitle2)
												$_t_TableNameWithBrackets:=Substring:C12(VMTITLE2; $_l_CharacterPosition+Length:C16("QUERY SELECTION"); Length:C16(VMTITLE2))
											Else 
												$_l_CharacterPosition:=Position:C15("QUERY SELECTION WITH ARRAY"; vMTitle2)
												$_t_TableNameWithBrackets:=Substring:C12(VMTITLE2; $_l_CharacterPosition+Length:C16("QUERY SELECTION WITH ARRAY"); Length:C16(VMTITLE2))
											End if 
											
										Else 
											$_l_CharacterPosition:=Position:C15("QUERY SELECTION BY FORMULA"; vMTitle2)
											$_t_TableNameWithBrackets:=Substring:C12(VMTITLE2; $_l_CharacterPosition+Length:C16("QUERY SELECTION BY FORMULA"); Length:C16(VMTITLE2))
										End if 
										$_l_CharacterPosition:=Position:C15("]"; $_t_TableNameWithBrackets)
										$_t_TableNameWithBrackets:=Substring:C12($_t_TableNameWithBrackets; 2; $_l_CharacterPosition-1)
										MESSAGES OFF:C175
										EXECUTE FORMULA:C63("WS_P_FILEPOINTER:=->"+$_t_TableNameWithBrackets)
										If (Records in selection:C76(WS_P_FILEPOINTER->)>0)
											EXECUTE FORMULA:C63(vMTitle2)
										End if 
									Else 
										MESSAGES OFF:C175
										//If ((vMTitle2#"NL_@") | (◊Level=0))
										If (Method called on error:C704="")
											ON ERR CALL:C155("Error_Macro")
										End if 
										
										If (Character code:C91(vMTitle2[[1]])=34) & (Character code:C91(vMTitle2[[(Length:C16(vMTitle2))]])=34)
											//TRACE
										End if 
										EXECUTE FORMULA:C63(vMTitle2)
										
									End if 
									
									//End if
								End if 
							End if 
						End if 
				End case 
				
			End while 
			
			If ($_l_Right>0)
				CLOSE WINDOW:C154
			End if 
			
			If ($_l_CountParameters=0)
				If ($_bo_noStop=False:C215)
					
				Else 
				End if 
			End if 
		End if 
		
		ON ERR CALL:C155("Error_Proc")
		vMT:=$_t_Res
		SCPT_t_Description1:=$_t_Description1
		SCPT_t_Description2:=$_t_Description2
		SCPT_t_Description3:=$_t_Description3
		SCPT_t_Description4:=$_t_Description4
		SCPT_t_Description5:=$_t_Description5
		MESSAGES ON:C181
		SCPT_bo_miniwindow:=$_bo_MinMacroOLD
	Else 
		
		$_t_ExecuteText:=$_t_ScriptText
		Compiler_Variables
		Compiler_Variables_Inter
		$_bo_InternetServer:=((DB_GetModuleSettingByNUM(Module_IntServer))>1)
		$_t_ExecuteText:=Macro_translate($_t_ExecuteText)
		$_t_ExecuteText:=Macro_PlatformTranslate(->$_t_ExecuteText; 0)
		$_t_ExecuteText:=SCRIPT_Parse($_t_ExecuteText)
		//$_obj_NewScript:=Formula($_t_ExecuteText)
		//$_objectToExecute:=New object("Script";$_obj_NewScript)
		//$_objectToExecute.Script()
		//$_t_Script:=$_at_ItemScript{$_l_ExportFields}
		S_C_P_t_Return:=""
		$_t_ExecuteText:=Replace string:C233($_t_ExecuteText; "$0"; "S_C_P_t_Return")
		$_t_ExecuteText:="<!--#4DCODE"+Char:C90(13)+$_t_ExecuteText+Char:C90(13)+"-->"
		PROCESS 4D TAGS:C816($_t_ExecuteText; $_t_Result)
		//$_t_FIeldValue:=S_C_P_t_Return
		
		
		
		
	End if 
	
End if 
If ($_t_ErrorMethodName#"")
	ON ERR CALL:C155($_t_ErrorMethodName)
End if 
ERR_MethodTrackerReturn("Record_Play"; $_t_oldMethodName)
