//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_BreakLine
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       23/09/2011 21:21 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StatementGroups; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0)
	ARRAY TEXT:C222($_at_ParameterStrings; 0)
	ARRAY TEXT:C222($_at_Statements; 0)
	C_BOOLEAN:C305($_bo_PossibleConjunction)
	C_LONGINT:C283($_l_AdjustIndex; $_l_BracketLevel; $_l_BracketsCount; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_CharacterPosition3; $_l_CheckStartPosition; $_l_CloseCount; $_l_ClosingsToAdd; $_l_CountClosingBrackets; $_l_Counter)
	C_LONGINT:C283($_l_CountOpenBrackets; $_l_CountOpeningBrackets; $_l_CurrentGroup; $_l_ExtraClosingsToRemove; $_l_FindEnd; $_l_GetsPosition; $_l_Index; $_l_Index2; $_l_Length; $_l_MaxLength; $_l_p2)
	C_LONGINT:C283($_l_PositionAND; $_l_PositionIndex; $_l_PositionNEXT; $_l_PositionOR; $_l_StripIndex; $_l_WidowedBracketCount)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_After; $_t_AfterGets; $_t_AssessedText; $_t_Before; $_t_BeforeBracket; $_t_BeforeInnerBrackets; $_t_CheckString; $_t_Command; $_t_Conjuction; $_t_ConjuctionCharacter; $_t_LastPhrase)
	C_TEXT:C284($_t_LastRealChar; $_t_Line; $_t_LineToAssess; $_t_LineToProcess; $_t_LineWithoutClosingBrackets; $_t_LineWithoutOpeningBrackets; $_t_Memory; $_t_Method; $_t_mTitle3; $_t_oldMethodName; $_t_Parameter)
	C_TEXT:C284($_t_Parameter1; $_t_ParameterData; $_t_RevisedLine; $_t_Statement; $_t_TakeOff; $_t_ThisCharacter; $1; VmTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_BreakLine")

If (Count parameters:C259>=3)  //& (False)
	
	$_t_Line:=$1
	$_l_GetsPosition:=Position:C15(":="; $_t_Line)
	If ($_l_GetsPosition=0)
		$_l_CharacterPosition:=Position:C15("("; $_t_Line)
		If ($_l_CharacterPosition>0)
			$_t_Command:=Substring:C12($_t_Line; 1; $_l_CharacterPosition-1)
			$_t_LineToAssess:=Substring:C12($_t_Line; $_l_CharacterPosition)
			APPEND TO ARRAY:C911($3->; $_t_LineToAssess)
			APPEND TO ARRAY:C911($4->; "")
			$2->:=$_t_Command
		Else 
			$2->:=$_t_Line
			//TRACE
		End if 
	Else 
		$_t_Command:=Substring:C12($_t_Line; 1; $_l_GetsPosition-1)
		//APPEND TO ARRAY($3->;$_t_Command)
		//APPEND TO ARRAY($4->;"")
		
		$_t_LineToAssess:=Substring:C12($_t_Line; $_l_GetsPosition+2)
		$_l_CharacterPosition:=Position:C15("NEW PROCESS"; $_t_LineToAssess)
		If ($_l_CharacterPosition>0)
			APPEND TO ARRAY:C911($3->; $_t_Command)
			APPEND TO ARRAY:C911($4->; "")
			$2->:="NEW PROCESS"
			$_l_CharacterPosition2:=Position:C15("("; $_t_LineToAssess)
			$_t_LineToAssess:=Substring:C12($_t_LineToAssess; $_l_CharacterPosition2+1)
			$_l_CharacterPosition:=Length:C16($_t_LineToAssess)
			Repeat 
				If ($_t_LineToAssess[[$_l_CharacterPosition]]=")")
					$_t_LineToAssess:=Substring:C12($_t_LineToAssess; 1; $_l_CharacterPosition-1)
					$_l_CharacterPosition:=0
				End if 
				$_l_CharacterPosition:=$_l_CharacterPosition-1
			Until ($_l_CharacterPosition<=0)
			$_l_CharacterPosition:=Position:C15(";"; $_t_LineToAssess)
			If ($_l_CharacterPosition>0)
				$_t_Method:=Substring:C12($_t_LineToAssess; 1; $_l_CharacterPosition-1)
				APPEND TO ARRAY:C911($3->; $_t_Method)
				APPEND TO ARRAY:C911($4->; "")
				
				$_t_LineToAssess:=Substring:C12($_t_LineToAssess; $_l_CharacterPosition+1)
				$_l_CharacterPosition:=Position:C15(";"; $_t_LineToAssess)
				If ($_l_CharacterPosition>0)
					$_t_Memory:=Substring:C12($_t_LineToAssess; 1; $_l_CharacterPosition)
					$_t_LineToAssess:=Substring:C12($_t_LineToAssess; $_l_CharacterPosition+1)
					Repeat 
						$_l_CharacterPosition:=Position:C15(";"; $_t_LineToAssess)
						If ($_l_CharacterPosition>0)
							$_t_Parameter:=Substring:C12($_t_LineToAssess; 1; $_l_CharacterPosition-1)
							$_t_LineToAssess:=Substring:C12($_t_LineToAssess; $_l_CharacterPosition+1)
							APPEND TO ARRAY:C911($3->; $_t_Parameter)
							APPEND TO ARRAY:C911($4->; "")
							
						Else 
							
							APPEND TO ARRAY:C911($3->; $_t_LineToAssess)
							APPEND TO ARRAY:C911($4->; "")
						End if 
					Until ($_l_CharacterPosition=0)
				End if 
			End if 
			
		Else 
			$2->:=$_t_Line
		End if 
	End if 
	
	
	If (False:C215)
		If ($_l_GetsPosition=0)
			//TRACE
			If (True:C214)
				$_l_CharacterPosition:=Position:C15("("; $_t_Line)
				If ($_l_CharacterPosition>0)
					$2->:=Substring:C12($_t_Line; 1; $_l_CharacterPosition-1)
					$_t_Conjuction:=""
					$_l_BracketLevel:=1
					Repeat 
						//TRACE
						$_l_p2:=0
						$_l_CloseCount:=0
						$_l_p2:=0
						$_l_CloseCount:=0
						
						$_t_LineToProcess:=Substring:C12($_t_Line; $_l_CharacterPosition)
						$_t_BeforeInnerBrackets:=Substring:C12($_t_Line; 1; $_l_CharacterPosition)
						If (False:C215)
							$_t_LineWithoutOpeningBrackets:=Replace string:C233($_t_LineToProcess; "("; "")
							$_l_CountOpeningBrackets:=Length:C16($_t_LineToProcess)-Length:C16($_t_LineWithoutOpeningBrackets)
							$_t_LineWithoutClosingBrackets:=Replace string:C233($_t_LineToProcess; ")"; "")
							$_l_CountClosingBrackets:=Length:C16($_t_LineToProcess)-Length:C16($_t_LineWithoutClosingBrackets)
							$_t_LastPhrase:=""
							Case of 
								: ($_l_CountClosingBrackets<$_l_CountOpeningBrackets) | (True:C214)  //add closing brackets
									$_t_LastRealChar:=""
									$_bo_PossibleConjunction:=False:C215
									$_l_WidowedBracketCount:=0
									$_l_BracketLevel:=0
									//There is a widowedBracket
									For ($_l_PositionIndex; 1; Length:C16($_t_LineToProcess))
										
										Case of 
											: ($_t_LineToProcess[[$_l_PositionIndex]]="(")  //openingbracket
												If ($_t_LastRealChar="ClosingBracket") & ($_bo_PossibleConjunction)
													$_t_LastPhrase:=$_t_LineToProcess[[$_l_PositionIndex]]  //Start a new phrase
													If ($_l_BracketLevel#0)
														//There is a widowedBracket
														If ($_l_BracketLevel=1)
															$_l_WidowedBracketCount:=$_l_WidowedBracketCount+$_l_BracketLevel
															$_t_LastPhrase:=Substring:C12($_t_LastPhrase; 2)
														Else 
															//The bracket level is greater than 1 add a closing bracket
															$_l_WidowedBracketCount:=$_l_WidowedBracketCount+($_l_BracketLevel-1)
															$_t_LastPhrase:=Substring:C12($_t_LastPhrase; 2)+")"
														End if 
														//and take off the widows at the beginning of the phrase
														
													End if 
													$_bo_PossibleConjunction:=False:C215
													$_l_BracketLevel:=1
												Else 
													//This opening bracket is not the start of a new phrase
													$_t_LastPhrase:=$_t_LastPhrase+$_t_LineToProcess[[$_l_PositionIndex]]
													$_bo_PossibleConjunction:=False:C215
													$_l_BracketLevel:=$_l_BracketLevel+1
												End if 
												$_t_LastRealChar:="OpeningBracket"
											: ($_t_LineToProcess[[$_l_PositionIndex]]=")")
												
												$_t_LastPhrase:=$_t_LastPhrase+$_t_LineToProcess[[$_l_PositionIndex]]
												
												$_l_BracketLevel:=$_l_BracketLevel-1
												$_t_LastRealChar:="ClosingBracket"
											: ($_t_LineToProcess[[$_l_PositionIndex]]="&")
												If ($_t_LastRealChar="ClosingBracket")
													$_bo_PossibleConjunction:=True:C214
													$_t_ConjuctionCharacter:="&"
												End if 
											: ($_t_LineToProcess[[$_l_PositionIndex]]="|")
												If ($_t_LastRealChar="ClosingBracket")
													$_bo_PossibleConjunction:=True:C214
													$_t_ConjuctionCharacter:="|"
												End if 
											Else 
												$_t_LastPhrase:=$_t_LastPhrase+$_t_LineToProcess[[$_l_PositionIndex]]
												$_t_LastRealChar:=""
										End case 
									End for 
									
									
									
								: ($_l_CountClosingBrackets>$_l_CountOpeningBrackets)
								Else 
							End case 
							If ($_l_BracketLevel>0)
								$_t_LastPhrase:=$_t_LastPhrase+(")"*$_l_BracketLevel)
								
							End if 
							If ($_t_LastPhrase#"")
								
							End if 
						End if 
						If (True:C214)
							
							For ($_l_Counter; $_l_CharacterPosition; Length:C16($_t_Line))
								If ($_l_Counter<=Length:C16($_t_Line))
									$_t_CheckString:=Substring:C12($_t_Line; $_l_Counter)
									$_l_CheckStartPosition:=Position:C15("("; $_t_CheckString)
									If ($_l_CheckStartPosition>0)  //is an opening bracket
										$_l_BracketsCount:=0
										$_l_CharacterPosition3:=0
										For ($_l_FindEnd; $_l_CheckStartPosition+1; Length:C16($_t_CheckString))
											If ($_t_CheckString[[$_l_FindEnd]]="(")
												$_l_BracketsCount:=$_l_BracketsCount+1
											End if 
											If ($_t_CheckString[[$_l_FindEnd]]=")")
												If ($_l_BracketsCount>0)
													$_l_BracketsCount:=$_l_BracketsCount-1
												Else 
													$_l_CharacterPosition3:=$_l_FindEnd
													$_l_FindEnd:=Length:C16($_t_CheckString)
												End if 
											End if 
										End for 
										If ($_l_CharacterPosition3=0)
											$_t_CheckString:=$_t_CheckString+")"
											$_l_CharacterPosition3:=Length:C16($_t_CheckString)
										End if 
										//$_l_CharacterPosition3:=Position(")";$_t_CheckString)
										If ($_l_CharacterPosition3>0)  //is a closing bracket
											If ($_l_CharacterPosition3<$_l_CheckStartPosition)
												//closing bracket is before opening bracket(goto closing bracket)
												$_l_Counter:=$_l_Counter+($_l_CharacterPosition3-1)
											Else 
												//closing bracket is after opening bracket(go to opening bracket)
												$_l_Counter:=$_l_Counter+($_l_CheckStartPosition-1)
												If ($_l_CheckStartPosition>1)
													$_t_BeforeBracket:=Substring:C12($_t_CheckString; 1; $_l_CheckStartPosition-1)
													Case of 
														: (Position:C15("&"; $_t_BeforeBracket)>0)
															$_t_BeforeBracket:="&"
														: (Position:C15("|"; $_t_BeforeBracket)>0)
															$_t_BeforeBracket:="|"
														: (Position:C15("#"; $_t_BeforeBracket)>0)
															$_t_BeforeBracket:="#"
														Else 
															//NO CONJUCTION SO IGNORE THE STATEMENT
															$_t_BeforeBracket:=""
													End case 
													If ($_t_BeforeBracket#"")
														$_t_RevisedLine:=Replace string:C233($_t_Line; $_t_BeforeInnerBrackets; "")
														$_t_TakeOff:=Substring:C12($_t_CheckString; 1; Length:C16($_t_CheckString)-1)  //Substring($_t_Line;1;$_l_Counter)
														
														$_t_LineWithoutOpeningBrackets:=Replace string:C233($_t_CheckString; "("; "")
														$_l_CountOpeningBrackets:=Length:C16($_t_CheckString)-Length:C16($_t_LineWithoutOpeningBrackets)
														$_t_LineWithoutClosingBrackets:=Replace string:C233($_t_TakeOff; ")"; "")
														$_l_CountClosingBrackets:=Length:C16($_t_CheckString)-Length:C16($_t_LineWithoutClosingBrackets)
														If ($_l_CountClosingBrackets>$_l_CountOpeningBrackets)
															$_l_ExtraClosingsToRemove:=$_l_CountClosingBrackets-$_l_CountOpeningBrackets
															$_l_MaxLength:=Length:C16($_t_CheckString)
															For ($_l_AdjustIndex; $_l_MaxLength; 1; -1)
																If ($_t_CheckString[[$_l_AdjustIndex]]=")")
																	If ($_l_ExtraClosingsToRemove>0)
																		If ($_l_AdjustIndex<Length:C16($_t_CheckString))
																			$_t_Before:=Substring:C12($_t_CheckString; 1; $_l_AdjustIndex-1)
																			$_t_After:=Substring:C12($_t_CheckString; $_l_AdjustIndex+1)
																			$_t_CheckString:=$_t_Before+$_t_After
																		Else 
																			$_t_CheckString:=Substring:C12($_t_CheckString; 1; Length:C16($_t_CheckString)-1)
																			
																		End if 
																		$_l_ExtraClosingsToRemove:=$_l_ExtraClosingsToRemove-1
																		
																	End if 
																End if 
																If ($_l_ExtraClosingsToRemove=0)
																	$_l_AdjustIndex:=0
																End if 
															End for 
														End if 
														If ($_l_CountClosingBrackets<$_l_CountOpeningBrackets)
															$_l_ClosingsToAdd:=$_l_CountOpeningBrackets-$_l_CountClosingBrackets
															//more opening bracked than closing cant asses properly
															
															$_t_CheckString:=$_t_CheckString+")"
														End if 
														$_t_Parameter:=$_t_CheckString
														
														$_t_RevisedLine:=$_t_BeforeInnerBrackets+Replace string:C233($_t_RevisedLine; $_t_TakeOff; "")
														//$pos3:=Position("(";$_t_Parameter)
														//$_t_Parameter:=Substring($_t_Parameter;$Pos3+1)
														$_l_Length:=Length:C16($_t_Parameter)
														//TRACE
														If (False:C215)
															Repeat 
																$_t_ThisCharacter:=$_t_Parameter[[$_l_Length]]
																If ($_t_ThisCharacter=")")
																	$_t_Parameter:=Substring:C12($_t_Parameter; 1; $_l_Length-1)
																	$_l_Length:=0
																Else 
																	$_l_Length:=$_l_Length-1
																End if 
															Until ($_l_Length=0)
														End if 
														$_l_Counter:=$_l_CharacterPosition+1
														If ($_t_BeforeBracket#"") & ($_t_Parameter#"")
															$_t_Line:=$_t_RevisedLine
															APPEND TO ARRAY:C911($3->; $_t_Parameter)
															APPEND TO ARRAY:C911($4->; $_t_Conjuction)
															$_t_Conjuction:=$_t_BeforeBracket
														End if 
													End if 
													
												End if 
												
											End if 
										Else 
											//no closing brackets..go to opening bracket
											$_l_Counter:=$_l_Counter+($_l_CheckStartPosition-1)
										End if 
									Else   //No opening brackets
										$_l_CharacterPosition3:=Position:C15(")"; $_t_CheckString)
										If ($_l_CharacterPosition3>0)
											$_l_Counter:=$_l_Counter+($_l_CharacterPosition3-1)
										Else 
											//no more brackets
											$_l_Counter:=Length:C16(VmTitle3)
										End if 
									End if 
									
									
									If ($_t_Line[[$_l_Counter]]="(")
										$_l_CloseCount:=$_l_CloseCount+1
									End if 
									If ($_t_Line[[$_l_Counter]]=")")
										If ($_l_CloseCount=0)
											If ($_l_CheckStartPosition>0)
												$_l_p2:=$_l_Counter
												$_l_Counter:=Length:C16($_t_Line)
											Else 
												$_l_p2:=$_l_Counter
												$_l_Counter:=Length:C16($_t_Line)
											End if 
											
										Else 
											$_l_CloseCount:=$_l_CloseCount-1
										End if 
									End if 
								Else 
									$_l_Counter:=999999999
								End if 
							End for 
							
							//$_l_p2:=Position(")";vMTitle3)
							If ($_l_p2=0)
								$_l_p2:=Length:C16($_t_Line)
							End if 
							$_t_mTitle3:=Substring:C12($_t_Line; $_l_p2+1)
							$_t_Parameter1:=Substring:C12($_t_Line; $_l_CharacterPosition+1; $_l_p2-($_l_CharacterPosition+1))
							For ($_l_StripIndex; 1; Length:C16($_t_Parameter1))
								If ($_t_Parameter1[[$_l_StripIndex]]#" ")
									If ($_t_Parameter1[[$_l_StripIndex]]="(")
										//opens with a bracket
										$_t_Parameter1:=Substring:C12($_t_Parameter1; $_l_StripIndex+1)
										$_l_Length:=Length:C16($_t_Parameter1)
										Repeat 
											$_t_ThisCharacter:=$_t_Parameter1[[$_l_Length]]
											If ($_t_ThisCharacter=")")
												$_t_Parameter1:=Substring:C12($_t_Parameter1; 1; $_l_Length-1)
												$_l_Length:=0
											Else 
												$_l_Length:=$_l_Length-1
											End if 
										Until ($_l_Length=0)
										$_l_StripIndex:=999999
									Else 
										$_l_StripIndex:=999999
									End if 
								End if 
							End for 
							
							If ($_t_Parameter1#"")
								Case of 
									: ($_t_Conjuction="&")
										APPEND TO ARRAY:C911($3->; $_t_Parameter1)
										APPEND TO ARRAY:C911($4->; "&")
									: ($_t_Conjuction="|")
										APPEND TO ARRAY:C911($3->; $_t_Parameter1)
										APPEND TO ARRAY:C911($4->; "&")
									: ($_t_Conjuction="#")
										APPEND TO ARRAY:C911($3->; $_t_Parameter1)
										APPEND TO ARRAY:C911($4->; "#")
									Else 
										APPEND TO ARRAY:C911($3->; $_t_Parameter1)
										APPEND TO ARRAY:C911($4->; "")
								End case 
							End if 
							If ($_t_mTitle3#"")
								$_t_Line:=$_t_mTitle3
								$_t_mTitle3:=""
								$_l_CharacterPosition:=Position:C15("("; $_t_Line)
								If ($_l_CharacterPosition>0)
									$_t_Conjuction:=Substring:C12($_t_Line; 1; $_l_CharacterPosition-1)
									Case of 
										: (Position:C15("&"; $_t_Conjuction)>0)
											$_t_Conjuction:="&"
										: (Position:C15("|"; $_t_Conjuction)>0)
											$_t_Conjuction:="|"
										: (Position:C15("#"; $_t_Conjuction)>0)
											$_t_Conjuction:="#"
										Else 
											//NO CONJUCTION SO IGNORE THE STATEMENT
											$_t_Line:=""
									End case 
								Else 
									$_t_Line:=""
								End if 
							Else 
								$_t_Line:=""
							End if 
						End if 
					Until ($_t_Line="")
				Else 
					$2->:=$_t_Line
				End if 
			End if 
			If (False:C215)
				ARRAY TEXT:C222($_at_Statements; 0)
				ARRAY TEXT:C222($_at_Conjuctions; 0)
				
				$_l_CharacterPosition:=Position:C15("("; $_t_Line)
				If ($_l_CharacterPosition>0)
					//$_t_Line:=""
					Repeat 
						$_l_PositionAND:=Position:C15("&"; $_t_Line)
						If ($_l_PositionAND>0)
							//Go back a few chars to see if preceded by a )
							For ($_l_Index2; $_l_PositionAND-1; 1; -1)
								If ($_t_Line[[$_l_Index2]]#" ")
									If ($_t_Line[[$_l_Index2]]=")")
										$_l_Index2:=0
									Else 
										$_l_PositionAND:=0
										$_l_Index2:=0
									End if 
								End if 
							End for 
							If ($_l_PositionAND>0)
								//Go Forward a few chars to see if followed  by a (
								For ($_l_Index2; $_l_PositionAND+1; Length:C16($_t_Line))
									If ($_t_Line[[$_l_Index2]]#" ")
										If ($_t_Line[[$_l_Index2]]="(")
											$_l_Index2:=0
										Else 
											$_l_PositionAND:=0
											$_l_Index2:=0
										End if 
									End if 
								End for 
							End if 
							
						End if 
						$_l_PositionOR:=Position:C15("|"; $_t_Line)
						If ($_l_PositionOR>0)
							//Go back a few chars to see if preceded by a )
							For ($_l_Index2; $_l_PositionOR-1; 1; -1)
								If ($_t_Line[[$_l_Index2]]#" ")
									If ($_t_Line[[$_l_Index2]]=")")
										$_l_Index2:=0
									Else 
										$_l_PositionOR:=0
										$_l_Index2:=0
									End if 
								End if 
							End for 
							If ($_l_PositionOR>0)
								//Go Forward a few chars to see if followed  by a (
								For ($_l_Index2; $_l_PositionOR+1; Length:C16($_t_Line))
									If ($_t_Line[[$_l_Index2]]#" ")
										If ($_t_Line[[$_l_Index2]]="(")
											$_l_Index2:=0
										Else 
											$_l_PositionOR:=0
											$_l_Index2:=0
										End if 
									End if 
								End for 
								
								
							End if 
							
						End if 
						If ($_l_PositionOR>0)
							If ($_l_PositionOR<$_l_PositionAND)
								$_l_PositionNEXT:=$_l_PositionOR
							Else 
								$_l_PositionNEXT:=$_l_PositionAND
							End if 
						Else 
							$_l_PositionNEXT:=$_l_PositionAND
						End if 
						If ($_l_PositionNEXT>0)
							APPEND TO ARRAY:C911($_at_Statements; Substring:C12($_t_Line; 1; ($_l_PositionNEXT-1)))
							
							If ($_l_PositionNEXT=$_l_PositionOR)
								APPEND TO ARRAY:C911($_at_Conjuctions; "|")
							Else 
								APPEND TO ARRAY:C911($_at_Conjuctions; "&")
							End if 
							
						Else 
							//no conjuction
							APPEND TO ARRAY:C911($_at_Statements; $_t_Line)
							APPEND TO ARRAY:C911($_at_Conjuctions; "")
						End if 
						
						
					Until ($_l_PositionOR=0) & ($_l_PositionAND=0)
					//Now we have each segment of the statement in an array we can assess the brackets on each statement.
					//if a statement has an extra ( remember it so we can group the section of the statement together-it may be around the whole statement
					ARRAY LONGINT:C221($_al_StatementGroups; 0)
					ARRAY LONGINT:C221($_al_StatementGroups; Size of array:C274($_at_Conjuctions))
					$_l_CurrentGroup:=0
					For ($_l_Index; 1; Size of array:C274($_at_Statements))
						$_t_Statement:=$_at_Statements{$_l_Index}
						$_l_CountOpenBrackets:=0
						For ($_l_Index2; 1; Length:C16($_t_Statement))
							If ($_t_Statement[[$_l_Index2]]="(")
								$_l_CountOpenBrackets:=$_l_CountOpenBrackets+1
							End if 
							If ($_t_Statement[[$_l_Index2]]=")")
								$_l_CountOpenBrackets:=$_l_CountOpenBrackets-1
							End if 
						End for 
						If ($_l_CountOpenBrackets>0)
							$_l_CurrentGroup:=$_l_CurrentGroup+1
							$_l_CharacterPosition:=Position:C15("("; $_t_Statement)
							//$_t_Statement:=Substring($_t_Statement;1;$_l_CharacterPosition-1)+Substring($_t_Statement;
						End if 
						
					End for 
				Else 
					//TRACE
					//no brackets?
				End if 
			End if   //
			//TRACE
			$_l_CharacterPosition:=Position:C15("("; $_t_Line)
			If ($_l_CharacterPosition>0)
				//With any statement we are only concerned that the brackets are all there
				//$BeforeGets:=Substring($_t_Line;1;$_l_GetsPosition-1)
				//$_t_AfterGets:=Substring($_t_Line;$_l_GetsPosition+1)
				$_t_AssessedText:=""
				
				Repeat 
					$_l_CharacterPosition:=Position:C15("&"; $_t_AfterGets)
					If ($_l_CharacterPosition=0)
						$_l_CharacterPosition:=Position:C15("|"; $_t_AfterGets)
					End if 
					If ($_l_CharacterPosition>0)
						//assess the bit before the conjuction and and the assessed bit to $_t_AssessedText
						
					End if 
				Until ($_l_CharacterPosition=0)
			Else 
				//no brackets?
			End if 
		Else 
			$_t_Before:=Substring:C12($_t_Line; 1; $_l_GetsPosition-1)
			$_t_After:=Substring:C12($_t_Line; $_l_GetsPosition+2)
			$_l_CharacterPosition:=Position:C15("NEW PROCESS"; $_t_After)
			If ($_l_CharacterPosition=0)
				
				$2->:=$_t_Line
			Else 
				//TRACE
				ARRAY TEXT:C222($_at_ParameterStrings; 0)
				//note that the first 3 parameters are the metod name;memory required and Process_Name..we will allow this to be called with just the method name `and we store the return value in parameter 1
				$_l_CharacterPosition:=Position:C15("("; $_t_After)
				$_t_After:=Substring:C12($_t_After; $_l_CharacterPosition+1)
				APPEND TO ARRAY:C911($3->; $_t_Before)
				APPEND TO ARRAY:C911($4->; "")
				$2->:="NEW PROCESS"
				Repeat 
					$_l_CharacterPosition:=Position:C15(";"; $_t_After)
					If ($_l_CharacterPosition>0)
						$_t_ParameterData:=Substring:C12($_t_After; 1; $_l_CharacterPosition-1)
						If ($_t_ParameterData#"")
							If ($_t_ParameterData[[1]]=Char:C90(34))
								$_t_ParameterData:=Substring:C12($_t_ParameterData; 2)
							End if 
							If ($_t_ParameterData[[Length:C16($_t_ParameterData)]]=Char:C90(34))
								$_t_ParameterData:=Substring:C12($_t_ParameterData; 1; Length:C16($_t_ParameterData)-1)
							End if 
						End if 
						APPEND TO ARRAY:C911($3->; $_t_ParameterData)
						APPEND TO ARRAY:C911($4->; "")
						$_t_After:=Substring:C12($_t_After; $_l_CharacterPosition+1)
					Else 
						$_l_CharacterPosition2:=Position:C15(")"; $_t_After)
						If ($_l_CharacterPosition2>0)
							$_t_ParameterData:=Substring:C12($_t_After; 1; $_l_CharacterPosition2-1)
							If ($_t_ParameterData#"")
								If ($_t_ParameterData[[1]]=Char:C90(34))
									$_t_ParameterData:=Substring:C12($_t_ParameterData; 2)
								End if 
								If ($_t_ParameterData[[Length:C16($_t_ParameterData)]]=Char:C90(34))
									$_t_ParameterData:=Substring:C12($_t_ParameterData; 1; Length:C16($_t_ParameterData)-1)
								End if 
							End if 
							APPEND TO ARRAY:C911($3->; $_t_ParameterData)
							APPEND TO ARRAY:C911($4->; "")
						End if 
					End if 
					
				Until ($_l_CharacterPosition=0)
				
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Macro_BreakLine"; $_t_oldMethodName)
