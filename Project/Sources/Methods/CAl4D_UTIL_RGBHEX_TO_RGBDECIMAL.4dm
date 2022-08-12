//%attributes = {}
If (False:C215)
	//Project Method Name:      CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL
	//------------------ Method Notes ------------------
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_Length; $_l_RGBDecimal; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_RGBHex; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL")

$_t_RGBHex:=$1
$_l_CharacterPosition:=Position:C15("#"; $_t_RGBHex; 1; $_l_Length)
If ($_l_CharacterPosition>0)
	$_t_RGBHex:=Substring:C12($_t_RGBHex; $_l_CharacterPosition+1)
End if 

//========================    Method Actions    ==================================

For ($_l_Index; 1; Length:C16($_t_RGBHex))
	$_l_RGBDecimal:=($_l_RGBDecimal << 4)+Position:C15($_t_RGBHex[[$_l_Index]]; "123456789ABCDEF"; 1; $_l_Length)
End for 

//========================    Clean up and Exit    =================================

$0:=$_l_RGBDecimal
ERR_MethodTrackerReturn("CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL"; $_t_oldMethodName)