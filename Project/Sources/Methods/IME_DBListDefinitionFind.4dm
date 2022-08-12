//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBListDefinitionFind
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
	C_LONGINT:C283($_l_CharPosition; $_l_CRPosition; $_l_Length)
	C_TEXT:C284(<>STR_t_CR; $_t_CR; $_t_FInd; $_t_ListDefinition; $_t_oldMethodName; $_t_Result; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBListDefinitionFind")
//IME_DBListDefinitionFind
//Rollo 17/6/2004

//find the first definition of a particular data value pair
//eg Label=This
//returns This


$_t_CR:=<>STR_t_CR

$_t_FInd:=$1
If ($_t_FInd="@=")
	$_t_FInd:=$_t_FInd+"="
End if 

$_t_ListDefinition:=$2

If ($_t_ListDefinition#"")
	
	$_l_CharPosition:=Position:C15($_t_FInd; $_t_ListDefinition)
	
	If ($_l_CharPosition>0)
		
		$_l_Length:=Length:C16($_t_FInd)
		$_l_CRPosition:=Position:C15($_t_CR; Substring:C12($_t_ListDefinition; $_l_CharPosition))
		$_t_Result:=Substring:C12($_t_ListDefinition; $_l_CharPosition+$_l_Length+1; $_l_CRPosition-$_l_Length-2)
		
	Else 
		$_t_Result:=""
	End if 
	
Else 
	$_t_Result:=""
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("IME_DBListDefinitionFind"; $_t_oldMethodName)