//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_ParseForCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                               23/09/2011 21:35 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_2DParameters; 0; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
	ARRAY TEXT:C222($_at_Commands; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0; 0)
	ARRAY TEXT:C222($_at_Conjuctions1D; 0)
	ARRAY TEXT:C222($_at_ExternalBlocks; 0)
	ARRAY TEXT:C222($_at_Parameters1D; 0)
	ARRAY TEXT:C222($_at_ScriptTextLines; 0)
	C_BLOB:C604($_blb_ScriptBlob)
	C_BOOLEAN:C305($_bo_End; $_bo_FirstLine; $_bo_HandleCaseof; $_bo_HandleFor; $_bo_Handleif; $_bo_HandleRepeat; $_bo_HandleWhile; $_bo_NoStop; $_bo_Save; $_bo_StepOut; $2)
	C_LONGINT:C283($_l_BracketPosition; $_l_CaseLevelNow; $_l_ColumnCount; $_l_CurrentCaseLevel; $_l_CurrentColumn; $_l_CurrentIFLevel; $_l_CurrentRepeatLevel; $_l_CurrentWhileLevel; $_l_EndofLinePosition; $_l_ForLevel; $_l_ForLevelNow)
	C_LONGINT:C283($_l_Found; $_l_IfLevelNOW; $_l_Index; $_l_NumberofLines; $_l_ParameterColumns; $_l_ParametersIndex; $_l_RepeatLevelNow; $_l_Row; $_l_RowCount; $_l_TextBlocksIndex; $_l_TextIndex)
	C_LONGINT:C283($_l_WhileLevelNow)
	C_TEXT:C284($_t_Command; $_t_DocumentName; $_t_oldMethodName; $_t_ScriptFunction; $_t_ScriptFunction2; $_t_ScriptText; $_t_ThisLine; $1; vMT; VmTitle2; vMTitle3)
	C_TEXT:C284(vMTWas)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_ParseForCode")

