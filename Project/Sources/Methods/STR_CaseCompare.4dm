//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_CaseCompare
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
	C_BOOLEAN:C305($0; $equal)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $string1; $string2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_CaseCompare")

// (PM) STR_CaseCompare
// Performs a case-sensitive comparison on two strings
// $1 = String 1
// $2 = String 2
// $0 = Equal


$string1:=$1
$string2:=$2
$equal:=False:C215

// Check if the lengths match
If (Length:C16($string1)=Length:C16($string2))
	
	// Assume equality until proved wrong
	$equal:=True:C214
	
	// Compare the codepoints of each character
	For ($i; 1; Length:C16($string1))
		If (Character code:C91($string1[[$i]])#Character code:C91($string2[[$i]]))
			//v11 `If (Character code($string1≤$i≥)#Character code($string2≤$i≥))
			$equal:=False:C215
		End if 
	End for 
	
End if 

$0:=$equal
ERR_MethodTrackerReturn("STR_CaseCompare"; $_t_oldMethodName)