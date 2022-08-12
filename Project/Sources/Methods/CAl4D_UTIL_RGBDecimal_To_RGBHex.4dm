//%attributes = {}
If (False:C215)
	//Project Method Name:      CAl4D_UTIL_RGBDecimal_To_RGBHex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Negative; $_bo_OK)
	C_LONGINT:C283($_l_DecNo; $_l_Remainder; $1)
	C_TEXT:C284($_t_Chars; $_t_HexSTR; $_t_oldMethodName; $_t_Prefix; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAl4D_UTIL_RGBDecimal_To_RGBHex")
$_l_DecNo:=$1
$_t_Prefix:=$2

$_t_HexSTR:=""
$_t_Chars:="0123456789ABCDEF"
$_bo_OK:=True:C214
$_bo_Negative:=($_l_DecNo<0)


If (($_l_DecNo>=-MAXLONG:K35:2) & ($_l_DecNo<=MAXLONG:K35:2))  // When overtaking, it may happen that the result is <0
	////  Incase it is a negative number
	////
	$_l_DecNo:=Abs:C99($_l_DecNo)
	
	While (($_l_DecNo#0) & $_bo_OK)
		If (Length:C16($_t_HexSTR)<255)  // Be careful not to exceed 255 characters
			$_l_Remainder:=$_l_DecNo%16  ////  Get the modulo 16 remainder
			$_t_HexSTR:=$_t_Chars[[$_l_Remainder+1]]+$_t_HexSTR  ////  +1 because 4D strings are 1 based
			$_l_DecNo:=$_l_DecNo\16  ////  Longint divide by 16
		Else 
			$_bo_OK:=False:C215  // The result exceeds 255 characters
		End if 
	End while 
	
	If ($_bo_OK)  // All went well
		$_t_HexSTR:=$_t_Prefix+("0"*(6-Length:C16($_t_HexSTR)))+$_t_HexSTR
		If ($_bo_Negative)
			$_t_HexSTR:="-"+$_t_HexSTR
		End if 
	Else 
		$_t_HexSTR:=""
	End if 
End if 


$0:=$_t_HexSTR
ERR_MethodTrackerReturn("CAl4D_UTIL_RGBDecimal_To_RGBHex"; $_t_oldMethodName)