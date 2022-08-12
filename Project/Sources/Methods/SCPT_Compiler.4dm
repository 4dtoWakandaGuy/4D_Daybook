//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_Compiler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_HandlerTypes; 0)
	ARRAY LONGINT:C221($_al_Level; 0)
	ARRAY LONGINT:C221($_al_LineNumbers; 0)
	ARRAY LONGINT:C221($_al_TypesChain; 0)
	ARRAY TEXT:C222($_at_2DCommand; 0; 0)
	ARRAY TEXT:C222($_at_CommandTypes; 0)
	ARRAY TEXT:C222($_at_ReturnParameters; 0)
	ARRAY TEXT:C222($_at_ScriptTextLines; 0)
	C_LONGINT:C283($_l_AssinValuePosition; $_l_CharacterCodeOpenBracket; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_CurrentChain; $_l_CurrentLevel; $_l_CurrentType; $_l_EndofLinePosition; $_l_ExitWithError; $_l_IndexColumns; $_l_IndexRows)
	C_LONGINT:C283($_l_MaxLevels; $_l_NumberofRows)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_AfterAssign; $_t_BeforeAssign; $_t_Command; $_t_CurrentLine; $_t_IncomingScriptText; $_t_oldMethodName; $_t_ParametersString; $_t_ReturnData)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_Compiler")

ARRAY TEXT:C222($_at_ScriptTextLines; 0)
If (Count parameters:C259>=1)
	$_t_IncomingScriptText:=$1->
Else 
	$_t_IncomingScriptText:=[SCRIPTS:80]Recording_Text:4
End if 
Repeat 
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_IncomingScriptText; *)
	
	If ($_l_EndofLinePosition>0)
		APPEND TO ARRAY:C911($_at_ScriptTextLines; Substring:C12($_t_IncomingScriptText; 1; $_l_EndofLinePosition-1))
		If ($_l_EndofLinePosition<Length:C16($_t_IncomingScriptText))
			$_t_IncomingScriptText:=Substring:C12($_t_IncomingScriptText; $_l_EndofLinePosition+1; Length:C16($_t_IncomingScriptText))
		Else 
			$_t_IncomingScriptText:=""
		End if 
	Else 
		APPEND TO ARRAY:C911($_at_ScriptTextLines; $_t_IncomingScriptText)
	End if 
	MESSAGE:C88($_at_ScriptTextLines{Size of array:C274($_at_ScriptTextLines)})
