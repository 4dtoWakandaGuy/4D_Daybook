//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_Barcode_Pattern
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Set_Barcode_Pattern
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(BARC_al_Checksums2;0)
	//ARRAY LONGINT(BARC_al_Checksums;0)
	//ARRAY TEXT(BARC_at_Patterns;0)
	//ARRAY TEXT(BARC_at_Patterns2;0)
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterCode2; $1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Pattern; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_Barcode_Pattern")

// adds Element to BARC_at_Patterns


$_l_CharacterCode:=$1
$_t_Pattern:=$2
If (Count parameters:C259>2)
	$_l_CharacterCode2:=$3
Else 
	$_l_CharacterCode2:=$_l_CharacterCode  // used for Code128, Type B
End if 
BARC_at_Patterns{$_l_CharacterCode}:=$_t_Pattern
BARC_at_Patterns2{$_l_CharacterCode2}:=$_t_Pattern
APPEND TO ARRAY:C911(BARC_al_Checksums; $_l_CharacterCode)

If (BARC_at_Patterns{0}="10100001100")  // code128
	APPEND TO ARRAY:C911(BARC_al_Checksums2; $_l_CharacterCode2)
End if 
ERR_MethodTrackerReturn("Set_Barcode_Pattern"; $_t_oldMethodName)