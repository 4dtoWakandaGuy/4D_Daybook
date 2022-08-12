//%attributes = {}
If (False:C215)
	//Project Method Name:      FileNamefromPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FileNamefromPath")
//this method will get the file name(eg the last bit)from a path




Case of 
	: (Is macOS:C1572)  //MAC
		If ($1#"")
			$_l_CharacterPosition:=Position:C15(":"; $1)
			If ($_l_CharacterPosition>0)
				For ($_l_Index; Length:C16($1); 0; -1)
					If ($1[[$_l_Index]]=":")  //FILE SEPERATOR
						$0:=Substring:C12($1; $_l_Index+1; Length:C16($1))
						$_l_Index:=0
					End if 
				End for 
			Else 
				$0:=$1
			End if 
		Else 
			$0:=$1
		End if 
	Else 
		If ($1#"")
			$_l_CharacterPosition:=Position:C15("\\"; $1)
			If ($_l_CharacterPosition>0)
				For ($_l_Index; Length:C16($1); 0; -1)
					If ($1[[$_l_Index]]="\\")  //FILE SEPERATOR
						$0:=Substring:C12($1; $_l_Index+1; Length:C16($1))
						$_l_Index:=0
					End if 
				End for 
			Else 
				$0:=$1
			End if 
		Else 
			$0:=$1
		End if 
End case 
ERR_MethodTrackerReturn("FileNamefromPath"; $_t_oldMethodName)