Until (Length:C16($_t_IncomingScriptText)=0)
For ($_l_IndexRows; Size of array:C274($_at_ScriptTextLines); 1; -1)
	MESSAGE:C88("BEFORE"+$_at_ScriptTextLines{$_l_IndexRows})
	If ($_at_ScriptTextLines{$_l_IndexRows}#"")
		$_at_ScriptTextLines{$_l_IndexRows}:=SCPT_StripTrailingSPACES($_at_ScriptTextLines{$_l_IndexRows}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
		$_at_ScriptTextLines{$_l_IndexRows}:=SCPT_StripLeadingSpaces($_at_ScriptTextLines{$_l_IndexRows}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
		
		
		$_at_ScriptTextLines{$_l_IndexRows}:=SCPT_StripTrailingComments($_at_ScriptTextLines{$_l_IndexRows})
	End if 
	MESSAGE:C88("AFTER"+$_at_ScriptTextLines{$_l_IndexRows})
	If ($_at_ScriptTextLines{$_l_IndexRows}="")
		DELETE FROM ARRAY:C228($_at_ScriptTextLines; $_l_IndexRows)
	End if 
End for 
//At this point we now have an array of the lines with no comments and no blank lines
ARRAY LONGINT:C221($_al_HandlerTypes; 0)
ARRAY TEXT:C222($_at_CommandTypes; 0)
ARRAY LONGINT:C221($_al_LineNumbers; 0)
ARRAY TEXT:C222($_at_2DCommand; 0; 0)
ARRAY LONGINT:C221($_al_Level; 0)
ARRAY LONGINT:C221($_al_TypesChain; 0)
ARRAY TEXT:C222($_at_ReturnParameters; 0)
$_l_MaxLevels:=1
$_l_CurrentLevel:=1
$_l_CurrentType:=0
$_l_CharacterCodeOpenBracket:=Character code:C91("(")
$_l_ExitWithError:=0
For ($_l_IndexRows; 1; Size of array:C274($_at_ScriptTextLines))
	$_t_CurrentLine:=$_at_ScriptTextLines{$_l_IndexRows}
	$_l_CharacterPosition:=Position:C15(Char:C90($_l_CharacterCodeOpenBracket); $_t_CurrentLine)
	If ($_l_CharacterPosition>0)
		$_t_Command:=Substring:C12($_t_CurrentLine; 1; $_l_CharacterPosition-1)
		$_t_ParametersString:=Substring:C12($_t_CurrentLine; $_l_CharacterPosition; Length:C16($_t_CurrentLine))
		$_l_CharacterPosition2:=Position:C15(":="; $_t_Command)
		If ($_l_CharacterPosition>0)
			//RETURNS A VALUE
			//take of the return parameter first
			$_t_ReturnData:=Substring:C12($_t_Command; 1; $_l_CharacterPosition-1)
			$_t_Command:=Substring:C12($_t_Command; $_l_CharacterPosition+2; Length:C16($_t_Command))
			$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
			If ($_l_CurrentLevel>$_l_MaxLevels)
				$_l_MaxLevels:=$_l_CurrentLevel
			End if 
			ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
			$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="EVALUATE"
			If ($_l_CurrentLevel>$_l_MaxLevels)
				$_l_MaxLevels:=$_l_CurrentLevel
			End if 
			APPEND TO ARRAY:C911($_al_HandlerTypes; 9)
		Else 
			Case of 
				: ($_t_Command=":")
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					// a continuation in a case chain
					$_l_CurrentChain:=$_al_TypesChain{Size of array:C274($_al_TypesChain)}
					If ($_l_CurrentChain=3)
						$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
						ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
						$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel-1}:="CASE INSTANCE"
						
					Else 
						$_l_ExitWithError:=-3
					End if 
				: ($_t_Command="For")
					APPEND TO ARRAY:C911($_al_TypesChain; 2)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="FOR"
					$_l_CurrentLevel:=$_l_CurrentLevel+1
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; 2)
					
				: ($_t_Command="if")
					APPEND TO ARRAY:C911($_al_TypesChain; 1)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="IF"
					$_l_CurrentLevel:=$_l_CurrentLevel+1
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; 1)
				: ($_t_Command="Case of")
					//this is an error a case of statement should not have anything else on the same line
					$_l_ExitWithError:=-1
				: ($_t_Command="Else")
					//are we in an if chain or a case of chain
					//this is an error  an else statement should not have anything else on the same line
				: ($_t_Command="End if")
					//this is an error  an end if statement should not have anything else on the same line
				: ($_t_Command="End case")
					//this is an error  an end case statement should not have anything else on the same line
					
				: ($_t_Command="While")
					
					APPEND TO ARRAY:C911($_al_TypesChain; 4)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="WHILE"
					$_l_CurrentLevel:=$_l_CurrentLevel+1
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					
					APPEND TO ARRAY:C911($_al_HandlerTypes; 4)
				: ($_t_Command="End while")
					//this is an error  an end while statement should not have anything else on the same line
				: ($_t_Command="Repeat")
					//this is an error  an repeat   statement should not have anything else on the same line
				: ($_t_Command="Until")
					
					APPEND TO ARRAY:C911($_al_TypesChain; 5)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="UNTIL"
					$_l_CurrentLevel:=$_l_CurrentLevel-1
					If ($_l_CurrentLevel>$_l_MaxLevels)  // This should neve happen here
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; -5)
				Else 
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:=$_t_Command
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; 0)
			End case 
			
		End if 
	Else 
		$_l_AssinValuePosition:=Position:C15(":="; $_t_CurrentLine)
		If ($_l_AssinValuePosition>0)
			APPEND TO ARRAY:C911($_at_CommandTypes; "ASSIGN")
			$_t_BeforeAssign:=Substring:C12($_t_CurrentLine; 1; $_l_AssinValuePosition-1)
			$_t_AfterAssign:=Substring:C12($_t_CurrentLine; $_l_AssinValuePosition+2; Length:C16($_t_CurrentLine))
			//IT MAY NOT BE AN ASSIGN IT MAY BE A COMMAND THAT RETURNS A VALUE WITH NO PARAMETERS
			$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
			If ($_l_CurrentLevel>$_l_MaxLevels)  //This should neve happen here
				$_l_MaxLevels:=$_l_CurrentLevel
			End if 
			ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
			$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:=$_t_AfterAssign
			//$_l_CurrentLevel:=$_l_CurrentLevel+1
			APPEND TO ARRAY:C911($_al_HandlerTypes; 0)
		Else 
			//IT IS A CALL TO A METHOD-NO PARAMETERS
			
			Case of 
				: ($_t_CurrentLine=":")
					//This is an error
					$_l_ExitWithError:=-3
				: ($_t_CurrentLine="For")
					//This is an error in the text it can be an if with no parameters
					$_l_ExitWithError:=-2
				: ($_t_CurrentLine="if")
					//This is an error in the text it can be an if with no parameters
					$_l_ExitWithError:=-1
				: ($_t_CurrentLine="Case of")
					APPEND TO ARRAY:C911($_al_TypesChain; 3)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="CASE OF"
					$_l_CurrentLevel:=$_l_CurrentLevel+1
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; 3)
				: ($_t_CurrentLine="Else")
					//are we in an if chain or a case of chain
					$_l_CurrentChain:=$_al_TypesChain{Size of array:C274($_al_TypesChain)}
					Case of 
						: ($_l_CurrentChain=1)  //in an if statement
							$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
							If ($_l_CurrentLevel>$_l_MaxLevels)
								$_l_MaxLevels:=$_l_CurrentLevel
							End if 
							ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
							$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel-1}:="ELSE"
							APPEND TO ARRAY:C911($_al_HandlerTypes; -10)  //else  in an if
						: ($_l_CurrentChain=3)  //in a case statement
							$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
							If ($_l_CurrentLevel>$_l_MaxLevels)
								$_l_MaxLevels:=$_l_CurrentLevel
							End if 
							ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
							$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel-1}:="ELSE"
							APPEND TO ARRAY:C911($_al_HandlerTypes; -30)  //else  in an if
					End case 
				: ($_t_CurrentLine="End if")
					$_l_CurrentChain:=$_al_TypesChain{Size of array:C274($_al_TypesChain)}
					If ($_l_CurrentChain=1)  //we are in an 'if statement
						$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
						If ($_l_CurrentLevel>$_l_MaxLevels)
							$_l_MaxLevels:=$_l_CurrentLevel
						End if 
						ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
						$_l_CurrentLevel:=$_l_CurrentLevel-1
						$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="END IF"
						APPEND TO ARRAY:C911($_al_HandlerTypes; -1)
						DELETE FROM ARRAY:C228($_al_TypesChain; Size of array:C274($_al_TypesChain))
					Else 
						$_l_ExitWithError:=-1
						
					End if 
				: ($_t_CurrentLine="End case")
					$_l_CurrentChain:=$_al_TypesChain{Size of array:C274($_al_TypesChain)}
					If ($_l_CurrentChain=3)  //we are in an 'if statement
						$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
						If ($_l_CurrentLevel>$_l_MaxLevels)
							$_l_MaxLevels:=$_l_CurrentLevel
						End if 
						ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
						$_l_CurrentLevel:=$_l_CurrentLevel-1
						$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="END CASE"
						APPEND TO ARRAY:C911($_al_HandlerTypes; -3)
						DELETE FROM ARRAY:C228($_al_TypesChain; Size of array:C274($_al_TypesChain))
					Else 
						$_l_ExitWithError:=-3
						
					End if 
					
				: ($_t_CurrentLine="While")
					//This is an error in the text it can be an if with no parameters
					$_l_ExitWithError:=-4
				: ($_t_CurrentLine="End while")
					$_l_CurrentChain:=$_al_TypesChain{Size of array:C274($_al_TypesChain)}
					If ($_l_CurrentChain=4)  //we are in a WHILE  statement
						$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
						If ($_l_CurrentLevel>$_l_MaxLevels)
							$_l_MaxLevels:=$_l_CurrentLevel
						End if 
						ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
						$_l_CurrentLevel:=$_l_CurrentLevel-1
						$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="END WHILE"
						APPEND TO ARRAY:C911($_al_HandlerTypes; -4)
						DELETE FROM ARRAY:C228($_al_TypesChain; Size of array:C274($_al_TypesChain))
					Else 
						$_l_ExitWithError:=-4
					End if 
					
				: ($_t_CurrentLine="Repeat")
					APPEND TO ARRAY:C911($_al_TypesChain; 5)
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:="REPEAT"
					$_l_CurrentLevel:=$_l_CurrentLevel+1
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					APPEND TO ARRAY:C911($_al_HandlerTypes; 5)
				: ($_t_CurrentLine="Until")
					
					//This is an error in the text it can be an if with no parameters
					$_l_ExitWithError:=-5
				Else 
					$_l_NumberofRows:=Size of array:C274($_at_2DCommand)
					If ($_l_CurrentLevel>$_l_MaxLevels)
						$_l_MaxLevels:=$_l_CurrentLevel
					End if 
					ARRAY TEXT:C222($_at_2DCommand; $_l_NumberofRows+1; $_l_MaxLevels)
					$_at_2DCommand{$_l_NumberofRows}{$_l_CurrentLevel}:=$_t_CurrentLine
					APPEND TO ARRAY:C911($_al_HandlerTypes; 0)
			End case 
			
			
		End if 
		
	End if 
	
End for 
$_ti_DocumentRef:=DB_CreateDocument([SCRIPTS:80]Script_Code:1+".txt"; "TEXT")

For ($_l_IndexRows; 1; Size of array:C274($_at_2DCommand))
	For ($_l_IndexColumns; 1; Size of array:C274($_at_2DCommand{$_l_IndexRows}))
		SEND PACKET:C103($_ti_DocumentRef; $_at_2DCommand{$_l_IndexRows}{$_l_IndexColumns}+Char:C90(9))
		
	End for 
	SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
	
End for 
SEND PACKET:C103($_ti_DocumentRef; $_t_IncomingScriptText)
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("SCPT_Compiler"; $_t_oldMethodName)