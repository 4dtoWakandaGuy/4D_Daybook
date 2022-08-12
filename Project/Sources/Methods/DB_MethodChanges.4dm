//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MethodChanges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2013 03:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_NewLineNumber; 0)
	ARRAY LONGINT:C221($_al_OLDLineNumber; 0)
	ARRAY TEXT:C222($_at_ChangedLinesCombined; 0)
	ARRAY TEXT:C222($_at_ChangedLinesinNEW; 0)
	ARRAY TEXT:C222($_at_ChangedLinesinOLD; 0)
	ARRAY TEXT:C222($_at_ChangedLinesNotes; 0)
	C_LONGINT:C283($_l_AddBlockContinueLine; $_l_AddBlockStartLine; $_l_DeleteBlockStartContinue; $_l_DeleteBlockStartLine; $_l_EditBlockContinueLine; $_l_EditBlockStartLine; $_l_FindLineIndex; $_l_Index; $_l_LineNumberIndexin1; $_l_LineNumberRowin1; $_l_LineNumberRowin2)
	C_LONGINT:C283($_l_Offset1; $_l_Offset2; $5; $6)
	C_POINTER:C301($_ptr_DocLineNumbers1Array; $_ptr_DocLineNumbers2Array; $_ptr_DocLines1; $_ptr_DocLines2; $1; $2; $3; $4)
	C_TEXT:C284($_t_AddBlockText; $_t_DeleteBlockText; $_t_EditBlockText; $_t_EditedLines; $_t_LinesAddedToNew; $_t_LinesDeletedFromNew; $_t_LineText; $_t_oldMethodName; $_t_ReturnText; $_t_Text; $_t_VersionChangeNotes)
	C_TEXT:C284($_t_WithoutNew; $_t_WithoutOld; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MethodChanges"; Form event code:C388)

ARRAY TEXT:C222($_at_ChangedLinesinNEW; 0)
ARRAY TEXT:C222($_at_ChangedLinesinOLD; 0)
ARRAY TEXT:C222($_at_ChangedLinesCombined; 0)
ARRAY LONGINT:C221($_al_NewLineNumber; 0)
ARRAY LONGINT:C221($_al_OLDLineNumber; 0)
ARRAY TEXT:C222($_at_ChangedLinesNotes; 0)
$_l_Offset1:=0
$_l_Offset2:=0
If (Count parameters:C259>=5)
	$_l_Offset1:=$5
End if 
If (Count parameters:C259>=6)
	$_l_Offset2:=$6
End if 
$_t_EditedLines:=""
$_t_LinesAddedToNew:=""
$_t_LinesDeletedFromNew:=""
$_t_Text:=""
$_t_VersionChangeNotes:=""

$_l_AddBlockStartLine:=0
$_l_AddBlockContinueLine:=0
$_t_AddBlockText:=""

$_l_DeleteBlockStartLine:=0
$_l_DeleteBlockStartContinue:=0
$_t_DeleteBlockText:=""

$_l_EditBlockStartLine:=0
$_l_EditBlockContinueLine:=0
$_t_EditBlockText:=""

$_ptr_DocLineNumbers1Array:=$1
$_ptr_DocLineNumbers2Array:=$2
$_ptr_DocLines1:=$3
$_ptr_DocLines2:=$4
$0:=""


For ($_l_LineNumberIndexin1; 1; Size of array:C274($_ptr_DocLineNumbers1Array->))
	Case of 
		: ($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}>0) & ($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}=0)
			//Line number is in new not in old
			//there seems to be an error in the diff where sometimes it will report a line as being different when its the same
			$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers2Array->; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
			Case of 
				: ($_l_LineNumberRowin2<0)
					APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
					APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
					APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Additional Line in New at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}+$_l_Offset1)+" Text Added "+$_ptr_DocLines1->{$_l_LineNumberIndexin1})
					
				Else 
					If ($_ptr_DocLines2->{$_l_LineNumberRowin2}#$_ptr_DocLines1->{$_l_LineNumberIndexin1})
						
						If ($_l_LineNumberRowin2>$_l_LineNumberIndexin1)
							$_t_LineText:=$_ptr_DocLines2->{$_l_LineNumberRowin2}
							//For ($_l_FindLineIndex;$_l_LineNumberIndexin1;$_l_LineNumberRowin2)
							For ($_l_FindLineIndex; $_l_LineNumberIndexin1; Size of array:C274($_ptr_DocLineNumbers1Array->))
								If ($_ptr_DocLines1->{$_l_FindLineIndex}#$_t_LineText)
									If ($_ptr_DocLineNumbers1Array->{$_l_FindLineIndex}=0) | ($_ptr_DocLineNumbers1Array->{$_l_FindLineIndex}>=$_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
										If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
											$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
										End if 
										If ($_ptr_DocLines2->{$_l_LineNumberRowin2}#"") | (True:C214)
											$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2})
											If ($_l_LineNumberRowin1<1)
												$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2})
												If ($_l_LineNumberRowin1<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
													APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberRowin2})
												End if 
												$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers1Array->)
												
											Else 
												If ($_l_LineNumberRowin1=$_l_LineNumberIndexin1)
													If ($_ptr_DocLines1->{$_l_FindLineIndex}#"")
														//the lines on $_ptr_DocLines1(The new doc) are added
														$_l_LineNumberRowin1:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
														
														
														If ($_l_LineNumberRowin1<0)
															APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_FindLineIndex})
															APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
															APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_FindLineIndex})
															APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
															APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
															APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Additional Line in New at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_FindLineIndex}+$_l_Offset1)+" Line Added "+$_ptr_DocLines1->{$_l_FindLineIndex})
														End if 
													End if 
												Else 
													If ($_ptr_DocLines2->{$_l_LineNumberRowin2}#$_ptr_DocLines1->{$_l_LineNumberRowin1})
														$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2})
														If ($_l_LineNumberRowin1<0)
															APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
															APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberRowin2})
															APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberRowin2})
															APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
															APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2})
															APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberRowin2}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberRowin2})
														End if 
														
													End if 
													$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers1Array->)
													
												End if 
											End if 
										End if 
										//$_l_FindLineIndex:=Size of array($_ptr_DocLineNumbers1Array->)
										
									Else 
										If ($_ptr_DocLines1->{$_l_FindLineIndex}#"") | (True:C214)
											$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers2Array->; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
											If ($_l_LineNumberRowin2<1)
												$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
												If ($_l_LineNumberRowin2<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Additional Line in New at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_FindLineIndex}+$_l_Offset1)+" Line Added "+$_ptr_DocLines1->{$_l_FindLineIndex})
												End if 
											Else 
												If ($_ptr_DocLines1->{$_l_FindLineIndex}#$_ptr_DocLines2->{$_l_LineNumberRowin2})
													
													$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
													If ($_l_LineNumberRowin2<0)
														APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
														APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
														APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Additional Line in New at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_FindLineIndex}+$_l_Offset1)+" Line Added "+$_ptr_DocLines1->{$_l_FindLineIndex})
													End if 
												End if 
											End if 
											
										End if 
									End if 
								Else 
									If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
										$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
									End if 
									$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers1Array->)
								End if 
							End for 
						Else 
							If ($_ptr_DocLines1->{$_l_LineNumberIndexin1}#"") | (True:C214)
								$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers2Array->; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
								If ($_l_LineNumberRowin2<1)
									$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
									If ($_l_LineNumberRowin2<0)
										APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
										APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
										APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line added "+$_ptr_DocLines1->{$_l_LineNumberIndexin1})
									End if 
								Else 
									If ($_ptr_DocLines2->{$_l_LineNumberRowin2}#$_ptr_DocLines1->{$_l_LineNumberIndexin1})
										$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
										If ($_l_LineNumberRowin2<0)
											APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
											APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
											APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line added "+$_ptr_DocLines1->{$_l_LineNumberIndexin1})
										End if 
									End if 
									
								End if 
							End if 
						End if 
					End if 
			End case 
			
		: ($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}=0) & ($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}>0)
			//Line number no is not in new but is in old
			If (False:C215)
				If ($_ptr_DocLines2->{$_l_LineNumberIndexin1}#"") | (True:C214)
					APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
					APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
					APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
					APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
					
				End if 
			End if 
			$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
			Case of 
				: ($_l_LineNumberRowin2>$_l_LineNumberIndexin1)
					Case of 
						: ($_l_LineNumberRowin2<0)
							If ($_ptr_DocLines2->{$_l_LineNumberIndexin1}#"")
								$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
								If ($_l_LineNumberRowin1<1)
									$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
									If ($_l_LineNumberRowin1<0)
										APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
										APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
										APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
									End if 
								Else 
									If ($_ptr_DocLines1->{$_l_LineNumberRowin1}#$_ptr_DocLines2->{$_l_LineNumberIndexin1})
										$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
										If ($_l_LineNumberRowin1<0)
											APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
											APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
											APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
											APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
										End if 
									End if 
								End if 
							End if 
							
						Else 
							$_t_LineText:=$_ptr_DocLines1->{$_l_LineNumberRowin2}
							For ($_l_FindLineIndex; $_l_LineNumberIndexin1; Size of array:C274($_ptr_DocLineNumbers2Array->))
								If ($_ptr_DocLines2->{$_l_FindLineIndex}#$_t_LineText)
									If ($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}=0)
										If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
											$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
										End if 
										If ($_ptr_DocLines1->{$_l_LineNumberRowin2}#"") | (True:C214)
											$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers2Array->; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
											If ($_l_LineNumberRowin2<0)
												
												$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
												If ($_l_LineNumberRowin2<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_l_LineNumberRowin2+$_l_Offset2)+" Line Added "+$_ptr_DocLines1->{$_l_LineNumberRowin2})
												End if 
											Else 
												If ($_ptr_DocLines1->{$_l_LineNumberRowin2}#$_ptr_DocLines2->{$_l_LineNumberRowin2})
													$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
													If ($_l_LineNumberRowin2<0)
														APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
														APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
														APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_l_LineNumberRowin2+$_l_Offset2)+" Line Added "+$_ptr_DocLines1->{$_l_LineNumberRowin2})
													End if 
												End if 
											End if 
										End if 
										$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers2Array->)
									Else 
										If ($_ptr_DocLines2->{$_l_FindLineIndex}#"") | (True:C214)
											$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
											If ($_l_LineNumberRowin1<0)
												
												$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
												If ($_l_LineNumberRowin1<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
													APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_FindLineIndex})
												End if 
											Else 
												If ($_ptr_DocLines2->{$_l_FindLineIndex}#$_ptr_DocLines1->{$_l_LineNumberRowin1})
													$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
													If ($_l_LineNumberRowin1<0)
														APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
														APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
														APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_FindLineIndex})
													End if 
												End if 
											End if 
										End if 
									End if 
								Else 
									If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
										$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
									End if 
									
									$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers2Array->)
								End if 
							End for 
							
					End case 
				: ($_l_LineNumberRowin2<$_l_LineNumberIndexin1)
					//trace
					Case of 
						: ($_l_LineNumberRowin2<0)
							$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
							If ($_l_LineNumberRowin1<0)
								If ($_ptr_DocLines2->{$_l_LineNumberIndexin1}#"")
									$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
									If ($_l_LineNumberRowin1<0)
										APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
										APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
										APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
									End if 
								End if 
							Else 
								If ($_ptr_DocLines1->{$_l_LineNumberRowin1}#$_ptr_DocLines1->{$_l_LineNumberIndexin1})
									$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
									If ($_l_LineNumberRowin1<0)
										APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
										APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
										APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
										APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
									End if 
								End if 
								
							End if 
							
						Else 
							$_t_LineText:=$_ptr_DocLines1->{$_l_LineNumberRowin2}
							For ($_l_FindLineIndex; $_l_LineNumberRowin2; Size of array:C274($_ptr_DocLineNumbers2Array->))
								If ($_ptr_DocLines2->{$_l_FindLineIndex}#$_t_LineText)
									If ($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}=0)
										If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
											$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
										End if 
										If ($_ptr_DocLines1->{$_l_LineNumberRowin2}#"") | (True:C214)
											$_l_LineNumberRowin2:=Find in array:C230($_ptr_DocLineNumbers2Array->; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
											If ($_l_LineNumberRowin2<0)
												$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
												If ($_l_LineNumberRowin2<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
													APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_l_LineNumberRowin2+$_l_Offset2)+" Line Added "+$_ptr_DocLines1->{$_l_LineNumberRowin2})
												End if 
											Else 
												If ($_ptr_DocLines2->{$_l_LineNumberRowin2}#$_ptr_DocLines1->{$_l_LineNumberRowin2})
													$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
													If ($_l_LineNumberRowin2<0)
														APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; $_ptr_DocLines1->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; "")
														APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines1->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_al_NewLineNumber; $_ptr_DocLineNumbers1Array->{$_l_LineNumberRowin2})
														APPEND TO ARRAY:C911($_al_OLDLineNumber; 0)
														APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in new at line number "+String:C10($_l_LineNumberRowin2+$_l_Offset2)+" Line Added "+$_ptr_DocLines1->{$_l_LineNumberRowin2})
													End if 
												End if 
											End if 
										End if 
										$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers2Array->)
									Else 
										If ($_ptr_DocLines2->{$_l_FindLineIndex}#"") | (True:C214)
											$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
											If ($_l_LineNumberRowin1<0)
												$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
												If ($_l_LineNumberRowin1<0)
													APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
													APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
													APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
													APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_FindLineIndex})
												End if 
											Else 
												If ($_ptr_DocLines2->{$_l_FindLineIndex}#$_ptr_DocLines1->{$_l_LineNumberRowin1})
													$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
													If ($_l_LineNumberRowin1<0)
														APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
														APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
														APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_FindLineIndex})
														APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_FindLineIndex}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_FindLineIndex})
													End if 
												End if 
											End if 
											
										End if 
									End if 
								Else 
									If (($_l_FindLineIndex-1)>$_l_LineNumberIndexin1)
										$_l_LineNumberIndexin1:=$_l_FindLineIndex-1
									End if 
									
									$_l_FindLineIndex:=Size of array:C274($_ptr_DocLineNumbers2Array->)
								End if 
							End for 
							
					End case 
				Else 
					If ($_ptr_DocLines2->{$_l_LineNumberIndexin1}#"")
						$_l_LineNumberRowin1:=Find in array:C230($_ptr_DocLineNumbers1Array->; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
						If ($_l_LineNumberRowin1<0)
							$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
							If ($_l_LineNumberRowin1<0)
								APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
								APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
								APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
								APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
								APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
								APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
							End if 
						Else 
							If ($_ptr_DocLines2->{$_l_LineNumberIndexin1}#$_ptr_DocLines1->{$_l_LineNumberRowin1})
								$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
								If ($_l_LineNumberRowin1<0)
									APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
									APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
									APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
									APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
									APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
									APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
								End if 
							End if 
						End if 
					End if 
			End case 
		: ($_ptr_DocLineNumbers1Array->{$_l_LineNumberIndexin1}>0) & ($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}>0)
			//line number is in old and new
			If ($_ptr_DocLines1->{$_l_LineNumberIndexin1}#$_ptr_DocLines2->{$_l_LineNumberIndexin1})
				//TRACE
				APPEND TO ARRAY:C911($_at_ChangedLinesinNEW; "")
				APPEND TO ARRAY:C911($_at_ChangedLinesinOLD; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
				APPEND TO ARRAY:C911($_at_ChangedLinesCombined; $_ptr_DocLines2->{$_l_LineNumberIndexin1})
				APPEND TO ARRAY:C911($_al_NewLineNumber; 0)
				APPEND TO ARRAY:C911($_al_OLDLineNumber; $_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1})
				APPEND TO ARRAY:C911($_at_ChangedLinesNotes; "Extra Line in old at line number "+String:C10($_ptr_DocLineNumbers2Array->{$_l_LineNumberIndexin1}+$_l_Offset2)+" Line Removed "+$_ptr_DocLines2->{$_l_LineNumberIndexin1})
				
			End if 
	End case 
	
End for 
For ($_l_Index; Size of array:C274($_at_ChangedLinesinNEW); 1; -1)
	If ($_al_NewLineNumber{$_l_Index}>0)
		$_l_LineNumberRowin1:=Find in array:C230($_al_OLDLineNumber; $_al_NewLineNumber{$_l_Index})
		If ($_l_LineNumberRowin1>0) & ($_l_LineNumberRowin1#$_l_Index)  //line is in both
			$_al_NewLineNumber{$_l_LineNumberRowin1}:=$_al_NewLineNumber{$_l_Index}
			$_at_ChangedLinesCombined{$_l_LineNumberRowin1}:=$_at_ChangedLinesinNEW{$_l_Index}
			$_at_ChangedLinesinNEW{$_l_LineNumberRowin1}:=$_at_ChangedLinesinNEW{$_l_Index}
			Case of 
				: (Position:C15("//"; ($_at_ChangedLinesinNEW{$_l_LineNumberRowin1}))=1)  //commented out
					$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+"commented out"+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" to "+$_at_ChangedLinesinNEW{$_l_LineNumberRowin1}
					
				: ($_at_ChangedLinesinNEW{$_l_LineNumberRowin1}="")  //blanked
					$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+"Removed Text"+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}
					
				: ($_at_ChangedLinesinOLD{$_l_LineNumberRowin1}="")  //Added(was blank)
					$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+"Added Text "+$_at_ChangedLinesinNEW{$_l_LineNumberRowin1}
					
				: (Position:C15("//"; $_at_ChangedLinesinOLD{$_l_LineNumberRowin1})=1)  //uncommented out
					$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+"Uncommented from"+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" to "+$_at_ChangedLinesinNEW{$_l_LineNumberRowin1}
					
				Else 
					Case of 
						: (Position:C15($_at_ChangedLinesinOLD{$_l_LineNumberRowin1}; $_at_ChangedLinesinNEW{$_l_LineNumberRowin1})>0)  //the old code is still there just something added
							$_t_WithoutOld:=Replace string:C233($_at_ChangedLinesinNEW{$_l_LineNumberRowin1}; $_at_ChangedLinesinOLD{$_l_LineNumberRowin1}; "")
							If (Position:C15("//"; $_t_WithoutOld)=1)  //commented Added
								$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" Comment Added "+$_t_WithoutOld
							Else 
								$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" Text Added "+$_t_WithoutOld
							End if 
						: (Position:C15($_at_ChangedLinesinNEW{$_l_LineNumberRowin1}; $_at_ChangedLinesinOLD{$_l_LineNumberRowin1})>0)  //the new code is the old code minus something
							
							$_t_WithoutNew:=Replace string:C233($_at_ChangedLinesinOLD{$_l_LineNumberRowin1}; $_at_ChangedLinesinNEW{$_l_LineNumberRowin1}; "")
							If (Position:C15("//"; $_t_WithoutNew)=1)  //uncommented Added
								$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" Uncommented "+$_t_WithoutNew
							Else 
								$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" Text Removed "+$_t_WithoutNew
							End if 
						Else 
							$_at_ChangedLinesNotes{$_l_LineNumberRowin1}:="Line"+String:C10($_al_NewLineNumber{$_l_LineNumberRowin1})+$_at_ChangedLinesinOLD{$_l_LineNumberRowin1}+" Changed to "+Char:C90(13)+$_at_ChangedLinesinNEW{$_l_LineNumberRowin1}
							
							
					End case 
			End case 
			DELETE FROM ARRAY:C228($_at_ChangedLinesinNEW; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesinOLD; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesCombined; $_l_Index)
			DELETE FROM ARRAY:C228($_al_NewLineNumber; $_l_Index)
			DELETE FROM ARRAY:C228($_al_OLDLineNumber; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesNotes; $_l_Index)
			
		Else 
			Case of 
				: ($_at_ChangedLinesinNEW{$_l_Index}#"")
				: ($_at_ChangedLinesinOLD{$_l_Index}#"")
					
				Else 
					//The changed line is blank a
					DELETE FROM ARRAY:C228($_at_ChangedLinesinNEW; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesinOLD; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesCombined; $_l_Index)
					DELETE FROM ARRAY:C228($_al_NewLineNumber; $_l_Index)
					DELETE FROM ARRAY:C228($_al_OLDLineNumber; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesNotes; $_l_Index)
					
			End case 
		End if 
	Else 
		$_l_LineNumberRowin2:=Find in array:C230($_al_NewLineNumber; $_al_OLDLineNumber{$_l_Index})
		If ($_l_LineNumberRowin2>0) & ($_l_LineNumberRowin2#$_l_Index)  //line is in both
			$_al_OLDLineNumber{$_l_LineNumberRowin2}:=$_al_OLDLineNumber{$_l_Index}
			//`$_at_ChangedLinesCombined{$ref}:=$_at_ChangedLinesinNEW{$_l_Index}
			$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}:=$_at_ChangedLinesinOLD{$_l_Index}
			Case of 
				: (Position:C15("//"; ($_at_ChangedLinesinNEW{$_l_LineNumberRowin2}))=1)  //commented out
					$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" Commented out "+Char:C90(13)+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" to "+Char:C90(13)+$_at_ChangedLinesinNEW{$_l_LineNumberRowin2}
					
				: ($_at_ChangedLinesinNEW{$_l_LineNumberRowin2}="")  //blanked
					$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" Removed Text "+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}
					
				: ($_at_ChangedLinesinOLD{$_l_LineNumberRowin2}="")  //Added(was blank)
					$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" Added Text "+$_at_ChangedLinesinNEW{$_l_LineNumberRowin2}
					
				: (Position:C15("//"; $_at_ChangedLinesinOLD{$_l_LineNumberRowin2})=1)  //uncommented out
					$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" Uncommented from"+Char:C90(13)+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" to "+Char:C90(13)+$_at_ChangedLinesinNEW{$_l_LineNumberRowin2}
					
				Else 
					Case of 
						: (Position:C15($_at_ChangedLinesinOLD{$_l_LineNumberRowin2}; $_at_ChangedLinesinNEW{$_l_LineNumberRowin2})>0)  //the old code is still there just something added
							$_t_WithoutOld:=Replace string:C233($_at_ChangedLinesinNEW{$_l_LineNumberRowin2}; $_at_ChangedLinesinOLD{$_l_LineNumberRowin2}; "")
							If (Position:C15("//"; $_t_WithoutOld)=1)  //commented Added
								$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" "+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" Comment Added "+$_t_WithoutOld
							Else 
								$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" "+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" Text Added "+$_t_WithoutOld
							End if 
						: (Position:C15($_at_ChangedLinesinNEW{$_l_LineNumberRowin2}; $_at_ChangedLinesinOLD{$_l_LineNumberRowin2})>0)  //the new code is the old code minus something
							
							$_t_WithoutNew:=Replace string:C233($_at_ChangedLinesinOLD{$_l_LineNumberRowin2}; $_at_ChangedLinesinNEW{$_l_LineNumberRowin2}; "")
							If (Position:C15("//"; $_t_WithoutNew)=1)  //uncommented Added
								$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" "+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" Uncommented "+$_t_WithoutNew
							Else 
								$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+" "+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" Text Removed "+$_t_WithoutNew
							End if 
						Else 
							$_at_ChangedLinesNotes{$_l_LineNumberRowin2}:="Line "+String:C10($_al_NewLineNumber{$_l_LineNumberRowin2}+$_l_Offset1)+Char:C90(13)+$_at_ChangedLinesinOLD{$_l_LineNumberRowin2}+" Changed to "+Char:C90(13)+$_at_ChangedLinesinNEW{$_l_LineNumberRowin2}+Char:C90(13)
							
							
					End case 
			End case 
			DELETE FROM ARRAY:C228($_at_ChangedLinesinNEW; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesinOLD; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesCombined; $_l_Index)
			DELETE FROM ARRAY:C228($_al_NewLineNumber; $_l_Index)
			DELETE FROM ARRAY:C228($_al_OLDLineNumber; $_l_Index)
			DELETE FROM ARRAY:C228($_at_ChangedLinesNotes; $_l_Index)
			
		Else 
			Case of 
				: ($_at_ChangedLinesinNEW{$_l_Index}#"")
				: ($_at_ChangedLinesinOLD{$_l_Index}#"")
					
				Else 
					//The changed line is blank a
					DELETE FROM ARRAY:C228($_at_ChangedLinesinNEW; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesinOLD; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesCombined; $_l_Index)
					DELETE FROM ARRAY:C228($_al_NewLineNumber; $_l_Index)
					DELETE FROM ARRAY:C228($_al_OLDLineNumber; $_l_Index)
					DELETE FROM ARRAY:C228($_at_ChangedLinesNotes; $_l_Index)
					
			End case 
		End if 
	End if 
	
	
	
End for 
$_t_ReturnText:=""
For ($_l_Index; 1; Size of array:C274($_at_ChangedLinesinNEW))
	
	$_t_ReturnText:=$_t_ReturnText+$_at_ChangedLinesNotes{$_l_Index}+Char:C90(13)
End for 

$0:=$_t_ReturnText
ERR_MethodTrackerReturn("DB_MethodChanges"; $_t_oldMethodName)