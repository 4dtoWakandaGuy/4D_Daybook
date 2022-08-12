//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_HighAsciiFormula
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterPosition; $_l_Index; $_l_Index2; $_l_MaxLength)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_ThisCharacter; DB_T_FilterString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_HighAsciiFormula")
$0:=False:C215
$_l_MaxLength:=255-128
If (Length:C16($1->)<$_l_MaxLength)
	For ($_l_Index; 1; Length:C16($1->))
		$_l_CharacterCode:=Character code:C91($1->[[$_l_Index]])
		For ($_l_Index2; 128; 255)
			If ($_l_CharacterCode=$_l_Index2)
				$0:=True:C214
				$_t_ThisCharacter:=Char:C90($_l_Index2)
				If ($2->#"")
					$_l_CharacterPosition:=Position:C15($_t_ThisCharacter; $2->)
					If ($_l_CharacterPosition=0)
						$2->:=$2->+","+$_t_ThisCharacter
					End if 
					
				Else 
					$2->:=$_t_ThisCharacter
				End if 
			End if 
			
		End for 
		
	End for 
Else 
	If (DB_T_FilterString="")
		For ($_l_Index; 128; 255)
			DB_T_FilterString:=DB_T_FilterString+Char:C90($_l_Index)
		End for 
	End if 
	For ($_l_Index; 1; Length:C16(DB_T_FilterString))
		$_l_CharacterCode:=Character code:C91(DB_T_FilterString[[$_l_Index]])
		For ($_l_Index2; 1; Length:C16($1->))
			If ($_l_CharacterCode=Character code:C91($1->[[$_l_Index2]]))
				$0:=True:C214
				$_t_ThisCharacter:=$1->[[$_l_Index2]]
				If ($2->#"")
					$_l_CharacterPosition:=Position:C15($_t_ThisCharacter; $2->)
					If ($_l_CharacterPosition=0)
						$2->:=$2->+","+$_t_ThisCharacter
					End if 
					
				Else 
					$2->:=$_t_ThisCharacter
				End if 
			End if 
			
		End for 
		
	End for 
	
End if 
ERR_MethodTrackerReturn("DB_HighAsciiFormula"; $_t_oldMethodName)