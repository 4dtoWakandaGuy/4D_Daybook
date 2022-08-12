//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_ContactNameClean
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FilterWords; 0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index)
	C_TEXT:C284($_t_CharacterString; $_t_FilterContactNameA; $_t_FilteredContactName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContactNameClean")

//NG August 2004
// This method creates a 'clean' version of a contact name to be used for soundex.
$_t_oldMethodName:=ERR_MethodTracker("DB_ContactNameClean")

$_t_CharacterString:="aehiouwybfpvcgjkqsxzdtlmnr"
ARRAY TEXT:C222($_at_FilterWords; 4)
$_at_FilterWords{1}:="The "
$_at_FilterWords{2}:=" "
$_at_FilterWords{3}:=" & "
$_at_FilterWords{4}:=" and "
//not the space positions in the above are important
$_t_FilterContactNameA:=$1
If ($_t_FilterContactNameA#"")
	For ($_l_Index; 1; Size of array:C274($_at_FilterWords))
		$_t_FilterContactNameA:=Replace string:C233($_t_FilterContactNameA; $_at_FilterWords{$_l_Index}; "")
	End for 
	$_t_FilteredContactName:=""
	For ($_l_Index; 1; Length:C16($_t_FilterContactNameA))
		$_l_CharacterPosition:=Position:C15($_t_FilterContactNameA[[$_l_Index]]; $_t_CharacterString)
		If ($_l_CharacterPosition>0)
			$_t_FilteredContactName:=$_t_FilteredContactName+$_t_FilterContactNameA[[$_l_Index]]
		End if 
	End for 
End if 

$0:=$_t_FilteredContactName
ERR_MethodTrackerReturn("DB_ContactNameClean"; $_t_oldMethodName)