If (Count parameters:C259>=1)
	
	If ([SCRIPTS:80]Script_Code:1#$1)
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
	End if 
End if 
$_t_ScriptText:=[SCRIPTS:80]Recording_Text:4
//`$_t_ScriptText:=Replace string($_t_ScriptText;"$";"Mloc_")

ARRAY TEXT:C222($_at_ScriptTextLines; 0)
Repeat 
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_ScriptText)
	If ($_l_EndofLinePosition>0)
		$_t_ThisLine:=Substring:C12($_t_ScriptText; 1; $_l_EndofLinePosition-1)
		$_t_ScriptText:=Substring:C12($_t_ScriptText; $_l_EndofLinePosition+1)
		APPEND TO ARRAY:C911($_at_ScriptTextLines; $_t_ThisLine)
	Else 
		If ($_t_ScriptText#"")
			APPEND TO ARRAY:C911($_at_ScriptTextLines; $_t_ScriptText)
		End if 
	End if 
Until ($_l_EndofLinePosition=0)
ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
ARRAY TEXT:C222($_at_Commands; 0)
ARRAY TEXT:C222($_at_ExternalBlocks; 0)
ARRAY TEXT:C222($_at_2DParameters; 0; 0)
ARRAY TEXT:C222($_at_Conjuctions; 0; 0)

VmTitle2:=""
vMTitle3:=""
$_l_CurrentCaseLevel:=0
$_l_CurrentIFLevel:=0
$_l_CurrentWhileLevel:=0
$_l_CurrentRepeatLevel:=0
$_l_ForLevel:=0
$_l_RowCount:=0
$_l_ColumnCount:=1
$_l_CurrentColumn:=1
$_l_WhileLevelNow:=0
$_l_CaseLevelNow:=0
$_l_IfLevelNOW:=0
$_l_RepeatLevelNow:=0
$_l_ForLevelNow:=0
$_l_Row:=0
$_bo_NoStop:=True:C214
$_l_ParameterColumns:=0

For ($_l_Index; 1; Size of array:C274($_at_ScriptTextLines))
	SET BLOB SIZE:C606($_blb_ScriptBlob; 0)
	
	$_t_ScriptFunction:=""
	vMT:=$_at_ScriptTextLines{$_l_Index}
	Record_PlayLine(->$_t_ScriptFunction)
	If (VmTitle2#"")
		//C_LONGINT($_l_offset)
		//API Tokenize (VmTitle2;$_blb_ScriptBlob)
		//$BLOBASTEXT:=BLOB to text($_blb_ScriptBlob;Mac text without length ;$_l_offset;32000)
		
	End if 
	Case of 
		: ($_t_ScriptFunction="Case of") | ($_t_ScriptFunction="if") | ($_t_ScriptFunction="While") | ($_t_ScriptFunction="Repeat") | ($_t_ScriptFunction="For")
			vMTWas:=VmTitle2
			$_l_RowCount:=$_l_RowCount+1
			$_bo_HandleCaseof:=False:C215
			$_bo_Handleif:=False:C215
			
			$_bo_HandleWhile:=False:C215
			$_bo_HandleRepeat:=False:C215
			$_bo_HandleFor:=False:C215
			Case of 
				: ($_t_ScriptFunction="Case of")
					$_bo_HandleCaseof:=True:C214
					$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
					$_l_CaseLevelNow:=$_l_CurrentCaseLevel
					If ($_l_CurrentCaseLevel>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentCaseLevel
					End if 
					//$_l_CurrentColumn:=$_l_CurrentCaseLevel
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Case of"
					$_l_CurrentColumn:=$_l_CurrentColumn+1
					If ($_l_CurrentColumn>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentColumn
						ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
						ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
						ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_l_WhileLevelNow:=$_l_CurrentWhileLevel
					$_l_RepeatLevelNow:=$_l_CurrentRepeatLevel
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					$_bo_End:=False:C215
					$_t_ScriptText:=""
					$_l_Found:=0
					$_at_Commands{$_l_RowCount}:="Case of"
					
				: ($_t_ScriptFunction="if")
					$_bo_Handleif:=True:C214
					$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					If ($_l_CurrentIFLevel>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentIFLevel
					End if 
					//$_l_CurrentColumn:=$_l_CurrentIFLevel
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
					$_l_CurrentColumn:=$_l_CurrentColumn+1
					If ($_l_CurrentColumn>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentColumn
						ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
						ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
						ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_l_ForLevelNow:=$_l_ForLevel
					$_l_WhileLevelNow:=$_l_CurrentWhileLevel
					$_l_RepeatLevelNow:=$_l_CurrentRepeatLevel
					$_l_CaseLevelNow:=$_l_CurrentCaseLevel
					$_bo_End:=False:C215
					$_t_ScriptText:=""
					$_l_Found:=0
					$_t_Command:=""
					ARRAY TEXT:C222($_at_Parameters1D; 0)
					ARRAY TEXT:C222($_at_Conjuctions1D; 0)
					
					Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
					If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
						$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_bo_StepOut:=False:C215
					If ($_t_Command#"")
						Repeat 
							If ($_t_Command[[Length:C16($_t_Command)]]=" ")
								$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
								If ($_t_Command="")
									$_bo_StepOut:=True:C214
								Else 
									If ($_t_Command[[Length:C16($_t_Command)]]#" ")
										$_bo_StepOut:=True:C214
									End if 
								End if 
							Else 
								$_bo_StepOut:=True:C214
							End if 
						Until ($_bo_StepOut)
					End if 
					$_bo_StepOut:=False:C215
					If ($_t_Command#"")
						Repeat 
							If ($_t_Command[[1]]=" ")
								$_t_Command:=Substring:C12($_t_Command; 2)
								If ($_t_Command="")
									$_bo_StepOut:=True:C214
								Else 
									If ($_t_Command[[1]]#" ")
										$_bo_StepOut:=True:C214
									End if 
								End if 
								
							Else 
								$_bo_StepOut:=True:C214
							End if 
						Until ($_bo_StepOut)
					End if 
					$_at_Commands{$_l_RowCount}:=$_t_Command
					For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
						$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
						$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
					End for 
				: ($_t_ScriptFunction="While")
					$_bo_HandleWhile:=True:C214
					$_l_CurrentWhileLevel:=$_l_CurrentWhileLevel+1
					$_l_WhileLevelNow:=$_l_CurrentWhileLevel
					If ($_l_CurrentWhileLevel>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentWhileLevel
					End if 
					//$_l_CurrentColumn:=$_l_CurrentWhileLevel
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
					$_l_CurrentColumn:=$_l_CurrentColumn+1
					If ($_l_CurrentColumn>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentColumn
						ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
						ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
						ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_l_ForLevelNow:=$_l_ForLevel
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					$_l_RepeatLevelNow:=$_l_CurrentRepeatLevel
					$_l_CaseLevelNow:=$_l_CurrentCaseLevel
					$_bo_End:=False:C215
					$_t_ScriptText:=""
					$_l_Found:=0
					$_t_Command:=""
					ARRAY TEXT:C222($_at_Parameters1D; 0)
					ARRAY TEXT:C222($_at_Conjuctions1D; 0)
					
					Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
					If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
						$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_at_Commands{$_l_RowCount}:="WHILE"
					For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
						$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
						$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
					End for 
				: ($_t_ScriptFunction="Repeat")
					$_bo_HandleRepeat:=True:C214
					$_l_CurrentRepeatLevel:=$_l_CurrentRepeatLevel+1
					$_l_RepeatLevelNow:=$_l_CurrentRepeatLevel
					If ($_l_CurrentRepeatLevel>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentRepeatLevel
					End if 
					//$_l_CurrentColumn:=$_l_CurrentRepeatLevel
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Repeat"
					$_l_CurrentColumn:=$_l_CurrentColumn+1
					If ($_l_CurrentColumn>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentColumn
						ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
						ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
						ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_l_ForLevelNow:=$_l_ForLevel
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					$_l_WhileLevelNow:=$_l_CurrentWhileLevel
					$_l_CaseLevelNow:=$_l_CurrentCaseLevel
					$_bo_End:=False:C215
					$_t_ScriptText:=""
					$_l_Found:=0
					$_at_Commands{$_l_RowCount}:="Repeat"
					
				: ($_t_ScriptFunction="For")
					$_bo_HandleFor:=True:C214
					$_l_ForLevel:=$_l_ForLevel+1
					$_l_ForLevelNow:=$_l_ForLevel
					If ($_l_ForLevel>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentRepeatLevel
					End if 
					//$_l_CurrentColumn:=$_l_ForLevel
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
					$_l_CurrentColumn:=$_l_CurrentColumn+1
					If ($_l_CurrentColumn>$_l_ColumnCount)
						$_l_ColumnCount:=$_l_CurrentColumn
						ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
						ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
						ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_l_IfLevelNOW:=$_l_CurrentIFLevel
					$_l_WhileLevelNow:=$_l_CurrentWhileLevel
					$_l_CaseLevelNow:=$_l_CurrentCaseLevel
					$_l_RepeatLevelNOW:=$_l_CurrentRepeatLevel
					$_bo_End:=False:C215
					$_t_ScriptText:=""
					$_l_Found:=0
					$_t_Command:=""
					ARRAY TEXT:C222($_at_Parameters1D; 0)
					ARRAY TEXT:C222($_at_Conjuctions1D; 0)
					Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
					If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
						$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
						ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
						ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
					End if 
					$_at_Commands{$_l_RowCount}:="For"
					For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
						$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
						$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
					End for 
			End case 
			For ($_l_TextIndex; $_l_Index+1; Size of array:C274($_at_ScriptTextLines))
				If ($_bo_NoStop) & ($_bo_End=False:C215)
					vMT:=$_at_ScriptTextLines{$_l_TextIndex}
					Record_PlayLine(->$_t_ScriptFunction2)
					Case of 
						: ($_t_ScriptFunction2=":")  //
							$_l_RowCount:=$_l_RowCount+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							If ($_l_RowCount>Size of array:C274($_at_2DTextBlocks))
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							
							$_l_BracketPosition:=Position:C15("("; vMTitle3)
							If ($_l_BracketPosition>0)
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn-1}:=VmTitle2
							End if 
							$_t_Command:=""
							ARRAY TEXT:C222($_at_Parameters1D; 0)
							ARRAY TEXT:C222($_at_Conjuctions1D; 0)
							
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
							If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
								$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[Length:C16($_t_Command)]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[Length:C16($_t_Command)]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[1]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 2)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[1]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_at_Commands{$_l_RowCount}:=$_t_Command
							For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
								$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
								$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
							End for 
							
							
							
						: ($_t_ScriptFunction2="Case of")
							$_l_RowCount:=$_l_RowCount+1
							$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel+1
							If ($_l_CurrentCaseLevel>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentCaseLevel
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Case of"
							
							$_l_CurrentColumn:=$_l_CurrentColumn+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_at_Commands{$_l_RowCount}:="Case of"
							
						: ($_t_ScriptFunction2="if")
							$_l_RowCount:=$_l_RowCount+1
							$_l_CurrentIFLevel:=$_l_CurrentIFLevel+1
							If ($_l_CurrentIFLevel>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentIFLevel
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							
							$_l_CurrentColumn:=$_l_CurrentColumn+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_t_Command:=""
							ARRAY TEXT:C222($_at_Parameters1D; 0)
							ARRAY TEXT:C222($_at_Conjuctions1D; 0)
							
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
							If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
								$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[Length:C16($_t_Command)]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[Length:C16($_t_Command)]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[1]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 2)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[1]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_at_Commands{$_l_RowCount}:=$_t_Command
							For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
								$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
								$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
							End for 
						: ($_t_ScriptFunction2="else")
							$_l_RowCount:=$_l_RowCount+1
							
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn-1}:="ELSE"
							$_at_Commands{$_l_RowCount}:="Else"
							
						: ($_t_ScriptFunction2="End if")
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentIFLevel=$_l_IfLevelNOW) & ($_bo_Handleif)
								$_bo_End:=True:C214
								If ($_l_TextIndex>$_l_Index)
									$_l_Index:=$_l_TextIndex
								End if 
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="END IF"
								$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
								
								
							Else 
								$_l_CurrentIFLevel:=$_l_CurrentIFLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="END IF"
								
							End if 
							$_at_Commands{$_l_RowCount}:="End if"
							
						: ($_t_ScriptFunction2="End Case")
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentCaseLevel=$_l_CaseLevelNow) & ($_bo_HandleCaseof)
								$_bo_End:=True:C214
								If ($_l_TextIndex>$_l_Index)
									$_l_Index:=$_l_TextIndex
								End if 
								
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="END CASE"
								$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
							Else 
								$_l_CurrentCaseLevel:=$_l_CurrentCaseLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="END CASE"
								
							End if 
							$_at_Commands{$_l_RowCount}:="End Case"
							
						: ($_t_ScriptFunction2="While")
							$_l_RowCount:=$_l_RowCount+1
							
							$_l_CurrentWhileLevel:=$_l_CurrentWhileLevel+1
							If ($_l_CurrentWhileLevel>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentWhileLevel
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							
							$_l_CurrentColumn:=$_l_CurrentColumn+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_t_Command:=""
							ARRAY TEXT:C222($_at_Parameters1D; 0)
							ARRAY TEXT:C222($_at_Conjuctions1D; 0)
							
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
							If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
								$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[Length:C16($_t_Command)]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[Length:C16($_t_Command)]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[1]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 2)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[1]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_at_Commands{$_l_RowCount}:=$_t_Command
							For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
								$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
								$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
							End for 
						: ($_t_ScriptFunction2="Repeat")
							$_l_RowCount:=$_l_RowCount+1
							$_l_CurrentRepeatLevel:=$_l_CurrentRepeatLevel+1
							If ($_l_CurrentRepeatLevel>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentRepeatLevel
							End if 
							
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							$_l_CurrentColumn:=$_l_CurrentColumn+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_at_Commands{$_l_RowCount}:="Repeat"
							
						: ($_t_ScriptFunction2="End while")
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentWhileLevel=$_l_WhileLevelNow) & ($_bo_HandleWhile)
								$_bo_End:=True:C214
								$_l_Index:=$_l_TextIndex
								
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_l_CurrentWhileLevel:=$_l_CurrentWhileLevel-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="End while"
								$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
							Else 
								$_l_CurrentWhileLevel:=$_l_CurrentWhileLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="End While"
							End if 
							$_at_Commands{$_l_RowCount}:="End While"
							
						: ($_t_ScriptFunction2="Until")
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							
							If ($_l_CurrentRepeatLevel=$_l_RepeatLevelNow) & ($_bo_HandleRepeat)
								$_bo_End:=True:C214
								$_l_Index:=$_l_TextIndex
								
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_l_CurrentRepeatLevel:=$_l_CurrentRepeatLevel-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
								$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
							Else 
								$_l_CurrentRepeatLevel:=$_l_CurrentRepeatLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							End if 
							$_t_Command:=""
							ARRAY TEXT:C222($_at_Parameters1D; 0)
							ARRAY TEXT:C222($_at_Conjuctions1D; 0)
							
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
							If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
								$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[Length:C16($_t_Command)]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[Length:C16($_t_Command)]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[1]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 2)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[1]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_at_Commands{$_l_RowCount}:=$_t_Command
							For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
								$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
								$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
							End for 
						: ($_t_ScriptFunction2="For")
							$_l_RowCount:=$_l_RowCount+1
							$_l_ForLevel:=$_l_ForLevel+1
							If ($_l_ForLevel>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_ForLevel
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							
							$_l_CurrentColumn:=$_l_CurrentColumn+1
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_t_Command:=""
							ARRAY TEXT:C222($_at_Parameters1D; 0)
							ARRAY TEXT:C222($_at_Conjuctions1D; 0)
							
							Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
							If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
								$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[Length:C16($_t_Command)]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[Length:C16($_t_Command)]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_bo_StepOut:=False:C215
							If ($_t_Command#"")
								Repeat 
									If ($_t_Command[[1]]=" ")
										$_t_Command:=Substring:C12($_t_Command; 2)
										If ($_t_Command="")
											$_bo_StepOut:=True:C214
										Else 
											If ($_t_Command[[1]]#" ")
												$_bo_StepOut:=True:C214
											End if 
										End if 
									Else 
										$_bo_StepOut:=True:C214
									End if 
								Until ($_bo_StepOut)
							End if 
							$_at_Commands{$_l_RowCount}:=$_t_Command
							For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
								$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
								$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
							End for 
							
						: ($_t_ScriptFunction2="End for")
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_ForLevel=$_l_ForLevelNow) & ($_bo_HandleFor)
								$_bo_End:=True:C214
								$_l_Index:=$_l_TextIndex
								$_l_ForLevel:=$_l_ForLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
								$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
							Else 
								$_l_ForLevel:=$_l_ForLevel-1
								$_l_CurrentColumn:=$_l_CurrentColumn-1
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							End if 
							
							$_at_Commands{$_l_RowCount}:="End For"
							
						Else 
							If (VmTitle2#"")
								$_l_RowCount:=$_l_RowCount+1
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
								If ($_l_CurrentColumn>$_l_ColumnCount)
									$_l_ColumnCount:=$_l_CurrentColumn
									
								End if 
								ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
								ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
								ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
								ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
								ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
								$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
								
								$_t_Command:=""
								ARRAY TEXT:C222($_at_Parameters1D; 0)
								ARRAY TEXT:C222($_at_Conjuctions1D; 0)
								
								Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
								If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
									$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
									ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
									ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
								End if 
								$_bo_StepOut:=False:C215
								If ($_t_Command#"")
									Repeat 
										If ($_t_Command[[Length:C16($_t_Command)]]=" ")
											$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
											If ($_t_Command="")
												$_bo_StepOut:=True:C214
											Else 
												If ($_t_Command[[Length:C16($_t_Command)]]#" ")
													$_bo_StepOut:=True:C214
												End if 
											End if 
										Else 
											$_bo_StepOut:=True:C214
										End if 
									Until ($_bo_StepOut)
								End if 
								$_bo_StepOut:=False:C215
								If ($_t_Command#"")
									Repeat 
										If ($_t_Command[[1]]=" ")
											$_t_Command:=Substring:C12($_t_Command; 2)
											If ($_t_Command="")
												$_bo_StepOut:=True:C214
											Else 
												If ($_t_Command[[1]]#" ")
													$_bo_StepOut:=True:C214
												End if 
											End if 
										Else 
											$_bo_StepOut:=True:C214
										End if 
									Until ($_bo_StepOut)
								End if 
								$_at_Commands{$_l_RowCount}:=$_t_Command
								For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
									$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
									$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
								End for 
							End if 
					End case 
				Else 
					$_l_Index:=$_l_TextIndex-1
					$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
				End if 
			End for 
			vMT:=vMTWas
		: ($_t_ScriptFunction="End if") | ($_t_ScriptFunction="End while") | ($_t_ScriptFunction="Until") | ($_t_ScriptFunction="ENd Case")  //Bad widow
			
		: ($_t_ScriptFunction="Begin SQL")
			$_l_RowCount:=$_l_RowCount+1
			ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
			ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
			ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
			ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
			ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Begin SQL"
			$_l_CurrentColumn:=$_l_CurrentColumn+1
			If ($_l_CurrentColumn>$_l_ColumnCount)
				$_l_ColumnCount:=$_l_CurrentColumn
				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
				ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
				ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
				ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
				ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			End if 
			$_bo_FirstLine:=True:C214
			For ($_l_TextIndex; $_l_Index+1; Size of array:C274($_at_ScriptTextLines))
				If ($_bo_NoStop) & ($_bo_End=False:C215)
					vMT:=$_at_ScriptTextLines{$_l_TextIndex}
					Record_PlayLine(->$_t_ScriptFunction2)
					Case of 
						: ($_t_ScriptFunction2="End SQL")  //
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_l_CurrentColumn:=$_l_CurrentColumn-1
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							$_at_Commands{$_l_RowCount}:="End SQL"
							$_l_Index:=$_l_TextIndex-1
							$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
						Else 
							If ($_bo_FirstLine)
								$_l_RowCount:=$_l_RowCount+1
								$_bo_FirstLine:=False:C215
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_ExternalBlocks{$_l_RowCount}:=$_at_ExternalBlocks{$_l_RowCount}+Char:C90(13)+Char:C90(10)
							
					End case 
				Else 
					$_l_Index:=$_l_TextIndex-1
					$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
				End if 
			End for 
			
			
		: ($_t_ScriptFunction="Begin JavaScript")
			$_l_RowCount:=$_l_RowCount+1
			ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
			ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
			ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
			ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
			ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Begin Javascript"
			$_l_CurrentColumn:=$_l_CurrentColumn+1
			If ($_l_CurrentColumn>$_l_ColumnCount)
				$_l_ColumnCount:=$_l_CurrentColumn
				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
				ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
				ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
				ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
				ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			End if 
			$_bo_FirstLine:=True:C214
			For ($_l_TextIndex; $_l_Index+1; Size of array:C274($_at_ScriptTextLines))
				If ($_bo_NoStop) & ($_bo_End=False:C215)
					vMT:=$_at_ScriptTextLines{$_l_TextIndex}
					Record_PlayLine(->$_t_ScriptFunction2)
					Case of 
						: ($_t_ScriptFunction2="End Javascipt")  //
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_l_CurrentColumn:=$_l_CurrentColumn-1
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							$_at_Commands{$_l_RowCount}:="End Javsscript"
							$_l_Index:=$_l_TextIndex-1
							$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
						Else 
							If ($_bo_FirstLine)
								$_l_RowCount:=$_l_RowCount+1
								$_bo_FirstLine:=False:C215
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_ExternalBlocks{$_l_RowCount}:=$_at_ExternalBlocks{$_l_RowCount}+Char:C90(13)+Char:C90(10)
							
					End case 
				Else 
					$_l_Index:=$_l_TextIndex-1
					$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
				End if 
			End for 
			
		: ($_t_ScriptFunction="Begin AppleScript")
			$_l_RowCount:=$_l_RowCount+1
			ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
			ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
			ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
			ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
			ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:="Begin Applescript"
			$_l_CurrentColumn:=$_l_CurrentColumn+1
			If ($_l_CurrentColumn>$_l_ColumnCount)
				$_l_ColumnCount:=$_l_CurrentColumn
				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
				ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
				ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
				ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
				ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
			End if 
			$_bo_FirstLine:=True:C214
			For ($_l_TextIndex; $_l_Index+1; Size of array:C274($_at_ScriptTextLines))
				If ($_bo_NoStop) & ($_bo_End=False:C215)
					vMT:=$_at_ScriptTextLines{$_l_TextIndex}
					Record_PlayLine(->$_t_ScriptFunction2)
					Case of 
						: ($_t_ScriptFunction2="End Applescript")  //
							$_l_RowCount:=$_l_RowCount+1
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_l_CurrentColumn:=$_l_CurrentColumn-1
							$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
							$_at_Commands{$_l_RowCount}:="End Applescript"
							$_l_Index:=$_l_TextIndex-1
							$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
						Else 
							If ($_bo_FirstLine)
								$_l_RowCount:=$_l_RowCount+1
								$_bo_FirstLine:=False:C215
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							If ($_l_CurrentColumn>$_l_ColumnCount)
								$_l_ColumnCount:=$_l_CurrentColumn
							End if 
							ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
							ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
							ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
							ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
							ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
							$_at_ExternalBlocks{$_l_RowCount}:=$_at_ExternalBlocks{$_l_RowCount}+Char:C90(13)+Char:C90(10)
							
					End case 
				Else 
					$_l_Index:=$_l_TextIndex-1
					$_l_TextIndex:=Size of array:C274($_at_ScriptTextLines)
				End if 
			End for 
		Else 
			If (VmTitle2#"")
				$_l_RowCount:=$_l_RowCount+1
				If ($_l_CurrentColumn>$_l_ColumnCount)
					$_l_ColumnCount:=$_l_CurrentColumn
					ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
					ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
					ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
				End if 
				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_RowCount; $_l_ColumnCount)
				ARRAY TEXT:C222($_at_Commands; $_l_RowCount)
				ARRAY TEXT:C222($_at_ExternalBlocks; $_l_RowCount)
				ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
				ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
				$_at_2DTextBlocks{$_l_RowCount}{$_l_CurrentColumn}:=VmTitle2
				$_t_Command:=""
				ARRAY TEXT:C222($_at_Parameters1D; 0)
				ARRAY TEXT:C222($_at_Conjuctions1D; 0)
				
				Macro_BreakLine(VmTitle2; ->$_t_Command; ->$_at_Parameters1D; ->$_at_Conjuctions1D)
				If (Size of array:C274($_at_Parameters1D)>$_l_ParameterColumns)
					$_l_ParameterColumns:=Size of array:C274($_at_Parameters1D)
					ARRAY TEXT:C222($_at_2DParameters; $_l_RowCount; $_l_ParameterColumns)
					ARRAY TEXT:C222($_at_Conjuctions; $_l_RowCount; $_l_ParameterColumns)
				End if 
				$_at_Commands{$_l_RowCount}:=$_t_Command
				$_bo_StepOut:=False:C215
				If ($_t_Command#"")
					Repeat 
						If ($_t_Command[[Length:C16($_t_Command)]]=" ")
							$_t_Command:=Substring:C12($_t_Command; 1; Length:C16($_t_Command)-1)
							If ($_t_Command="")
								$_bo_StepOut:=True:C214
							Else 
								If ($_t_Command[[Length:C16($_t_Command)]]#" ")
									$_bo_StepOut:=True:C214
								End if 
							End if 
						Else 
							$_bo_StepOut:=True:C214
						End if 
					Until ($_bo_StepOut)
				End if 
				$_bo_StepOut:=False:C215
				If ($_t_Command#"")
					Repeat 
						If ($_t_Command[[1]]=" ")
							$_t_Command:=Substring:C12($_t_Command; 2)
							If ($_t_Command="")
								$_bo_StepOut:=True:C214
							Else 
								If ($_t_Command[[1]]#" ")
									$_bo_StepOut:=True:C214
								End if 
							End if 
						Else 
							$_bo_StepOut:=True:C214
						End if 
					Until ($_bo_StepOut)
				End if 
				For ($_l_ParametersIndex; 1; Size of array:C274($_at_Parameters1D))
					$_at_2DParameters{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Parameters1D{$_l_ParametersIndex}
					$_at_Conjuctions{$_l_RowCount}{$_l_ParametersIndex}:=$_at_Conjuctions1D{$_l_ParametersIndex}
				End for 
				
			End if 
	End case 
End for 
If (False:C215)
	$_t_DocumentName:=$1
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; ":"; "")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "/"; "_")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "\\"; "_")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "."; "_")
	$_ti_DocumentRef:=Create document:C266($_t_DocumentName+".txt"; "TEXT")
	SET BLOB SIZE:C606([SCRIPTS:80]Parsed_Script:20; 0)
	$_l_NumberofLines:=Size of array:C274($_at_2DTextBlocks)
	VARIABLE TO BLOB:C532($_l_NumberofLines; [SCRIPTS:80]Parsed_Script:20; *)
	
	For ($_l_Index; 1; Size of array:C274($_at_2DTextBlocks))
		VARIABLE TO BLOB:C532($_at_2DTextBlocks{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
		
		//````````````
		For ($_l_TextBlocksIndex; 1; Size of array:C274($_at_2DTextBlocks{$_l_Index}))
			
			SEND PACKET:C103($_ti_DocumentRef; $_at_2DTextBlocks{$_l_Index}{$_l_TextBlocksIndex}+Char:C90(9))
		End for 
		SEND PACKET:C103($_ti_DocumentRef; $_at_Commands{$_l_Index}+Char:C90(9))
		
		For ($_l_TextBlocksIndex; 1; Size of array:C274($_at_2DParameters{$_l_Index}))
			SEND PACKET:C103($_ti_DocumentRef; $_at_2DParameters{$_l_Index}{$_l_TextBlocksIndex}+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; $_at_Conjuctions{$_l_Index}{$_l_TextBlocksIndex}+Char:C90(9))
		End for 
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
	End for 
	VARIABLE TO BLOB:C532($_at_Commands; [SCRIPTS:80]Parsed_Script:20; *)
	VARIABLE TO BLOB:C532($_at_ExternalBlocks; [SCRIPTS:80]Parsed_Script:20; *)
	For ($_l_Index; 1; Size of array:C274($_at_2DParameters))
		VARIABLE TO BLOB:C532($_at_2DParameters{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
	End for 
	For ($_l_Index; 1; Size of array:C274($_at_Conjuctions))
		VARIABLE TO BLOB:C532($_at_Conjuctions{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
	End for 
	If (Count parameters:C259>=1)
		$_bo_Save:=$2
	Else 
		$_bo_Save:=True:C214
	End if 
	If ($_bo_Save)
		SAVE RECORD:C53([SCRIPTS:80])
	End if 
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
Else 
	
	SET BLOB SIZE:C606([SCRIPTS:80]Parsed_Script:20; 0)
	$_l_NumberofLines:=Size of array:C274($_at_2DTextBlocks)
	VARIABLE TO BLOB:C532($_l_NumberofLines; [SCRIPTS:80]Parsed_Script:20; *)
	For ($_l_Index; 1; Size of array:C274($_at_2DTextBlocks))
		VARIABLE TO BLOB:C532($_at_2DTextBlocks{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
	End for 
	VARIABLE TO BLOB:C532($_at_Commands; [SCRIPTS:80]Parsed_Script:20; *)
	VARIABLE TO BLOB:C532($_at_ExternalBlocks; [SCRIPTS:80]Parsed_Script:20; *)
	For ($_l_Index; 1; Size of array:C274($_at_2DParameters))
		VARIABLE TO BLOB:C532($_at_2DParameters{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
	End for 
	For ($_l_Index; 1; Size of array:C274($_at_Conjuctions))
		VARIABLE TO BLOB:C532($_at_Conjuctions{$_l_Index}; [SCRIPTS:80]Parsed_Script:20; *)
	End for 
	[SCRIPTS:80]ParsedStamp:24:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
	
	If (Count parameters:C259>=2)
		$_bo_Save:=$2
	Else 
		$_bo_Save:=True:C214
	End if 
	If ($_bo_Save)
		SAVE RECORD:C53([SCRIPTS:80])
	End if 
	
End if 
ERR_MethodTrackerReturn("MACRO_ParseForCode"; $_t_oldMethodName)