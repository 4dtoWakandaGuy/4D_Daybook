//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_HexToDecimal
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
	C_LONGINT:C283($_l_CharPosition; $_l_Index; $_l_Power; $_l_Value; $0)
	C_TEXT:C284($_t_Hex; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_HexToDecimal")

// (PM) UTI_HexToDecimal
// Converts a number from the hexadecimal notation to the decimal notation
// $1 = Hex number
// $2 = Decimal number


$_t_Hex:=$1
$_l_Value:=0
$_l_Power:=0

// If the number stats with 0x or x, remove these characters
Case of 
	: ($_t_Hex="0x@")
		$_t_Hex:=Substring:C12($_t_Hex; 3)
	: ($_t_Hex="x@")
		$_t_Hex:=Substring:C12($_t_Hex; 2)
End case 

// Convert from hexadecimal to decimal
For ($_l_Index; Length:C16($_t_Hex); 1; -1)
	$_l_CharPosition:=Position:C15($_t_Hex[[$_l_Index]]; "0123456789ABCDEF")-1
	$_l_Value:=$_l_Value+($_l_CharPosition*(16^$_l_Power))
	$_l_Power:=$_l_Power+1
End for 

$0:=$_l_Value
ERR_MethodTrackerReturn("UTI_HexToDecimal"; $_t_oldMethodName)
