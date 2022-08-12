//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_StringFindBetween
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:51`Method: NTK_StringFindBetween
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Position1; $_l_Position2)
	C_TEXT:C284($_t_FoundText; $_t_oldMethodName; $_t_StartDelimiter; $_t_StopDelimiter; $_t_TextToSearch; $0; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_StringFindBetween")
// (PM) String_FindInBetween
// Returns the text portion which is in between two delimiters
// $1 = Text to search
// $2 = Start delimiter
// $3 = Stop delimiter (optional)
// $0 = Found text


$_t_TextToSearch:=$1
$_t_StartDelimiter:=$2
If (Count parameters:C259>=3)
	$_t_StopDelimiter:=$3
End if 

If ($_t_StartDelimiter="")
	$_l_Position1:=1
Else 
	$_l_Position1:=Position:C15($_t_StartDelimiter; $_t_TextToSearch)+Length:C16($_t_StartDelimiter)
End if 

If ($_t_StopDelimiter="")
	$_l_Position2:=Length:C16($_t_TextToSearch)
Else 
	$_l_Position2:=Position:C15($_t_StopDelimiter; Substring:C12($_t_TextToSearch; $_l_Position1+1))
End if 

$_t_FoundText:=Substring:C12($_t_TextToSearch; $_l_Position1; $_l_Position2)

$0:=$_t_FoundText
ERR_MethodTrackerReturn("NTK_StringFindBetween"; $_t_oldMethodName)
