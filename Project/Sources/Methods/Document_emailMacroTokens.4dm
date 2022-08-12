//%attributes = {}
If (False:C215)
	//Project Method Name:      Document_emailMacroTokens
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
	C_LONGINT:C283($_l_CharacterPosition; $pos2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $MacroName; $ParseText; $ReturnText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Document_emailMacroTokens")

//added 12/12/07 -kmw
//this method will  look for special macro tokens, execute any macros found in the text and return text whereby macro tokens are replaced with any text returned by those macros
//

If (Count parameters:C259>=1)
	$ParseText:=$1
	$ReturnText:=""
	
	$_l_CharacterPosition:=Position:C15("<Macro"; $ParseText)
	
	If ($_l_CharacterPosition>0)
		Repeat 
			Case of 
				: (Substring:C12($ParseText; $_l_CharacterPosition; 11)="<MacroTxt: ")
					$ReturnText:=$ReturnText+Substring:C12($ParseText; 1; ($_l_CharacterPosition-1))
					$ParseText:=Substring:C12($ParseText; ($_l_CharacterPosition+11))
					$pos2:=Position:C15(">"; $ParseText)
					$MacroName:=Substring:C12($ParseText; 1; ($pos2-1))
					$ParseText:=Substring:C12($ParseText; ($pos2+1))
					$ReturnText:=$ReturnText+Macro_ResultTxt($MacroName)
				: (Substring:C12($ParseText; $_l_CharacterPosition; 11)="<MacroNum: ")
					$ReturnText:=$ReturnText+Substring:C12($ParseText; 1; ($_l_CharacterPosition-1))
					$ParseText:=Substring:C12($ParseText; ($_l_CharacterPosition+11))
					$pos2:=Position:C15(">"; $ParseText)
					$MacroName:=Substring:C12($ParseText; 1; ($pos2-1))
					$ParseText:=Substring:C12($ParseText; ($pos2+1))
					$ReturnText:=$ReturnText+String:C10(Macro_Result($MacroName))
				Else 
					$ReturnText:=$ReturnText+Substring:C12($ParseText; 1; ($_l_CharacterPosition-1))
					$pos2:=Position:C15(">"; $ParseText)
					$ParseText:=Substring:C12($ParseText; ($pos2+1))
					$ReturnText:=$ReturnText+"<macro token not formed correctly>"
			End case 
			$_l_CharacterPosition:=Position:C15("<Macro"; $ParseText)
			If ($_l_CharacterPosition<1)
				$ReturnText:=$ReturnText+$Parsetext
				$Parsetext:=""
			End if 
		Until ($Parsetext="")
	Else 
		$ReturnText:=$Parsetext
	End if 
End if 
//
$0:=$ReturnText
ERR_MethodTrackerReturn("Document_emailMacroTokens"; $_t_oldMethodName)