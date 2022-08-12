//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CompanyNameClean
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
	ARRAY TEXT:C222($_at_FilterWords; 0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index)
	C_TEXT:C284($_t_CharacterString; $_t_FilterCompanyNameA; $_t_FilteredCompanyName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CompanyNameClean")
//DB_COmpanyNameClean
$_t_CharacterString:="aehiouwybfpvcgjkqsxzdtlmnr"
ARRAY TEXT:C222($_at_FilterWords; 6)
$_at_FilterWords{1}:="The "
$_at_FilterWords{2}:=" PLC"
$_at_FilterWords{3}:=" LLC"
$_at_FilterWords{4}:="Ltd"
$_at_FilterWords{5}:=" & "
$_at_FilterWords{6}:=" and "
//not the space positions in the above are important
$_t_FilterCompanyNameA:=$1
If ($_t_FilterCompanyNameA#"")
	For ($_l_Index; 1; Size of array:C274($_at_FilterWords))
		$_t_FilterCompanyNameA:=Replace string:C233($_t_FilterCompanyNameA; $_at_FilterWords{$_l_Index}; "")
	End for 
	$_t_FilteredCompanyName:=""
	For ($_l_Index; 1; Length:C16($_t_FilterCompanyNameA))
		$_l_CharacterPosition:=Position:C15($_t_FilterCompanyNameA[[$_l_Index]]; $_t_CharacterString)
		If ($_l_CharacterPosition>0)
			$_t_FilteredCompanyName:=$_t_FilteredCompanyName+$_t_FilterCompanyNameA[[$_l_Index]]
		End if 
	End for 
End if 

$0:=$_t_FilteredCompanyName
ERR_MethodTrackerReturn("DB_CompanyNameClean"; $_t_oldMethodName)