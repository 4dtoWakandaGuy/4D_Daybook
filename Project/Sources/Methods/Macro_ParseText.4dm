//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ParseText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(MAC_abo_2DBooleanparameters;0;0)
	//ARRAY LONGINT(MAC_al_2DLongintParameters;0;0)
	//ARRAY LONGINT(Mac_al_FunctionType;0)
	//ARRAY LONGINT(MAC_al_NextRowifFalse;0)
	//ARRAY REAL(MAC_ar_2DRealParameters;0;0)
	//ARRAY TEXT(MAC_at_RowCommand;0)
	//ARRAY TEXT(MAC_at_textStringParameters;0;0)
	C_BOOLEAN:C305($_bo_End; $_bo_Modified; $_bo_NoStop; $_bo_StartFresh; $2; vMModified)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; $_l_BracketPosition; $_l_BracketPositionCheck; $_l_CaseLevelNOW; $_l_CharacterIndex; $_l_CloseBracketPositionCheck; $_l_CloseCount; $_l_ClosePosition; $_l_CurrentCaseLevel; $_l_CurrentIFLevel; $_l_CurrentProcess)
	C_LONGINT:C283($_l_EndofLine; $_l_Found; $_l_IfLevelNOW; $_l_NextCaseRow; $_l_NumberofRows; $_l_Process; $_l_wLevel; $_l_wLevelNOW)
	C_TEXT:C284($_t_Conjuction; $_t_Description1; $_t_Description2; $_t_Description3; $_t_Description4; $_t_Description5; $_t_oldMethodName; $_t_Parameter1; $_t_RemainingScript; $_t_ScriptText; $_t_ScriptTitle2)
	C_TEXT:C284($_t_ScriptTitle3; $_t_SubTextParse; $_t_TestThisString; $_t_ThisFunction; $1; $Macro_t_Function; SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5)
	C_TEXT:C284(vMT; vMTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_ParseText")

If (Count parameters:C259>=3)
	$_bo_StartFresh:=$2
Else 
	$_bo_StartFresh:=True:C214
End if 
If ($_bo_StartFresh)
	ARRAY LONGINT:C221(MAC_al_NextRowifFalse; 0)
	ARRAY TEXT:C222(MAC_at_RowCommand; 0)
	ARRAY LONGINT:C221(MAC_al_2DLongintParameters; 0; 0)
	ARRAY REAL:C219(MAC_ar_2DRealParameters; 0; 0)
	ARRAY BOOLEAN:C223(MAC_abo_2DBooleanparameters; 0; 0)
	ARRAY TEXT:C222(MAC_at_textStringParameters; 0; 0)
	ARRAY LONGINT:C221(Mac_al_FunctionType; 0)
End if 


If (Count parameters:C259>=1)  //MacroText
	$_t_ScriptText:=$1
	$_l_EndofLine:=Position:C15(Char:C90(13)+Char:C90(13); $_t_ScriptText)
	If ($_l_EndofLine>0)
		Repeat 
			$_t_ScriptText:=Replace string:C233($_t_ScriptText; Char:C90(13)+Char:C90(13); Char:C90(13))
		Until (Position:C15(Char:C90(13)+Char:C90(13); $_t_ScriptText)=0)
		$_t_Description1:=SCPT_t_Description1
		$_t_Description2:=SCPT_t_Description2
		$_t_Description3:=SCPT_t_Description3
		$_t_Description4:=SCPT_t_Description4
		$_t_Description5:=SCPT_t_Description5
		$_l_CurrentIFLevel:=0
		$_l_IfLevelNOW:=0
		$_l_CurrentCaseLevel:=0
		$_l_CaseLevelNOW:=0
		$_l_wLevel:=0
		$_l_wLevelNOW:=0
		SCPT_t_Description1:=""
		SCPT_t_Description2:=""
		SCPT_t_Description3:=""
		SCPT_t_Description4:=""
		SCPT_t_Description5:=""
		$_l_Process:=0
		$_l_CurrentProcess:=Current process:C322
		
		$_t_ScriptTitle2:=""
		$_t_ScriptTitle3:=""
		While ((Length:C16($_t_ScriptText)>3))  //& ((◊RecPlayUp>0) | ($_bo_NoStop)) & (◊Cancel#$_l_CurrentProcess))
			$Macro_t_Function:=""
			Macro_ParseLine(->$Macro_t_Function; ->$_t_ScriptText; ->$_t_ScriptTitle2; ->$_t_ScriptTitle3)
			$_t_ThisFunction:=$Macro_t_Function
			Case of 
				: ($Macro_t_Function="`@")  //Do not store the line as it is a comment
				: ($Macro_t_Function="*@")  //internet function-in the parse we don't take account of whether the use has the internet manager
					APPEND TO ARRAY:C911(MAC_al_NextRowifFalse; 0)
					APPEND TO ARRAY:C911(MAC_at_RowCommand; $Macro_t_Function)
					APPEND TO ARRAY:C911(Mac_al_FunctionType; 1)
					$_l_NumberofRows:=Size of array:C274(MAC_al_2DLongintParameters)
					INSERT IN ARRAY:C227(MAC_al_2DLongintParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_ar_2DRealParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_abo_2DBooleanparameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_at_textStringParameters; $_l_NumberofRows+1)  //no parameters here
					If ($_t_ScriptTitle3#"")  //Store the text-this will be passed to IME_Reply i am doing this rather than storing it in the command-this is the value passed to IME_Reply as $1
						APPEND TO ARRAY:C911(MAC_at_textStringParameters{$_l_NumberofRows+1}; $_t_ScriptTitle2)
						
					End if 
					
				: ($Macro_t_Function="ITX @")
					APPEND TO ARRAY:C911(MAC_al_NextRowifFalse; 0)
					APPEND TO ARRAY:C911(MAC_at_RowCommand; $Macro_t_Function)
					APPEND TO ARRAY:C911(Mac_al_FunctionType; 2)
					$_l_NumberofRows:=Size of array:C274(MAC_al_2DLongintParameters)
					INSERT IN ARRAY:C227(MAC_al_2DLongintParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_ar_2DRealParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_abo_2DBooleanparameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_at_textStringParameters; $_l_NumberofRows+1)  //no parameters here
					If ($_t_ScriptTitle3#"")  //Store the text-this will be passed to ITX play
						APPEND TO ARRAY:C911(MAC_at_textStringParameters{Size of array:C274(MAC_at_textStringParameters)}; $_t_ScriptTitle3)
						APPEND TO ARRAY:C911(MAC_at_textStringParameters{Size of array:C274(MAC_at_textStringParameters)}; $_t_ScriptTitle2)
					End if 
				: ($Macro_t_Function="IMA @")
					APPEND TO ARRAY:C911(MAC_al_NextRowifFalse; 0)
					APPEND TO ARRAY:C911(MAC_at_RowCommand; $Macro_t_Function)
					APPEND TO ARRAY:C911(Mac_al_FunctionType; 3)
					$_l_NumberofRows:=Size of array:C274(MAC_al_2DLongintParameters)
					INSERT IN ARRAY:C227(MAC_al_2DLongintParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_ar_2DRealParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_abo_2DBooleanparameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_at_textStringParameters; $_l_NumberofRows+1)  //no parameters here
					If ($_t_ScriptTitle3#"")  //Store the text-this will be passed to ITX play
						APPEND TO ARRAY:C911(MAC_at_textStringParameters{Size of array:C274(MAC_at_textStringParameters)}; $_t_ScriptTitle3)
						APPEND TO ARRAY:C911(MAC_at_textStringParameters{Size of array:C274(MAC_at_textStringParameters)}; $_t_ScriptTitle2)
					End if 
				: ($Macro_t_Function="Case of")
					//Start Case of counter=need to record back here the next :() at each :()
					$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
					$_l_CaseLevelNOW:=$_l_CurrentCaseLevel
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					$_bo_End:=False:C215
					$_t_RemainingScript:=""
					$_l_Found:=0
					APPEND TO ARRAY:C911(MAC_al_NextRowifFalse; 0)
					APPEND TO ARRAY:C911(MAC_at_RowCommand; $Macro_t_Function)
					APPEND TO ARRAY:C911(Mac_al_FunctionType; 3)
					$_l_NumberofRows:=Size of array:C274(MAC_al_2DLongintParameters)
					INSERT IN ARRAY:C227(MAC_al_2DLongintParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_ar_2DRealParameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_abo_2DBooleanparameters; $_l_NumberofRows+1)  //no parameters here
					INSERT IN ARRAY:C227(MAC_at_textStringParameters; $_l_NumberofRows+1)  //no parameters here
					$_l_NextCaseRow:=0
					//Macro_ParseText ($_t_ScriptText;False;"Case of")
					$_t_SubTextParse:=""
					While ((Length:C16($_t_ScriptText)>3) & ((<>SCPT_l_PlayerActive>0) | ($_bo_NoStop)) & ($_bo_End=False:C215))
						IDLE:C311  // 7/04/03 pb
						
						$Macro_t_Function:=""
						Macro_ParseLine(->$Macro_t_Function; ->$_t_ScriptText; ->$_t_ScriptTitle2; ->$_t_ScriptTitle3)
						
						Case of 
							: ($_t_ThisFunction="Else")
							: ($_t_ThisFunction="Case of")
								//here we just need to note that we have entered another level
							: ($Macro_t_Function=":")
								
								If ($_l_NextCaseRow>0)
									//We have a row waiting to know where the next :() is
									If ($_t_SubTextParse#"")  //we have the text of the bit between the case statement to parse
										Macro_ParseText($_t_SubTextParse; False:C215)
									End if 
								End if 
								If ($_l_CaseLevelNOW=$_l_CurrentCaseLevel)
									If ($_l_Found=1)
										$_l_Found:=2
									Else 
										If ($_l_Found=0)
											$_l_BracketPosition:=Position:C15("("; vMTitle3)
											If ($_l_BracketPosition>0)
												$_t_Conjuction:=""
												vMModified:=False:C215
												Repeat 
													$_l_ClosePosition:=0
													$_l_CloseCount:=0
													For ($_l_CharacterIndex; $_l_BracketPosition+1; Length:C16(vMTitle3))
														$_t_TestThisString:=Substring:C12(vmTitle3; $_l_CharacterIndex; Length:C16(vmTitle3))
														$_l_BracketPositionCheck:=Position:C15("("; $_t_TestThisString)
														If ($_l_BracketPositionCheck>0)
															//is an opening bracket
															$_l_CloseBracketPositionCheck:=Position:C15(")"; $_t_TestThisString)
															If ($_l_CloseBracketPositionCheck>0)
																//is a closing bracket
																If ($_l_CloseBracketPositionCheck<$_l_BracketPositionCheck)
																	//closing bracket is before opening bracket(goto closing bracket)
																	$_l_CharacterIndex:=$_l_CharacterIndex+($_l_CloseBracketPositionCheck-1)
																Else 
																	//closing bracket is after opening bracket(go to opening bracket)
																	$_l_CharacterIndex:=$_l_CharacterIndex+($_l_BracketPositionCheck-1)
																End if 
															Else 
																//no closing brackets..go to opening bracket
																$_l_CharacterIndex:=$_l_CharacterIndex+($_l_BracketPositionCheck-1)
															End if 
														Else 
															//No opening brackets
															$_l_CloseBracketPositionCheck:=Position:C15(")"; $_t_TestThisString)
															If ($_l_CloseBracketPositionCheck>0)
																$_l_CharacterIndex:=$_l_CharacterIndex+($_l_CloseBracketPositionCheck-1)
															Else 
																//no more brackets
																$_l_CharacterIndex:=Length:C16(VmTitle3)
															End if 
														End if 
														
														
														If (vMTitle3[[$_l_CharacterIndex]]="(")
															$_l_CloseCount:=$_l_CloseCount+1
														End if 
														If (vMTitle3[[$_l_CharacterIndex]]=")")
															If ($_l_CloseCount=0)
																$_l_ClosePosition:=$_l_CharacterIndex
																$_l_CharacterIndex:=Length:C16(vMTitle3)
															Else 
																$_l_CloseCount:=$_l_CloseCount-1
															End if 
														End if 
													End for 
													
													//$_l_ClosePosition:=Position(")";vMTitle3)
													If ($_l_ClosePosition=0)
														$_l_ClosePosition:=Length:C16(VMTITLE3)
													End if 
													$_t_ScriptTitle3:=Substring:C12(VMTITLE3; $_l_ClosePosition+1; Length:C16(VMTITLE3))
													$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; $_l_ClosePosition-($_l_BracketPosition+1))
													If ($_t_Parameter1#"")
														
														MESSAGES OFF:C175
														Case of 
															: ($_t_Conjuction="&")
																$_bo_Modified:=vMModified
																EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
																vMModified:=vMModified & $_bo_Modified
															: ($_t_Conjuction="|")
																$_bo_Modified:=vMModified
																EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
																vMModified:=vMModified | $_bo_Modified
															Else 
																EXECUTE FORMULA:C63("vMModified:="+$_t_Parameter1)
														End case 
													End if 
													If ($_t_ScriptTitle3#"")
														VMTITLE3:=$_t_ScriptTitle3
														$_t_ScriptTitle3:=""
														$_l_BracketPosition:=Position:C15("("; vMTitle3)
														If ($_l_BracketPosition>0)
															$_t_Conjuction:=Substring:C12(VMTITLE3; 1; $_l_BracketPosition-1)
															Case of 
																: (Position:C15("&"; $_t_Conjuction)>0)
																	$_t_Conjuction:="&"
																: (Position:C15("|"; $_t_Conjuction)>0)
																	$_t_Conjuction:="|"
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
													$_l_Found:=1
												Else 
													
												End if 
												
											End if 
										End if 
									End if 
								Else 
									If ($_l_Found=1)
										$_t_RemainingScript:=$_t_RemainingScript+vMTitle3+Char:C90(13)
									End if 
								End if 
								
								
								$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
								If ($_l_Found=1)
									$_t_RemainingScript:=$_t_RemainingScript+vMTitle3+Char:C90(13)
								End if 
							Else 
								$_t_SubTextParse:=$_t_SubTextParse+$Macro_t_Function+$_t_ScriptTitle3
						End case 
					End while 
					vMT:=$_t_RemainingScript+vMT
					
					
			End case 
			ARRAY LONGINT:C221(MAC_al_NextRowifFalse; 0)
			ARRAY TEXT:C222(MAC_at_RowCommand; 0)
			ARRAY LONGINT:C221(MAC_al_2DLongintParameters; 0; 0)
			ARRAY REAL:C219(MAC_ar_2DRealParameters; 0; 0)
			ARRAY LONGINT:C221(Mac_al_FunctionType; 0)
			ARRAY BOOLEAN:C223(MAC_abo_2DBooleanparameters; 0; 0)
			ARRAY TEXT:C222(MAC_at_textStringParameters; 0; 0)
		End while 
	End if 
	//````
End if 
ERR_MethodTrackerReturn("Macro_ParseText"; $_t_oldMethodName)