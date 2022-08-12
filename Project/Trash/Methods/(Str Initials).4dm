//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str Initials
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
	C_LONGINT:C283($i; $s)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $str1; $str2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str Initials")
//St Initials - returns the initial letters
If (Count parameters:C259>=1)
	$s:=Length:C16($1)
	If ($s>0)
		$0:=Substring:C12($1; 1; 1)
		$str1:=""
		For ($i; 2; $s)
			$str2:=Substring:C12($1; $i; 1)
			If (($str1=" ") | ($str1="-"))
				If (($str2#" ") & ($str2#"-") & ($str2#".") & ($str2#"!") & ($str2#":"))
					$0:=$0+$str2
				End if 
			End if 
			$str1:=$str2
		End for 
		$0:=Uppercase:C13($0)
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str Initials"; $_t_oldMethodName)