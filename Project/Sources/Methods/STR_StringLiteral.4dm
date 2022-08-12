//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_StringLiteral
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
	ARRAY LONGINT:C221($_al_Positions; 0)
	C_BOOLEAN:C305($_bo_InQuote)
	C_LONGINT:C283($_l_Chars; $_l_Index; $_l_Positions; $_l_SIzeofArray)
	C_TEXT:C284(<>QUOTE; $_t_oldMethodName; $_t_Text; $0; $1; $sDoubleQuote)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_StringLiteral")
//******************************************************************************
//
//Method: STR_StringLiteral
//
//Written by  Rollo on 11/12/98
//
//Purpose: ensure that no single bit of text between "" in the overall text
//exceeds the 4D 80 character limit - insert "+" where appropriate
//
//
//******************************************************************************

If (Count parameters:C259>=1)
	If (<>QUOTE="")
		<>Quote:=Char:C90(34)
	End if 
	
	$_t_Text:=$1
	
	
	If (Length:C16($_t_Text)>79)
		
		$_l_Chars:=1
		$_l_SIzeofArray:=Length:C16($_t_Text)
		ARRAY LONGINT:C221($_al_Positions; 0)
		$_l_Positions:=0
		
		For ($_l_Index; 1; $_l_SIzeofArray)
			
			If ($_bo_InQuote)
				If ($_t_Text[[$_l_Index]]=<>Quote)
					$_bo_InQuote:=False:C215
					$_l_Chars:=0
				Else 
					$_l_Chars:=$_l_Chars+1
					If ($_l_Chars>79)
						$_l_Positions:=$_l_Positions+1
						INSERT IN ARRAY:C227($_al_Positions; $_l_Positions)
						$_al_Positions{$_l_Positions}:=$_l_Index
						$_l_Chars:=0
					End if 
				End if 
			Else 
				If ($_t_Text[[$_l_Index]]=<>Quote)
					$_bo_InQuote:=True:C214
				End if 
			End if 
			
		End for 
		
		If ($_l_Positions>0)
			$_l_Index:=1
			$0:=Substring:C12($_t_Text; 1; $_al_Positions{$_l_Index})+<>Quote+"+"+<>Quote
			For ($_l_Index; 2; $_l_Positions)
				$0:=$0+Substring:C12($_t_Text; $_al_Positions{$_l_Index-1}+1; $_al_Positions{$_l_Index}-($_al_Positions{$_l_Index-1}))+<>Quote+"+"+<>Quote
				//Rollo: did read as below until 4./2/99 - an error, I believe!
				//   $0:=$0+Substring($_t_Text;$_al_Positions{$_l_Index-1}+1;$_al_Positions{$_l_Index}-
				//($_al_Positions{$_l_Index-1}    +1    ))+Char(Double quote)+"+"+Char(Double quote)
			End for 
			$0:=$0+Substring:C12($_t_Text; $_al_Positions{$_l_Index-1}+1)
		Else 
			$0:=$_t_Text
		End if 
		
	Else 
		$0:=$_t_Text
	End if 
Else 
	$0:=""
End if 



If (Length:C16($_t_oldMethodName)>80)  //Wed, Feb 21, 2007 balinderwalia: added
	$_t_oldMethodName:=Substring:C12($_t_oldMethodName; 1; 80)
End if 
ERR_MethodTrackerReturn("STR_StringLiteral"; $_t_oldMethodName)
