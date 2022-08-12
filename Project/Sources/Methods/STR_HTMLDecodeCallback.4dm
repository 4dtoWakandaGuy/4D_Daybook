//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_HTMLDecodeCallback
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
	//Array TEXT(<>HTML_at_Entities;0)
	C_LONGINT:C283($codepoint; $item)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $entity; $replacement)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_HTMLDecodeCallback")

//STR_HTMLDecodeCallback
//callback for Preg Replace Callback within STR_HTMLDecode


$entity:=$1
$replacement:=""

If ($entity="&#@;")  // It's a numerical entity
	
	$entity:=Substring:C12($entity; 3; Length:C16($entity)-3)
	If ($entity="x@")
		$codepoint:=UTI_HexToDecimal($entity)
	Else 
		$codepoint:=Num:C11($entity)
	End if 
	$replacement:=Char:C90($codepoint)
	//
Else   // It's a named entity
	
	// Perform a case-senstive find in array because we need to distinguish between uppercase and lowercase characters
	$item:=Array_FindCaseSensitive(-><>HTML_at_Entities; $entity)
	If ($item#-1)
		$replacement:=Char:C90($item)
	End if 
	
End if 

$0:=$replacement
ERR_MethodTrackerReturn("STR_HTMLDecodeCallback"; $_t_oldMethodName)