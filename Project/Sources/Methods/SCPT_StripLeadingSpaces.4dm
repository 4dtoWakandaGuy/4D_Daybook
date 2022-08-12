//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_StripLeadingSpaces
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 21:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CharsToStrip; 0)
	C_BOOLEAN:C305($_bo_Exit)
	C_COLLECTION:C1488($_col_Characters)
	C_LONGINT:C283($_l_CharIndex; $_l_StringLength; $_l_StripCharRow)
	C_TEXT:C284($_t_Char; $_t_oldMethodName; $_t_Text; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_StripLeadingSpaces")

//This will strip space etc trailing on a line

If (Count parameters:C259>0)
	$_col_Characters:=New collection:C1472
	If (Count parameters:C259>=1)
		For ($_l_CharIndex; 2; Count parameters:C259)
			//APPEND TO ARRAY($_at_CharsToStrip;${$_l_CharIndex})
			$_col_Characters.push(${$_l_CharIndex})
		End for 
	Else 
		//JUST SPACES
		$_col_Characters.push(Char:C90(32))
	End if 
	$0:=UTIL_TrimSpaces(New object:C1471("text"; $1; "where"; New collection:C1472("Start"); "chars"; $_col_Characters))
	
	If (False:C215)
		$_l_StringLength:=Length:C16($1)
		$_t_Text:=$1
		ARRAY TEXT:C222($_at_CharsToStrip; 0)
		If (Count parameters:C259>=1)
			For ($_l_CharIndex; 2; Count parameters:C259)
				APPEND TO ARRAY:C911($_at_CharsToStrip; ${$_l_CharIndex})
				
			End for 
		Else 
			//JUST SPACES
			APPEND TO ARRAY:C911($_at_CharsToStrip; Char:C90(32))
		End if 
		If ($_t_Text#"")
			$_l_CharIndex:=1
			$_bo_Exit:=False:C215
			Repeat 
				$_t_Char:=$_t_Text[[$_l_CharIndex]]
				$_l_StripCharRow:=Find in array:C230($_at_CharsToStrip; $_t_Char)
				If ($_l_StripCharRow<0)
					$_t_Text:=Substring:C12($_t_Text; $_l_CharIndex; Length:C16($_t_Text))
					$_bo_Exit:=True:C214
				Else 
					If ($_l_CharIndex=Length:C16($_t_Text))
						//No valid chars on the line
						$_t_Text:=""
					End if 
				End if 
				$_l_CharIndex:=$_l_CharIndex+1
			Until ($_bo_Exit) | ($_l_CharIndex>Length:C16($_t_Text))
		End if 
		$0:=$_t_Text
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SCPT_StripLeadingSpaces"; $_t_oldMethodName)
